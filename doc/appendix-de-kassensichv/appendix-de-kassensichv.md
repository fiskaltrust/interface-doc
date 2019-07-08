# Appendix: DE - KassSichV

This appendix expands on the information provided in the General Part by adding details specific to the German market. This additional information is provided only where applicable. The remaining chapters, for which there is no additional information required, were omitted.

The links to regulations and further information, can be found at:

<https://www.bundesfinanzministerium.de/Content/DE/Gesetzestexte/Gesetze_Gesetzesvorhaben/Abteilungen/Abteilung_IV/18_Legislaturperiode/Gesetze_Verordnungen/2016-12-28-Kassenmanipulationsschutzgestz/0-Gesetz.html>

<https://www.bundesfinanzministerium.de/Content/DE/Gesetzestexte/Gesetze_Verordnungen/2017-10-06-KassenSichV.html>

<https://www.bsi.bund.de/DE/Themen/DigitaleGesellschaft/Grundaufzeichnungen/grundaufzeichnungen_node.html;jsessionid=1D19B65DDBC349BC0C872288647A4281.2_cid369>

<https://www.bsi.bund.de/DE/Presse/Kurzmeldungen/Meldungen/news_sicherheitseinrichtungen_elektr_kassen_08062018.html>


## Terminology

| term | description |
|---|---|
| Action (DE: Vorgang) | an "action" within the meaning of the KassenSichV is a related recording process of an electronic recording system. An action can comprise one or more business-actions as well as other procedures, occurrences and events. Each action must trigger at least one transaction logged by the certified technical safety device (DE: TSE).  |
| Transaction (DE: Transaktion) | In the context of the logging of an action at least one transaction must be generated within the certified technical safety device (DE: TSE). While an "action" refers to the processes in the recording system, a "transaction" describes the safeguarding steps within the certified technical security device (at least at the beginning and end of the action) to the action in the respective recording system. |
| Business-action (DE: Geschäftsvorfall) | Business-actions are all legal and economic transactions that document, influence or change the profit or loss or the asset composition of an enterprise within a certain period of time. |

## Cash Register Integration

This chapter describes the cash register integration in accordance with the German law. The general rules for cash register integration are described in General Part of this document.

### Receipt Creation Process

This chapter describes the general process of creating receipts with fiskaltrust.Service and its workflow, in accordance with the German law. It requires to give a scope to an ongoing action over time. This scope is named a transaction. Calls to fiskaltrust.Service are processed just in time and cannot be async over multiple minutes. Therefore and in accordance with German law, a single call is maybe not able to scope a complete transaction. To solve this, multiple calls are used, scoping the same transaction.

#### The fiskaltrust.SecurityMechanism explicit transaction

The regular workflow of the fiskaltrust.SecurityMechanism in the German market for actions running longer than 45s (German max transaction update time delta), defines the steps required for the creation of a receipt as follows:

##### Start-Transaction

Already before you know how your action ends up you have to create/reserve a transaction number, to be able to track when the action started. this is done by a special call to the ´Sign´ method using the ´ReceiptCase´ "Start-Transaction". Details of this ´ReceiptRequest´ has to match a Zero-Receipt, so no ´ChargeItems´ and no ´PayItems´ are allowed. In addition to the requirements of a Zero-Receipt it is required to add a unique identification to the property ´cbReceiptIdentification´. This unique identifier can only be used once (at least between each daily closing) in a system and will create a bracket around an ongoing action. For all further ´Sign´ method calls it is mandatory to use the same unique identifier in the property ´cbReceiptIdentification´. Only one ongoing action/transaction by unique identifier is allowed, calling two times ´Sign´ method using ´ReceiptCase´ "Start-Transaction" with the same unique identifier ends up in an exception. If there are communication errors use the ´ReceiptCaseFlag´ "ReceiptRequest" to check if an action/transaction was already created.  
According to the German law and BSI TR-03153 a call to the ´Sign´ method using the ´ReceiptCase´ "Start-Transaction" take care of starting a transaction inside the TSE. The up-counting transaction number defined in TR-03153 is responded behind hash-tag in property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "ST".

##### Update-Transaction

