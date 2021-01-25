---
slug: /poscreators/middleware-doc/germany/reference-tables/ftpayitemcase
title: 'Type of Payment: ftPayItemCase'
---

# Type of Payment: ftPayItemCase

This table expands on the values provided in table [ftPayItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-payment-ftpayitemcase) with values applicable to the German market.

| **Value**  | **Description** | **ZAHLART_TYP (DSFinV-K)** | **Middleware-Version** |
|---|---|---|---|
| `0x4445000000000000` | Unknown payment type for DE<br />This is handled like a cash payment in national currency. | Bar | 1.3- |
| `0x4445000000000001` | Cash payment in national currency | Bar | 1.3- |
| `0x4445000000000002` | Cash payment in foreign currency | Bar | 1.3-  |
| `0x4445000000000003` | Crossed cheque | Unbar | 1.3-  |
| `0x4445000000000004` | Debit card payment | ECKarte | 1.3- |
| `0x4445000000000005` | Credit card payment  | Kreditkarte | 1.3- |
| `0x4445000000000006` | Online payment | ElZahlungsdienstleister | 1.3- |
| `0x4445000000000007` | Customer card payment | Guthabenkarte  | 1.3- |
| `0x4445000000000008` | SEPA transfer   | Unbar | 1.3-  |
| `0x4445000000000009` | Other Bank transfer | Unbar | 1.3- |
| `0x444500000000000A` | Internal / material consumption | Keine | 1.3- |
| `0x444500000000000B` | Change in national currency | Bar | 1.3- |
| `0x444500000000000C` | Change in foreign curreny | Bar | 1.3- |
| `0x444500000000000D` | Voucher<br />not taxable <br />DSFinV-K transformation required. UST_Schluessel=5. Negative amount gets converted to GV_TYP=MehrzweckgutscheinKauf. Positive amount gets converted to TYP_GV=MehrzweckgutscheinEinlösung. amount=-amount. In case of void-receipt everything is returned. | Keine | 1.3 |
| `0x444500000000000E` | Receivable<br />not taxable <br />DSFinV-K transformation required. UST_Schluessel=5. Negative amount gets converted to GV_TYP=Forderungsauflösung. Positive amount gets converted to GV_TYP=Forderungsentstehung. amount=-amount. In case of cancellation-receipt the +/- sign has to be returned.  | Keine | 1.3- |
| `0x444500000000000F` | Down payment<br />not taxable <br />DSFinV-K transformation required. UST_Schluessel=5. Negative amount gets converted to GV_TYP=Anzahlungseinstellung. Positive amount gets converted to GV_TYP=Anzahlungsaufloesung. amount=-amount. In case of void-receipt everything is returned. Not valid for taxable down payments, where it is clearly defined what the service is for. | Keine  | 1.3- |
| `0x4445000000000010` | Tip to employee<br />not taxable<br />DSFinV-K transformation required. UST_Schluessel=5. Negative amount required, get converted to GV_TYP=TrinkgeldAN. amount=-amount. In case of void-receipt everything returned. | Keine | 1.3- |
| `0x4445000000000011` | (real) Grant <br />not taxable<br />DSFinV-K transformation required. UST_Schluessel=5. Positive amount required, get converted to GV_TYP=ZuschussEcht. amount=-amount. In case of void-receipt everything is returned. | Keine | 1.3- |
| `0x4445000000000012` | Cash transfer to empty till<br />not taxable <br />DSFinV-K transformation required. UST_Schluessel=5. Negative amount required, get converted to GV_TYP=Anfangsbestand. amount=-amount. In case of void-receipt everything is returned. | Keine | 1.3- |
| `0x4445000000000013` | Cash transfer from/to owner<br />not taxable <br />DSFinV-K transformation required. UST_Schluessel=5. Negative amount gets converted to GV_TYP=Privateinlage. Positive amount gets converted to GV_TYP=Privatentnahme. amount=-amount. In case of void-receipt everything is returned | Keine | 1.3- |
| `0x4445000000000014` | Cash transfer from/to till<br />not taxable <br />DSFinV-K transformation required. UST_Schluessel=5. GV_TYP=Geldtransit. amount=-amount. Cash transfer from till is positive amount, cash transfer to till is negative amount. | Keine | 1.3- |
| `0x4445000000000015` | Cash transfer to employee <br />not taxable <br />DSFinV-K transformation required. Positive amount required, get converted to UST_Schluessel=5.GV_TYP=Lohnzahlung. amount=-amount. | Keine | 1.3- |
| `0x4445000000000016` | Cash transfer from/to cash book <br />not taxable <br />DSFinV-K transformation required. Negative amount gets converted to GV_TYP=Einzahlung. Positive amount gets converted to GV_TYP=Auszahlung. amount=-amount.  In case of void-receipt everything is returned | Keine | 1.3- |
| `0x4445000000000017` | Cash amount difference from/to till<br />not taxable<br />DSFinV-K transformation required. UST_Schluessel=5. GV_TYP=DifferenzSollIst. amount=-amount. Cash transfer from till is positive amount, cash transfer to till is negative amount. | Keine | 1.3- |

