### Type of Payment: ftPayItemCase

This table expands on the values provided in table [ftPayItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-payment-ftpayitemcase) with values applicable to the German market.

| **Value**  | **Description** | **ZAHLART_TYP (DSFinV-K)** | **Middleware-Version** |
|---|---|---|---|
| `0x4445000000000000` | unknown payment type for DE<br />This is handled like a cash payment in national currency. | Bar | 1.3- |
| `0x4445000000000001` | cash payment in national currency | Bar | 1.3- |
| `0x4445000000000002` | cash payment in foreign currency | Bar | 1.3-  |
| `0x4445000000000003` | crossed cheque | Unbar | 1.3-  |
| `0x4445000000000004` | debit card payment | ECKarte | 1.3- |
| `0x4445000000000005` | credit card payment  | Kreditkarte | 1.3- |
| `0x4445000000000006` | online payment | ElZahlungsdienstleister | 1.3- |
| `0x4445000000000007` | customer card payment | Guthabenkarte  | 1.3- |
| `0x4445000000000008` | SEPA transfer   | Unbar | 1.3-  |
| `0x4445000000000009` | other Bank transfer | Unbar | | 1.3- |
| `0x444500000000000A` | internal / material consumption | Keine | 1.3- |
| `0x444500000000000B` | change in national currency | Bar | 1.3- |
| `0x444500000000000C` | change in foreign curreny | Bar | 1.3- |
| `0x444500000000000D` | voucher<br /> not taxable <br /> DSFinV-K transformation required. UST_Schluessel=5. negative amount gets converted to GV_TYP=MehrzweckgutscheinKauf. positive amount gets converted to TYP_GV=MehrzweckgutscheinEinlösung. amount=-amount. in case of void-receipt everything turned. | Keine | 1.3 |
| `0x444500000000000E` | receiveable<br /> not taxable <br /> DSFinV-K transformation required. UST_Schluessel=5. negative amount gets converted to GV_TYP=Forderungsentstehung. positive amount gets converted to GV_TYP=Forderungsaufloesung. amount=-amount. in case of void-receipt everything turned  | Keine | 1.3- |
| `0x444500000000000F` | down payment<br /> not taxable <br /> DSFinV-K transformation required. UST_Schluessel=5. negative amount gets converted to GV_TYP=Anzahlungseinstellung. positive amount gets converted to GV_TYP=Anzahlungsaufloesung. amount=-amount. in case of void-receipt everyting turned. not valid for taxable down payments, where it is clearly defined what se serrice is for. | Keine  | 1.3- |
| `0x4445000000000010` | tip to employee<br /> not taxable<br /> DSFinV-K transformation required. UST_Schluessel=5. negative amount required, get converted to GV_TYP=TrinkgeldAN. amount=-amount. in case of void-receipt everything turned. | Keine | 1.3- |
| `0x4445000000000011` | (real) grant <br /> not taxable<br /> DSFinV-K transformation required. UST_Schluessel=5. positiv amount required, get converted to GV_TYP=ZuschussEcht. amount=-amount. in case of void-receipt everything turned. | Keine | 1.3- |
| `0x4445000000000012` | cash transfer to empty till<br /> not taxable <br /> DSFinV-K transformation required. UST_Schluessel=5. negativ amount required, get converted to GV_TYP=Anfangsbestand. amount=-amount. in case of void-receipt everything turned. | Keine | 1.3- |
| `0x4445000000000013` | cash transfer from/to owner<br /> not taxable <br /> DSFinV-K transformation required. UST_Schluessel=5. negative amount gets converted to GV_TYP=Privateinlage. positive amount gets converted to GV_TYP=Privatentnahme. amount=-amount. in case of void-receipt everything turned | Keine | 1.3- |
| `0x4445000000000014` | cash transfer from/to till<br /> not taxable <br /> DSFinV-K transformation required. UST_Schluessel=5. GV_TYP=Geldtransit. amount=-amount. | Keine | 1.3- |
| `0x4445000000000015` | cash transfer to employee <br /> not taxable <br /> DSFinV-K transformation required. negative amount required, get converted to UST_Schluessel=5.GV_TYP=Lohnzahlung. amount=-amount. | Keine | 1.3- |
| `0x4445000000000016` | cash transfer from/to cash book <br /> not taxable <br /> DSFinV-K transformation required. negative amount gets converted to GV_TYP=Einzahlung. positive amount gets converted to GV_TYP=Auszahlung. amount=-amount.  in case of void-receipt everything turned | Keine | 1.3- |
| `0x4445000000000017` | cash amount difference from/to till<br /> not taxable<br /> DSFinV-K transformation required. UST_Schluessel=5. GV_TYP=DifferenzSollIst. amount=-amount. | Keine | 1.3- |

