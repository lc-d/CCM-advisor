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
di lavoro in `dati/note/<TICKER>/note-<YYYYMMDD>.md` prima di chiudere la conversazione (o comunque al momento
in cui si esegue `/report`, se non erano già state salvate), così la fase 2 funziona anche in una chat diversa.

## Come si usa

1. È sempre preferibile mettere documenti dell'azienda in `dati/aziende/<TICKER>/`. Considera di aggiungere alla
   cartella il Form-S1 dell'IPO filling (utile per la ricostruzione storica) e/o ultimo 10-Q, 10-K, ecc.
   dalla [SEC](https://www.sec.gov/edgar/search/) (puoi slavare la pagina HTML della SEC in locale e incollarla nella
   sottocartella del ticker).
2. Lancia `/analysis <TICKER> [URL]` — discuti l'analisi, correggi, aggiungi contesto; le note di lavoro vengono salvate
   automaticamente alla chiusura della conversazione.
3. Finita la conversazione lancia `/report <TICKER>` — genera la scheda in `analisi/<TICKER>/`.

Tenendo una scheda per data, lo storico resta confrontabile nel tempo e i diff di git mostrano come cambiano i
documenti di report tra un trimestre e l'altro.

## Struttura

```
analisi-finanziaria/
├── .claude/skills/
│   ├── analysis/
│   │   ├── SKILL.md                                # /analysis TICKER [URL] — fase 1
│   │   └── references/                             # materiale di supporto alla fase 1
│   │       ├── metriche.md                         # metriche da estrarre e convenzioni
│   │       └── fonti.md                            # gerarchia delle fonti da consultare
│   └── report/
│       ├── SKILL.md                                # /report TICKER — fase 2
│       └── references/                             # materiale di supporto alla fase 2
│           └── template-scheda.md                  # struttura fissa del documento di output
├── dati/
│   ├── aziende/<TICKER>/*.*                         # input grezzi (S1, 10-Q, 10-K, altro)
│   └── note/<TICKER>/note-<YYYYMMDD>.md             # note di lavoro della fase 1
├── analisi/<TICKER>/<TICKER>_<YYYYMMDD>_analisi.md # output: schede generate, una per data
└── README.md
```

## Nota

Le schede prodotte sono analisi fattuale, non consulenza finanziaria.