Changes in ongoing actions have to be tracked. This is done by a special call to the ´Sign´ method using the ´ReceiptCase´ "Update-Transaction". Details of the ´ReceiptRequest´ should show up the current overall ´ChargeItems´ and ´PayItems´ of the ongoing action. To identify the action/transaction once again the unique identifier used in "Start-Transaction", handed over by the property ´cbReceiptIdentification´ is used. Calling the ´Sign´ method using an unique identifier that wasn't used to create a transaction or was already used to finalize a transaction will end up in an exception. According to the German law and BSI TR-03153 a call to the ´Sign´ method using the ´ReceiptCase´ "Update-Transaction" take care of updating a transaction inside the TSE. The same transaction number as responded at the call of "Start-Transaction" is responded behind the hash-tag in the property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "UT".  
It is not mandatory to call ´Sign´ using ´ReceiptCase´ "Update-Transaction" before you finalize a transaction. It is also possible to call ´Sign´ using ´ReceiptCase´ "Update-Transaction" multiple times for a single unique identifier/for a single transaction.

##### Delta-Transaction

The main functionality is the same as it is when calling ´Sign´ method using ´ReceiptCase´ "Update-Transaction". The differences are the details used in ´ChargeItems´ and ´PayItems´, they show up exactly the delta happened until last call using ´Start-Transaction´ or last call using ´Delta-Transaction´. For all the implementation there should be a system-wide decision taken to use only one of the ´ReceiptCases´, ´Update-Transaction´ or this one.  
According to the German law and BSI TR-03153 a call to the ´Sign´ method using the ´ReceiptCase´ "Delta-Transaction" take care of updating a transaction inside the TSE. The same transaction number as responded at the call of "Start-Transaction" is responded behind the hash-tag in the property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "DT".  
It is not mandatory to call ´Sign´ using ´ReceiptCase´ "Delta-Transaction" before you finalize a transaction. It is also possible to call ´Sign´ using ´ReceiptCase´ "Delta-Transaction" multiple times for a single unique identifier/for a single transaction.

##### End-Transaction

According to the German law and BSI TR-03153 each call to the ´Sign´ method using other ´ReceiptCase´ than "Start-Transaction", "Update-Transaction", "Delta-Transaction" and any kind of Zero-Receipts take care of ending a transaction inside the TSE.  
To identify the action/transaction that should be finalized the unique identifier in the property ´cbReceiptIdentification´ inside the ´ReceiptRequest´ is used. No matter if you used "Update-Transaction", "Delta-Transaction" or none of them, the ´ChargeItems´ and ´PayItems´ have to include the complete final state of all items involved.  
The transaction number defined in TR-03153 is responded behind hash-tag in property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "T".

#### The fiskaltrust.SecurityMechanism implicit transaction

