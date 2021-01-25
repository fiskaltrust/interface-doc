# Type of Service: ftChargeItemCase

This table expands on the values provided in the table [ftChargeItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-service-ftchargeitemcase), with country-specific values applicable to the German market.

| **Value** | **Description** | **UST_SCHLUESSEL (DSFinV-K)** | **GV_TYP (DSFinV-K)** | **Service-Version** |
|---|---|---|---|---|
| `0x4445000000000000` | Unknown type of service for DE | 7 | Umsatz | 1.3- |
| `0x4445000000000001` | Undefined type of service for DE normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) | 1 | Umsatz  | 1.3- |
| `0x4445000000000002` | Undefined type of service for DE discounted-1<br /> 1.1.2019: 7% (DE: Ermäßigter Steuersatz) | 2 | Umsatz   | 1.3- |
| `0x4445000000000003` | Undefined type of service for DE special-1.  1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  | 3 | Umsatz     | 1.3- |
| `0x4445000000000004` | Undefined type of service for DE special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) | 4 | Umsatz         | 1.3- |
| `0x4445000000000005` | Undefined type of service for DE not taxable   | 5 | Umsatz | 1.3- |
| `0x4445000000000006` | Undefined type of service for DE zero   | 6 | Umsatz | 1.3- |
| `0x4445000000000007` | Undefined type of service for DE unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` | 7 or > 1000 | Umsatz | 1.3- |
| `0x4445000000000011` | Delivery normal. For processing, see (0x4445000000000001) | 1 | Umsatz   | 1.3- |
| `0x4445000000000012` | Delivery discounted-1. For processing, see (0x4445000000000002)  | 2 | Umsatz   | 1.3- |
| `0x4445000000000013` | Delivery special-1. For processing, see (0x4445000000000003)  | 3 | Umsatz | 1.3- |
| `0x4445000000000014` | Delivery special-2. For processing, see (0x4445000000000004) | 4 | Umsatz  | 1.3- |
| `0x4445000000000015` | Delivery not taxable. For processing, see (0x4445000000000005) | 5 | Umsatz | 1.3- |
| `0x4445000000000016` | Delivery zero. For processing, see (0x4445000000000005) | 6 | Umsatz | 1.3- |
| `0x4445000000000017` | Delivery unknown vat. For processing, see (0x4445000000000007) | 7 or > 1000 | Umsatz | 1.3- |
| `0x4445000000000019` | Other services normal. For processing, see (0x4445000000000003) | 1 | Umsatz  | 1.3- |
| `0x444500000000001A` | Other services discounted-1.For processing, see (0x4445000000000001) | 2 | Umsatz  | 1.3- |
| `0x444500000000001B` | Other services special-1. For processing, see (0x4445000000000004)  | 3 | Umsatz | 1.3- |
| `0x444500000000001C` | Other services special-2. For processing, see (0x4445000000000002) | 4 | Umsatz  | 1.3- |
| `0x444500000000001D` | Other services not taxable. For processing, see (0x4445000000000005)  | 5 | Umsatz | 1.3- |
| `0x444500000000001E` | Other services zero. For processing, see (0x4445000000000005)  | 6 | Umsatz | 1.3- |
| `0x444500000000001F` | Other services unknown vat. For processing, see (0x4445000000000007)  | 7 or > 1000 | Umsatz | 1.3- |
| `0x4445000000000021` | Returnable normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Pfand  | 1.3- |
| `0x4445000000000022` | Returnable discounted-1.  1.1.2019: 7% (DE: Ermäßigter Steuersatz) | 2 | Pfand  | 1.3- |
| `0x4445000000000023` | Returnable special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Pfand  | 1.3- |
| `0x4445000000000024` | Returnable special-2.  1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Pfand  | 1.3- |
| `0x4445000000000025` | Returnable not taxable |5|Pfand  1.3- ||
| `0x4445000000000026` | returnable zero |6|Pfand | 1.3- |
| `0x4445000000000027` | Returnable vat unknown. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000|Pfand  1.3- ||
| `0x4445000000000029` | Returnable reverse normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|PfandRueckzahlung  | 1.3- |
| `0x444500000000002A` | Returnable reverse discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|PfandRueckzahlung  | 1.3- |
| `0x444500000000002B` | Returnable reverse special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|PfandRueckzahlung  | 1.3- |
| `0x444500000000002C` | Returnable reverse special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|PfandRueckzahlung  | 1.3- |
| `0x444500000000002D` | Returnable reverse not taxable|5|PfandRueckzahlung  |1.3- |
| `0x444500000000002E` | Returnable reverse zero|6|PfandRueckzahlung  |1.3- |
| `0x444500000000002F` | Returnable reverse vat unknown. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000`|7 or > 1000|PfandRueckzahlung  |1.3- |
| `0x4445000000000031` | Discount normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Rabatt  | 1.3- |
| `0x4445000000000032` | Discount discounted-1 . 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Rabatt   | 1.3-|
| `0x4445000000000033` | Discount special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Rabatt     | 1.3- |
| `0x4445000000000034` | Discount special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Rabatt         | 1.3- |
| `0x4445000000000035` | Discount not taxable |5|Rabatt | 1.3- |
| `0x4445000000000036` | Discount zero  |6|Rabatt | 1.3- |
| `0x4445000000000037` | Discount unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000|Rabatt  | 1.3- |
| `0x4445000000000039` | Extra charge normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Aufschlag  | 1.3- |
| `0x444500000000003A` | Extra charge discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Aufschlag   | 1.3-|
| `0x444500000000003B` | Extra charge special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Aufschlag     | 1.3- |
| `0x444500000000003C` | Extra charge special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Aufschlag         | 1.3- |
| `0x444500000000003D` | Extra charge not taxable |5|Aufschlag | 1.3- |
| `0x444500000000003E` | Extra charge zero  |6|Aufschlag | 1.3- |
| `0x444500000000003F` | Extra charge unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000 |Aufschlag  | 1.3- |
| `0x4445000000000041` | Unreal grant normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|ZuschussUnecht  | 1.3- |
| `0x4445000000000042` | Unreal grant discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|ZuschussUnecht   | 1.3-|
| `0x4445000000000043` | Unreal grant special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|ZuschussUnecht     | 1.3- |
| `0x4445000000000044` | Unreal grant special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|ZuschussUnecht         | 1.3- |
| `0x4445000000000045` | Unreal grant not taxable |5|ZuschussUnecht | 1.3- |
| `0x4445000000000046` | Unreal grant zero  |6|ZuschussUnecht | 1.3- |
| `0x4445000000000047` | Unreal grant unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000|ZuschussUnecht  | 1.3- |
| `0x4445000000000049` | Real grant not taxable  | 5 |ZuschussEcht | 1.3- |
| `0x4445000000000051` | Tip to owner normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|TrinkgeldAG  | 1.3- |
| `0x4445000000000052` | Tip to owner discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|TrinkgeldAG   | 1.3-|
| `0x4445000000000053` | Tip to owner special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle) |3|TrinkgeldAG     | 1.3- |
| `0x4445000000000054` | Tip to owner special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|TrinkgeldAG         | 1.3- |
| `0x4445000000000055` | Tip to owner not taxable |5|TrinkgeldAG | 1.3- |
| `0x4445000000000056` | Tip to owner zero |6|TrinkgeldAG | 1.3- |
| `0x4445000000000057` | Tip to owner unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000|TrinkgeldAG  | 1.3- |
| `0x4445000000000059` | Tip to employee no vat | 5 |TrinkgeldAN | 1.3- |
| `0x4445000000000060` | Voucher sale not taxable  | 5 |MehrzweckgutscheinKauf | 1.3- |
| `0x4445000000000061` | Coupon sales normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|EinzweckgutscheinKauf  | 1.3- |
| `0x4445000000000062` | Coupon sales discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|EinzweckgutscheinKauf   | 1.3-|
| `0x4445000000000063` | Coupon sales special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|EinzweckgutscheinKauf     | 1.3- |
| `0x4445000000000064` | Coupon sales special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|EinzweckgutscheinKauf         | 1.3- |
| `0x4445000000000065` | Coupon sales not taxable |5|EinzweckgutscheinKauf | 1.3- |
| `0x4445000000000066` | Coupon sales zero |6|EinzweckgutscheinKauf | 1.3- |
| `0x4445000000000067` | Coupon sales unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000|EinzweckgutscheinKauf  | 1.3- |
| `0x4445000000000068` | Voucher redeem not taxable  | 5 |MehrzweckgutscheinEinloesung | 1.3- |
| `0x4445000000000069` | Coupon redeem normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|EinzweckgutscheinEinloesung  | 1.3- |
| `0x444500000000006A` | Coupon redeem discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|EinzweckgutscheinEinloesung   | 1.3-|
| `0x444500000000006B` | Coupon redeem special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|EinzweckgutscheinEinloesung     | 1.3- |
| `0x444500000000006C` | Coupon redeem special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|EinzweckgutscheinEinloesung         | 1.3- |
| `0x444500000000006D` | Coupon redeem not taxable |5|EinzweckgutscheinEinloesung | 1.3- |
| `0x444500000000006E` | Coupon redeem zero  |6|EinzweckgutscheinEinloesung | 1.3- |
| `0x444500000000006F` | Coupon redeem unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000|EinzweckgutscheinEinloesung  | 1.3- |
| `0x4445000000000071` | Receivable creation normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Forderungsentstehung  | 1.3- |
| `0x4445000000000072` | Receivable creation discounted-1 . 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Forderungsentstehung   | 1.3-|
| `0x4445000000000073` | Receivable creation special-1. 1.1.2019: 10,70% (DE: Durchschnittssatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle) |3|Forderungsentstehung     | 1.3- |
| `0x4445000000000074` | Receivable creation special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Forderungsentstehung         | 1.3- |
| `0x4445000000000075` | Receivable creation not taxable |5|Forderungsentstehung | 1.3- |
| `0x4445000000000076` | Receivable creation zero  |6|Forderungsentstehung | 1.3- |
| `0x4445000000000077` | Receivable creation unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000|Forderungsentstehung  | 1.3- |
| `0x4445000000000079` | Receivable reduction normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Forderungsaufloesung  | 1.3- |
| `0x444500000000007A` | Receivable reduction discounted-1 . 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Forderungsaufloesung   | 1.3-|
| `0x444500000000007B` | Receivable reduction special-1 . 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Forderungsaufloesung     | 1.3- |
| `0x444500000000007C` | Receivable reduction special-2 . 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Forderungsaufloesung         | 1.3- |
| `0x444500000000007D` | Receivable reduction not taxable |5|Forderungsaufloesung | 1.3- |
| `0x444500000000007E` | Receivable reduction zero |6|Forderungsaufloesung | 1.3- |
| `0x444500000000007F` | Receivable reduction unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000|Forderungsaufloesung  | 1.3- |
| `0x4445000000000081` | Down payment creation normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Anzahlungseinstellung  | 1.3- |
| `0x4445000000000082` | Down payment creation discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Anzahlungseinstellung   | 1.3-|
| `0x4445000000000083` | Down payment creation special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Anzahlungseinstellung     | 1.3- |
| `0x4445000000000084` | Down payment creation special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Anzahlungseinstellung         | 1.3- |
| `0x4445000000000085` | Down payment creation not taxable |5|Anzahlungseinstellung | 1.3- |
| `0x4445000000000086` | Down payment creation zero  |6|Anzahlungseinstellung | 1.3- |
| `0x4445000000000087` | Down payment creation unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000|Anzahlungseinstellung  | 1.3- |
| `0x4445000000000089` | Down payment reduction normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Anzahlungsaufloesung  | 1.3- |
| `0x444500000000008A` | Down payment reduction discounted-1 . 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Anzahlungsaufloesung   | 1.3-|
| `0x444500000000008B` | Down payment reduction special-1 . 1.1.2019: 10,70% (DE: Durchschnittssatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle) |3|Anzahlungsaufloesung     | 1.3- |
| `0x444500000000008C` | Down payment reduction special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Anzahlungsaufloesung         | 1.3- |
| `0x444500000000008D` | Down payment reduction not taxable |5|Anzahlungsaufloesung | 1.3- |
| `0x444500000000008E` | Down payment reduction zero  |6|Anzahlungsaufloesung | 1.3- |
| `0x444500000000008F` | Down payment reduction unknown vat. <br /> <br />`chargeItem.VATRate == 0.0 ? UST_SCHLUESSEL = 7 : UST_SCHLUESSEL = (chargeItem.VATRate * 100) + 1000` |7 or > 1000|Anzahlungsaufloesung  | 1.3- |
| `0x4445000000000090` | Cash transfer to empty till not taxable  | 5 |Anfangsbestand | 1.3- |
| `0x4445000000000091` | Cash transfer from till to owner not taxable  | 5 |Privatentnahme | 1.3- |
| `0x4445000000000092` | Cash transfer from owner to till not taxable  | 5 |Privateinlage | 1.3- |
| `0x4445000000000093` | Cash transfer from/to till not taxable  | 5 |Geldtransit | 1.3- |
| `0x4445000000000094` | Cash transfer from till to employee not taxable  | 5 |Lohnzahlung | 1.3- |
| `0x4445000000000095` | Cash transfer to cash book not taxable | 5 | Einzahlung | 1.3- |
| `0x4445000000000096` | Cash transfer from cash book not taxable  | 5 | Auszahlung | 1.3- |
| `0x4445000000000097` | Cash amount difference from/to till not taxable  | 5 | DifferenzSollIst | 1.3- |
| `0x44450000000000A1` | Reverse charge | 5 | Umsatz | 1.3- |
| `0x44450000000000A2` | Not own sales | 5 | Umsatz  | 1.3- |


#### ftChargeItemCaseFlag

This table shows flags that can be added to each `ftChargeItemCase` with values applicable to the German market. 

| Value | Description | Middleware-Version |
|---|---|---|
| 0x0000000000010000 | **Take away marker.** <br />For some cases, it is necessary to differ for the same good from in-house-consumption and take away. This flag signals a take away situation or in other words, a not-in-house-consumption if it is set. | 1.3.1- |


#### Table with vat rate reference numbers defined in DSFinV-K

This table will be removed in the future / replaced by a reference

| ID | USt-Satz | Beschreibung |
|---|---|---|
| 1 | 19,00% | Regelsteuersatz |
| 2 | 7,00% | Ermäßigter Steuersatz |
| 3 | 10,70% | Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle |
| 4 | 5,50% | Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG) |
| 5 | 0,00% | Nicht Steuerbar |
| 6 | 0,00% | Umsatzsteuerfrei |
| 7 | 0,00% | UmsatzsteuerNichtErmittelbar |
| 8-999 | | reserviert für Änderungen der DFKA-Taxonomie/DSFinV-K |
| ab 1000 | | individuelle Sachverhalte (Altsteuersätze, § 13b UStG, o.ä.) |

