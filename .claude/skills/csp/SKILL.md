---
name: csp
description: "Individua le migliori 3 opportunità di vendita di Cash Secured Put in scadenza la settimana successiva, a partire dallo screener pubblico cortesi.org/csp, e ne verifica il sentiment di mercato (incluso X) prima di rispondere. Da usare quando l'utente scrive /csp o chiede opportunità di CSP settimanali."
argument-hint: "[capitale da impegnare in $, es. 5000]"
---

# /csp — Opportunità Cash Secured Put settimanali

Skill autonoma in due fasi, indipendente dal flusso `/analysis` + `/report`. Obiettivo: selezionare le 3 migliori
opportunità di vendita di Cash Secured Put (CSP) con scadenza la settimana successiva a quella corrente, tra i ticker
segnalati da uno screener pubblico, e verificarne il sentiment prima di rispondere. Lo scopo è non farsi assegnare le
put, in questo senso un sentiment negativo è un fattore positivo

## 0. Prerequisito: connettore IBKR

Questa skill richiede gli strumenti IBKR (Interactive Brokers) in sessione — `get_price_snapshot`,
`get_option_data`, `get_option_parameters`, `search_contracts` — per verificare al punto 5 della sezione 1 i dati dello
screener con una fonte indipendente in tempo reale (lo screener è uno snapshot giornaliero, i premi si muovono
intraday). Controlla che siano disponibili prima di iniziare lo screening.

Se non sono disponibili, **fermati e chiedi all'utente di configurare il connettore IBKR** prima di procedere: non
proseguire in autonomia sostituendo la verifica con la sola ricerca web, perché su un'operazione con capitale impegnato
la conferma in tempo reale di prezzo, strike e premio non è un'opzione accessoria.

## 1. Screening delle opportunità

1. Visita `https://cortesi.org/csp/povery.html` (screener CSP pubblico, rigenerato quotidianamente) e leggi la tabella
   "Top opportunities (30)". Colonne attese: `# | Ticker | Tag | Score | Price | 52w L | 52w H | from 52w L |
   Day % | Mom 5d % | CSP strike | Strike delta | DTE | OTM | Mid | Exp prem | Ann yield | Wkly % | Spread | Capital | ATM IV |
   Why`. Se la struttura della pagina è cambiata rispetto a queste colonne, segnalalo all'utente prima di procedere.
2. Calcola la scadenza settimanale "della settimana successiva" rispetto a oggi: il primo venerdì che deve ancora
   arrivare è la scadenza di questa settimana, la scadenza target è il venerdì dopo. Se oggi è venerdì, la scadenza di
   questa settimana è oggi stesso e la scadenza target resta quella tra 2 venerdì. Converti la scadenza target in DTE
   atteso (giorni da oggi).
3. Filtra le righe della tabella con `DTE` pari, o più vicino (tolleranza ±2 giorni), al DTE target. Scarta o segnala i
   ticker con `Spread` largo (>15%) o con dati palesemente incoerenti (es. `Ann yield` fuori scala).
4. Tra i ticker rimasti ordina per `Score` decrescente, usando `Ann yield` come discriminante in caso di parità, e
   scegli i migliori 3.
    - Se l'utente ha indicato un capitale da impegnare (argomento in $ passato a `/csp`), scarta prima i ticker il cui
      `Capital` (capitale richiesto per un singolo contratto, strike × 100) supera quel budget, poi applica lo stesso
      ordinamento per `Score`/`Ann yield` sui rimanenti. Se nessun ticker rientra nel budget, segnalalo all'utente
      invece di sceglierne comunque tre. Se il capitale non è stato indicato, procedi senza questo filtro ma segnala
      nella risposta che il dimensionamento è calcolato solo a titolo indicativo.
5. **Verifica i dati con IBKR prima di rispondere** (vedi prerequisito al punto 0): usa `get_price_snapshot` (prezzo
   corrente) e `get_option_data`/`get_option_parameters` (catena opzioni, per confermare strike e premio alla scadenza
   target) sui 3 ticker scelti. Segnala nella risposta eventuali scostamenti rilevanti rispetto ai dati dello screener,
   incluso uno spread bid/ask live più largo di quanto riportato dallo screener.