The regular workflow of the fiskaltrust.SecurityMechanism in the German market for actions running immediately has the same requirements as long-running ones. In details, this means, according to BSI TR-03153, there has to be a "Start-Transaction" and a "Finish-Transaction" executed against the TSE. To speed up these two steps into one call to the ´Sign´ method there is a special ´ReceiptCaseFlag´ introduced. Each time this is used in combination with a usual ´ReceiptCase´ a "Start-Transaction" is done behind the scenes upfront to the final call using the given ´ReceiptCase´.
Using a unique identifier in `cbReceiptIdentification´ that was already used with a ´Sign´ call with ´ReceiptCase´ "Start-Transaction" will end up in an exception.
The up-counting transaction number defined in TR-03153 is responded behind hash-tag in property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "IT".

### Receipt for special functions

This section describes receipt types used for special functions on the German market and expands the common descriptions.

#### Zero Receipt

In the following chapters, you can find examples of special cases of zero receipts applicable to the German market.

#### Start Receipt (Initial Receipt)

There is a number of requirements for the implementation of a new, or a replaced German security mechanism (TSE). This kind of receipt can be used once in a lifetime of the queue/scu combination and initializes also the underlying German security mechanism (TSE) for usage.
This receipt must be archived. On successful operation, a notification to the tax authority is also created, which reports the active usage of the ftCashboxIdentification and the serial number of the German security mechanism (TSE).

#### Stop Receipt (Closing Receipt)

Once the queue has been closed with a stop receipt, the usage of the German security mechanism is deactivated.
On successful operation, a notification to the tax authority is also created, which reports the deactivation.

## Reference Tables

This chapter expands on the reference tables covered in [Reference Tables in General Part](../general/general.md#reference-tables), with country-specific information applicable to the German market.

### Service Status: ftState

The table below describes supported statuses for the ftState field in accordance with the German law. These codes can be added through the logic operator "OR".

The country-specific code is made of the country’s code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Germany (DE) this is `0x4445`, which results in `0x4445000000000000` as the value for the "ready" status.

| **Value** | **Description** | **Service-Version** |
|---|---|---|

### Type of Receipt: ftReceiptCase

The ftReceiptCase indicates the receipt type and defines how it should be processed by the fiskaltrust.SecurityMechanism in accordance with the German law.

For Germany (DE) the country code is `0x4445`. Thus, the value of an unknown ftReceiptCase in Germany is `0x4445000000000000`.

| **Value** | **Description** | **BON_TYP (DSFinV-K)** | **Service- Version** |
|---|---|---|---|
| `0x4445000000000000` | unknown type for country-code "DE"<br />This is handled like a pos-receipt (`0x4445000000000001`). | Beleg | 1.3- |
| `0x4445000000000001` | pos-receipt<br />main kind of receipt processed on a pos-system. creates a turnover and/or change in the amount of cash in the till or similar operations. <br />using the ChargeItems and PayItems to hand over details for processing. independent from the used flow (explicit/implicit), the ChargeItems and PayItems should contain the full final state of the receipt. the duration of the action is calculated using the minimum and maximum of datetime over ReceiptRequest/ChargeItems/PayItems.<br /> DSFinV-K: BON_TYP=Beleg, can be overwritten by ftReceiptCaseFlag  | Beleg | 1.3- |
| `0x4445000000000002` | zero-receipt<br />used for communication and functional test of the fiskaltrust.SecurityMechanism. In addition a detailed status information is responded on the used TSE-Device. Is only valid when charge items block (ftChargeItems) and pay items block (ftPayItems) in the ReceiptRequest are empty arrays.<br />Also TSE data are unloaded, what may cause a long running request.<br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception.<br />if you want to end a ongoing transaction without turnover (e.g. all items on a receipt are voided) then use a regular ReceiptCase.<br /> Informations returned:<br />- List of cbReceiptReference <-> Transaction-ID<br />- Statusdata of TSE, serialnumber, available/free memory, available number of signatures left, ...<br /> DSFinV-K: BON_TYP=AVSonstige, ChargeItems and PayItems have to be empty | AVSonstige | 1.3- |
| `0x4445000000000003` | initial operation receipt / start-receipt<br />The request is only valid with the same property requirements as a zero-receipt. initializing a new fiskaltrust.SecurityMachanism, this includes also the initialization of the used TSE in the background. Depending on the TSE-Type used this includes different actions.<br />On successful initialization, a notification is created which includes the queue-id, scu-id, certificate/public-key, tse-serialnumber=hash(public-key). this notification need to be reported to tax administration.<br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception.<br /> DSFinV-K: BON_TYP=AVSonstige, ChargeItems and PayItems have to be empty | AVSonstige | 1.3- |
| `0x4445000000000004` | out of operation receipt / stop-receipt<br />The request is only valid with the same property requirements as a zero-receipt. disabling a fiskaltrust.SecurityMachanism, this includes also the deactivation of the used TSE in the background. Depending on the TSE-Type used this includes different actions.<br />On successful deactivation, a notification is created which includes the queue-id, scu-id, certificate/public-key, tse-serialnumber=hash(public-key). this notification needs to be reported to tax administration. <br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception.<br /> DSFinV-K: BON_TYP=AVSonstige, ChargeItems and PayItems have to be empty | AVSonstige | 1.3- |
| `0x4445000000000005` | monthly-closing<br /> TBD: close all open cbReceiptReference <-> Transaction-ID  <br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | AVSonstige | 1.3- |
| `0x4445000000000006` | yearly-closing<br /> TBD: close all open cbReceiptReference <-> Transaction-ID  <br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | AVSonstige | 1.3- |
| `0x4445000000000007` | daily-closing<br /> TBD: close all open cbReceiptReference <-> Transaction-ID  <br />this works only on implicit flow. calling without the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | AVSonstige | 1.3- |
| `0x4445000000000008` | start-transaction-receipt<br />starts a new, unfinished action. use ChargeItems and PayItems to hand over already known details for final receipt. using the same cbTerminalID and cbReceiptReferece in further calls connects the action items. <br />this works only on explicit flow. calling with the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | AVSonstige | 1.3- |
| `0x4445000000000009` | update-transaction-receipt<br />updates an ongoing action. use ChargeItems and PayItems to hand over all details for final receipt. using the same cbTerminalID and cbReceiptReferece in further calls connects the action items. <br />this works only on explicit flow. calling with the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | AVSonstige | 1.3- |
| `0x444500000000000A` | delta-transaction-receipt<br />updates an ongoing action. use ChargeItems and PayItems to hand changes for final receipt. using the same cbTerminalID and cbReceiptReferece in further calls connects the action items. <br />this works only on explicit flow. calling with the ReceiptCaseFlag 0x0000000100000000 ends up in an exception. | AVSonstige | 1.3- |
| `0x444500000000000B` | fail-transaction-receipt<br />stopps/fails an ongoing action. tries to finish an open transaction (accepts fail, continue on fail). clears cbReceiptReferece <-> Transaction-ID relation. <br /> DSFinV-K: BON_TYP=AVBelegabbruch | AVSonstige | 1.3- |
| `0x444500000000000C` | b2b-invoice<br /> TBD: <br /> DSFinV-K: BON_TYP=Beleg, can be overwritten by ftReceiptCaseFlag  | Beleg | 1.3- |
| `0x444500000000000D` | b2c-invoice<br /> TBD: <br /> DSFinV-K: BON_TYP=Beleg, can be overwritten by ftReceiptCaseFlag  | Beleg | 1.3- |
| `0x444500000000000E` | info-invoice<br /> TBD: <br /> DSFinV-K: BON_TYP=AVRechnung | AVRechnung | 1.3- |
| `0x444500000000000F` | info-delivery-note<br /> TBD: <br /> DSFinV-K: BON_TYP=AVTransfer | AVTransfer | 1.3- |
| `0x4445000000000010` | info-order<br /> TBD: <br /> DSFinV-K: BON_TYP=AVBestellung | AVBestellung | 1.3- |
| `0x4445000000000011` | cash deposit / cash pay-in / cash pay-out / exchange<br /> TBD: <br /> DSFinV-K: BON_TYP=Beleg, can be overwritten by ftReceiptCaseFlag | Beleg | 1.3- |
| `0x4445000000000012` | material consumption<br /> TBD: <br /> DSFinV-K: BON_TYP=AVSachbezug | AVSachbezung | 1.3- |
| `0x4445000000000013` | info-internal<br /> TBD: <br /> DSFinV-K: BON_TYP=AVSonstige | AVSonstige | 1.3- |
| `0x4445000000000014` | protocol<br /> TBD: <br /> DSFinV-K: BON_TYP=AVSonstige | AVSonstige  | 1.3- |
| `0x4445000000000015` | foreign sales<br /> TBD: <br /> DSFinV-K: BON_TYP=AVSonstige | AVSonstige | 1.3- |


##### actions where a receiptcase has to be defined

- register new terminal (TerminalID)
- unregister a terminal (TerminalID)


#### ftReceiptCaseFlag

This table expands on the values provided in table [ftReceiptCaseFlag in General Part](../general/general.md#ftreceiptcaseflag) with values applicable to the German market.

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

This table expands on the values provided in Table [ftChargeItemCase in General Part](../general/general.md#type-of-service-ftchargeitemcase) with values applicable to the German 

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
| `0x4445000000000011` | delivery normal. For processing, see (0x4445000000000003) | 1 | Umsatz   | 1.3- |
| `0x4445000000000012` | delivery discounted-1. For processing, see (0x4445000000000001)  | 2 | Umsatz   | 1.3- |
| `0x4445000000000013` | delivery special-1. For processing, see (0x4445000000000004)  | 3 | Umsatz | 1.3- |
| `0x4445000000000014` | delivery special-2. For processing, see (0x4445000000000002) | 4 | Umsatz  | 1.3- |
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

This table expands on the values provided in table [ftPayItemCase in General Part](../general/general.md#type-of-payment-ftpayitemcase) with values applicable to the German market.

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

