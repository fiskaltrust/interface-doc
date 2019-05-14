# Appendix: DE - KassSichV

This appendix expands on the information provided in the General Part by adding details specific to the German market. This additional information is provided only where applicable. The remaining chapters, for which there is no additional information required, were omitted.

The links to regulations and further information, can be found at:

<https://www.bundesfinanzministerium.de/Content/DE/Gesetzestexte/Gesetze_Gesetzesvorhaben/Abteilungen/Abteilung_IV/18_Legislaturperiode/Gesetze_Verordnungen/2016-12-28-Kassenmanipulationsschutzgestz/0-Gesetz.html>

<https://www.bundesfinanzministerium.de/Content/DE/Gesetzestexte/Gesetze_Verordnungen/2017-10-06-KassenSichV.html>

<https://www.bsi.bund.de/DE/Themen/DigitaleGesellschaft/Grundaufzeichnungen/grundaufzeichnungen_node.html;jsessionid=1D19B65DDBC349BC0C872288647A4281.2_cid369>

<https://www.bsi.bund.de/DE/Presse/Kurzmeldungen/Meldungen/news_sicherheitseinrichtungen_elektr_kassen_08062018.html>

## Cash Register Integration

This chapter describes the cash register integration in accordance with the German law. The general rules for cash register integration are described in General Part of this document.

### Receipt Creation Process

This chapter describes the general process of creating receipts with fiskaltrust.Service and its workflow, in accordance with the German law. It requires to give a scope to an ongoing action over time. This scope is named a transaction. Calls to fiskaltrust.Service are processed just in time and cannot be async over multiple minutes. Therefore and in accordance with German law a single call is maybe not able to scope a complete transaction. To solve this, multiple calls are used, scoping the same transaction.

#### The fiskaltrust.SecurityMechanism explicit transaction

The regular workflow for actions running longer than (german max transaction update time delta) 45s of the fiskaltrust.SecurityMechanism in the German market defines the steps required for creation of a receipt as follows:

##### Start-Transaction

Already before you know how your action ends up you have to create/reserve a transaction number, to be able to track when the action started. this is done by a special call to the ´Sign´ method using the ´ReceiptCase´ "Start-Transaction". Details of this ´ReceiptRequest´ has to match a Zero-Receipt, so no ´ChargeItems´ and no ´PayItems´ are allowed. In addition to the requirements of a Zero-Receipt it is required to add a unique identification to the property ´cbReceiptIdentification´. This unique identifier can only be used once (at least between each daily closing) in a system and will create a bracket around an ongoing action. For all further ´Sign´ method calls it is mandatory to use the same unique identifier in the property ´cbReceiptIdentification´. Only one ongoing action/transaction by unique identifier is allowed, calling two times ´Sign´ method using ´ReceiptCase´ "Start-Transaction" with the same unique identifier ends up in an exception. If there are communication errors use the ´ReceiptCaseFlag´ "ReceiptRequest" to check if an action/transaction was already created.  
According to the German law and BSI TR-03153 a call to the ´Sign´ method using the ´ReceiptCase´ "Start-Transaction" take care of starting a transaction inside the TSE. The up-counting transaction number defined in TR-03153 is responded behind hash-tag in property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "ST".

##### Update-Transaction

Changes of ongoing actions have to be tracked. This is done by a special call to the ´Sign´ method using the ´ReceiptCase´ "Update-Transaction". Details of the ´ReceiptRequest´ should show up the current over all ´ChargeItems´ and ´PayItems´ of the ongoing action. To identify the action/transaction once again the unique identifier used in "Start-Transaction", handed over by the property ´cbReceiptIdentification´ is used. Calling the ´Sign´ method using an unique identifier that wasn't used to create a transaction or was already used to finalize a transaction will end up in an exception. According to the German law and BSI TR-03153 a call to the ´Sign´ method using the ´ReceiptCase´ "Update-Transaction" take care of updating a transaction inside the TSE. The same transaction number as responded at the call of "Start-Transaction" is responded behind the hash-tag in the property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "UT".  
It is not mandatory to call ´Sign´ using ´ReceiptCase´ "Update-Transaction" before you finalize a transaction. It is also possible to call ´Sign´ using ´ReceiptCase´ "Update-Transaction" multiple times for a single unique identifier/for a single transaction.

