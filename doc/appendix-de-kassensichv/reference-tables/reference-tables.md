## Reference Tables

This chapter expands on the reference tables covered in [Reference Tables in General Part](../../general/reference-tables/reference-tables.md#reference-tables), with country-specific information applicable to the German market.

### Service Status: ftState

The table below describes supported statuses for the ftState field in accordance with the German law. These codes can be added through the logic operator "OR".

The country-specific code is made of the country’s code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Germany (DE) this is `0x4445`, which results in `0x4445000000000000` as the value for the "ready" status.

| **Value** | **Description** | **Service-Version** |
|---|---|---|

### Type of Receipt: ftReceiptCase

The ftReceiptCase indicates the receipt type and defines how it should be processed by the fiskaltrust.SecurityMechanism in accordance with the German law.

For Germany (DE) the country code is `0x4445`. Thus, the value of an unknown ftReceiptCase in Germany is `0x4445000000000000`.

| **Value** | **Description** | **BON_TYP (DSFinV-K)** <br> **processType (TSE)** | **Service- Version** |
|---|---|---|---|
| `0x4445000000000000` | unknown type for country-code "DE"<br />This is handled like a pos-receipt (`0x4445000000000001`). | Beleg <br> Kassenbeleg-V1 | 1.3- |
| `0x4445000000000001` | pos-receipt<br />main kind of receipt processed on a pos-system. creates a turnover and/or change in the amount of cash in the till or similar operations. <br />using the ChargeItems and PayItems to hand over details for processing. independent from the used flow (explicit/implicit), the ChargeItems and PayItems should contain the full final state of the receipt. the duration of the action is calculated using the minimum and maximum of datetime over ReceiptRequest/ChargeItems/PayItems.<br /> DSFinV-K: BON_TYP=Beleg, can be overwritten by ftReceiptCaseFlag  | Beleg <br> Kassenbeleg-V1 | 1.3- |
| `0x4445000000000002` | zero-receipt<br />used for communication and functional test of the fiskaltrust.SecurityMechanism. In addition a detailed status information is responded on the used TSE-Device. Is only valid when charge items block (ftChargeItems) and pay items block (ftPayItems) in the ReceiptRequest are empty arrays.<br />Also TSE data are unloaded, what may cause a long running request.<br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception.<br />if you want to end a ongoing transaction without turnover (e.g. all items on a receipt are voided) then use a regular ReceiptCase.<br /> Informations returned:<br />- List of cbReceiptReference <-> Transaction-ID<br />- Statusdata of TSE, serialnumber, available/free memory, available number of signatures left, ...<br /> DSFinV-K: BON_TYP=AVSonstige, ChargeItems and PayItems have to be empty | [none] <br> SonstigerVorgang  | 1.3- |
| `0x4445000000000003` | initial operation receipt / start-receipt<br />The request is only valid with the same property requirements as a zero-receipt. initializing a new fiskaltrust.SecurityMachanism, this includes also the initialization of the used TSE in the background. Depending on the TSE-Type used this includes different actions.<br />On successful initialization, a notification is created which includes the queue-id, scu-id, certificate/public-key, tse-serialnumber=hash(public-key). this notification need to be reported to tax administration.<br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception.<br /> DSFinV-K: BON_TYP=AVSonstige, ChargeItems and PayItems have to be empty | [none] <br> SonstigerVorgang | 1.3- |
| `0x4445000000000004` | out of operation receipt / stop-receipt<br />The request is only valid with the same property requirements as a zero-receipt. disabling a fiskaltrust.SecurityMachanism, this includes also the deactivation of the used TSE in the background. Depending on the TSE-Type used this includes different actions.<br />On successful deactivation, a notification is created which includes the queue-id, scu-id, certificate/public-key, tse-serialnumber=hash(public-key). this notification needs to be reported to tax administration. <br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception.<br /> DSFinV-K: BON_TYP=AVSonstige, ChargeItems and PayItems have to be empty | [none] <br> SonstigerVorgang | 1.3- |
| `0x4445000000000005` | monthly-closing<br /> TBD: close all open cbReceiptReference <-> Transaction-ID  <br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | [none] <br> SonstigerVorgang | 1.3- |
| `0x4445000000000006` | yearly-closing<br /> TBD: close all open cbReceiptReference <-> Transaction-ID  <br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | [none] <br> SonstigerVorgang | 1.3- |
| `0x4445000000000007` | daily-closing<br /> TBD: close all open cbReceiptReference <-> Transaction-ID  <br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | [none] <br> SonstigerVorgang | 1.3- |
| `0x4445000000000008` | start-transaction-receipt<br />starts a new, unfinished action. use ChargeItems and PayItems to hand over already known details for final receipt. using the same cbTerminalID and cbReceiptReferece in further calls connects the action items. <br />this works only on explicit flow. calling with the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | [none] <br> [empty] | 1.3- |
| `0x4445000000000009` | update-transaction-receipt<br />updates an ongoing action. use ChargeItems and PayItems to hand over all details for final receipt. using the same cbTerminalID and cbReceiptReferece in further calls connects the action items. <br />this works only on explicit flow. calling with the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | [none] <br> [empty] | 1.3- |
| `0x444500000000000A` | delta-transaction-receipt<br />updates an ongoing action. use ChargeItems and PayItems to hand changes for final receipt. using the same cbTerminalID and cbReceiptReferece in further calls connects the action items. <br />this works only on explicit flow. calling with the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | [none] <br> [empty] | 1.3- |
| `0x444500000000000B` | fail-transaction-receipt<br />stopps/fails an ongoing action. tries to finish an open transaction (accepts fail, continue on fail). clears cbReceiptReferece <-> Transaction-ID relation. <br /> DSFinV-K: BON_TYP=AVBelegabbruch | AVBelegabbruch <br> Kassenbeleg-V1 | 1.3- |
| `0x444500000000000C` | b2b-invoice<br /> TBD: <br /> DSFinV-K: BON_TYP=Beleg, can be overwritten by ftReceiptCaseFlag  | Beleg <br> Kassenbeleg-V1 | 1.3- |
| `0x444500000000000D` | b2c-invoice<br /> TBD: <br /> DSFinV-K: BON_TYP=Beleg, can be overwritten by ftReceiptCaseFlag  | Beleg <br> Kassenbeleg-V1 | 1.3- |
| `0x444500000000000E` | info-invoice<br /> TBD: <br /> DSFinV-K: BON_TYP=AVRechnung | AVRechnung <br> Kassenbeleg-V1 | 1.3- |
| `0x444500000000000F` | info-delivery-note<br /> TBD: <br /> DSFinV-K: BON_TYP=AVTransfer | AVTransfer <br> Kassenbeleg-V1 | 1.3- |
| `0x4445000000000010` | info-order<br /> when goods are already delivered to customer and request-payitems not empty <br> (ReceiptRequest.PayItems != [])  <br /> DSFinV-K: BON_TYP=AVBestellung | AVBestellung <br> Kassenbeleg-V1 | 1.3- |
| `0x4445000000000010` | info-order<br /> when recording an ongoing order and request-payitems are empty <br> (ReceiptRequest.PayItems == []) <br /> DSFinV-K: BON_TYP=[none] | [none] <br> Bestellung-V1 | 1.3- |
| `0x4445000000000011` | cash deposit / cash pay-in / cash pay-out / exchange<br /> TBD: <br /> DSFinV-K: BON_TYP=Beleg, can be overwritten by ftReceiptCaseFlag | Beleg <br> Kassenbeleg-V1 | 1.3- |
| `0x4445000000000012` | material consumption<br /> TBD: <br /> DSFinV-K: BON_TYP=AVSachbezug | AVSachbezung <br> Kassenbeleg-V1  | 1.3- |
| `0x4445000000000013` | info-internal<br />  when request-chargeitems are not empty and when request-payitems are not empty <br /> DSFinV-K: BON_TYP=AVSonstige | AVSonstige <br> Kassenbeleg-V1 | 1.3- |
| `0x4445000000000013` | info-internal<br /> when request-chargeitems are empty or when request-payitems are empty <br> (ReceiptRequest.ChargePayItems == [] && ReceiptRequest.PayItems == []) <br /> DSFinV-K: BON_TYP=[none] | [none] <br> SonstigerVorgang | 1.3- |
| `0x4445000000000014` | protocol<br /> TBD: <br /> DSFinV-K: BON_TYP=[none] | [none] <br> SonstigerVorgang | 1.3- |
| `0x4445000000000015` | foreign sales<br /> TBD: <br /> DSFinV-K: BON_TYP=AVSonstige | AVSonstige <br> Kassenbeleg-V1 | 1.3- |


##### actions where a receiptcase has to be defined

- register new terminal (TerminalID)
- unregister a terminal (TerminalID)


#### ftReceiptCaseFlag

This table expands on the values provided in table [ftReceiptCaseFlag in General Part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag) with values applicable to the German market.

| Value | Description | Service-Version |
|---|---|---|
| 0x0000000000010000 | out of service | 1.3- |
| 0x0000000000020000  | training receipt<br /> DSFinV-K: overrides BON_TYP=AVTraining  | 1.3- |
| 0x0000000000040000 | reverse/voided receipt<br /> DSFinV-K: overrides BON_TYP=AVBelegstorno  | 1.3- |
| 0x0000000000080000  | paper/handwritten receipt | 1.3- |
| 0x0000000000100000  | small business, not taxable sales. TBD: law reference | 1.3- |
| 0x0000000000200000  | receiver is a company | 1.3- |
| 0x0000000000400000  | contains characteristics related to UStG. TBD: law reference | 1.3- |
| 0x0000000100000000 | Implicit Transaction. No Start-Transaction call to ´Sign´ is required, it is done implicitly. If the unique identifier set in property ´cbReceiptIdentification´ already started a transaction, this will throw an exception. | 1.3-  |
| 0x0000800000000000  | Receipt request. Common behaviour. | 1.3- |


### Type of Service: ftChargeItemCase

This table expands on the values provided in Table [ftChargeItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-service-ftchargeitemcase) with values applicable to the German 

| **Value** | **Description** | **UST_SCHLUESSEL (DSFinV-K)** | **GV_TYP (DSFinV-K)** | **Service-Version** |
|---|---|---|---|---|
| `0x4445000000000000` | unknown type of service for DE | 7 | Umsatz | 1.3- |
| `0x4445000000000001` | undefined type of service for DE normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) | 1 | Umsatz  | 1.3- |
| `0x4445000000000002` | undefined type of service for DE discounted-1<br /> 1.1.2019: 7% (DE: Ermäßigter Steuersatz) | 2 | Umsatz   | 1.3- |
| `0x4445000000000003` | undefined type of service for DE special-1.  1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  | 3 | Umsatz     | 1.3- |
| `0x4445000000000004` | undefined type of service for DE special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) | 4 | Umsatz         | 1.3- |
| `0x4445000000000005` | undefined type of service for DE not taxable   | 5 | Umsatz | 1.3- |
| `0x4445000000000006` | undefined type of service for DE zero   | 6 | Umsatz | 1.3- |
| `0x4445000000000007` | undefined type of service for DE unknown vat   | 7 | Umsatz | 1.3- |
| `0x4445000000000011` | delivery normal. For processing, see (0x4445000000000001) | 1 | Umsatz   | 1.3- |
| `0x4445000000000012` | delivery discounted-1. For processing, see (0x4445000000000002)  | 2 | Umsatz   | 1.3- |
| `0x4445000000000013` | delivery special-1. For processing, see (0x4445000000000003)  | 3 | Umsatz | 1.3- |
| `0x4445000000000014` | delivery special-2. For processing, see (0x4445000000000004) | 4 | Umsatz  | 1.3- |
| `0x4445000000000015` | delivery not taxable. For processing, see (0x4445000000000005) | 5 | Umsatz | 1.3- |
| `0x4445000000000016` | delivery zero. For processing, see (0x4445000000000005) | 6 | Umsatz | 1.3- |
| `0x4445000000000017` | delivery unknown vat. For processing, see (0x4445000000000005) | 7 | Umsatz | 1.3- |
| `0x4445000000000019` | other services normal. For processing, see (0x4445000000000003) | 1 | Umsatz  | 1.3- |
| `0x444500000000001A` | other services discounted-1.For processing, see (0x4445000000000001) | 2 | Umsatz  | 1.3- |
| `0x444500000000001B` | other services special-1. For processing, see (0x4445000000000004)  | 3 | Umsatz | 1.3- |
| `0x444500000000001C` | other services special-2. For processing, see (0x4445000000000002) | 4 | Umsatz  | 1.3- |
| `0x444500000000001D` | other services not taxable. For processing, see (0x4445000000000005)  | 5 | Umsatz | 1.3- |
| `0x444500000000001E` | other services zero. For processing, see (0x4445000000000005)  | 6 | Umsatz | 1.3- |
| `0x444500000000001F` | other services unknown vat. For processing, see (0x4445000000000005)  | 7 | Umsatz | 1.3- |
| `0x4445000000000021` | returnable normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Pfand  | 1.3- |
| `0x4445000000000022` | returnable discounted-1.  1.1.2019: 7% (DE: Ermäßigter Steuersatz) | 2 | Pfand  | 1.3- |
| `0x4445000000000023` | returnable special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Pfand  | 1.3- |
| `0x4445000000000024` | returnable special-2.  1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Pfand  | 1.3- |
| `0x4445000000000025` | returnable not taxable |5|Pfand  1.3- |
| `0x4445000000000026` | returnable zero |6|Pfand | 1.3- |
| `0x4445000000000027` | returnable vat unknown |7|Pfand  1.3- |
| `0x4445000000000029` | returnable reverse normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|PfandRueckzahlung  | 1.3- |
| `0x444500000000002A` | returnable reverse discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|PfandRueckzahlung  | 1.3- |
| `0x444500000000002B` | returnable reverse special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|PfandRueckzahlung  | 1.3- |
| `0x444500000000002C` | returnable reverse special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|PfandRueckzahlung  | 1.3- |
| `0x444500000000002D` | returnable reverse not taxable|5|PfandRueckzahlung  |1.3- |
| `0x444500000000002E` | returnable reverse zero|6|PfandRueckzahlung  |1.3- |
| `0x444500000000002F` | returnable reverse vat unknown|7|PfandRueckzahlung  |1.3- |
| `0x4445000000000031` | discount normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Rabatt  | 1.3- |
| `0x4445000000000032` | discount discounted-1 . 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Rabatt   | 1.3-|
| `0x4445000000000033` | discount special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Rabatt     | 1.3- |
| `0x4445000000000034` | discount special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Rabatt         | 1.3- |
| `0x4445000000000035` | discount not taxable |5|Rabatt | 1.3- |
| `0x4445000000000036` | discount zero  |6|Rabatt | 1.3- |
| `0x4445000000000037` | discount unknown vat |7|Rabatt  | 1.3- |
| `0x4445000000000039` | extra charge normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Aufschlag  | 1.3- |
| `0x444500000000003A` | extra charge discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Aufschlag   | 1.3-|
| `0x444500000000003B` | extra charge special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Aufschlag     | 1.3- |
| `0x444500000000003C` | extra charge special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Aufschlag         | 1.3- |
| `0x444500000000003D` | extra charge not taxable |5|Aufschlag | 1.3- |
| `0x444500000000003E` | extra charge zero  |6|Aufschlag | 1.3- |
| `0x444500000000003F` | extra charge unknown vat |7|Aufschlag  | 1.3- |
| `0x4445000000000041` | unreal grant normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|ZuschussUnecht  | 1.3- |
| `0x4445000000000042` | unreal grant discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|ZuschussUnecht   | 1.3-|
| `0x4445000000000043` | unreal grant special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|ZuschussUnecht     | 1.3- |
| `0x4445000000000044` | unreal grant special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|ZuschussUnecht         | 1.3- |
| `0x4445000000000045` | unreal grant not taxable |5|ZuschussUnecht | 1.3- |
| `0x4445000000000046` | unreal grant zero  |6|ZuschussUnecht | 1.3- |
| `0x4445000000000047` | unreal grant unknown vat |7|ZuschussUnecht  | 1.3- |
| `0x4445000000000049` | real grant not taxable  | 5 |ZuschussEcht | 1.3- |
| `0x4445000000000051` | tip to owner normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|TrinkgeldAG  | 1.3- |
| `0x4445000000000052` | tip to owner discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|TrinkgeldAG   | 1.3-|
| `0x4445000000000053` | tip to owner special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|TrinkgeldAG     | 1.3- |
| `0x4445000000000054` | tip to owner special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|TrinkgeldAG         | 1.3- |
| `0x4445000000000055` | tip to owner not taxable |5|TrinkgeldAG | 1.3- |
| `0x4445000000000056` | tip to owner zero  |6|TrinkgeldAG | 1.3- |
| `0x4445000000000057` | tip to owner unknown vat |7|TrinkgeldAG  | 1.3- |
| `0x4445000000000059` | tip to employee no vat  | 5 |TrinkgeldAN | 1.3- |
| `0x4445000000000060` | voucher sale not taxable  | 5 |MehrzweckgutscheinKauf | 1.3- |
| `0x4445000000000061` | coupon sales normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|EinzweckgutscheinKauf  | 1.3- |
| `0x4445000000000062` | coupon sales discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|EinzweckgutscheinKauf   | 1.3-|
| `0x4445000000000063` | coupon sales special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|EinzweckgutscheinKauf     | 1.3- |
| `0x4445000000000064` | coupon sales special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|EinzweckgutscheinKauf         | 1.3- |
| `0x4445000000000065` | coupon sales not taxable |5|EinzweckgutscheinKauf | 1.3- |
| `0x4445000000000066` | coupon sales zero  |6|EinzweckgutscheinKauf | 1.3- |
| `0x4445000000000067` | coupon sales unknown vat |7|EinzweckgutscheinKauf  | 1.3- |
| `0x4445000000000068` | voucher redeem not taxable  | 5 |MehrzweckgutscheinEinloesung | 1.3- |
| `0x4445000000000069` | coupon redeem normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|EinzweckgutscheinEinloesung  | 1.3- |
| `0x444500000000006A` | coupon redeem discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|EinzweckgutscheinEinloesung   | 1.3-|
| `0x444500000000006B` | coupon redeem special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|EinzweckgutscheinEinloesung     | 1.3- |
| `0x444500000000006C` | coupon redeem special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|EinzweckgutscheinEinloesung         | 1.3- |
| `0x444500000000006D` | coupon redeem not taxable |5|EinzweckgutscheinEinloesung | 1.3- |
| `0x444500000000006E` | coupon redeem zero  |6|EinzweckgutscheinEinloesung | 1.3- |
| `0x444500000000006F` | coupon redeem unknown vat |7|EinzweckgutscheinEinloesung  | 1.3- |
| `0x4445000000000071` | receiveable creation normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Forderungsentstehung  | 1.3- |
| `0x4445000000000072` | receiveable creation discounted-1 . 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Forderungsentstehung   | 1.3-|
| `0x4445000000000073` | receiveable creation special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Forderungsentstehung     | 1.3- |
| `0x4445000000000074` | receiveable creation special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Forderungsentstehung         | 1.3- |
| `0x4445000000000075` | receiveable creation not taxable |5|Forderungsentstehung | 1.3- |
| `0x4445000000000076` | receiveable creation zero  |6|Forderungsentstehung | 1.3- |
| `0x4445000000000077` | receiveable creation unknown vat |7|Forderungsentstehung  | 1.3- |
| `0x4445000000000079` | receiveable reduction normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Forderungsaufloesung  | 1.3- |
| `0x444500000000007A` | receiveable reduction discounted-1 . 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Forderungsaufloesung   | 1.3-|
| `0x444500000000007B` | receiveable reduction special-1 . 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Forderungsaufloesung     | 1.3- |
| `0x444500000000007C` | receiveable reduction special-2 . 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Forderungsaufloesung         | 1.3- |
| `0x444500000000007D` | receiveable reduction not taxable |5|Forderungsaufloesung | 1.3- |
| `0x444500000000007E` | receiveable reduction zero  |6|Forderungsaufloesung | 1.3- |
| `0x444500000000007F` | receiveable reduction unknown vat |7|Forderungsaufloesung  | 1.3- |
| `0x4445000000000081` | down payment creation normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Anzahlungseinstellung  | 1.3- |
| `0x4445000000000082` | down payment creation discounted-1. 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Anzahlungseinstellung   | 1.3-|
| `0x4445000000000083` | down payment creation special-1. 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Anzahlungseinstellung     | 1.3- |
| `0x4445000000000084` | down payment creation special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Anzahlungseinstellung         | 1.3- |
| `0x4445000000000085` | down payment creation not taxable |5|Anzahlungseinstellung | 1.3- |
| `0x4445000000000086` | down payment creation zero  |6|Anzahlungseinstellung | 1.3- |
| `0x4445000000000087` | down payment creation unknown vat |7|Anzahlungseinstellung  | 1.3- |
| `0x4445000000000089` | down payment reduction normal. 1.1.2019: 19,00% (DE: Regelsteuersatz) |1|Anzahlungsaufloesung  | 1.3- |
| `0x444500000000008A` | down payment reduction discounted-1 . 1.1.2019: 7% (DE: Ermäßigter Steuersatz) |2|Anzahlungsaufloesung   | 1.3-|
| `0x444500000000008B` | down payment reduction special-1 . 1.1.2019: 10,70% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 3 UStG) übrige Fälle)  |3|Anzahlungsaufloesung     | 1.3- |
| `0x444500000000008C` | down payment reduction special-2. 1.1.2019: 5,50% (DE: Durchschnittsatz (§ 24 Abs. 1 Nr. 1 UStG)) |4|Anzahlungsaufloesung         | 1.3- |
| `0x444500000000008D` | down payment reduction not taxable |5|Anzahlungsaufloesung | 1.3- |
| `0x444500000000008E` | down payment reduction zero  |6|Anzahlungsaufloesung | 1.3- |
| `0x444500000000008F` | down payment reduction unknown vat |7|Anzahlungsaufloesung  | 1.3- |
| `0x4445000000000090` | cash transfer to empty till not taxable  | 5 |Anfangsbestand | 1.3- |
| `0x4445000000000091` | cash transfer from till to owner not taxable  | 5 |Privatentnahme | 1.3- |
| `0x4445000000000092` | cash transfer from owner to till not taxable  | 5 |Privateinlage | 1.3- |
| `0x4445000000000093` | cash transfer from/to till not taxable  | 5 |Geldtransit | 1.3- |
| `0x4445000000000094` | cash transfer from till to employee not taxable  | 5 |Lohnzahlung | 1.3- |
| `0x4445000000000095` | cash transfer to cash book not taxable | 5 | Einzahlung | 1.3- |
| `0x4445000000000096` | cash transfer from cash book not taxable  | 5 | Auszahlung | 1.3- |
| `0x4445000000000097` | cash amount difference from/to till not taxable  | 5 | DifferenzSollIst | 1.3- |
| `0x44450000000000A1` | reverse charge | 5 | Umsatz | 1.3- |
| `0x44450000000000A2` | not own sales | 5 | Umsatz  | 1.3- |


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


