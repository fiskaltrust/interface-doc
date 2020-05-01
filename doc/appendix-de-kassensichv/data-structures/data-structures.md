## Data Structures

This chapter expands on the descriptions of the data structures covered in the Chapter ["Data Structures"](../../general/data-structures/data-structures.md) of the General Part, with country specific information applicable to the German market.

### Receipt Request

In the general description the field `ftReceiptCaseData` is described as optional. However for the German market the content of this field is not always optional.

For some special cases we need you to transmit data within the field `ftReceiptCaseData` that is later needed for the DSFinV-K export. The following table describes when and how you have to fill them.


| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `AgencyId` | `string`      | Mandatory if agency business (DE: Agenturgeschäft) | Send via `ftReceiptCaseData` in JSON format. To send, add the key value pair `AgencyId` e.g. `"ftChargeItemCaseData":"{ ..., "AgencyId":192, ... }"` | 1.3 |
| `ProductGroupId` | `string`      | optional | Send via `ftReceiptCaseData` in JSON format. To send, pls. add the key value pair `ProductGroupId` e.g. `"ftChargeItemCaseData":"{ ..., "ProductGroupId":192, ... }"`. If not sent, the ft will automatically generate a product number (hash) deducted from `ftChargeItem.ProductGroup` | 1.3 |
| `UserId` | `string`      | optional | Send via `ftReceiptCaseData` in JSON format. To send, pls. add the key value pair `UserId` e.g. `"ftReceiptCaseData":"{ ..., "UserId":192, ... }"`. If not sent, the ft will automatically generate a User-ID (hash) deducted from `cbUser` | 1.3 |
| `ReceiptNote` | `string`      | optional                         | Additional information on the receipt header. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `ReceiptNote` e.g. `"ftReceiptCaseData":"{ ..., "ReceiptNote":"123, ich bin dabei!", ... }"` | 1.3|
| `ReceiptName` | `string`      | Mandatory if your request mapps to the DSFinV-K BON_TYPE "AVSonstige" (see `ftReceiptCase`), otherwise optional | Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `ReceiptName` e.g. `"ftReceiptCaseData":"{ ..., "ReceiptName":"Sonstige Sonderwurst", ... }"` | 1.3|
| `ActionStartMoment` | ISO 8601 and RFC3339 date     | Mandatory if the action (DE: Vorgang) starts within another system. Otherwise the receipt request of an action must be connected in a way that ft can find the start of the action. | The action start can be within this cashpoint or outside of this cashpoint. If outside (e.g. by another system or another cashpoint) than it has to be provided via `ftReceiptCaseData` in JSON format by adding the key value pair `ActionStartMoment`. E.g. `"ftReceiptCaseData":"{ ..., "ActionStartMoment":"2020-09-27T17:00:01", ... }"`. If not provided, ft tries to find the action start by following the `cbPreviousReceiptReference` path into the past until no more previous receipt references exist. ft will than fill this field with the value from `ftReceiptMoment` of the oldest receipt found in that chain. | 1.3 |

If you want (optional) to provide a reference from another systems or another cashpoints, you can add it via the field `ftReceiptCaseData` by providing it's data as shown below:

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
