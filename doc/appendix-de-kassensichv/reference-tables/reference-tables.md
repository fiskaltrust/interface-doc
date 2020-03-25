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

You can downloade the current version of the DSFinV-K specification [here](https://www.bzst.de/DE/Unternehmen/Aussenpruefungen/DigitaleSchnittstelleFinV/digitaleschnittstellefinv_node.html).

Based on the the current version of the DSFinV-K specification, this chapter explains how the DSFinV-K export is structured, shows how the previously described input values are mapped by fisklatrust to the files and data of the DSFinV-K export and defines how additional, for the DSFInV-K required, values can be sent to the fiskaltrust middleware. Furthermore, it describes how the marking of actions (DE: Vorgänge) can be made by connecting business actions (DE: Geschäftsvorfälle) and other procedures, occurrences and events (DE: Andere Vorgänge). 

#### Structure

The DSFinV-K export is divided into the following sections/modules: 

- Single recordings module (DE: Einzelaufzeichnungsmodul)
- Master data module (DE: Stammdatenmodul)
- Cashpoint closing module (DE: Kassenabschlussmodul)

Each module consists of several files. In the following we will go into the individual modules and have look to the files and data contained in them.

#### Single recordings module (DE: Einzelaufzeichnungsmodul)

The single recordings provide the basis for data storage. These are divided into two main areas:

- Bonpos (lines.csv)
- Bonkopf (transactions.csv)

In addition to these two files there are further detail files which are described in the following.

##### File: Bonpos (lines.csv)

The Bonpos (lines.csv) file contains the single items of an action (DE: Vorgang) with the allocation of the correct VAT rate, quantity and type of goods supplied. In addition, the method of calculating the VAT (gross or net method) is also recorded. With the gross method only the gross price is recorded, with the net method the net price and the sales tax due on it.

Following table shows the values needed per line/position in the Bonpos file:

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | No. of the cashpoint closing | Integer | automatically filled by ft |
| `BON_ID` | Action-ID | String | `ftReceiptReference` |
| `POS_ZEILE` | Line/Position number  | String | automatically filled by ft |
| `GUTSCHEIN_NR` | Voucher no.| String | optional, can be sent via `ftPayItemData` in JSON format. To send, add the key value pair `voucherNr` e.g. `"ftPayItemData":"{ ..., "voucherNr":"UAUA91829182HH", ... }"`|
| `ARTIKELTEXT` | Product/Article text| String | `ftChargeItem.Description` |
| `POS_TERMINAL_ID` | Terminal-ID of this line (position)| String | `cbTerminalID` |
| `GV_TYP` | Type of business action  | String | `ftChargeItemCase` |
| `GV_NAME` | Addition to the business action type | String| optional, can be sent via `ftChargeItemData` in JSON format. To send, add the key value pair `itemCaseName` e.g. `"ftChargeItemData":"{ ..., "itemCaseName":"Rabatt: Black Friday", ... }"` |
| `INHAUS` | Inhouse consumption | 0 or 1 | optional, can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `inhaus` e.g. `"ftReceiptCaseData":"{ ..., "inhaus":1, ... }"`, defaults to 0 if not sent, any other value than 0 is interpreted as 1.|
| `P_STORNO` | Position cancellation Identification | String | not used|
| `AGENTUR_ID` | ID of the Agency | Number | automatically filled by ft |
| `ART_NR` | Article number | String | `ftChargeItem.ProductNumber` |
| `GTIN` | GTIN | String | optional, can be sent via `ftChargeItemData` in JSON format. To send, add the key value pair `GTIN` e.g. `"ftChargeItemData":"{ ..., "GTIN":"9181981928298", ... }"` |
| `WARENGR_ID` | Product group ID | String | send via `ftChargeItem.productGroup` in JSON format by adding the key value pair `productGroupId` e.g. `"productGroup":"{ "productGroupId":"981981AA", "productGroupName":"Fleischwaren" }"`|
| `WARENGR` | Description of the product group | String |send via `ftChargeItem.productGroup` in JSON format by adding the key value pair `productGroupName` e.g. `"productGroup":"{ "productGroupId":"981981AA", "productGroupName":"Fleischwaren" }"`|
| `MENGE` | Quantity | Decimal (3) | `ftChargeItem.Quantity` |
| `FAKTOR` | factor, e.g. container size | Decimal (3) | `ftChargeItem.UnitQuantity`|
| `EINHEIT` | Unit of measurement, e.g. kg, litres or pieces | String | `ftChargeItem.Unit` |
| `STK_BR` | Price per unit incl. VAT | Decimal (5) | `ftChargeItem.UnitPrice` |

##### File: Bonpos_USt (lines_vat.csv)

For each position, this file contains information on the VAT rates used. This detail table is necessary because, for example, several VAT rates per position can occur for combinations of goods (DE: Warenzusammenstellungen) or several lines with price information can be necessary for discounts. 


| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | No. of the cashpoint closing | Integer | automatically filled by ft |
| `BON_ID` | Action-ID | String | automatically filled by ft |
| `POS_ZEILE` | Line/Position number  | String | automatically filled by ft |
| `UST_SCHLUESSEL` | ID of the VAT rate | Integer | automatically filled by ft |
| `POS_BRUTTO` | Gross sales | Decimal (5) | automatically filled by ft |
| `POS_NETTO` | Net sales | Decimal (5) | automatically filled by ft |
| `POS_UST` | VAT | Decimal (5) | automatically filled by ft |


##### File: Bonpos_Preisfindung (itemamounts.csv)

This table contains detailed information on the origin of the price, e.g. special customer discounts or surcharges.

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | No. of the cashpoint closing | Integer | automatically filled by ft |
| `BON_ID` | Action-ID | String | automatically filled by ft |
| `POS_ZEILE` | Line/Position number  | String | automatically filled by ft |
| `TYP` | Base price, discount or surcharge  | String |automatically filled by ft |
| `UST_SCHLUESSEL` | ID of the VAT rate | Integer | automatically filled by ft |
| `PF_BRUTTO` | Gross sales | Decimal (5) | automatically filled by ft |
| `PF_NETTO` | Net sales | Decimal (5) | automatically filled by ft |
| `PF_UST` | VAT | Decimal (5) | automatically filled by ft |


##### File: Bonpos_Zusatzinfo (subitems.csv)

This table allows to detail the composition of sold combinations of goods (DE: Warenzusammenstellungen). They serve exclusively for explanation.

This does not affect the basis of assessment for VAT. In the case of goods combinations with different tax rates, however, information is stored here which serves to control the distribution of the VAT assessment basis (example: fast food menu consisting of a drink and a burger). In addition, orders deviating from the standard order can be taken into account to record the actual consumption of goods (example: gyros plate with chips instead of rice).

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `BON_ID` | Action-ID | String | automatically filled by ft |
| `POS_ZEILE` | Line/Position number  | String | automatically filled by ft |
| `ZI_ART_NR` | Article number  | String |             |
| `ZI_GTIN` | GTIN | String |             |
| `ZI_NAME` | Article name | String |             |
| `ZI_WARENGR_ID` | Product group ID | String |             |
| `ZI_WARENGR` | Name of the product group | String ||
| `ZI_MENGE` | Quantity | Decimal (3) ||
| `ZI_FAKTOR` | factor, e.g. container sizes | Decimal (3) ||
| `ZI_EINHEIT` | Unit of measurement, e.g. kg, litres or pieces | String ||
| `ZI_UST_SCHLUESSEL` | ID of VAT rate for the base price | Integer ||
| `ZI_BASISPREIS_BRUTTO` | Gross basis price | Decimal (5) ||
| `ZI_BASISPREIS_NETTO` | Net basis price | Decimal (5) ||
| `ZI_BASISPREIS_UST` | Basis VAT | Decimal (5) ||


##### File: Bonkopf (transactions.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `BON_ID` | Action-ID | String | `ftReceiptReference` |
| `BON_NR` | Receipt number | Integer | `ftReceiptIdentification` |
| `BON_TYP` | Receipt type / action type| String | `ftReceiptCase` |
| `BON_NAME` | Action-ID | String | mandatory if action type (`BON_TYPE`) is `AVSonstige`, otherwise optional, can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `receiptName ` e.g. `"ftReceiptCaseData":"{ ..., "receiptName":"Sonstige Sonderwurst", ... }"` |
| `TERMINAL_ID` | ID of the terminal that was used to record this receipt | String | `cbTerminalID` |
| `BON_STORNO` | Cancellation indicator | String | not used |
| `BON_START` | Time of the action start | String | automatically filled by ft |
| `BON_ENDE` | Time of the action end | String | automatically filled by ft |
| `BEDIENER_ID` | User-ID | String | send via `cbUser` in JSON format by adding the key value pair `userId` e.g. `"cbUser":"{ "userId":"19292", "userName":"Peter Lux"}"`|
| `BEDIENER_NAME` | User name | String | send via `cbUser` in JSON format by adding the key value pair `userName` e.g. `"cbUser":"{ "userId":"19292", "userName":"Peter Lux"}"`|
| `UMS_BRUTTO` | Gross total turnover | Decimal (2) | automatically filled by ft |
| `KUNDE_NAME` | Name of beneficiary customer | String | if known, send via `cbCustomer` in JSON format by adding the key value pair `customerName` e.g. `"cbCustomer":"{"customerName":"Max Wanne",...}"`|
| `KUNDE_ID` | ID of the beneficiary customer| String | if known, send via `cbCustomer` in JSON format by adding the key value pair `customerId` e.g. `"cbCustomer":"{"customerName":"Max Wanne", "customerId":"PX9819822", ...}"`|
| `KUNDE_TYP` | Type of the beneficiary customer (e.g. employee) | String | if known, send via `cbCustomer` in JSON format by adding the key value pair `customerType` e.g. `"cbCustomer":"{..., "customerId":"PX9819822", "customerType":"Mitarbeiter", ...}"`|
| `KUNDE_STRASSE` | Street and house number of the beneficiary customer | String | if known, send via `cbCustomer` in JSON format by adding the key value pair `customerStreet` e.g. `"cbCustomer":"{..., "customerStreet":"Lindwurmstr. 98", ...}"` |
| `KUNDE_PLZ` | Zip of the beneficiary customer | String | if known, send via `cbCustomer` in JSON format by adding the key value pair `customerStreet` e.g. `"cbCustomer":"{..., "customerZip":"80337", ...}"` |
| `KUNDE_ORT` | City of the beneficiary customer | String | if known, send via `cbCustomer` in JSON format by adding the key value pair `customerCity` e.g. `"cbCustomer":"{..., "customerCity":"München", ...}"` |
| `KUNDE_LAND` | Country of the beneficiary customer | String | if known, send via `cbCustomer` in JSON format by adding the key value pair `customerCountry` e.g. `"customerCountry":"{..., "customerCountry":"DE", ...}"`  |
| `KUNDE_USTID` | VAT-ID of the beneficiary customer | String | if known, send via `cbCustomer` in JSON format by adding the key value pair `customerVATId` e.g. `"customerCountry":"{..., "customerVATId":"DE123456789", ...}"`   |
| `BON_NOTIZ` | Additional information on the receipt header | String | tbd |

##### File: Bonkopf_USt  (transactions_vat.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `BON_ID` | Action-ID | String | `ftReceiptReference` |
| `POS_ZEILE` | Line/Position number  | String | automatically filled by ft |
| `UST_SCHLUESSEL` | ID of the VAT rate | Integer | automatically filled by ft |
| `BON_BRUTTO` | Gross sales | Decimal (5) | automatically filled by ft |
| `BON_NETTO` | Net sales | Decimal (5) | automatically filled by ft |
| `BON_UST` | VAT | Decimal (5) | automatically filled by ft |

##### File: Bonkopf_AbrKreis (allocation_groups.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `BON_ID` | Action-ID | String | `ftReceiptReference` |
| `ABRECHNUNGSKREIS` | Criterion (e.g table number, department etc.) of the assignment | String | `cbArea` (? tbd)|

##### File: Bonkopf_Zahlarten (datapayment.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `BON_ID` | Action-ID | String | `ftReceiptReference` |
| `ZAHLART_TYP` | Type of payment method | String | `ftPayItemCase` |
| `ZAHLART_NAME` | Name of the payment method | String | optional, can be sent via `ftPayItemData` in JSON format. To send, add the key value pair `itemCaseName` e.g. `"ftPayItemData":"{ ..., "itemCaseName":"Sodexo", ... }"` |
| `ZAHLWAEH_CODE` | Currency code | String | only mandatory if foreign currency was used for the payment, can be sent via `ftPayItemData` in JSON format. To send, add the key value pair `currencyCode` e.g. `"ftPayItemData":"{ ..., "currencyCode":"USD", ... }"`. Only ISO 4217 currency codes are allowed. |
| `ZAHLWAEH_BETRAG` | Amount in foreign currency | Decimal (2) | only mandatory if foreign currency was used for the payment, can be sent via `ftPayItemData` in JSON format. To send, add the key value pair `foreignCurrencyAmount` e.g. `"ftPayItemData":"{ ..., "foreignCurrencyAmount":23.00, ... }"`. |
| `BASISWAEH_BETRAG` | Amount in basis currency (usually EUR) | Decimal (2) | only mandatory if foreign currency was used for the payment, can be sent via `ftPayItemData` in JSON format. To send, add the key value pair `baseCurrencyAmount` e.g. `"ftPayItemData":"{ ..., "baseCurrencyAmount":20.99, ... }"`|

##### File: Bon_Referenzen (references.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `BON_ID` | Action-ID | String | `ftReceiptReference` |
| `POS_ZEILE` | Line number of the referencing operation | String | automatically filled by ft  |
| `REF_TYP` | Type of reference | "ExterneRechnung" or "ExternerLieferschein" or "Transaktion" or "ExterneSonstige" | can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `refType ` e.g. `"ftReceiptCaseData":"{ ..., "refType":"Transaktion", ... }"`. The value "Transaktion" mapps to an internal reference within this DSFinV-K export, all other values map to external references.|
| `REF_NAME` | Description for type | String | mandatory if refType is "ExterneSonstige", otherwise optional. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `refName ` e.g. `"ftReceiptCaseData":"{ ..., "refName":"Sonstige Sonderwurst", ... }"`.|
| `REF_DATUM` | Date of the cashpoint closing | String | mandatory if refType is "Transaktion", otherwise optional. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `refMoment ` e.g. `"ftReceiptCaseData":"{ ..., "refMoment":"2020-01-03T17:00:01", ... }"`.|
| `REF_Z_KASSE_ID` | ID of the (closing) cashpoint | String | mandatory if refType is "Transaktion", otherwise optional. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `refCashBoxIdentification ` e.g. `"ftReceiptCaseData":"{ ..., "refCashBoxIdentification":"AHHAH1919919", ... }"`.|
| `REF_Z_NR` | No. of the cashpoint closing | Integer | mandatory if refType is "Transaktion", otherwise optional. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `refClosingNr` e.g. `"ftReceiptCaseData":"{ ..., "refClosingNr":1091029, ... }"`.|
| `REF_BON_ID` | Action-ID | String | mandatory, can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `refReceiptId` e.g. `"ftReceiptCaseData":"{ ..., "refReceiptId":"UAUUA1112", ... }"`.|

##### File: TSE_Transaktionen (transactions_tse.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `BON_ID` | Action-ID | String | `ftReceiptReference` |
| `TSE_ID` | ID of the TSE used for the transaction | Integer | automatically filled by ft |
| `TSE_TANR` | Transaction number of the transaction | Integer | automatically filled by ft|
| `TSE_TA_START` | Log time of the StartTransaction operation | String | automatically filled by ft |
| `TSE_TA_ENDE` | Log time of the FinishTransaction operation | String | automatically filled by ft |
| `TSE_TA_VORGANGSART` | processType der FinishTransaktions operation | String | automatically filled by ft |
| `TSE_TA_SIGZ` | Signature counter of the FinishTransaction operation | String | automatically filled by ft |
| `TSE_TA_SIG` | Signature of the FinishTransaction operation | String | automatically filled by ft |
| `TSE_TA_FEHLER` | Where appropriate, indications of TSE errors | String | automatically filled by ft|
| `TSE_VORGANGSDATEN` | Data of the operation (optional) | String | automatically filled by ft |

#### Master data module (DE: Stammdatenmodul)

To avoid redundancies, the master data is only saved once for each cash register closing. If changes are made to the master data listed below, a closing must be created automatically beforehand.

The master data module is divided into the following files:

##### File: Stamm_Abschluss (cashpointclosing.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `Z_BUCHUNGSTAG` | Booking date different from creation date | String | tbd |
| `TAXONOMIE_VERSION` | Version of the DFKA taxonomy cash register | String | automatically filled by ft |
| `Z_START_ID` | First BON_ID in closing | String | automatically filled by ft |
| `Z_ENDE_ID` | Last BON_ID in the closing | String | automatically filled by ft |
| `NAME` | Name of the company | String | tbd |
| `STRASSE` | Street | String | tbd |
| `PLZ` | Zip | String | tbd |
| `ORT` | City | String | tbd |
| `LAND` | Country | String | tbd |
| `STNR` | Tax number of the company | String | tbd |
| `USTID` | VAT ID | String | tbd |
| `Z_SE_ZAHLUNGEN` | Total of all payments | Decimal (2) | automatically filled by ft  |
| `Z_SE_BARZAHLUNGEN` | Total of all cash payments | Decimal (2) | automatically filled by ft |

##### File: Stamm_Orte (location.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `LOC_NAME` | Name of the site | String | tbd |
| `LOC_STRASSE` | Street | String | tbd |
| `LOC_PLZ` | Zip | String | tbd |
| `LOC_ORT` | City | String | tbd |
| `LOC_LAND` | Country | String | tbd |
| `LOC_USTID` | VAT ID | String | tbd |

##### File: Stamm_Kassen (cashregister.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `KASSE_BRAND` | Brand of the cash register | String | tbd |
| `KASSE_MODELL` | Model designation | String | tbd |
| `KASSE_SERIENNR` | Serial number of the cash register | String | tbd | 
| `KASSE_SW_BRAND` | Brand name of the software | String | tbd |
| `KASSE_SW_VERSION` | Version of the software | String | tbd |
| `KASSE_BASISWAEH_CODE` | Basis currency of the cash register | String | tbd |
| `KEINE_UST_ZUORDNUNG` | VAT not determinable | String | tbd |

##### File: Stamm_Terminals (slaves.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `TERMINAL_ID` | ID of the terminal | String | tbd |
| `TERMINAL_BRAND` | Brand of the terminal | String | tbd |
| `TERMINAL_MODELL` | Model designation | String | tbd |
| `TERMINAL_SERIENNR` | Serial number of the terminal | String | tbd |
| `TERMINAL_SW_BRAND` | Brand name of the software | String | tbd |
| `TERMINAL_SW_VERSION` | Version of the software | String | tbd |

##### File: Stamm_Agenturen (pa.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `AGENTUR_ID` | ID of the agency | Integer |  |
| `AGENTUR_NAME` | Name of the client | String |  |
| `AGENTUR_STRASSE` | Street | String |  |
| `AGENTUR_PLZ` | Zip | String |  |
| `AGENTUR_ORT` | City | String |  |
| `AGENTUR_LAND` | Country | String |  |
| `AGENTUR_STNR` | Street| String |  |
| `AGENTUR_USTID` | VAT ID| String |  |

##### File: Stamm_USt (vat.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer |  |
| `UST_SCHLUESSEL` | ID of the VAT rate| Integer |  |
| `UST_SATZ` | Percentage | Decimal (2) |  |
| `UST_BESCHR` | Description| String |  |

##### File: Stamm_TSE (tse.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer | automatically filled by ft |
| `TSE_ID` | TSE ID | Integer | automatically filled by ft |
| `TSE_SERIAL` |  Serial number of the TSE (Corresponds according to TR- 03153 section 7.5. to the hash value of the key contained in the certificate; octet string in hexadecimal representation) | String | automatically filled by ft |
| `TSE_SIG_ALGO` | The signature algorithm used by the TSE | String | automatically filled by ft |
| `TSE_ZEITFORMAT` | The format used by the TSE for the log-time | String | automatically filled by ft |
| `TSE_PD_ENCODING` | Text encoding of the process data (UTF-8 or ASCII) | String | automatically filled by ft |
| `TSE_PUBLIC_KEY` |  Public key - eventually extracted from the TSE certificate - in base64 encoding | String | automatically filled by ft |
| `TSE_ZERTIFIKAT_I` |  First 1,000 characters of the TSE certificate (in base64 encoding) | String | automatically filled by ft |
| `TSE_ZERTIFIKAT_II` | Possibly another 1,000 characters of the certificate (in base64 encoding) | String | automatically filled by ft |

#### Cashpoint closing module (DE: Kassenabschlussmodul)

The three structure levels (modules) allow transactions to be separated and grouped, so that they can be automatically posted or transferred to the bookkeeping. The cash register closing therefore has an accounting function, meaning that the data of the respective closing has to be stored digitally within this module. The storage takes place in three files:

##### File: Z_Zahlart Z_GV_TYP (businesscases.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer ||
| `GV_TYP` | business action type | String ||
| `GV_NAME` | name of the business action type | String ||
| `AGENTUR_ID` | Agency ID | Integer ||
| `UST_SCHLUESSEL` | ID of the VAT rate | Integer ||
| `Z_UMS_BRUTTO` | Gross sales | Decimal (5) ||
| `Z_UMS_NETTO` | Net sales | Decimal (5) ||
| `Z_UST` | VAT | Decimal (5) ||

##### File: Z_Zahlart (payment.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer ||
| `ZAHLART_TYP` | Type of payment method | String ||
| `ZAHLART_NAME` | Name of the payment method | String ||
| `Z_ZAHLART_BETRAG` | business action type | Decimal (2) ||

##### File: Z_Waehrungen (cash_per_currency.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String | `ftCashBoxIdentification` |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | String | `cbReceiptMoment` |
| `Z_NR` | Nr. of the cashpoint closing | Integer ||
| `ZAHLART_WAEH` | Currency | String ||
| `ZAHLART_BETRAG_WAEH` | Amount | Decimal (2) ||
