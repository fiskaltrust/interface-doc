## Data Structures

This chapter expands on the descriptions of the country-specific Data Structures, covered in the Chapter ["Data Structures"](../../general/data-structures/data-structures.md) of the General Part, with information applicable to the German market.

### Receipt Request

#### Single fields

Fields from the receipt request that need special handling for the German market are listed below:

| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `cbTerminalID` | `string (50)` | Mandatory | The unique identification of the input station/cash register/terminal within a ftCashBoxID| 1.3 |
| `cbUser` | `string (50)` | Mandatory | Name (not ID) of the user who creates the receipt. | 1.3 |
| `cbReceiptReference` | `string (50)` | Mandatory if the request is part of a business action | Used to connect all requests referring to the same business action. | 1.3 |
| `cbPreviousReceiptReference` | `string (50)` | Optional | Points to `cbReceiptReference` of a previous request. Used to connect requests representing a business action. E.g. split, merge or reference a receipt to be voided. | 1.3 |

Examples of using `cbReceiptReference` and `cbPreviousReceiptReference` to connect requests representing a business action can be found [here](../examples/cbReference.md).

#### Customer data `cbCustomer`

If you need to provide customer data in your request, you can send it in via the field `cbCustomer` by filling it JSON format with following fields:

| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `CustomerName` | `string (50)`  | Optional | **Name of beneficiary customer.** <br />Send via `cbCustomer` in JSON format by adding the key value pair `CustomerName` e.g. `"cbCustomer":"{"CustomerName":"Erika Musterfrau",...}"` | 1.3 |
| `CustomerId` | `string (50)`  | Optional | **ID of the beneficiary customer.** <br />Send via `cbCustomer` in JSON format by adding the key value pair `CustomerId ` e.g. `"cbCustomer":"{"customerName":"Max Mustermann", "CustomerId":"PX9819822", ...}"` | 1.3 |
| `CustomerType` | `string (50)`  | Optional | **Type of the beneficiary customer** (e.g. employee). <br />Send via `cbCustomer` in JSON format by adding the key value pair `CustomerType` e.g. `"cbCustomer":"{..., "CustomerId":"PX9819822", "CustomerType":"Mitarbeiter", ...}"` | 1.3 |
| `CustomerStreet` | `string (60)`  | Optional | S**treet and house number of the beneficiary customer.** <br />Send via `cbCustomer` in JSON format by adding the key value pair `CustomerStreet` e.g. `"cbCustomer":"{..., "CustomerStreet":"Lindwurmstr. 98", ...}"` | 1.3 |
| `CustomerZip` | `string (10)`  | Optional | **Zip of the beneficiary customer.** <br />Send via `cbCustomer` in JSON format by adding the key value pair `CustomerZip` e.g. `"cbCustomer":"{..., "CustomerZip":"80337", ...}"` | 1.3 |
| `CustomerCity` | `string (62)`  | Optional | **City of the beneficiary customer**. <br />Send via `cbCustomer` in JSON format by adding the key value pair `CustomerCity` e.g. `"cbCustomer":"{..., "CustomerCity":"München", ...}"` | 1.3 |
| `CustomerCountry` | `ISO 3166 ALPHA-3 country code` | Optional | **Country of the beneficiary customer.** <br />Send via `cbCustomer` in JSON format by adding the key value pair `CustomerCountry` e.g. `"cbCustomer":"{..., "CustomerCountry":"DEU", ...}"` | 1.3 |
| `CustomerVATId` | `string(15)` | Optional | **VAT-ID of the beneficiary customer.**<br />Send via `cbCustomer` in JSON format by adding the key value pair `CustomerVATId` e.g. `"cbCustomer":"{..., "CustomerVATId":"DE123456789", ...}"` | 1.3 |


#### Receipt case data `ftReceiptCaseData`

In the general description, the field `ftReceiptCaseData` is described as optional. However, for the German market, the content of this field is not always optional.

For some cases, it is needed to transmit data within the field `ftReceiptCaseData`, that is required later for the DSFinV-K export. The following table describes when and how you have to fill them.


| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `UserId` | `string`      | optional | Send via `ftReceiptCaseData` in JSON format. To send, please add the key value pair `UserId` e.g. `"ftReceiptCaseData":"{ ..., "UserId": "U192", ... }"`. If not sent, the fiskaltrust.Middleware will automatically generate a User-ID (hash) deducted from `cbUser` | 1.3 |
| `ReceiptNote` | `string`      | optional                         | Additional information on the receipt header. Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `ReceiptNote` e.g. `"ftReceiptCaseData":"{ ..., "ReceiptNote":"123, ich bin dabei!", ... }"` | 1.3|
| `ReceiptName` | `string`      | Mandatory if your request mapps to the DSFinV-K BON_TYPE "AVSonstige" (see `ftReceiptCase`), otherwise optional | Can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `ReceiptName` e.g. `"ftReceiptCaseData":"{ ..., "ReceiptName":"Sonstige Sonderwurst", ... }"` | 1.3|

If you need to provide a **reference** to another system or another cashpoint, you can add it via the field `ftReceiptCaseData` by providing its data as shown below:

| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `RefType` | "ExterneRechnung" or "ExternerLieferschein" or "Transaktion" or "ExterneSonstige"      | mandatory | Send via `ftReceiptCaseData` in JSON format. Add the key value pair `RefType` e.g. `"ftReceiptCaseData":"{ ..., "RefType":"Transaktion", ... }"`. The value "Transaktion" maps to an internal reference of another cashpoint, all other values map to external references. | 1.3 |
| `RefName` | `string` | If the external reference you want to add is of type (RefType) "ExterneSonstige", you must provide data for the field `RefName`. |  Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefName` e.g. `"ftReceiptCaseData":"{ ..., "RefName":"Name der Referenz", ... }"`. | 1.3 |
| `RefMoment` | `string` | If the reference you want to add is of type (RefType) "Transaktion", you must provide data for the field `RefMoment`. |  Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefMoment` e.g. `"ftReceiptCaseData":"{ ..., "RefMoment":"2020-01-03T17:00:01", ... }"`. | 1.3 |
| `RefCashBoxIdentification` | `string` | If the reference you want to add is of type (RefType) "Transaktion", you must provide data for the field `RefCashBoxIdentification`. |  It should contain the value of ´ftCashBoxIdentification´ from the referenced cashpoint. Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefCashBoxIdentification` e.g. `"ftReceiptCaseData":"{ ..., "RefCashBoxIdentification":"AHHAH1919919", ... }"`. | 1.3 |
| `RefClosingNr` | `integer` | If the reference you want to add is of type (RefType) "Transaktion", you must provide data for the field `RefClosingNr`. |  It should provide the referenced cashpoint daily closing number of the referenced object. Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefClosingNr` e.g. `"ftReceiptCaseData":"{ ..., "RefClosingNr":1091029, ... }"`. Starting from version 1.3.6, the closing numbers to reference can be obtained from the `ftStateData` field of daily closing receipts' responses (via the `DailyClosingNumber` JSON element).  | 1.3 |
| `RefReceiptId` | `string` | If the reference you want to add is of type (RefType) "Transaktion", you must provide data for the field `RefReceiptId`. | It should contain the value of ´ftReceiptIdentification´ of the referenced object. Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefReceiptId` e.g. `"ftReceiptCaseData":"{ ..., "RefReceiptId":"UAUUA1112#20200211-112430", ... }"`. | 1.3 |

### Charge Items Entry

In the general description, the field `ftChargeItemCaseData` is described as optional. However, for the German market, the content of this field is not always optional.

For some cases, it is needed to transmit data within the field `ftChargeItemCaseData`, that is required later for the DSFinV-K export. The following table describes how and when these need to be filled.


| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `VoucherNr` | `string`      | mandatory if applicable | Send via `ftChargeItemCaseData` in JSON format if the ChargeItem represents the voucher. To send, please add the key value pair `VoucherNr` e.g. `"ftChargeItemCaseData":"{ ..., "VoucherNr":"UAUA91829182HH", ... }"`.  | 1.3 |
| `AgencyId` | `integer`      | mandatory if applicable | Mandatory if agency business (DE: Agenturgeschäft). Send via `ftChargeItemCaseData` (if a ChargeItem represents the voucher) or `ftPayItemCaseData` (if a PayItem represents the voucher). To send, use the key value pair `AgencyId` e.g. `"ftChargeItemCaseData":"{ ..., "AgencyId": "73c94a68-c329-4d82-a8e4-d48903791922", ... }"` (the ID can be taken from the Portal's _Agency management_ page).  | 1.3 |
| `ProductGroupId` | `string`      | optional | Send via `ftChargeItemCaseData` in JSON format. To send, please add the key value pair `ProductGroupId` e.g. `"ftChargeItemCaseData":"{ ..., "ProductGroupId":192, ... }"`. If not sent, the fiskaltrust.Middleware will automatically generate an ID (CRC32 hash) deducted from `ftChargeItem.ProductGroup` | 1.3 |


The following table highlights fields of the charge item that need special handling for the German market.

| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `ProductNumber` | `string (50)` | mandatory if available | Article number | 1.3 |
| `ProductBarcode` | `string (50)` | mandatory if applicable | Use to send the Global Trade Item Number (GTIN) if the charge item represents an article. | 1.3 |
| `ProductGroup` | `string (50)` | mandatory if available | Name of the product group. | 1.3 |
| `Quantity` | `decimal (3)` | mandatory if available | Quantity | 1.3 |
| `UnitQuantity` | `decimal (3)` | mandatory if available | Factor, e.g. container size | 1.3 |
| `Unit` | `string` | mandatory if available | Unit of measurement, e.g. kg, litres or pieces | 1.3 |
| `UnitPrice` | `decimal (5)` | mandatory if available | Price per unit incl. VAT | 1.3 |
| `VATAmount` | `decimal (5)` | mandatory for special cases | In some special cases of taxation (e.g. car spare part in the car repair shop), the VAT is not a percentage of the net-price (NETTO) or the gross-price. For these cases, the field  `VATAmount` is mandatory and a `ftChargeItemCase` that maps to DSFinV-K UST_SCHLUESSEL 7 should be used. The value of the field `VATRate` should be set to `0.0`. | 1.3 |


### Pay Items Entry

In the general description, the field `ftPayItemCaseData` is described as optional. However, for the German market, the content of this field is not always optional.

For some cases, it is needed to transmit data within the field `ftPayItemCaseData`, that is required later for  the DSFinV-K export. The following table describes how and when these need to be filled.


| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `CurrencyCode` | `string (3)` | mandatory if foreign currency used | Mandatory if a foreign currency was used for the payment. To send, add the key value pair `CurrencyCode` e.g. `"ftPayItemCaseData":"{ ..., "CurrencyCode":"USD", ... }"`. Only ISO 4217 currency codes are allowed.  | 1.3 |
| `ForeignCurrencyAmount` | `decimal (2)` | mandatory if foreign currency used  | Mandatory if a foreign currency was used for the payment. To send, add the key value pair `ForeignCurrencyAmount` e.g. `"ftPayItemCaseData":"{ ..., "ForeignCurrencyAmount":23.00, ... }"`.  | 1.3 |
| `BaseCurrencyAmount` | `decimal (2)` | mandatory if foreign currency used | Mandatory if a foreign currency was used for the payment. Represents the converted value of the payed foreign currency amount into the base currency (EUR). To send, add the key value pair `BaseCurrencyAmount` e.g. `"ftPayItemCaseData":"{ ..., "BaseCurrencyAmount":20.00, ... }"`.  | 1.3 |
| `VoucherNr` | `string`      | mandatory if applicable | Send via `ftPayItemCaseData` in JSON format if the pay item represents the voucher. To send, please add the key value pair `VoucherNr` e.g. `"ftPayItemCaseData":"{ ..., "VoucherNr":"UAUA91829182HH", ... }"`.  | 1.3 |
| `MoneyGroupId` | `string` | optional | Send via `ftPayItemCaseData` in JSON format. To send, please add the key value pair `MoneyGroupId` e.g. `"ftPayItemCaseData":"{ ..., "MoneyGroupId":192, ... }"`. If not sent, the fiskaltrust.Middleware will automatically generate an ID (CRC32 hash) deducted from `ftPayItem.MoneyGroup` | 1.3 |
| `AgencyId` | `integer`      | mandatory if applicable | Mandatory if agency business (DE: Agenturgeschäft). Send via `ftPayItemCaseData` in JSON format. To send, please add the key value pair `AgencyId` e.g. `"ftPayItemCaseData":"{ ..., "AgencyId": "73c94a68-c329-4d82-a8e4-d48903791922", ... }"` (the ID can be taken from the Portal's _Agency management_ page). Should only be used in cases where PayItems will be transformed to `GV_TYP`es during DSFinV-K generation - otherwise, please use `ftChargeItemCaseData`. | 1.3 |

