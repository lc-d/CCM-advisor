#!/usr/bin/env bash
#
# sync-skills.sh — distribuisce le skill di .claude/skills/ (fonte di verità)
# verso i path letti da Codex CLI/ChatGPT e Grok Build, mantenendo un'unica
# copia dei file tramite symlink (nessuna duplicazione, nessun drift).
#
# Path di destinazione:
#   - <repo>/.agents/skills/<nome>   -> letto sia da Codex CLI/ChatGPT (scope
#     di progetto) sia da Grok Build, che scansiona .agents/skills/ a ogni
#     livello di directory.
#   - ~/.agents/skills/<nome>        -> scope globale Codex CLI/ChatGPT
#     (--global)
#   - ~/.grok/skills/<nome>          -> scope globale Grok Build (--global)
#
# Uso:
#   scripts/sync-skills.sh              # sync di progetto (symlink)
#   scripts/sync-skills.sh --global     # sync di progetto + globale
#   scripts/sync-skills.sh --copy       # copia invece di symlink
#   scripts/sync-skills.sh --zip        # crea anche uno zip per skill in
#                                        # dist/grok-skills-import/, da
#                                        # caricare a mano nell'import UI di
#                                        # Grok Skills (grok.com/app), che
#                                        # non legge il filesystem locale.
#   scripts/sync-skills.sh --check-only # non sincronizza, mostra solo il
#                                        # report di portabilità
#
# In ogni caso, alla fine viene stampato un report delle skill che
# referenziano tool/strumenti specifici di Claude Code (MCP, subagenti,
# Artifact, AskUserQuestion, ...): quelle sezioni restano nel file — quindi
# vengono lette anche da Codex/Grok — ma non hanno un tool equivalente da
# eseguire su quelle piattaforme, a meno di collegare lì lo stesso server MCP.

set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
SRC_DIR="$REPO_ROOT/.claude/skills"

MODE="symlink"     # symlink | copy
DO_GLOBAL=false
DO_ZIP=false
CHECK_ONLY=false

for arg in "$@"; do
  case "$arg" in
    --global) DO_GLOBAL=true ;;
    --copy) MODE="copy" ;;
    --zip) DO_ZIP=true ;;
    --check-only) CHECK_ONLY=true ;;
    -h|--help)
      sed -n '1,30p' "${BASH_SOURCE[0]}" | grep '^#' | sed 's/^# \{0,1\}//'
      exit 0
      ;;
    *)
      echo "Argomento sconosciuto: $arg" >&2
      exit 1
      ;;
  esac
done

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Nessuna cartella skill trovata in $SRC_DIR" >&2
  exit 1
fi

link_or_copy() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"

  if [[ -L "$dst" ]]; then
    rm "$dst"
  elif [[ -e "$dst" ]]; then
    echo "  ! salto $dst: esiste già e non è un symlink gestito da questo script" >&2
    return
  fi

  if [[ "$MODE" == "symlink" ]]; then
    local rel
    rel="$(python3 -c "import os,sys; print(os.path.relpath(sys.argv[1], os.path.dirname(sys.argv[2])))" "$src" "$dst")"
    ln -s "$rel" "$dst"
    echo "  -> symlink $dst -> $rel"
  else
    rm -rf "$dst"
    cp -R "$src" "$dst"
    echo "  -> copiato $dst"
  fi
}

echo "Fonte di verità: $SRC_DIR"
skills=()
while IFS= read -r -d '' skill_dir; do
  skills+=("$skill_dir")
done < <(find "$SRC_DIR" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)