##### Delta-Transaction

The main functionality is the same as it is when calling ´Sign´ method using ´ReceiptCase´ "Update-Transaction". The difference are the details used in ´ChargeItems´ and ´PayItems´, they show up exactly the delta happend until last call using ´Start-Transaction´ or last call using ´Delta-Transaction´. For all the implementation there should be a system wide decision taken to use only one of the ´ReceiptCases´, ´Update-Transaction´ or this one.  
According to the German law and BSI TR-03153 a call to the ´Sign´ method using the ´ReceiptCase´ "Delta-Transaction" take care of updating a transaction inside the TSE. The same transaction number as responded at the call of "Start-Transaction" is responded behind the hash-tag in the property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "DT".  
It is not mandatory to call ´Sign´ using ´ReceiptCase´ "Delta-Transaction" before you finalize a transaction. It is also possible to call ´Sign´ using ´ReceiptCase´ "Delta-Transaction" multiple times for a single unique identifier/for a single transaction.

##### End-Transaction

According to the German law and BSI TR-03153 each call to the ´Sign´ method using other ´ReceiptCase´ than "Start-Transaction", "Update-Transaction", "Delta-Transaction" and any kind of Zero-Receipts take care of ending a transaction inside the TSE.  
To identify the action/transaction that should be finalized the unique identifier in the property ´cbReceiptIdentification´ inside the ´ReceiptRequest´ is used. No matter if you used "Update-Transaction", "Delta-Transaction" or none of them, the ´ChargeItems´ and ´PayItems´ have to include the complete final state of all items involved.  
The transaction number defined in TR-03153 is responded behind hash-tag in property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "T".

#### The fiskaltrust.SecurityMechanism implicit transaction

