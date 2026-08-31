---
ticker: PL
title: Planet Labs PBC
model: Claude Sonnet 5
date: 2026-08-31T16:00:00.000-04:00
---

# Planet Labs PBC (PL) — Scheda di analisi

## Sintesi fase 1

Planet Labs PBC nasce nel 2010 a San Francisco come Cosmogia Inc., fondata da tre ex ricercatori NASA Ames — Will Marshall, Robbie Schingler e Chris Boshuizen — con l'obiettivo di fotografare l'intera Terra ogni giorno. Pioniera dei CubeSat commerciali ("Dove"), cresce per acquisizioni (RapidEye e BlackBridge 2015, Terra Bella/SkySat da Google 2017, Boundless 2019, VanderSat 2021) e debutta al NYSE nel dicembre 2021 tramite fusione SPAC con dMY Technology Group IV, come Public Benefit Corporation.

La fase di analisi preliminare si è concentrata, su indicazione dell'utente, su tre aree specifiche oltre al quadro standard:

**Confronto tecnologico con BlackSky (BKSY)**, condotto sui dati locali del 10-Q BlackSky (periodo chiuso 30/6/2026): le due aziende hanno filosofie opposte, non solo scale diverse. Planet punta su imaging globale, giornaliero, a bassa/media risoluzione (PlanetScope 3-5m), con un moat basato sull'archivio storico dal 2009 e sulla copertura, non sulla latenza; estende la gamma verso l'alta risoluzione (Pelican, 0,3m) e l'iperspettrale (Tanager, capacità che BlackSky non ha). BlackSky punta su imaging on-demand, alta risoluzione (Gen-3: 35cm elettro-ottico + 1m SWIR per imaging notturno, capacità che Planet non ha), alta cadenza su aree mirate, con un business model che include anche la vendita diretta di satelliti (Mission Solutions). Le due tecnologie appaiono più complementari che sovrapposte nel segmento difesa/intelligence.

**Approfondimento su fondatori e team attuale**: il CEO Will Marshall (PhD Oxford, ex NASA/USRA, co-Principal Investigator su PhoneSat) mantiene il controllo strategico insieme al cofondatore Robbie Schingler (oggi Chief Strategy Officer), mentre il terzo cofondatore Chris Boshuizen ha lasciato l'azienda nel 2023. Il CFO **Ashley Fieglein Johnson** ha un mandato insolitamente ampio — President, COO e CFO in un'unica persona, con delivery di prodotto/tecnologia sotto la sua supervisione dopo l'uscita di Kevin Weil nel 2024 — un tratto distintivo di governance che concentra potere esecutivo ma comporta un rischio di chiave-persona più marcato della norma. Il ruolo di CTO, apparentemente "mancante" dal 2023, si è rivelato essere stato deliberatamente scisso nel settembre 2024 in due posizioni C-level distinte: Chief Product and Technology Officer (oggi Kevin Kirn, dall'ottobre 2025) per il lato software/piattaforma, e Chief Space Officer (James Mason) per il lato satelliti/hardware — scelta organizzativa coerente con la crescente rilevanza del segmento Satellite Services.

**Governance e controllo di voto** (dato aggiunto in questo aggiornamento, fonte: proxy DEF 14A depositato 27/5/2026): le 23.493.796 azioni Class B a supervoto (20 voti/azione) sono detenute per il 100% dai due co-fondatori rimasti, in parti esattamente uguali — 11.746.898 ciascuno (50%) — Marshall direttamente, Schingler tramite un trust familiare (Ulysses Trust). Sommando le azioni Class A dirette, i due controllano circa il 62% dei voti totali con solo il 9-10% circa di quota economica diretta: un assetto di controllo saldo tipico delle PBC founder-led, coerente con il rischio di chiave-persona già segnalato.

**Orizzonte di investimento dell'utente: 3 anni.** Su questo orizzonte, gli elementi più rilevanti emersi sono: un backlog superiore a $900M (+79% YoY a fine FY2026, sostanzialmente stabile nel trimestre successivo), con il 98-99% dell'ACV di natura ricorrente, che offre buona visibilità sui ricavi; la scadenza delle Convertible Notes nel 2030, oltre l'orizzonte; e la rivalutazione delle warrant liabilities ereditate dalla SPAC — fenomeno che ha causato $161,4 milioni di perdita non-cash nel FY2026 e un ultimo scatto di $106,5 milioni nel primo trimestre FY2027, **prima che i Public Warrant venissero integralmente redenti/esercitati il 27 aprile 2026** (vedi sezione Bilancio): il rumore contabile GAAP da questa fonte è quindi **già concluso**, non più "in esaurimento entro fine anno" come indicato nella versione precedente di questa scheda.

