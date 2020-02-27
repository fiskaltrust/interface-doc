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