The regular workflow for actions running immediatly of the fiskaltrust.SecurityMechanism in the German market have same requirements like long running ones. In details this means, according to BSI TR-03153, there has to be a "Start-Transaction" and a "Finish-Transaction" executed against the TSE. To speed up this two steps into one call to the ´Sign´ method the is a special ´ReceiptCaseFlag´ introduced. Each time this is used in combination with a usual ´ReceiptCase´ a "Start-Transaction" is done behind the scense upfront to the final call using the given ´ReceiptCase´.
Using a unique identifier in `cbReceiptIdentification´ that was already used with a´Sign´ call with ´ReceiptCase´ "Start-Transaction" will end up in an exception.
The up-counting transaction number defined in TR-03153 is responded behind hash-tag in property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "IT".

### Receipt for special functions

This section describes receipt types used for special functions on the German market and expands the common descriptions.

#### Zero Receipt

In the following chapters you can find examples of special cases of zero receipts applicable to the German market.

#### Start Receipt (Initial Receipt)

There is a number of requirements for the implementation of a new, or a replaced security mechanism (TSE).

TBD ...

This receipt must be archived.

#### Stop Receipt (Closing Receipt)

TBD ...

Once the queue has been closed with a stop receipt, no hashing and signing of receipts will be done for that queue.

## Reference Tables

This chapter expands on the reference tables covered in chapter x.y of the General Part on page p, with country specific information applicable to the German market.

### Service Status: ftState

The table below describes supported statuses for the ftState field in accordance with the German law. These codes can be added through the logic operator "OR".

The country specific code, is made of the country’s code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Germany (DE) this is `0x4445`, which results in `0x4445000000000000` as the value for the "ready" status.

| **Value** | **Description** | **Service-Version** |
|----------------------|

### Type of Receipt: ftReceiptCase

The ftReceiptCase indicates the receipt type and defines how it should be processed by the fiskaltrust.SecurityMechanism in accordance with the German law.

For Germany (DE) the country code is `0x4445`. Thus, the value for an unknown ftReceiptCase in Germany is `0x4445000000000000`.

| **Value** | **Description** | **Service- Version** |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------|---------------------|
| `0x4445000000000000` | "default value"<br />unknown payment type: automatic processing through the fiskaltrust.SecurityMechanisms settings is attempted. | 0-                  |
| `0x4445000000000000` | "unknown payment type for DE"<br />This is handled like a Start Receipt.                                                          | 0-                  |
| `0x4445000000000001` | "Start Transaction"                                                                                                               | 0-                  |
| `0x4445000000000002` | "Update Transaction"                                                                                                              | 0-                  |
| `0x4445000000000003` | "Delta Transaction"                                                                                                               | 0-                  |
| `0x4445000000000004` | "End Transaction"                                                                                                                 | 0-                  |
| `0x4445000000000005` | "Start Receipt"                                                                                                                   | 0-                  |
| `0x4445000000000006` | "Stop Receipt"                                                                                                                    | 0-                  |
| `0x4445000000000007` | "Daily Closing Receipt"                                                                                                           | 0-                  |

#### ftReceiptCaseFlag

This table expands on the values provided in table 10 of chapter x.y.z on page p with values applicable to the German market.

| Value | Description | Service-Version |
|----------------------|
| TBD | Implicit Transaction. No Start-Transaction call to ´Sign´ is required, it is done implicit. If the unique identifier set in property ´cbReceiptIdentification´ already started a transaction, this will throw an exception. | TBD |

### Type of Service: ftChargeItemCase

This table expands on the values provided in Table 12 on chapter x.y.z on page p with values applicable to the German market.

| **Value**            | **Description**                                                                            | **Service-Version** |
|----------------------|--------------------------------------------------------------------------------------------|---------------------|
| `0x4445000000000000` | "unknown type of service for DE"<br />With help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms, an allocation to normal /discounted-1 /discounted-2/zero is attempted.                                                                                                  | 0-                  |
| `0x4445000000000001` | "undefined type of service for DE discounted-1"                                            | 0-                  |
| `0x4445000000000002` | "undefined type of service for DE discounted-2"                                            | 0-                  |
| `0x4445000000000003` | "undefined type of service for DE normal"                                                  | 0-                  |
| `0x4445000000000004` | "undefined type of service for DE special"                                                 | 0-                  |
| `0x4445000000000005` | "undefined type of service for DE zero"                                                    | 0-                  |
| `0x4445000000000006` | "reverse charge"                                                                           | 0-                  |
| `0x4445000000000007` | "not own sales"                                                                            | 0-                  |
| `0x4445000000000008` | "delivery discounted-1"<br />For processing, see (0x4445000000000001)                      | 0-                  |
| `0x4445000000000009` | "delivery discounted-2"<br />For processing, see (0x4445000000000002)                      | 0-                  |
| `0x444500000000000A` | "delivery normal"<br />For processing, see (0x4445000000000003)                            | 0-                  |
| `0x444500000000000B` | "delivery special"<br />For processing, see (0x4445000000000004)                           | 0-                  |
| `0x444500000000000C` | "delivery zero"<br />For processing, see (0x4445000000000005)                              | 0-                  |
| `0x444500000000000D` | "other services discounted-1"<br />For processing, see (0x4445000000000001)                | 0-                  |
| `0x444500000000000E` | "other services discounted-2"<br />For processing, see (0x4445000000000002)                | 0-                  |
| `0x444500000000000F` | "other services normal"<br />For processing, see (0x4445000000000003)                      | 0-                  |
| `0x4445000000000010` | "other services special"<br />For processing, see (0x4445000000000004)                     | 0-                  |
| `0x4445000000000011` | "other services zero"<br />For processing, see (0x4445000000000005)                        | 0-                  |
| `0x4445000000000012` | "catalogue services discounted-1"<br />For processing, see (0x4445000000000001)            | 0-                  |
| `0x4445000000000013` | "catalogue services discounted-2"<br />For processing, see (0x4445000000000002)            | 0-                  |
| `0x4445000000000014` | "catalogue services normal"<br />For processing, see (0x4445000000000003)                  | 0-                  |
| `0x4445000000000015` | "catalogue services special"<br />For processing, see (0x4445000000000004)                 | 0-                  |
| `0x4445000000000016` | "catalogue services zero"<br />For processing, see (0x4445000000000005)                    | 0-                  |
| `0x4445000000000017` | "own consumption discounted-1"<br />For processing, see (0x4445000000000001)               | 0-                  |
| `0x4445000000000018` | "own consumption discounted-2"<br />For processing, see (0x4445000000000002)               | 0-                  |
| `0x4445000000000019` | "own consumption normal"<br />For processing, see (0x4445000000000003)                     | 0-                  |
| `0x444500000000001A` | "own consumption special"<br />For processing, see (0x4445000000000004)                    | 0-                  |
| `0x444500000000001B` | "own consumption zero"<br />For processing, see (0x4445000000000005)                       | 0-                  |
| `0x444500000000001C` | "down payment discounted-1"<br />For processing, see (0x4445000000000001)                  | 0-                  |
| `0x444500000000001D` | "down payment discounted-2"<br />For processing, see (0x4445000000000002)                  | 0-                  |
| `0x444500000000001E` | "down payment normal"<br />For processing, see (0x4445000000000003)                        | 0-                  |
| `0x444500000000001F` | "down payment special"<br />For processing, see (0x4445000000000004)                       | 0-                  |
| `0x4445000000000020` | "down payment zero"<br />For processing, see (0x4445000000000005)                          | 0-                  |
| `0x4445000000000021` | "account of a third party/ third party name/ collection"<br />For processing, see (0x4445000000000007)                                                                                                                                                                                        | 0-                  |
| `0x4445000000000022` | "obligation with signature requirement"<br />Obligations are to be equalized with pay items. If however, it is for technical reasons necessary to transfer obligations in the charge items block, then this code should be used for obligations with German law requirement. The gross amount due is recorded in the signature field, set zero, according to the German law.<br />For example, a receipt for a voucher issuance, for which the voucher is indicated as item in the charge items block and the corresponding cash amount is indicated in the pay items block.<br />An example for this would be a voucher intake via charge items block, or a payment of an outgoing invoice.                                                                                                                                                                                                 | 0-                  |
| `0x4445000000000023` | "obligation without signature requirement"<br />Obligations are to be equalized with pay items. If however, it is systematically necessary to transfer obligations in the charge items block, then this code should be used for obligations without German law requirement. The gross amount due is recorded in the signature field, set zero, according to the German law. For processing, also see (0x4445000000000007).                                                                      | 0-                  |

### Type of Payment: ftPayItemCase

This table expands on the values provided in table Table 13 on chapter x.y.z on page p with values applicable to the German market.

| **Value**            | **Description**                                                                                                                   | **Service-Version** |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------|---------------------|
| `0x4445000000000000` | "default value"<br />unknown payment type: automatic processing through the fiskaltrust.SecurityMechanisms settings is attempted. | 0-                  |
| `0x4445000000000000` | "unknown payment type for DE"<br />This is handled like a cash payment in national currency.                                      | 0-                  |
| `0x4445000000000001` | "cash payment in national currency"                                                                                               | 0-                  |
| `0x4445000000000002` | "cash payment in foreign currency"                                                                                                | 0-                  |
| `0x4445000000000003` | "crossed cheque"                                                                                                                  | 0-                  |
| `0x4445000000000004` | "debit card payment"                                                                                                              | 0-                  |
| `0x4445000000000005` | "credit card payment"                                                                                                             | 0-                  |
| `0x4445000000000006` | "voucher payment (coupon)"                                                                                                        | 0-                  |
| `0x4445000000000007` | "online payment"                                                                                                                  | 0-                  |
| `0x4445000000000008` | "customer card payment"                                                                                                           | 0-                  |
| `0x4445000000000009` | "other debit card"                                                                                                                | 0-                  |
| `0x444500000000000A` | "other credit card"                                                                                                               | 0-                  |
| `0x444500000000000B` | "account receivable"<br />delivery note/ settlement in foreign currency                                                           | 0-                  |
| `0x444500000000000C` | "SEPA transfer"                                                                                                                   | 0-                  |
| `0x444500000000000D` | "other transfer"                                                                                                                  | 0-                  |
| `0x444500000000000E` | "cash book expense"                                                                                                               | 0-                  |
| `0x444500000000000F` | "cash book contribution"                                                                                                          | 0-                  |
| `0x4445000000000010` | "levy"<br />DE: Anzahlung                                                                                                         | 0-                  |
| `0x4445000000000011` | "internal/ material consumption"                                                                                                  | 0-                  |
| `0x4445000000000012` | "change"<br />tip                                                                                                                 | 0-                  |