### Type of Payment: ftPayItemCase

This table expands on the values provided in table [ftPayItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-payment-ftpayitemcase) with values applicable to the German market.

| **Value**  | **Description** | **ZAHLART_TYP (DSFinV-K)** | **Service-Version** |
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





### Type of Signature: ftSignatureType

The ftSignatureType indicates type and origin of the signature. The data type is `Int64` and can contain a country specific code which is a value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex and used as byte 8 and 7.

For definitions regarding national laws, please refer to the appropriate appendix<span id="t-type-of-signature-ftsignaturetype-127">.</span>

| **Value**            | **Description**          | **Service-Version** |
|----------------------|--------------------------|---------------------|
| `0x4445000000000001` | Signature according to kasssichv (qr-code content)                  | 1.3                 |
| `0x4445000000000002` | Archiving required  | 1.3                |
| `0x4445000000000003` | notification       | 1.3                 |
| `0x4445000000000010` | start-transaction-result     | 1.3                 |
| `0x4445000000000011` | finish-transaction-payload     | 1.3                 |
| `0x4445000000000012` | finish-transaction-result     | 1.3                 |
| `0x4445000000000013` | receipt / qr-version     | 1.3                 |
| `0x4445000000000014` | receipt / kassenseriennummer     | 1.3                 |
| `0x4445000000000015` | receipt / processtype     | 1.3                 |
| `0x4445000000000016` | receipt / processdata     | 1.3                 |
| `0x4445000000000017` | receipt / transaktionsnummer     | 1.3                 |
| `0x4445000000000018` | receipt / signaturzähler     | 1.3                 |
| `0x4445000000000019` | receipt / startzeit (start-transaction)    | 1.3                 |
| `0x444500000000001A` | receipt / logtime     | 1.3                 |
| `0x444500000000001B` | receipt / signaturalgorithmus     | 1.3                 |
| `0x444500000000001C` | receipt / logtime-format     | 1.3                 |
| `0x444500000000001D` | receipt / signatur     | 1.3                 |
| `0x444500000000001E` | receipt / public-key     | 1.3                 |
| `0x444500000000001F` | receipt /  vorgangsbeginn (action)    | 1.3                 |