6. **Calcola il max pain** per ciascuno dei 3 ticker, sulla stessa scadenza target (vedi
   [Investopedia — Max Pain](https://www.investopedia.com/terms/m/maxpain.asp) per la teoria):
    - Recupera con `get_option_data` l'intera catena (call e put) per la scadenza target, poi con `get_price_snapshot`
      (`option_open_interest`) l'open interest di ogni singolo contratto call e put quotato su quegli strike. Se gli
      strike quotati sono molti, puoi limitare la finestra a un intervallo ragionevole attorno al prezzo corrente (es.
      ±30%), segnalando nella risposta che il max pain è stato calcolato su un sottoinsieme di strike.
    - Per ogni strike candidato `P` della catena, calcola la perdita totale che i detentori di opzioni subirebbero se il
      titolo chiudesse a `P` a scadenza:
      `perdita(P) = Σ_k [ OI_call(k) × max(0, P − k) + OI_put(k) × max(0, k − P) ] × 100`
      (la somma è su tutti gli strike `k` della catena).
    - Il **max pain** è lo strike `P` che **minimizza** `perdita(P)` — cioè il prezzo al quale il maggior valore
      nozionale di opzioni in circolazione scadrebbe senza valore, quindi il punto di massima perdita aggregata per i
      detentori (e massimo guadagno per chi ha venduto le opzioni, incluso chi vende il CSP).
    - Confronta il max pain con il prezzo corrente e con lo strike del CSP scelto: un max pain sopra il prezzo attuale è
      un segnale (non una certezza) di attrazione verso l'alto entro la scadenza, quindi riduce il rischio di
      assegnazione; un max pain sotto lo strike scelto va segnalato come fattore di rischio aggiuntivo.

## 2. Sentiment e rischi, per ciascuno dei 3 ticker

Per ciascun ticker selezionato:

1. Cerca notizie recenti (ultimi 3-7 giorni): risultati societari, guidance, upgrade/downgrade di analisti, eventi macro
   o settoriali rilevanti.
2. Cerca il sentiment su X (Twitter) e altre fonti social/forum finanziarie di rilievo tramite ricerca web (es.
   `site:x.com <ticker>` o query equivalenti); sintetizza in un giudizio bullish / neutro / bearish con il motivo
   prevalente che emerge dalle fonti trovate.
3. **Controlla se cade una data di earnings entro la scadenza scelta**: è il rischio principale per un CSP a breve
   termine, perché aumenta la probabilità di gap e di assegnazione. Se gli earnings cadono nella finestra, segnalalo
   esplicitamente come rischio anche se il resto del quadro è favorevole.

## 3. Rispondi

Presenta una tabella con: Ticker, Strike, Premio (Mid / Exp prem), Scadenza (data effettiva, non solo DTE), Ann yield,
Score, Max Pain (strike calcolato, con la distanza % dal prezzo corrente), Sentiment (1 riga di motivazione), Earnings
entro scadenza (sì/no). Se è stato indicato un capitale, aggiungi una colonna Contratti (quanti contratti da 100 azioni
rientrano nel budget, arrotondato per difetto, con il capitale effettivamente impegnato). Sotto la tabella, per ciascun
ticker un breve paragrafo che lega score, sentiment, rischio earnings e posizione del max pain rispetto allo strike in
una valutazione d'insieme.

Chiudi sempre con un avviso: è un'analisi basata su uno screener automatico e su sentiment pubblico, non una
raccomandazione di investimento personalizzata; vendere un CSP comporta l'obbligo di acquistare il sottostante allo
strike se assegnato, va valutato in base al proprio profilo di rischio e alla propria disponibilità di capitale.

## 4. Salva la risposta in un file .md

Alla fine del processo chiedi **sempre** all'utente se vuole salvare un file markdown della risposta. Se la risposta è
si salva un file nella cartella `/csp` del progetto con questo nome `csp/csp-[DateToExpired].md` 