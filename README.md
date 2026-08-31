# CMM Advisor, analisi finanziaria con Claude

Progetto per la produzione di schede di analisi fondamentale su aziende quotate, in formato markdown e con struttura
omogenea.

## Flusso di lavoro

Due comandi principali per due fasi distinte:

1. inizia una conversazione su un'azienda a partire dall'analisi iniziale qualitativa proposta e prosegui con l'analisi
   quantitativa più tecnica;
2. produci un documento di report a partire dall'analisi della fase 1 e secondo un template predeterminato.

| Comando                  | Fase                    | Cosa fa                                                                                                                                                                                                            |
|--------------------------|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `/analysis TICKER [URL]` | 1 — Analisi preliminare | Raccoglie bilanci, dati di mercato, notizie e stime; ricostruisce i prospetti con `financial-analysis:3-statement-model`; discute i risultati in conversazione; salva le note di lavoro. Non produce il documento. |
| `/report TICKER`         | 2 — Documento di report | Trasforma l'analisi (dalla conversazione o dalle note) nella scheda markdown secondo il template. Non introduce dati nuovi.                                                                                        |

La separazione serve a poter correggere e indirizzare l'analisi prima che diventi un documento. La fase 1 salva le note
di lavoro in `.note/<TICKER>/note-<YYYYMMDD>.md` prima di chiudere la conversazione (o comunque al momento
in cui si esegue `/report`, se non erano già state salvate), così la fase 2 funziona anche in una chat diversa.

## Come si usa

1. È sempre preferibile mettere documenti dell'azienda in `dati/aziende/<TICKER>/`. Considera di aggiungere alla
   cartella il Form-S1 dell'IPO filling (utile per la ricostruzione storica) e/o ultimi 10-Q, 10-K, ecc.
   dalla [SEC](https://www.sec.gov/edgar/search/) (puoi slavare la pagina HTML della SEC in locale e incollarla nella
   sottocartella del ticker).
2. Lancia `/analysis <TICKER> [URL]` — discuti l'analisi, correggi, aggiungi contesto; le note di lavoro vengono salvate
   automaticamente alla chiusura della conversazione.
3. Finita la conversazione lancia `/report <TICKER>` — genera la scheda in `analisi/<TICKER>/`.

Tenendo una scheda per data, lo storico resta confrontabile nel tempo e i diff di git mostrano come cambiano i
documenti di report tra un trimestre e l'altro.

## Altri comandi

Strumento indipendente dal flusso analisi/report, in un'unica esecuzione:

| Comando | Cosa fa                                                                                                                                                                                                                                                                                                                                                            |
|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `/csp [BUDGET]` | Individua le 3 migliori opportunità di vendita di Cash Secured Put in scadenza la settimana successiva, a partire dallo screener pubblico [cortesi.org/csp](https://cortesi.org/csp/povery.html), verifica i dati con una fonte indipendente e ne controlla il sentiment (incluso X) e il rischio earnings prima di rispondere. Su richiesta salva il report in `csp/csp-<scadenza>.md`. |

## Struttura

```
analisi-finanziaria/
├── .claude/skills/                                  # fonte di verità delle skill
│   ├── analysis/
│   │   ├── SKILL.md                                # /analysis TICKER [URL] — fase 1
│   │   └── references/                             # materiale di supporto alla fase 1
│   │       ├── metriche.md                         # metriche da estrarre e convenzioni
│   │       └── fonti.md                            # gerarchia delle fonti da consultare
│   ├── report/
│   │   ├── SKILL.md                                # /report TICKER — fase 2
│   │   └── references/                             # materiale di supporto alla fase 2
│   │       └── template-scheda.md                  # struttura fissa del documento di output
│   └── csp/
│       └── SKILL.md                                # /csp — screening settimanale CSP
├── .agents/skills/                                  # symlink verso .claude/skills/, non copie
│   ├── analysis/ -> ../../.claude/skills/analysis
│   ├── report/   -> ../../.claude/skills/report
│   └── csp/      -> ../../.claude/skills/csp
├── scripts/
│   └── sync-skills.sh                              # rigenera .agents/skills/ e i sync globali
├── dati/
│   └── aziende/<TICKER>/*.*                         # input grezzi (S1, 10-Q, 10-K, altro)
├── .note/<TICKER>/note-<YYYYMMDD>.md                # note di lavoro della fase 1
├── analisi/<TICKER>/<TICKER>_<YYYYMMDD>_analisi.md # output: schede generate, una per data
├── csp/csp-<YYYY-MM-DD>.md                          # output: report /csp, uno per scadenza
└── README.md
```

## Skill su altre piattaforme (Codex/ChatGPT, Grok)

Le skill in `.claude/skills/` sono nel formato "Agent Skills" (`SKILL.md` con frontmatter YAML), diventato uno
standard condiviso: sia Codex CLI/ChatGPT che Grok Build lo leggono senza bisogno di conversione. Cambia solo il
path da cui ciascuna piattaforma li scopre:

| Piattaforma            | Path letto                                |
|-------------------------|--------------------------------------------|
| Claude Code             | `.claude/skills/` (o `~/.claude/skills/`)   |
| Codex CLI / ChatGPT      | `.agents/skills/` (o `~/.agents/skills/`)   |
| Grok Build               | `.agents/skills/` (o `~/.grok/skills/`)     |

`.claude/skills/` resta l'unica fonte di verità: `.agents/skills/` contiene solo symlink verso quella cartella,
generati con `scripts/sync-skills.sh` (nessuna copia da tenere allineata a mano). Per rigenerarli, o per estendere
il sync anche ai path globali (`~/.agents/skills/`, `~/.grok/skills/`):

```
scripts/sync-skills.sh              # sync di progetto (.agents/skills/)
scripts/sync-skills.sh --global     # + sync globale per Codex/ChatGPT e Grok Build
scripts/sync-skills.sh --check-only # solo il report di portabilità, senza toccare nulla
```

Lo script segnala anche le skill che dipendono da tool disponibili solo in Claude Code: `/csp`, ad esempio, richiede
il connettore MCP di Interactive Brokers per il punto 5 dello screening — su Codex/Grok Build quel passaggio
funziona solo se lì è collegato lo stesso connettore, altrimenti resta un'istruzione che il modello non può eseguire.

Grok Skills (l'app consumer su grok.com, distinta da Grok Build) non legge il filesystem: per quella serve importare
manualmente uno zip via UI, generabile con `scripts/sync-skills.sh --zip` in `dist/grok-skills-import/`.

## Nota

Le schede prodotte sono analisi fattuale, non consulenza finanziaria.
