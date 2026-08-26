---
name: report
description: Produce la scheda di analisi finanziaria in markdown di un'azienda quotata, seguendo il template del progetto, a partire dall'analisi preliminare già svolta. Da usare quando l'utente scrive /report TICKER o chiede di generare il documento dopo un'analisi.
argument-hint: "<TICKER>"
---

# /report TICKER — Produzione della scheda

Fase 2 del flusso di lavoro. Trasforma l'analisi preliminare in un documento markdown
conforme al modello del progetto.

## 1. Recupera il materiale

Nell'ordine:

1. **La conversazione corrente**, se `/analysis <TICKER>` è stato eseguito in questa chat:
   è la fonte primaria, perché contiene anche le correzioni e le indicazioni dell'utente.
2. **Le note di lavoro** in `dati/note/<TICKER>/note-<YYYYMMDD>.md`, prendendo la piu'
   recente. Usa questa strada quando la chat non contiene l'analisi.
3. **I documenti** in `dati/aziende/<TICKER>/`, per verificare un dato dubbio alla fonte.

Se non trovi né conversazione né note per quel ticker, fermati e proponi all'utente di
eseguire prima `/analysis <TICKER> [URL]`. Non improvvisare un'analisi da zero in questa fase.

## 2. Regola fondamentale

Il report **non introduce dati nuovi**. Ogni cifra deve provenire dall'analisi preliminare
o essere verificata con le note `dati/note/<TICKER>/`. Se durante la scrittura
ti accorgi che manca un dato previsto dal template:

- se è recuperabile da una fonte già citata, recuperalo e cita la fonte;
- altrimenti scrivi `N/D` e aggiungilo alla lista dei dati mancanti in fondo al documento.

Non colmare mai un vuoto con una stima non dichiarata.

## 3. Aggiorna il prezzo di riferimento

Se dall'analisi preliminare è passato del tempo, aggiorna il prezzo al momento della
stesura recuperandolo da una fonte di mercato pubblica (es. Yahoo Finance o Stooq),
indicando fonte, data, ora e stato del dato: se il dato è `FROZEN` o `DELAYED`, scrivilo
nel documento accanto al prezzo. Ricalcola di conseguenza i multipli che dipendono dal
prezzo, tenendo fermi i denominatori di bilancio. I dati di bilancio restano quelli
dell'ultimo periodo pubblicato.

## 4. Scrivi il documento

Usa **sempre** `references/template-scheda.md` senza modificarne la struttura nè l'ordine delle
sezioni. Per la parte di prospetti e varianze, mantieni la coerenza con quanto prodotto
dalla skill `financial-analysis:3-statement-model` in fase di analisi.

Convenzioni:

- lingua italiana, numeri in formato `1.234.567,89`;
- valuta sempre esplicita; se converti, indica tasso e data;
- distingui nel testo i dati dalle opinioni, e le stime di consensus dai dati di bilancio;
- nessuna raccomandazione di acquisto o vendita: la scheda è analisi fattuale.

## 5. Verifica prima di salvare

- Tutte le sezioni del template sono presenti, anche quelle con `N/D`.
- Ogni cifra è riconducibile a una fonte elencata in fondo al documento.
- La data del prezzo di riferimento è indicata.
- Rischi e catalizzatori sono specifici all'azienda, non affermazioni generiche.
- I totali dei prospetti quadrano.

## 6. Salva e consegna

Salva in `analisi/<TICKER>/<TICKER>_<YYYYMMDD>_analisi.md`, creando la cartella se manca.
Se un file con lo stesso nome esiste già (seconda stesura nello stesso giorno),
sovrascrivilo solo dopo aver avvisato l'utente.

Consegna il file all'utente e riepiloga in due righe cosa contiene e quali dati sono
rimasti `N/D`.