if [[ ${#skills[@]} -eq 0 ]]; then
  echo "Nessuna skill trovata."
  exit 0
fi

if [[ "$CHECK_ONLY" == false ]]; then
  echo
  echo "== Sync di progetto (.agents/skills/ — letto da Codex/ChatGPT e Grok Build) =="
  for skill_dir in "${skills[@]}"; do
    name="$(basename "$skill_dir")"
    link_or_copy "$skill_dir" "$REPO_ROOT/.agents/skills/$name"
  done

  if [[ "$DO_GLOBAL" == true ]]; then
    echo
    echo "== Sync globale ChatGPT/Codex CLI (~/.agents/skills/) =="
    for skill_dir in "${skills[@]}"; do
      name="$(basename "$skill_dir")"
      link_or_copy "$skill_dir" "$HOME/.agents/skills/$name"
    done

    echo
    echo "== Sync globale Grok Build (\${GROK_HOME:-~/.grok}/skills/) =="
    grok_home="${GROK_HOME:-$HOME/.grok}"
    for skill_dir in "${skills[@]}"; do
      name="$(basename "$skill_dir")"
      link_or_copy "$skill_dir" "$grok_home/skills/$name"
    done
  fi

  if [[ "$DO_ZIP" == true ]]; then
    echo
    echo "== Bundle .zip per import manuale in Grok Skills (grok.com/app) =="
    zip_dir="$REPO_ROOT/dist/grok-skills-import"
    mkdir -p "$zip_dir"
    for skill_dir in "${skills[@]}"; do
      name="$(basename "$skill_dir")"
      zip_path="$zip_dir/$name.zip"
      rm -f "$zip_path"
      (cd "$SRC_DIR" && zip -rq "$zip_path" "$name")
      echo "  -> $zip_path"
    done
  fi
fi

echo
echo "== Report di portabilità =="
echo "Le sezioni sotto elencate restano nel file (letto comunque da Codex/Grok)"
echo "ma chiamano tool che esistono solo nel runtime Claude Code, salvo che la"
echo "piattaforma di destinazione non abbia collegato lo stesso server MCP."
echo

# Pattern euristici, in due categorie:
# 1) chiamate a tool nativi di Claude Code (nome preciso, prefisso mcp__ incluso)
# 2) menzioni testuali di connettori/strumenti esterni (MCP, IBKR, ...) — qui il
#    nome del tool nel testo è quasi sempre "corto" (es. get_price_snapshot),
#    quindi si segnala il paragrafo per revisione manuale piuttosto che il
#    singolo identificatore.
NATIVE_PATTERN='mcp__[a-zA-Z0-9_]+|\bAskUserQuestion\b|\bArtifact\(|\bAgent\(|\bScheduleWakeup\b|\bReportFindings\b|\bSendFeedback\b|\bEnterPlanMode\b|\bExitPlanMode\b'
CONNECTOR_PATTERN='\bMCP\b|\bconnettore\b|\bconnector\b|\bIBKR\b|\bInteractive Brokers\b'

found_any=false
for skill_dir in "${skills[@]}"; do
  name="$(basename "$skill_dir")"
  skill_md="$skill_dir/SKILL.md"
  [[ -f "$skill_md" ]] || continue

  native_matches="$(grep -noE "$NATIVE_PATTERN" "$skill_md" | sort -u -t: -k2 || true)"
  connector_matches="$(grep -noiE "$CONNECTOR_PATTERN" "$skill_md" | sort -u -t: -k1 -n || true)"

  if [[ -n "$native_matches" || -n "$connector_matches" ]]; then
    found_any=true
    echo "[$name] $skill_md"
    if [[ -n "$native_matches" ]]; then
      echo "  tool nativi Claude Code:"
      while IFS= read -r line; do
        echo "    riga ${line%%:*}: ${line#*:}"
      done <<< "$native_matches"
    fi
    if [[ -n "$connector_matches" ]]; then
      echo "  menzioni di connettori/strumenti esterni (verifica manuale):"
      while IFS= read -r ln; do
        num="${ln%%:*}"
        echo "    riga $num: $(sed -n "${num}p" "$skill_md" | sed 's/^ *//')"
      done <<< "$(cut -d: -f1 <<< "$connector_matches" | sort -un)"
    fi
    echo
  fi
done

if [[ "$found_any" == false ]]; then
  echo "Nessuna dipendenza da tool Claude Code-specifici rilevata: le skill dovrebbero"
  echo "funzionare senza modifiche anche su Codex/ChatGPT e Grok Build."
fi