*Table 15. Type of Signature: ftSignatureType*

### DSFinV-K export

You can download the current version of the DSFinV-K specification [here](https://www.bzst.de/DE/Unternehmen/Aussenpruefungen/DigitaleSchnittstelleFinV/digitaleschnittstellefinv_node.html).

Based on the the current version of the DSFinV-K specification, this chapter explains how the DSFinV-K export is structured, shows how the previously described input values are mapped by fisklatrust to the files and data of the DSFinV-K export and defines how additional, for the DSFInV-K required, values can be sent to the fiskaltrust middleware. Furthermore, it describes how the marking of actions (DE: Vorgänge) can be made by connecting business actions (DE: Geschäftsvorfälle) and other procedures, occurrences and events (DE: Andere Vorgänge). 

#### Structure

The DSFinV-K export is divided into the following sections/modules: 

- Single recordings module (DE: Einzelaufzeichnungsmodul)
- Master data module (DE: Stammdatenmodul)
- Cashpoint closing module (DE: Kassenabschlussmodul)

Each module consists of several files. In the following we will go into the individual modules and have look to the files and data contained in them. Details about the meaning of the files and their individual fields can be found in the official DSFinV-K specification.

#### Mandatory data

This chapter lists the data fields that are mandatory and can not be filled by ft. Therefore you need to provide them. For details on how to provide them, please see the chapters below. They offer information for all DSFinV-K fields. 

| **Fieldname**            | **Module**          | **Description**          |
|----------------------|--------------------------|---------------------|
| `BON_ID` | Single recordings | Action-ID (DE: Vorgangs-ID)|
| `POS_TERMINAL_ID` | Single recordings | ID of the slave (terminal) where the position (line) comes from. |
| `ART_NR` | Single recordings | Article number. |
| `GTIN` | Single recordings | Global Trade Item Number. |
| `WARENGR_ID` | Single recordings | Product group number. |
| `WARENGR` | Single recordings | Product group name. |
| `MENGE` | Single recordings | Quantity. |
| `FAKTOR` | Single recordings | Factor, e.g. container size. |
| `EINHEIT` | Single recordings| Unit of measurement, e.g. kg. |
| `STK_BR` | Single recordings | Price per unit incl. VAT. |
| `BON_NAME` | Single recordings  | The `BON_NAME` is used to further subdivide the items contained in the transaction category (`BON_TYP`). The `BON_NAME` must be filled if `BON_TYP` is `AVSonstige`.|
| `BON_STORNO` | Single recordings | Mandatory for the subsequent cancellation of an receipt. |
| `BON_START` | Single recordings | Mandatory if the action (DE: Vorgang) starts within another system. Otherwise the receipt request of an action must be connected in a way that ft can find the start of the action.|
| `BEDIENER_ID` | Single recordings | User-ID |
| `BEDIENER_NAME` | Single recordings | User name |
| `AGENTUR_ID` | Single recordings | ID of the agency, only mandatory if agency business (DE: Agenturgeschäft) |
| `KUNDE_NAME` | Single recordings | Full name of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `KUNDE_ID` | Single recordings | ID of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO.|
| `KUNDE_TYP` | Single recordings | Type of the beneficiary customer (e.g. employee). Not mandatory if exempted in relation to § 148 AO.|
| `KUNDE_STRASSE` | Single recordings | Street and house number of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `KUNDE_PLZ` | Single recordings | Zip of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `KUNDE_ORT` | Single recordings | City of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `KUNDE_LAND` | Single recordings | Country of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `KUNDE_USTID` | Single recordings | VAT-ID of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `ABRECHNUNGSKREIS` | Single recordings | Connection criterion (e.g table number, department etc.) of the assignment. |
| `ZAHLWAEH_CODE` | Single recordings | Foreign currency code. Only mandatory if foreign currency was used for the payment. |
| `ZAHLWAEH_BETRAG` | Single recordings | Amount in foreign currency. Only mandatory if foreign currency was used for the payment. |
| receipt references | Single recordings | see chapter "Bon_Referenzen" |
| `Z_BUCHUNGSTAG` | Master data | Booking date different from closing date (`Z_ERSTELLUNG`). Only mandatory if the booking date is different to the date of the daily closing receipt. | 
| Master data for the company, location, terminals, agencies as described in the chapter "Master data module" | Master data | Master data for this cashpoint closing and referenced by the single recordings|


The following chapters give you an overview of all DSFinV-K fields, provide you information on how they are filled by ft and how you can send additional data to fill mandatory (listed above) and optional fields that can not be filled by ft.

#### Single recordings module (DE: Einzelaufzeichnungsmodul)

The single recordings provide the basis for data storage. These are divided into two main areas:

- Bonpos (lines.csv)
- Bonkopf (transactions.csv)

In addition to these two files there are further detail files which are listed in the following. 

##### File: Bonpos (lines.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String | `cbReceiptReference` |
| `POS_ZEILE` | Line/Position number  | String | `ftChargeItem.Position` if available, otherwise automatically filled by ft |
| `GUTSCHEIN_NR` | Voucher no.| String | Optional, can be sent via `ftPayItemData` in JSON format. To send, add the key value pair `VoucherNr` e.g. `"ftPayItemData":"{ ..., "VoucherNr":"UAUA91829182HH", ... }"`|
| `ARTIKELTEXT` | Product/Article text| String | `ftChargeItem.Description` |
| `POS_TERMINAL_ID` | Terminal-ID of this line (position)| String | `cbTerminalID` |
| `GV_TYP` | Type of business action  | String | Deducted from `ftChargeItemCase` |
| `GV_NAME` | Addition to the business action type | String| Optional, can be sent via `ftChargeItemCaseData` in JSON format. To send, add the key value pair `ItemCaseName` e.g. `"ftChargeItemCaseData":"{ ..., "ItemCaseName":"Rabatt - Black Friday", ... }"` |
| `INHAUS` | Inhouse consumption | 0 or 1 | Optional, can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `Inhouse` e.g. `"ftReceiptCaseData":"{ ..., "Inhouse":1, ... }"`, defaults to 0 if not sent, any other value than 0 is interpreted as 1.|
| `P_STORNO` | Position cancellation identification | String | Not used|
| `AGENTUR_ID` | ID of the Agency | Integer | Mandatory if agency business (DE: Agenturgeschäft). Please sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `AgencyId` e.g. `"ftReceiptCaseData":"{ ..., "AgencyId":192, ... }"` |
| `ART_NR` | Article number | String | `ftChargeItem.ProductNumber` |
| `GTIN` | Global Trade Item Number | String | Mandatory if it is an article, can be sent via `ftChargeItemCaseData` in JSON format. To send, add the key value pair `GTIN` e.g. `"ftChargeItemCaseData":"{ ..., "GTIN":"9181981928298", ... }"` |
| `WARENGR_ID` | Product group ID | String | Mandatory, please send via `ftChargeItem.ProductGroup` in JSON format by adding the key value pair `ProductGroupId` e.g. `"ProductGroup":"{ ProductGroupId":"981981AA", "ProductGroupName":"Fleischwaren" }"`|
| `WARENGR` | Name of the product group | String |Mandatory, please send via `ftChargeItem.ProductGroup` in JSON format by adding the key value pair `ProductGroupName` e.g. `"ProductGroup":"{ "ProductGroupId":"981981AA", "ProductGroupName":"Fleischwaren" }"`|
| `MENGE` | Quantity | Decimal (3) | `ftChargeItem.Quantity` |
| `FAKTOR` | factor, e.g. container size | Decimal (3) | `ftChargeItem.UnitQuantity`|
| `EINHEIT` | Unit of measurement, e.g. kg, litres or pieces | String | `ftChargeItem.Unit` |
| `STK_BR` | Price per unit incl. VAT | Decimal (5) | `ftChargeItem.UnitPrice` |

##### File: Bonpos_USt (lines_vat.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `BON_ID` | Action-ID | String | `cbReceiptReference` |
| `POS_ZEILE` | Line/Position number  | String | Automatically filled by ft |
| `UST_SCHLUESSEL` | ID of the VAT rate | Integer | Automatically filled by ft depending on the `ftChargeItemCase` |
| `POS_BRUTTO` | Gross sales | Decimal (5) | `ftChargeItemCase.Amount` |
| `POS_NETTO` | Net sales | Decimal (5) | Automatically calculated and filled by ft depending on `ftChargeItemCase` and `ftChargeItemCase.Amount`|
| `POS_UST` | VAT | Decimal (5) | Automatically calculated and filled by ft depending on `ftChargeItemCase`|


##### File: Bonpos_Preisfindung (itemamounts.csv)

Not supported.

According to the DSFinV-K specification, in the data field STK_BR in the Bonpos file, either the reduced amount is displayed immediately (and the origin of the amount in the file Bonpos_Preisfindung) or the reduction in charges is displayed as a separate item line with negative amounts (with correct tax assignment; see file Bonpos_USt). The GV_TYP "Rabatt" is available for the separate line. For the reduction in charges, the current version of the fiskaltrust middleware expects a separate negative `ftChargeItem` with the corresponding `ftChargeItemCase` (e.g. `0x4445000000000031`) which mapps to the GV_TYP "Rabatt". ft does currently not support the file Bonpos_Preisfindung.


##### File: Bonpos_Zusatzinfo (subitems.csv)

This table allows to detail the composition of sold combinations of goods (DE: Warenzusammenstellungen). They serve exclusively for explanation.

This does not affect the basis of assessment for VAT. In the case of goods combinations with different tax rates, however, information is stored here which serves to control the distribution of the VAT assessment basis (example: fast food menu consisting of a drink and a burger). In addition, orders deviating from the standard order can be taken into account to record the actual consumption of goods (example: gyros plate with chips instead of rice).

You can send those subitems to the ft middleware via `ftChargeItemCaseData` in JSON format. To send, add the key value pair `SubItems` as an array of subitems: 

```json
"ftChargeItemCaseData" : "{ 
    ...,
    "SubItems" : [
        { ... },
        { ... }, 
        ...
    ],
    ... 
}"
```

Each subitem as described in the table below: 

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `BON_ID` | Action-ID | String | `cbReceiptReference` |
| `POS_ZEILE` | Line/Position number  | String | Automatically filled by ft |
| `ZI_ART_NR` | Article number  | String | To send, add the key value pair `ProductNumber` within the subitem. e.g. `"SubItems":"[{ "ProductNumber":"10292", ... }, ... ]` |
| `ZI_GTIN` | GTIN | String | To send, add the key value pair `GTIN` within the subitem. e.g. `"SubItems":"[{ "ProductNumber":"10292", "GTIN":"4231234266622", ... }, ... ]` |
| `ZI_NAME` | Article name | String | To send, add the key value pair `Description` within the subitem. e.g. `"SubItems":"[{ "ProductNumber":"10292", "GTIN":"4231234266622", ... }, ... ]` |
| `ZI_WARENGR_ID` | Product group ID | String |  To send, add the key value pair `ProductGroup` within the subitem. It should be sent as a JSON composed of the key value pairs `ProductGroupId` and `ProductGroupName` e.g. `"SubItems":"[{ ..., "ProductGroup":"{ "ProductGroupId":"981981AA", "ProductGroupName":"Fleischwaren" }", ... }, ... ]` |
| `ZI_WARENGR` | Name of the product group | String | Similar to `ZI_WARENGR_ID`, use `SubItem.ProductGroup.ProductGroupName` |
| `ZI_MENGE` | Quantity | Decimal (3) | To send, add the key value pair `Quantity` within the subitem. e.g. `"SubItems":"[{..., "Quantity":2.543, ... }, ... ]` |
| `ZI_FAKTOR` | factor, e.g. container sizes | Decimal (3) | To send, add the key value pair `UnitQuantity` within the subitem. e.g. `"SubItems":"[{ ..., "UnitQuantity":1.0, ... }, ... ]` |
| `ZI_EINHEIT` | Unit of measurement, e.g. kg, litres or pieces | String | To send, add the key value pair `Unit` within the subitem. e.g. `"SubItems":"[{ ..., "Unit":"kg", ... }, ... ]` |
| `ZI_UST_SCHLUESSEL` | ID of VAT rate for the base price | Integer | To send, add the key value pair `ftSubChargeItemCase` within the subitem. e.g. `"SubItems":"[{..., "ftSubChargeItemCase":"4919338167972134929", ... }, ... ]`. Possible values for `ftSubChargeItemCase` are the same as for `ftChargeItemCase` - as described in the reference table above. |
| `ZI_BASISPREIS_BRUTTO` | Gross basis price | Decimal (5) | To send, add the key value pair `Amount` within the subitem. e.g. `"SubItems":"[{..., "Amount":22.50, ... }, ... ]` |
| `ZI_BASISPREIS_NETTO` | Net basis price | Decimal (5) | Automatically calculated by ft from  `ftSubChargeItemCase` and (subitem) `Amount`|
| `ZI_BASISPREIS_UST` | Basis VAT | Decimal (5) | Automatically filled by ft depending on `ftSubChargeItemCase` |


##### File: Bonkopf (transactions.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String | `cbReceiptReference` |
| `BON_NR` | Receipt number | Long | `ftReceiptIdentification` (tbd: ftReceiptIdentification is a string, but number/long is needed) |
| `BON_TYP` | Receipt type / action type| String | `ftReceiptCase` |
| `BON_NAME` | Additional description related to the `BON_TYP` | String | Mandatory if `BON_TYPE` is "AVSonstige", otherwise optional, can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `ReceiptName ` e.g. `"ftReceiptCaseData":"{ ..., "ReceiptName":"Sonstige Sonderwurst", ... }"` |
| `TERMINAL_ID` | Mandatory, ID of the terminal that was used to record this receipt | String | `cbTerminalID` |
| `BON_STORNO` | Cancellation indicator | String | Filled by ft. Mandatory: if the receipt is a reverse/voided receipt, then it must be marked with the `ftReceiptCaseFlag` `0x0000000000040000` and must reference the initial receipt via `cbPreviousReceiptReference`. The referenced initial receipt must be part of the current cashpoint closing.|
| `BON_START` | Time of the action start | ISO 8601 and RFC3339 date | The action start can be within this cashpoint or outside of this cashpoint. If outside (e.g. by another system or another cashpoint) than it has to be provided in via `ftReceiptCaseData` in JSON format by adding the key value pair `ActionStartMoment`. E.g. `"ftReceiptCaseData":"{ ..., "ActionStartMoment":"2020-09-27T17:00:01", ... }"`. If not provided, ft tries to find the action start by following the `cbPreviousReceiptReference` path into the past until no more previous receipt references exist. ft will than fill this field with the value from `cbReceiptMoment` of the oldest receipt found in that chain. |
| `BON_ENDE` | Time of the action end | String | `cbReceiptMoment` |
| `BEDIENER_ID` | User-ID | String | Mandatory, send via `cbUser` in JSON format by adding the key value pair `UserId` e.g. `"cbUser":"{ "UserId":"19292", "UserName":"Peter Lux"}"`|
| `BEDIENER_NAME` | User name | String | Mandatory, send via `cbUser` in JSON format by adding the key value pair `UserName` e.g. `"cbUser":"{ "UserId":"19292", "UserName":"Peter Lux"}"`|
| `UMS_BRUTTO` | Gross total turnover | Decimal (2) | Automatically filled by ft |
| `KUNDE_NAME` | Name of beneficiary customer | String | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerName` e.g. `"cbCustomer":"{"CustomerName":"Max Wanne",...}"`|
| `KUNDE_ID` | ID of the beneficiary customer| String | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerId` e.g. `"cbCustomer":"{"customerName":"Max Mustermann", "CustomerId":"PX9819822", ...}"`|
| `KUNDE_TYP` | Type of the beneficiary customer (e.g. employee) | String | Mandatory if not exempted in relation to § 148 AO.  Send via `cbCustomer` in JSON format by adding the key value pair `CustomerType` e.g. `"cbCustomer":"{..., "CustomerId":"PX9819822", "CustomerType":"Mitarbeiter", ...}"`|
| `KUNDE_STRASSE` | Street and house number of the beneficiary customer | String | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerStreet` e.g. `"cbCustomer":"{..., "CustomerStreet":"Lindwurmstr. 98", ...}"` |
| `KUNDE_PLZ` | Zip of the beneficiary customer | String | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerZip` e.g. `"cbCustomer":"{..., "CustomerZip":"80337", ...}"` |
| `KUNDE_ORT` | City of the beneficiary customer | String | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerCity` e.g. `"cbCustomer":"{..., "CustomerCity":"München", ...}"` |
| `KUNDE_LAND` | Country of the beneficiary customer | ISO 3166 ALPHA-3 country code | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerCountry` e.g. `"cbCustomer":"{..., "CustomerCountry":"DEU", ...}"`  |
| `KUNDE_USTID` | VAT-ID of the beneficiary customer | String | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerVATId` e.g. `"cbCustomer":"{..., "CustomerVATId":"DE123456789", ...}"`   |
| `BON_NOTIZ` | Additional information on the receipt header | String | Optional, can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `ReceiptNote ` e.g. `"ftReceiptCaseData":"{ ..., "ReceiptNote":"123, ich bin dabei!", ... }"` |

##### File: Bonkopf_USt  (transactions_vat.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `BON_ID` | Action-ID | String | `cbReceiptReference` |
| `POS_ZEILE` | Line/Position number  | String | Automatically filled by ft |
| `UST_SCHLUESSEL` | ID of the VAT rate | Integer | Automatically filled by ft |
| `BON_BRUTTO` | Gross sales | Decimal (5) | Automatically filled by ft |
| `BON_NETTO` | Net sales | Decimal (5) | Automatically filled by ft |
| `BON_UST` | VAT | Decimal (5) | Automatically filled by ft |

##### File: Bonkopf_AbrKreis (allocation_groups.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `BON_ID` | Action-ID | String (max. 50 chars) | `cbReceiptReference` |
| `ABRECHNUNGSKREIS` | Connection criterion (e.g table number, department etc.) of the assignment | String | Mandatory if available. Please end via `cbArea` in JSON format by adding the key value pair `ConnectionCriterion` e.g. `"cbArea":"{..., "ConnectionCriterion":"Tisch Nr. 12", ...}"`.|

##### File: Bonkopf_Zahlarten (datapayment.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `BON_ID` | Action-ID | String | `cbReceiptReference` |
| `ZAHLART_TYP` | Type of payment method | String | From `ftPayItemCase` |
| `ZAHLART_NAME` | Name of the payment method | String | Optional, can be sent via `ftPayItemCaseData` in JSON format. To send, add the key value pair `ItemCaseName` e.g. `"ftPayItemCaseData":"{ ..., "ItemCaseName":"Sodexo", ... }"` |
| `ZAHLWAEH_CODE` | ISO 4217 currency code | String | Only mandatory if foreign currency was used for the payment, can be sent via `ftPayItemCaseData` in JSON format. To send, add the key value pair `CurrencyCode` e.g. `"ftPayItemCaseData":"{ ..., "CurrencyCode":"USD", ... }"`. Only ISO 4217 currency codes are allowed. |
| `ZAHLWAEH_BETRAG` | Amount in foreign currency | Decimal (2) | Only mandatory if foreign currency was used for the payment, can be sent via `ftPayItemCaseData` in JSON format. To send, add the key value pair `ForeignCurrencyAmount` e.g. `"ftPayItemCaseData":"{ ..., "ForeignCurrencyAmount":23.00, ... }"`. |
| `BASISWAEH_BETRAG` | Amount in basis currency (usually EUR) | Decimal (2) | Only mandatory if foreign currency was used for the payment, can be sent via `ftPayItemData` in JSON format. To send, add the key value pair `BaseCurrencyAmount` e.g. `"ftPayItemCaseData":"{ ..., "BaseCurrencyAmount":20.99, ... }"`|

##### File: Bon_Referenzen (references.csv)

If `cbPreviousReceiptReference` is filled in the receipt request, ft will automatically try to find the referenced receipt and if found, ft will add an entry to Bon_Referenzen. For a recommendation on how to connect the single requests via `cbReceiptReference` and `cbPreviousReceiptReference` see our Business Cases Examples document [here](https://fiskaltrust.de/wp-content/uploads/sites/5/2020/02/fiskaltrust-Business-Cases-in-JSON_englisch.pdf).

If there are external references (from other systems or other cashpoints) to be added, then they have to be added as shown below:

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `BON_ID` | Action-ID | String | `cbReceiptReference` |
| `POS_ZEILE` | Line number of the referencing operation | String | Automatically filled by ft  |
| `REF_TYP` | Type of reference | "ExterneRechnung" or "ExternerLieferschein" or "Transaktion" or "ExterneSonstige" | can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `RefType ` e.g. `"ftReceiptCaseData":"{ ..., "RefType":"Transaktion", ... }"`. The value "Transaktion" mapps to an internal reference within this DSFinV-K export, all other values map to external references.|
| `REF_NAME` | Description for type | String | Mandatory if `RefType` is "ExterneSonstige", otherwise optional. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `RefName ` e.g. `"ftReceiptCaseData":"{ ..., "RefName":"Sonstige Sonderwurst", ... }"`.|
| `REF_DATUM` | Date of the cashpoint closing | String | mandatory if `RefType` is "Transaktion", otherwise optional. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `RefMoment` e.g. `"ftReceiptCaseData":"{ ..., "RefMoment":"2020-01-03T17:00:01", ... }"`.|
| `REF_Z_KASSE_ID` | ID of the (closing) cashpoint | String | Mandatory if `RefType` is "Transaktion", otherwise optional. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `RefCashBoxIdentification ` e.g. `"ftReceiptCaseData":"{ ..., "RefCashBoxIdentification":"AHHAH1919919", ... }"`.|
| `REF_Z_NR` | No. of the cashpoint closing | Integer | Mandatory if `RefType` is "Transaktion", otherwise optional. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `RefClosingNr` e.g. `"ftReceiptCaseData":"{ ..., "RefClosingNr":1091029, ... }"`. (tbd: if ft generates the closing nr., than how do I receive it as a caller?) |
| `REF_BON_ID` | Action-ID | String | mandatory, can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `RefReceiptId` e.g. `"ftReceiptCaseData":"{ ..., "RefReceiptId":"UAUUA1112", ... }"`.|

##### File: TSE_Transaktionen (transactions_tse.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `BON_ID` | Action-ID | String | `cbReceiptReference` |
| `TSE_ID` | ID of the TSE used for the transaction | Integer | Automatically filled by ft |
| `TSE_TANR` | Transaction number of the transaction | Integer | Automatically filled by ft|
| `TSE_TA_START` | Log time of the StartTransaction operation | String | Automatically filled by ft |
| `TSE_TA_ENDE` | Log time of the FinishTransaction operation | String | Automatically filled by ft |
| `TSE_TA_VORGANGSART` | processType der FinishTransaktions operation | String | Automatically filled by ft |
| `TSE_TA_SIGZ` | Signature counter of the FinishTransaction operation | String | Automatically filled by ft |
| `TSE_TA_SIG` | Signature of the FinishTransaction operation | String | Automatically filled by ft |
| `TSE_TA_FEHLER` | Where appropriate, indications of TSE errors | String | Automatically filled by ft|
| `TSE_VORGANGSDATEN` | Data of the operation (optional) | String | Automatically filled by ft |

#### Master data module (DE: Stammdatenmodul)

To avoid redundancies, the master data is only saved once for each cash register closing. If changes are made to the master data listed below, a closing must be created automatically beforehand.

The **master data** for the day that is closed by the daily closing receipt (or monthly, yaearly because they include the daily closing) **must be included into the closing receipt** (daily/monthly/yearly). To include the data please send the content of `ftReceiptCaseData` in JSON format and add the key value pair `dailyClosingMasterData`. The value should also be JSON and formatted as follows:
```json
"dailyClosingMasterData" : "{ 

    "CompanyName" : "...",
    "CompanyStreet" : "...",
    "CompanyZip" : "...",
    "CompanyCity" : "...",
    "CompanyCountry" : "...",
    "CompanyTaxNr" : "...",
    "CompanyVATId" : "...",
    
    "LocationName" : "...",
    "LocationStreet" : "...",
    "LocationZip" : "...",
    "LocationCity" : "...",
    "LocationCountry" : "...",
    "LocationVATId" : "...",
    
    "CashRegisterBrand" : "...",
    "CashRegisterModel" : "...",
    "CashRegisterSWBrand" : "...",
    "CashRegisterSWBVersion" : "...",
    "CashRegisterBaseCurrency" : "...",
    
    "Terminals" : [ {
      "Id" : "...",
      "Brand" : "...",
      "Model" : "...",
      "SerialNr" : "...",
      "SWBrand" :  "...",
      "SWVersion" : "..."
    }, {...}, ...],
    
    "Agencies" : [ {
      "Id" : ...,
      "Name" : "...",
      "Street" : "...",
      "Zip" : "...",
      "City" :  "...",
      "Country" : "...",
      "TaxNr" : "...",
      "VATId" : "..."
    }, {...}, ...],
}"
```

The DSFinV-K master data module is divided into the following files:

##### File: Stamm_Abschluss (cashpointclosing.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `Z_BUCHUNGSTAG` | Booking date different from closing date (`Z_ERSTELLUNG`) | ISO 8601 und RFC3339 date | Can be send via `ftReceiptCaseData` in JSON format by adding the key value pair `BookingDate`. It is mandatory, if the booking date is different from the daily closing receipt date (`Z_ERSTELLUNG`). E.g. `"ftReceiptCaseData":"{ ..., "BookingDate":"2020-01-27", ... }"` |
| `TAXONOMIE_VERSION` | Version of the DFKA taxonomy cash register | String | Automatically filled by ft |
| `Z_START_ID` | First BON_ID in closing | String | Automatically filled by ft |
| `Z_ENDE_ID` | Last BON_ID in the closing | String | Automatically filled by ft |
| `NAME` | Name of the company | String | Mandatory, `dailyClosingMasterData.CompanyName` |
| `STRASSE` | Street | String | Mandatory,`dailyClosingMasterData.CompanyStreet` |
| `PLZ` | Zip | String | Mandatory, `dailyClosingMasterData.CompanyZip` |
| `ORT` | City | String | Mandatory, `dailyClosingMasterData.CompanyCity` |
| `LAND` | Country | ISO 3166 ALPHA-3 country code | Mandatory, `dailyClosingMasterData.CompanyCountry` |
| `STNR` | Tax number of the company | String | Mandatory, `dailyClosingMasterData.CompanyTaxNr` |
| `USTID` | VAT ID | String | Mandatory, `dailyClosingMasterData.CompanyVATId` |
| `Z_SE_ZAHLUNGEN` | Total of all payments | Decimal (2) | Automatically filled by ft  |
| `Z_SE_BARZAHLUNGEN` | Total of all cash payments | Decimal (2) | Automatically filled by ft |

(`dailyClosingMasterData`is described above in the chapter "Master data module")

##### File: Stamm_Orte (location.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `LOC_NAME` | Name of the site | String | Mandatory, `dailyClosingMasterData.LocationName` |
| `LOC_STRASSE` | Street | String | Mandatory, `dailyClosingMasterData.LocationStreet` |
| `LOC_PLZ` | Zip | String | Mandatory, `dailyClosingMasterData.LocationZip` |
| `LOC_ORT` | City | String | Mandatory, `dailyClosingMasterData.LocationCity` |
| `LOC_LAND` | Country | ISO 3166 ALPHA-3 county code | Mandatory, `dailyClosingMasterData.LocationCountry` |
| `LOC_USTID` | VAT ID | String | Mandatory, `dailyClosingMasterData.LocationVATId` |

(`dailyClosingMasterData`is described above in the chapter "Master data module")

##### File: Stamm_Kassen (cashregister.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `KASSE_BRAND` | Brand of the cash register | String | Mandatory, `dailyClosingMasterData.CashRegisterBrand` |
| `KASSE_MODELL` | Model designation | String | Mandatory, `dailyClosingMasterData.CashRegisterModel` |
| `KASSE_SERIENNR` | Serial number of the cash register | String | `ftCashBoxID` ?(tbd) | 
| `KASSE_SW_BRAND` | Brand name of the software | String | Mandatory, `dailyClosingMasterData.CashRegisterSWBrand` |
| `KASSE_SW_VERSION` | Version of the software | String | Mandatory, `dailyClosingMasterData.CashRegisterSWVersion`  |
| `KASSE_BASISWAEH_CODE` | Basis currency of the cash register | ISO 4217 currency code | Mandatory, `dailyClosingMasterData.CashRegisterBaseCurrency`  |
| `KEINE_UST_ZUORDNUNG` | VAT not determinable | String | Automatically filled by ft |

(`dailyClosingMasterData`is described above in the chapter "Master data module")

##### File: Stamm_Terminals (slaves.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `TERMINAL_ID` | ID of the terminal | String |Mandatory, `dailyClosingMasterData.Terminals.Id` |
| `TERMINAL_BRAND` | Brand of the terminal | String | Mandatory, `dailyClosingMasterData.Terminals.Brand`|
| `TERMINAL_MODELL` | Model designation | String | Mandatory, `dailyClosingMasterData.Terminals.Model` |
| `TERMINAL_SERIENNR` | Serial number of the terminal | String | Mandatory, `dailyClosingMasterData.Terminals.SerialNr` |
| `TERMINAL_SW_BRAND` | Brand name of the software | String | Mandatory, `dailyClosingMasterData.Terminals.SWBrand` |
| `TERMINAL_SW_VERSION` | Version of the software | String | Mandatory, `dailyClosingMasterData.Terminals.SWVersion` |

(`dailyClosingMasterData`is described above in the chapter "Master data module")

##### File: Stamm_Agenturen (pa.csv)


| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `AGENTUR_ID` | ID of the agency | Integer | Mandatory, `dailyClosingMasterData.Agencies.Id` | 
| `AGENTUR_NAME` | Name of the client | String | Mandatory, `dailyClosingMasterData.Agencies.Name` |
| `AGENTUR_STRASSE` | Street | String | Mandatory, `dailyClosingMasterData.Agencies.Street`|
| `AGENTUR_PLZ` | Zip | String |  Mandatory, `dailyClosingMasterData.Agencies.Zip` |
| `AGENTUR_ORT` | City | String | Mandatory, `dailyClosingMasterData.Agencies.City` |
| `AGENTUR_LAND` | ISO 3166 ALPHA-3 country code | String | Mandatory, `dailyClosingMasterData.Agencies.Country` |
| `AGENTUR_STNR` | Tax number | String | Mandatory, `dailyClosingMasterData.Agencies.TaxNr` |
| `AGENTUR_USTID` | VAT ID| String | Mandatory, `dailyClosingMasterData.Agencies.VATId` |

(`dailyClosingMasterData`is described above in the chapter "Master data module")

##### File: Stamm_USt (vat.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft  |
| `UST_SCHLUESSEL` | ID of the VAT rate| Integer | Automatically filled by ft  |
| `UST_SATZ` | Percentage | Decimal (2) | Automatically filled by ft  |
| `UST_BESCHR` | Description| String | Automatically filled by ft  |

##### File: Stamm_TSE (tse.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `TSE_ID` | TSE ID | Integer | Automatically filled by ft |
| `TSE_SERIAL` |  Serial number of the TSE (Corresponds according to TR- 03153 section 7.5. to the hash value of the key contained in the certificate; octet string in hexadecimal representation) | String | Automatically filled by ft |
| `TSE_SIG_ALGO` | The signature algorithm used by the TSE | String | Automatically filled by ft |
| `TSE_ZEITFORMAT` | The format used by the TSE for the log-time | String | Automatically filled by ft |
| `TSE_PD_ENCODING` | Text encoding of the process data (UTF-8 or ASCII) | String | Automatically filled by ft |
| `TSE_PUBLIC_KEY` |  Public key - eventually extracted from the TSE certificate - in base64 encoding | String | Automatically filled by ft |
| `TSE_ZERTIFIKAT_I` |  First 1,000 characters of the TSE certificate (in base64 encoding) | String | Automatically filled by ft |
| `TSE_ZERTIFIKAT_II` | Possibly another 1,000 characters of the certificate (in base64 encoding) | String | Automatically filled by ft |

#### Cashpoint closing module (DE: Kassenabschlussmodul)

The three structure levels (modules) allow transactions to be separated and grouped, so that they can be automatically posted or transferred to the bookkeeping. The cash register closing therefore has an accounting function, meaning that the data of the respective closing has to be stored digitally within this module. The storage takes place in three files:

##### File: Z_Zahlart Z_GV_TYP (businesscases.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `GV_TYP` | business action type | String | Automatically filled by ft |
| `GV_NAME` | name of the business action type | String | Automatically filled by ft |
| `AGENTUR_ID` | Agency ID | Integer | Automatically filled by ft |
| `UST_SCHLUESSEL` | ID of the VAT rate | Integer | Automatically filled by ft |
| `Z_UMS_BRUTTO` | Gross sales | Decimal (5) | Automatically filled by ft |
| `Z_UMS_NETTO` | Net sales | Decimal (5) | Automatically filled by ft|
| `Z_UST` | VAT | Decimal (5) | Automatically filled by ft |

##### File: Z_Zahlart (payment.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `ZAHLART_TYP` | Type of payment method | String | Automatically filled by ft |
| `ZAHLART_NAME` | Name of the payment method | String | Automatically filled by ft |
| `Z_ZAHLART_BETRAG` | business action type | Decimal (2) | Automatically filled by ft |

##### File: Z_Waehrungen (cash_per_currency.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | From `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically filled by ft |
| `ZAHLART_WAEH` | Currency | ISO 4217 currency code | Automatically filled by ft |
| `ZAHLART_BETRAG_WAEH` | Amount | Decimal (2) | Automatically filled by ft |
