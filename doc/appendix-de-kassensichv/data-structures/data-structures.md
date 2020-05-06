## Data Structures

This chapter expands on the descriptions of the data structures covered in the Chapter ["Data Structures"](../../general/data-structures/data-structures.md) of the General Part, with country specific information applicable to the German market.

### Receipt Request

#### Single fields

Following chapter highlights fields from the receipt request that need a special handling for the german market.

| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `cbTerminalID` | `string (50)` | Mandatory | The unique identification of the input station/cash register/terminal within a ftCashBoxID| 1.3 |
| `cbUser` | `string (50)` | Mandatory | Name (not ID) of the user, who creates the receipt. | 1.3 |
| `cbReceiptReference` | `string (50)` | Mandatory if the request is part of a business action | Used to connect all requests reffering to the same business action. | 1.3 |
| `cbPreviousReceiptReference` | `string (50)` | Optional | Points to `cbReceiptReference` of a previous request. Used to connect requests repesenting a business action. E.g. split, merge or just reference a receipt to be voided. | 1.3 |

Examples of using `cbReceiptReference` and `cbPreviousReceiptReference` to connect requests representing a business action can be found [here](connect-examples.md).

#### Customer data `cbCustomer`

If you need to provide customer data in your request, you can send it in via the field `cbCustomer` by filling it JSON format with following fields:

| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `CustomerName` | `string (50)`  | Optional | Name of beneficiary customer. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerName` e.g. `"cbCustomer":"{"CustomerName":"Erika Musterfrau",...}"`| 1.3 |
| `CustomerId` | `string (50)`  | Optional | ID of the beneficiary customer. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerId ` e.g. `"cbCustomer":"{"customerName":"Max Mustermann", "CustomerId":"PX9819822", ...}"`| 1.3 |
| `CustomerType` | `string (50)`  | Optional | Type of the beneficiary customer (e.g. employee). Send via `cbCustomer` in JSON format by adding the key value pair `CustomerType` e.g. `"cbCustomer":"{..., "CustomerId":"PX9819822", "CustomerType":"Mitarbeiter", ...}"` | 1.3 |
| `CustomerStreet` | `string (60)`  | Optional | Street and house number of the beneficiary customer. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerStreet` e.g. `"cbCustomer":"{..., "CustomerStreet":"Lindwurmstr. 98", ...}"` | 1.3 |
| `CustomerZip` | `string (10)`  | Optional | Zip of the beneficiary customer. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerZip` e.g. `"cbCustomer":"{..., "CustomerZip":"80337", ...}"` | 1.3 |
| `CustomerCity` | `string (62)`  | Optional | City of the beneficiary customer. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerCity` e.g. `"cbCustomer":"{..., "CustomerCity":"München", ...}"` | 1.3 |
| `CustomerCountry` | `ISO 3166 ALPHA-3 country code` | Optional | Country of the beneficiary customer. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerCountry` e.g. `"cbCustomer":"{..., "CustomerCountry":"DEU", ...}"` | 1.3 |
| `CustomerVATId` | `string(15)` | Optional | VAT-ID of the beneficiary customer.Send via `cbCustomer` in JSON format by adding the key value pair `CustomerVATId` e.g. `"cbCustomer":"{..., "CustomerVATId":"DE123456789", ...}"` | 1.3 |


#### Receipt case data `ftReceiptCaseData`

In the general description the field `ftReceiptCaseData` is described as optional. However for the German market the content of this field is not always optional.

For some special cases we need you to transmit data within the field `ftReceiptCaseData` that is later needed for the DSFinV-K export. The following table describes when and how you have to fill them.


| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `ProductGroupId` | `string`      | optional | Send via `ftReceiptCaseData` in JSON format. To send, pls. add the key value pair `ProductGroupId` e.g. `"ftChargeItemCaseData":"{ ..., "ProductGroupId":192, ... }"`. If not sent, the ft will automatically generate a product number (hash) deducted from `ftChargeItem.ProductGroup` | 1.3 |
| `UserId` | `string`      | optional | Send via `ftReceiptCaseData` in JSON format. To send, pls. add the key value pair `UserId` e.g. `"ftReceiptCaseData":"{ ..., "UserId":192, ... }"`. If not sent, the ft will automatically generate a User-ID (hash) deducted from `cbUser` | 1.3 |
| `ReceiptNote` | `string`      | optional                         | Additional information on the receipt header. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `ReceiptNote` e.g. `"ftReceiptCaseData":"{ ..., "ReceiptNote":"123, ich bin dabei!", ... }"` | 1.3|
| `ReceiptName` | `string`      | Mandatory if your request mapps to the DSFinV-K BON_TYPE "AVSonstige" (see `ftReceiptCase`), otherwise optional | Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `ReceiptName` e.g. `"ftReceiptCaseData":"{ ..., "ReceiptName":"Sonstige Sonderwurst", ... }"` | 1.3|
| `ActionStartMoment` | ISO 8601 and RFC3339 date     | Mandatory if the action (DE: Vorgang) starts within another system. Otherwise the receipt request of an action must be connected in a way that ft can find the start of the action. | The action start can be within this cashpoint or outside of this cashpoint. If outside (e.g. by another system or another cashpoint) than it has to be provided via `ftReceiptCaseData` in JSON format by adding the key value pair `ActionStartMoment`. E.g. `"ftReceiptCaseData":"{ ..., "ActionStartMoment":"2020-09-27T17:00:01", ... }"`. If not provided, ft tries to find the action start by following the `cbPreviousReceiptReference` path into the past until no more previous receipt references exist. ft will than fill this field with the value from `ftReceiptMoment` of the oldest receipt found in that chain. You can find examples for connecting the requests [here](connect-examples.md). | 1.3 |
| `VoidingReceipt` | `0 or 1`      | Mandatory if your receipt is a reverse receipt that voids another, previous receipt (DE: Nachträgliche Vorgangs-Stornierungen). | The signs for the charge items and pay items must be reversed comparing to the receipt to be voided. Please reference the receipt to be voided via `cbPreviousReceiptReference` and set the field `VoidingReceipt` to the value ´1´ within `ftReceiptCaseData`. E.g. `"ftReceiptCaseData":"{ ..., "VoidingReceipt":1, ... }"`. | 1.3 |

If you need to provide a **reference** to another systems or another cashpoints, you can add it via the field `ftReceiptCaseData` by providing it's data as shown below:

| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `RefType` | "ExterneRechnung" or "ExternerLieferschein" or "Transaktion" or "ExterneSonstige"      | mandatory | Send via `ftReceiptCaseData` in JSON format. Add the key value pair `RefType` e.g. `"ftReceiptCaseData":"{ ..., "RefType":"Transaktion", ... }"`. The value "Transaktion" mapps to an internal reference of another cashpoint, all other values map to external references. | 1.3 |
| `RefName` | `string` | If the external reference you want to add is of type (RefType) "ExterneSonstige", you must provide data for the field `RefName`. |  Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefName` e.g. `"ftReceiptCaseData":"{ ..., "RefName":"Name der Referenz", ... }"`. | 1.3 |
| `RefMoment` | `string` | If the reference you want to add is of type (RefType) "Transaktion", you must provide data for the field `RefMoment`. |  Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefMoment` e.g. `"ftReceiptCaseData":"{ ..., "RefMoment":"2020-01-03T17:00:01", ... }"`. | 1.3 |
| `RefCashBoxIdentification` | `string` | If the reference you want to add is of type (RefType) "Transaktion", you must provide data for the field `RefCashBoxIdentification`. |  It should contain the value of ´ftCashBoxIdentification´ from the referenced cashpoint. Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefCashBoxIdentification` e.g. `"ftReceiptCaseData":"{ ..., "RefCashBoxIdentification":"AHHAH1919919", ... }"`. | 1.3 |
| `RefClosingNr` | `integer` | If the reference you want to add is of type (RefType) "Transaktion", you must provide data for the field `RefClosingNr`. |  It should provide the the referenced cashpoint daily closing number of the referenced object. Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefClosingNr` e.g. `"ftReceiptCaseData":"{ ..., "RefClosingNr":1091029, ... }"`. | 1.3 |
| `RefReceiptId` | `string` | If the reference you want to add is of type (RefType) "Transaktion", you must provide data for the field `RefReceiptId`. |  It should contain the value of ´ftReceiptIdentification´ of the referenced object. Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefReceiptId` e.g. `"ftReceiptCaseData":"{ ..., "RefReceiptId":"UAUUA1112#20200211-112430", ... }"`. | 1.3 |


### Receipt Response


### Charge Items Entry


### Pay Items Entry


### Signature Entry