**Discussione qualitativa aggiuntiva (31/8/2026, non ancora tradotta in tesi d'investimento)**: l'utente ha chiesto quali implicazioni commerciali possano avere il MOAT dell'archivio storico e la flotta satellitare nella crescente economia dello spazio. La lettura emersa in conversazione — **da trattare come opinione/ipotesi di lavoro, non come dato verificato su fonte primaria** — è che l'archivio dal 2009 costituisca un moat "temporale" irriproducibile da nuovi entranti (a differenza di risoluzione/copertura, replicabili con capitale sufficiente, come dimostra Satellogic con margini lordi all'82% pur essendo un decimo della scala di Planet), utile per applicazioni a valle come modelli di variazione nel tempo, underwriting assicurativo/agricolo e, in prospettiva non confermata, verifica MRV per mercati del carbonio o licensing dei dati come training set per modelli AI geospaziali. Il limite di questa tesi è che il moat protegge la serie storica ma non la cattura futura, sempre più commoditizzata dalla discesa dei costi di manifattura/lancio satellitare — per cui il valore difendibile si sposterebbe progressivamente dall'hardware all'analytics costruito sopra l'archivio. L'utente formulerà la tesi d'investimento formale nella prossima sessione; questa scheda resta priva di raccomandazione, come da convenzione.

Durante la fase di analisi tutti i dati di bilancio sono stati verificati direttamente sui documenti SEC originali — 10-K FY2025 e FY2026, 10-Q Q1 FY2027 (periodo chiuso 30/4/2026) e proxy DEF 14A 2026 — scaricati da SEC EDGAR, correggendo diverse imprecisioni riscontrate nei dati aggregati da fonti secondarie (in particolare sulla perdita operativa GAAP e sul net debt, dettagliate nelle sezioni seguenti).

## Panoramica del business

Planet Labs opera la più grande costellazione commerciale di satelliti di osservazione della Terra, articolata su più linee di prodotto: **PlanetScope/SuperDove** (~200+ satelliti, imaging giornaliero globale a 3-5m di risoluzione), **SkySat** (~21 satelliti, alta risoluzione 0,5m), **Pelican** (nuova generazione ad alta risoluzione, 9 satelliti in orbita a maggio 2026, target 32, risoluzione 0,3m), **Tanager** (imaging iperspettrale, 400+ bande, per rilevamento emissioni), e il flusso più recente di **Satellite Services** (progettazione, costruzione e lancio di costellazioni chiavi in mano per governi terzi, es. Svezia).

Il modello di ricavi è prevalentemente ricorrente/subscription: il 98% dell'ACV Book of Business al 31/1/2026 è di natura ricorrente (fonte: 10-K FY2026), contro il 97% dell'anno precedente. Nel trimestre chiuso 30/4/2026, due clienti hanno rappresentato rispettivamente il 15% e l'11% dei ricavi (26% combinato) — in linea con il 25% combinato di FY2026 (13%+12%) — mentre a fine FY2025 un solo cliente rappresentava il 19%: la diversificazione lato ricavi osservata in FY2026 si conferma stabile nel trimestre successivo. Sul lato crediti, invece, un solo cliente rappresentava il 33% dei crediti verso clienti sia al 31/1/2026 sia al 30/4/2026 (era il 12% due esercizi prima) — concentrazione elevata e persistente, da monitorare per il rischio di timing/qualità degli incassi da un singolo cliente, verosimilmente governativo.

Il posizionamento competitivo vede Planet in concorrenza con incumbent ad alta risoluzione (Maxar, ora privata; Airbus Defence and Space), player next-gen ottici (BlackSky, Satellogic), operatori SAR (ICEYE, Capella Space, Umbra), player cinesi in espansione (Chang Guang Satellite) e specialisti iperspettrali (Wyvern, Orbital Sidekick). Il vantaggio competitivo di Planet risiede nell'archivio storico di immagini giornaliere dal 2009 (difficile da replicare retroattivamente) e nell'economia di scala della produzione di nanosatelliti a basso costo; il rischio principale al moat è la progressiva commoditizzazione dei dati di imaging grezzo — confermata anche dal confronto comps con Satellogic, che sta guadagnando margini lordi molto elevati proprio sulla leva del basso costo di manifattura — a cui Planet risponde spostando il valore verso analytics e AI.

## Dati finanziari chiave

| Metrica | FY2026 (chiuso 31/1/2026) | FY2025 (chiuso 31/1/2025) | Variazione YoY |
|-------------------|----------------|-----------------|----------------|
| Fatturato | $307,7 milioni | $244,4 milioni | +25,9% |
| Margine lordo | 56,08% | 57,18% | -1,10 p.p. |
| Margine operativo | -30,90% | -47,53% | +16,63 p.p. (miglioramento) |
| Utile netto | -$246,9 milioni | -$123,2 milioni | -100,4% (peggioramento) |
| EPS (base/diluito) | -$0,80 | -$0,42 | -90,5% (peggioramento) |
| Free cash flow | $57,6 milioni | -$58,7 milioni | +$116,3 milioni (svolta a positivo) |

*Fonte: Planet Labs PBC, Form 10-K per l'esercizio fiscale chiuso 31/1/2026, Consolidated Statements of Operations e Consolidated Statements of Cash Flows (SEC EDGAR, depositato 23/3/2026, dati verificati riga per riga sul documento originale il 26/8/2026). Tabella su base annuale (ultimo esercizio fiscale completo pubblicato), come da convenzione del template.*

**Nota sulla perdita netta**: il peggioramento dell'utile netto FY2026 è spiegato quasi interamente da una rivalutazione non-cash delle warrant liabilities di $161,4 milioni (legata all'apprezzamento del titolo nel periodo), non da un deterioramento operativo — il margine operativo, al contrario, migliora sensibilmente nell'anno. Il free cash flow è calcolato con definizione stretta di capex (solo acquisti di immobili/impianti, esclude software capitalizzato); includendo anche il software capitalizzato ($4,8M in FY2026), il capex totale sale a $81,5 milioni (FY2026) da $49,6 milioni (FY2025) — fonte: 10-K FY2026.

**Aggiornamento infra-annuale (10-Q Q1 FY2027, periodo chiuso 30/4/2026, verificato su fonte primaria SEC EDGAR il 31/8/2026)**: ricavi $94,2 milioni (+42% YoY, in accelerazione rispetto al +25,9% dell'intero FY2026); utile lordo $50,4 milioni (margine 53,5%, in leggero calo dal 56,1% annuale FY2026); **perdita operativa $34,9 milioni, in peggioramento del 53% YoY** (era -$22,8 milioni nel Q1 FY2026) — un'inversione rispetto al trend di miglioramento della leva operativa osservato sull'intero FY2026, dovuta a una crescita degli opex (+44%) superiore a quella dell'utile lordo (+38%). Non è ancora chiaro se sia un effetto di timing/stagionalità sulle assunzioni o l'inizio di un trend più strutturale — da monitorare nei prossimi trimestri prima di trarre conclusioni. Perdita netta GAAP -$138,9 milioni, di cui $106,5 milioni da rivalutazione warrant (ultima di questo tipo, vedi sezione Bilancio).

## Valutazione

| Multiplo | Valore | Nota |
|----------------|--------|------|
| P/E (trailing) | N/D | Non calcolabile: azienda in perdita GAAP (EPS -$0,80 FY2026) |
| P/E (forward) | N/D | Nessuna stima di consensus EPS forward verificata in questa fase |
| EV/EBITDA | N.S. (non significativo) | EBITDA GAAP negativo; su Adjusted EBITDA non-GAAP dichiarato dall'azienda ($15,5M FY2026, riconciliato nel 10-K) risulterebbe un multiplo triple-digit — livello non interpretabile |
| P/S | 23,04x (su FY2026) | Market cap $7.090M (prezzo $19,90 del 31/8/2026, 356,40M azioni) / Ricavi FY2026 $307,7M |
| Dividend yield | 0% | Nessuna distribuzione di dividendi risultante dai rendiconti finanziari FY2024-FY2026 (10-K) |

*Prezzo di riferimento: $19,90, chiusura NYSE del 31/8/2026 ore 15:54 EDT circa, fonte stockanalysis.com. Market cap ricalcolato: $7.090 milioni. EV ricalcolato a mano su base 30/4/2026 (Market cap + debito finanziario − cassa e investimenti a breve termine, ultimo bilancio trimestrale pubblicato): debito $447,6M, liquidità $730,8M → posizione di cassa netta +$283,3M → **EV ≈ $6.807 milioni**. I denominatori di conto economico (ricavi FY2026) restano quelli dell'ultimo esercizio fiscale completo pubblicato, come da convenzione del template; il numeratore (prezzo/EV) è invece aggiornato al 31/8/2026, inclusi i dati patrimoniali più recenti disponibili (Q1 FY2027).*

**EV/Ricavi TTM (metrica supplementare, non nel template ma utile per il confronto comps)**: ricavi TTM al 30/4/2026 $335,6 milioni (FY2026 $307,7M − Q1 FY2026 $66,3M + Q1 FY2027 $94,2M) → **EV/Ricavi TTM ≈ 20,3x**. Costruito un confronto comps con BlackSky (BKSY) e Satellogic (SATL) il 31/8/2026, su dati primari (10-Q rispettivi al 30/6/2026) e prezzi di mercato pari data:

| | PL | BKSY | SATL |
|---|---|---|---|
| EV/Ricavi TTM | 20,3x | 8,4x | 22,4x |
| Crescita ricavi ultimo trimestre YoY | +42% | +4,5% | +259% (parzialmente da vendita non ricorrente di un satellite in orbita, +71% al netto) |
| Margine operativo ultimo periodo | -37,1% | -48,7% | +1,7% (primo trimestre positivo) |
| Backlog/RPO su ricavi TTM | 2,7x | 3,5x | 2,5x |

Planet tratta a un multiplo intermedio tra i due peer, coerente con una crescita solida (+42% nell'ultimo trimestre) ma non esplosiva come Satellogic, a fronte però di una scala di ricavi e di una posizione di liquidità netta ampiamente superiori a entrambi (cassa netta 8-9 volte quella di BKSY/SATL in valore assoluto). BlackSky tratta al multiplo più basso del gruppo nonostante il miglior rapporto backlog/ricavi, verosimilmente per la crescita più lenta e la volatilità del segmento Mission Solutions; Satellogic al multiplo più alto, sostenuto da crescita e margini lordi (82,3% nell'ultimo trimestre) superiori al gruppo, ma su una base di ricavi ancora minuscola (~$32M TTM) e con una quota rilevante di ricavi del trimestre più recente legata a una vendita non ricorrente.

## Bilancio e solidità finanziaria

Al **30/4/2026** (fonte: 10-Q Q1 FY2027, Condensed Consolidated Balance Sheets, verificato su SEC EDGAR il 31/8/2026), Planet Labs dispone di **$368,1 milioni di cassa ed equivalenti** più **$362,7 milioni di investimenti a breve termine**, per un totale di **$730,8 milioni di risorse liquide** (in crescita da $640,1 milioni al 31/1/2026). Il debito finanziario è costituito esclusivamente dalle **Convertible Senior Notes 0,50% due 2030** (valore contabile netto $447,6 milioni, principale $460 milioni, emesse il 12/9/2025) — non risultano altre forme di debito finanziario.

Il net debt dipende dalla definizione adottata:
- **Definizione stretta** (debito − sola cassa): +$79,5 milioni
- **Includendo gli investimenti a breve termine**: **-$283,3 milioni**, cioè una posizione di **cassa netta positiva**, rafforzata rispetto ai -$193,2 milioni di fine FY2026

**Scadenze di rifinanziamento**: nessuna scadenza di debito finanziario nei prossimi 24 mesi; le Convertible Notes maturano nel 2030 (oltre l'orizzonte di investimento di 3 anni indicato dall'utente).

**Aggiornamento sui Public Warrant ereditati dalla SPAC (correzione rispetto alla versione precedente di questa scheda)**: il 27/3/2026 la società ha annunciato la redemption forzata di tutti i Public Warrant residui (strike $11,50/azione, ticker NYSE "PL WS"). Entro la Redemption Date del 27/4/2026, nel trimestre sono state emesse 9.374.075 azioni Class A da esercizio warrant, per $107,8 milioni di proventi lordi; le poche warrant residue sono state redente per un importo irrilevante. **Trading di "PL WS" sospeso e titolo delistato da NYSE prima dell'apertura del 27/4/2026; al 30/4/2026 zero warrant pubbliche o private in circolazione**. La versione precedente di questa scheda indicava una scadenza naturale attesa per il 7/12/2026: la società ha in realtà esercitato la call di redemption anticipata, e il fenomeno è **già concluso**. La rivalutazione di -$106,5 milioni nel Q1 FY2027 risulta quindi l'ultima di questo tipo — dal Q2 FY2027 in poi il net income GAAP non dovrebbe più contenere questa fonte di volatilità.

## Catalizzatori (prossimi 6-12 mesi)

- Pubblicazione dei risultati Q2 e Q3 FY2027 (attesi tipicamente a settembre e dicembre 2026), verifica dell'esecuzione contro la guidance FY2027 di ricavi $425-441 milioni (~+41% al midpoint) — fonte: comunicato risultati Q1 FY2027, giugno 2026. Particolare attenzione al trend della perdita operativa, in peggioramento YoY nel Q1 FY2027 dopo il miglioramento osservato nell'intero FY2026.
- Finalizzazione della documentazione di transazione e udienza di approvazione del tribunale nella causa Delaware class action, dopo l'accordo raggiunto in mediazione il 7/5/2026 — fonte: 10-Q Q1 FY2027, Note 8 Commitments and Contingencies. Evento di derisking, non più un'incognita aperta come nella versione precedente di questa scheda.
- Proseguimento del deployment della costellazione Pelican (risoluzione target 0,3m, con seconda generazione a 30cm attesa nel corso di FY2027) — fonte: ricerca web, comunicati Planet, agosto 2026.
- Possibili nuovi contratti Satellite Services dopo quelli già firmati con la Svezia e la NRO (pipeline dichiarata dal management: tre contratti a 9 cifre negli ultimi 12 mesi) — fonte: comunicato stampa risultati FY2026, 19/3/2026.

## Rischi principali

- **Peggioramento della perdita operativa nel Q1 FY2027** (-$34,9 milioni, +53% YoY), che inverte il trend di miglioramento osservato sull'intero FY2026 — opex cresciuti (+44%) più rapidamente dell'utile lordo (+38%); non ancora chiaro se effetto di timing/stagionalità o segnale più strutturale — fonte: 10-Q Q1 FY2027.
- **Concentrazione clienti**: due clienti al 15% e 11% dei ricavi nel trimestre chiuso 30/4/2026 (26% combinato); un solo cliente al 33% dei crediti verso clienti, dato invariato da due periodi consecutivi — fonte: 10-Q Q1 FY2027, Note su concentrazione clienti.
- **Contenzioso Delaware class action**: causa ereditata dalla fusione SPAC con dMY Technology Group IV; le parti hanno raggiunto un accordo transattivo in sede di mediazione il 7/5/2026, in attesa di documentazione definitiva e approvazione del tribunale — accantonamento già iscritto in bilancio. Rischio in via di chiusura, non più aperto come in precedenza — fonte: 10-Q Q1 FY2027.
- **Rischio di chiave-persona nella governance**: concentrazione dei ruoli President, COO e CFO in un'unica figura (Ashley Johnson), senza piano di successione pubblicamente noto; rafforzato dal dato ora disponibile sul controllo di voto (Marshall + Schingler, ~62% dei voti totali via azioni Class B a supervoto) — fonte: analisi fase 1, proxy DEF 14A 2026.
- **Margine lordo in calo strutturale atteso**: mix shift verso Satellite Services (a margine più basso del software puro); guidance FY2027 di margine lordo non-GAAP 52-54%, in calo dal 56% circa di FY2026; margine lordo Q1 FY2027 già sceso al 53,5% — fonte: comunicato risultati Q1 FY2027, giugno 2026; 10-Q Q1 FY2027.
- **Valutazione tesa e volatilità elevata**: EV/Ricavi TTM 20,3x, il più alto in valore assoluto tra i comps costruiti eccetto Satellogic; prezzo attuale -62% circa dal massimo delle 52 settimane ($51,76, 28/5/2026) — elevata sensibilità del titolo a esecuzione e sentiment di mercato — fonte: stockanalysis.com, 31/8/2026.

## Fonti consultate

- Planet Labs PBC, Form 10-K per l'esercizio fiscale chiuso 31/1/2026 — SEC EDGAR, depositato 23/3/2026: https://www.sec.gov/Archives/edgar/data/1836833/000119312526119957/pl-20260131.htm — consultato e verificato riga per riga il 26/8/2026
- Planet Labs PBC, Form 10-K per l'esercizio fiscale chiuso 31/1/2025 — SEC EDGAR, depositato ~21/3/2025: https://www.sec.gov/Archives/edgar/data/1836833/000183683325000050/pl-20250131.htm — consultato il 26/8/2026
- Planet Labs PBC, Form 10-Q per il trimestre chiuso 30/4/2026 (Q1 FY2027) — SEC EDGAR, depositato 5/6/2026: https://www.sec.gov/Archives/edgar/data/1836833/000119312526258304/pl-20260430.htm — consultato e verificato riga per riga il 31/8/2026
- Planet Labs PBC, Proxy Statement DEF 14A — SEC EDGAR, depositato 27/5/2026: https://www.sec.gov/Archives/edgar/data/1836833/000119312526241945/pl-20260527.htm — consultato il 31/8/2026, dati di ownership al 15/5/2026
- Planet Labs PBC, Form 10-K/A (Amendment No. 1), depositato 5/6/2026 — documento locale `dati/aziende/PL/10-K_A.html`
- Planet Labs PBC, Form 8-K (risultati voto Annual Meeting), 10/7/2026 — documento locale `dati/aziende/PL/8-K.html`
- Planet Labs PBC, Form S-1 (IPO/SPAC, 2021) — documento locale `dati/aziende/PL/PL-S-1.html`, non esaminato in dettaglio in questa fase
- BlackSky Technology, Form 10-Q, periodo chiuso 30/6/2026 — documento locale `dati/aziende/BKSY/Form 10-Q.html`, usato per il confronto tecnologico e i comps di valutazione
- Satellogic Inc., Form 10-Q per il trimestre chiuso 30/6/2026 — SEC EDGAR, depositato 6/8/2026: https://www.sec.gov/Archives/edgar/data/1874315/000187431526000032/satl-20260630.htm — documento locale `dati/aziende/SATL/10-Q_Q2FY2026.html`, usato per i comps di valutazione
- Satellogic Inc., Form 10-K per l'esercizio chiuso 31/12/2025 — SEC EDGAR, depositato 19/3/2026, consultato solo per il dato di fatturato FY2025 (calcolo TTM), non salvato in locale
- stockanalysis.com, quotazione e capitalizzazione di mercato di PL, BKSY, SATL — consultato 31/8/2026 ore 15:54-15:55 EDT (mercato aperto, quotazioni live)
- BusinessWire, "Planet Reports Financial Results for Fourth Quarter and Full Fiscal Year 2026", 19/3/2026
- Comunicati e press coverage sui risultati Q1 FY2027 (Motley Fool, Yahoo Finance, Investing.com, stocktitan.net), giugno 2026
- Planet.com Pulse, comunicati su promozioni/nomine management: "Planet Promotes New Chief Product Officer and Chief Space Officer" (26/9/2024), "Planet Welcomes Leading Executives in Product and Marketing" (ottobre 2025)
- Fonti web varie per biografie management e fondatori (Bloomberg Markets, LinkedIn/The Org, SpaceNews, ricerche aggregate) — consultate 26/8/2026
- Note di lavoro della fase di analisi preliminare, incl. discussione qualitativa su MOAT/space economy del 31/8/2026: `.note/PL/note-20260826.md`

## Dati mancanti (N/D)

- P/E forward: nessuna stima di consensus EPS verificata in questa fase
- Dati del 10-Q Q1 FY2027: **risolto in questo aggiornamento**, verificati su fonte primaria
- Titolarità esatta delle azioni Class B: **risolto in questo aggiornamento**, da proxy DEF 14A 2026 (50/50 Marshall/Schingler)
- Redemption dei Public Warrant: **risolto in questo aggiornamento** — già avvenuta il 27/4/2026, non più in attesa
- Comps di valutazione strutturati vs BlackSky e Satellogic: **risolto in questo aggiornamento**
- Composizione dettagliata del backlog per segmento/cliente (oltre a timing di conversione e concentrazione clienti, già noti)
- Esito finale (documentazione definitiva e approvazione del tribunale) della transazione nella causa Delaware class action, concordata in principio il 7/5/2026 ma non ancora formalizzata alla data di questa scheda
- Ipotesi emerse in discussione qualitativa (verifica MRV/mercati del carbonio, licensing dati per training AI geospaziale) non confermate da alcuna fonte primaria consultata — da verificare prima di includerle in una tesi d'investimento
- Tesi d'investimento dell'utente: non ancora fornita, attesa per la prossima sessione (1/9/2026)
