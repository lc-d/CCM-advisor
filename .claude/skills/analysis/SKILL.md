---
name: analysis
description: "Analisi preliminare interattiva di un'azienda quotata. Raccoglie bilanci, dati di mercato, notizie e stime, li discute in conversazione con l'utente e salva le .note di lavoro. Da usare quando l'utente scrive /analysis TICKER o chiede un'analisi preliminare di un'azienda. Non produce il documento finale: quello è compito della skill report."
argument-hint: "<TICKER> [URL sito aziendale o Investor Relations]"
---

# /analysis TICKER [URL] — Analisi preliminare

Fase 1 del flusso di lavoro. Obiettivo: raccogliere e discutere in conversazione tutto il materiale necessario, in modo
che l'utente possa correggere, aggiungere contesto e indirizzare l'analisi **prima** che il documento venga scritto.

Prima di cominciare l'analisi controlla sempre che non ci sia stata già una conversazione sullo stesso TICKER, es.
`../../../.note/<TICKER>/note-<YYYYMMDD>.md`. Se esiste chiedi all'utente se vuole ripartire dalla vecchia conversazione
o iniziarne una nuova.

**Importante!** Non scrivere la scheda finale in questa fase. Il documento si produce con `/report TICKER`. Prima di
chiudere la conversazione salva sempre le note di lavoro, vedi punto 6.

## 1. Identifica l'azienda

Dal ticker passato come argomento, conferma nome, mercato di quotazione e valuta di riferimento. Se il ticker è ambiguo
(più società con lo stesso simbolo su mercati diversi), chiedi conferma prima di procedere.

Se l'utente passa anche l'argomento [URL], il website della sezione Investor Relations dell'azineda, usalo come punto di
partenza per la ricerca dei documenti ufficiali al punto 2 e verificane la corrispondenza con l'azienda identificata dal
ticker. Se l'URL non è stato fornito, individua tu la sezione Investor Relations durante la ricerca.

## 2. Raccogli i dati

In quest'ordine:

1. **Documenti locali** — controlla se esiste una cartella `dati/aziende/<TICKER>/` e leggi tutto quello che trovi
   (bilanci, presentazioni, screenshot, appunti). Se non li trovi consiglia l'utente di inserire almeno
    1. l'ultimi Q dalla SEC;
    2. ultimo 10-k dalla SEC;
    3. Form-S1 dell'IPO filling (utile per ricostruzione storica). Prima di continuare.
2. **Ricerca** — segui la gerarchia delle fonti in `references/fonti.md`: documenti ufficiali, poi mercato, poi notizie
   degli ultimi 3-6 mesi, poi consensus.

## 3. Ricostruisci i prospetti — usa sempre `/financial-analysis:3-statement-model`

Invoca **sempre** la skill `financial-analysis:3-statement-model` per strutturare conto economico, stato patrimoniale e
rendiconto finanziario e per l'analisi delle varianze periodo-su-periodo. Da quella skill usa in particolare:

- il formato standard dei tre prospetti e i requisiti di presentazione GAAP/IFRS;
- la metodologia di calcolo delle varianze (variazione assoluta, percentuale, punti base)
  e la loro scomposizione per driver (volume, prezzo, mix, una tantum, cambio, timing);
- la soglia di materialità, per decidere quali scostamenti meritano un commento.

Nota: quella skill è pensata per il reporting interno e assume ERP, budget e bilancio di verifica. Qui i dati arrivano
invece dai bilanci pubblici, quindi ignora i passaggi su budget e connettori ERP e usa il periodo di confronto
(trimestre o esercizio precedente, più lo stesso periodo dell'anno prima) al posto del budget.

## 4. Estrai le metriche

Segui l'elenco e le convenzioni in `references/metriche.md`. Regola invariabile: un numero non trovato si segna `N/D`,
non si stima mai. Le stime di consensus vanno sempre etichettate come tali.

## 5. Discuti con l'utente

**Questa è la parte centrale della fase, la più importante!**.

Presenta come prima risposta in conversazione un'analisi qualitativa:

1. Breve storia dell'azienda dalla fondazione, in massimo 1000 caratteri;
2. Elenco e analisi della ownership;
3. I prodotti principali: elenco con breve descrizione;
4. Revenues stream;
5. Valutazione del MOAT (se c'è un MOAT);
6. Elenco potenziali concorrenti;
7. Analisi del Backlog;
8. Analisi di R&D negli ultimi 2 anni.

Alla fine della tua presentazione chiedi all'utente se vuole proseguire con un'analisi quantitativa più tecnica, se la
risposta è affermativa, procedi presentando:

- i prospetti ricostruiti e le varianze materiali, con un'ipotesi di spiegazione per ognuna;
- le metriche di valutazione con la data del prezzo usato;
- il quadro qualitativo: modello di business, posizionamento, rischi specifici, catalizzatori;
- **esplicitamente, i buchi**: quali dati mancano, quali fonti sarebbero servite, quali numeri sono incerti o in
  conflitto tra fonti diverse.

Poi fai domande all'utente su cio' che resta aperto: tesi d'investimento che ha in mente, orizzonte temporale, aspetti
su cui vuole che l'analisi si concentri. Aspettati di iterare piu' volte prima di considerare chiusa la fase.

## 6. Salva le note di lavoro

Prima di chiudere la conversazione e di creare il report salva quanto raccolto in
`../../../.note/<TICKER>/note-<YYYYMMDD>.md`:
tutti i dati numerici con la relativa fonte e data, le varianze commentate, i punti emersi dalla conversazione, e la
lista dei dati mancanti.

Serve perché `/report` possa essere eseguito anche in una chat diversa, dove la conversazione di questa fase non è piu'
disponibile.

**Nota bene:** se l'utente esegue `/report <TICKER>` considera chiusa la conversazione e salva le note, comunicandolo
all'utente.

