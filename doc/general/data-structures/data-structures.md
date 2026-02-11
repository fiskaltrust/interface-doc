---
slug: /poscreators/middleware-doc/general/data-structures
title: Data structures
---

## Data structures

This chapter outlines several data structures, which are used in the communication with the fiskaltrust.Middleware.

### Receipt Request

The cash register transfers the data of an entire receipt request to the fiskaltrust.Middleware using the ReceiptRequest data structure.

The details of fields supported by this data structure are outlined in the table below. The field fiskaltrust receipt case (ftReceiptCase) is of the highest importance for the correct processing of the receipt. This field defines the receipt type, determines if the receipt has to be secured accordingly to the national law, and establishes the way to calculate the correct values for each national counter.

The information necessary for processing of a receipt is provided through the configuration of fiskaltrust.SecurityMechanism.

| **Field name**               | **Data type**         | **Default Value**<br />**Mandatory Field** | **Description**                                                                                                                                                                                                                                                                                                                                    | **IF-Version** |
|------------------------------|-----------------------|--------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|
| `ftCashBoxID`                | `guid/string`         | empty-string<br />mandatory                | This ID is assigned through the creation of the CashBox and is a part of the authentication of the cash register.                                                                                                                                                                                                                                  | 0-             |
| `ftQueueID`                  | `guid/string`         | null<br />optional                         | The QueueID is required only when a load balancer is used. The value of the ftQueueID allows the load balancer to find the correct route to the corresponding Queue.                                                                                                                                                                               | 0-             |
| `ftPosSystemId`              | `guid/string`         | null<br />mandatory                        | This field identifies and documents the type and software version of the requesting POS system. It is used for audits and as a basis for commission calculation. The POS system is created in fiskaltrust.Portal, its ID must be implemented by PosCreator as a constant value.                                                                    | 0-             |
| `cbTerminalID`               | `String`<br />Max 1k  | empty-string<br />mandatory                | The unique identification of the input station/ cash register within a ftCashBoxID.                                                                                                                                                                                                                                                                | 0-             |
| `cbReceiptReference`         | `String`<br />Max 1k  | empty-string<br />mandatory                | Reference number send by the cash register. Ideally, this value would be a unique receipt number for the cash register, to allow saving of the return value to the cash register data set.                                                                                                                                                         | 0-             |
| `cbReceiptMoment`            | `DateTime`            | null<br />mandatory                        | The time of receipt creation. Must be provided in UTC, e.g. `2020-06-29T17:45:40.505Z`.                                                                                                                                                                                                                                                            | 0-             |
| `cbChargeItems`              | `ChargeItem[]`        | null<br />mandatory                        | List of services or items sold.                                                                                                                                                                                                                                                                                                                    | 0-             |
| `cbPayItems`                 | `PayItem[]`           | null<br />mandatory                        | List of payment received.                                                                                                                                                                                                                                                                                                                          | 0-             |
| `ftReceiptCase`              | `Int64`               | 0<br />mandatory                           | Type of business transaction according to the [reference table](../reference-tables/reference-tables.md#service-status-ftstate) in the appendix. It is used to choose the right processing logic.                                                                                                                                             | 0-             |
| `ftReceiptCaseData`          | `String`<br />Max 64k | empty-string<br />optional                 | Additional data for the business transaction, currently accepted only in JSON format. Although all string values are supported, we suggest using data structures serialized into JSON format.                                                                                                                                                      | 0-             |
| `cbReceiptAmount`            | `Decimal`?            | null<br />optional                         | Total receipt amount incl. taxes (gross receipt amount). If it is not provided, it can be calculated with the sum of the amounts of the cbChargeItems. It can be useful and important for systems working with net amounts, as it helps to apply different methods of calculation and rounding.                                                    | 0-             |
| `cbUser`                     | `String`<br />Max 1k  | empty-string<br />optional                 | Identification of the user, who creates the receipt. Although all string values are supported, we suggest using data structures serialized into JSON format.                                                                                                                                                                                       | 0-             |
| `cbArea`                     | `String`<br />Max 1k  | empty-string<br />optional                 | Identification of the section/field, in which the receipt is created. Although all string values are supported, we suggest using data structures serialized into JSON format.<br /><span class="underline">Examples:<br /></span>Table number of a gastronomic business; a department of a commercial establishment; the vehicle of a taxi company | 0-             |
| `cbCustomer`                 | `String`<br />Max 1k  | empty-string<br />optional                 | Identification of the client, for whom the receipt is created. Although all string values are supported, we suggest using data structures serialized into JSON format.<br /><span class="underline">Example:<br /></span>Email address                                                                                                             | 0-             |
| `cbSettlement`               | `String`<br />Max 1k  | empty-string<br />optional                 | Settlement identification where this receipt will be added.                                                                                                                                                                                                                                                                                        | 0-             |
| `cbPreviousReceiptReference` | `String`<br />Max 1k  | null<br />optional                         | cbReceiptReference of the previous receipt. Used to connect multiple requests for a single Business Case.                                                                                                                                                                                                                                          | 0-             |
<!-- PVO: "Decimal?" is this a mistake? -->

<span id="_Ref527915361" class="anchor"></span>*Table 3. Receipt Request*

**C# class ReceiptRequest:**
```cs
namespace fiskaltrust.ifPOS.v0
{
  public class ReceiptRequest
  {
    public string ftCashBoxID { get; set; }
    public string ftQueueID { get; set; }
    public string ftPosSystemId { get; set; }
    public string cbTerminalID { get; set; }
    public string cbReceiptReference { get; set; }
    public DateTime cbReceiptMoment { get; set; }
    public ChargeItem[] cbChargeItems { get; set; }
    public PayItem[] cbPayItems { get; set; }
    public long ftReceiptCase { get; set; }
    public string ftReceiptCaseData { get; set; }
    public decimal? cbReceiptAmount { get; set; }
    public string cbUser { get; set; }
    public string cbArea { get; set; }
    public string cbCustomer { get; set; }
    public string cbSettlement { get; set; }
    public string cbPreviousReceiptReference { get; set; }
  }
}
```

<span id="_Toc527986825" class="anchor"></span>*Code 1. Definition of class ReceiptRequest*

### Receipt response

The fiskaltrust.Middleware sends back the processed data to the cash register through the receipt response.

The data included in the request, such as header, service, pay items, and footer, will not be sent back. The returned data is added to the receipt as supplement to the data of the receipt request.


| **Field name**            | **Data type**     | **Default Value Mandatory Field** | **Description**                                                                                                                                                                                                          | **Version** |
|---------------------------|-------------------|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| `ftCashBoxID`             | `guid/string`     | mandatory                         | Allocated from request to response.                                                                                                                                                                                      | 0-          |
| `ftQueueID`               | `guid/string`     | mandatory                         | QueueId used for processing.                                                                                                                                                                                             | 0-          |
| `ftQueueItemID`           | `guid/string`     | mandatory                         | QueueItemId used for processing.                                                                                                                                                                                         | 0-          |
| `ftQueueRow`              | `long`            | mandatory                         | QueueRow used for processing.                                                                                                                                                                                            | 0-          |
| `cbTerminalID`            | `string`          | mandatory                         | Allocated from request to response.                                                                                                                                                                                      | 0-          |
| `cbReceiptReference`      | `string`          | mandatory                         | Allocated from request to response.                                                                                                                                                                                      | 0-          |
| `ftCashBoxIdentification` | `string`          | mandatory                         | Cash register identification number.                                                                                                                                                                                     | 0-          |
| `ftReceiptIdentification` | `string`          | mandatory                         | Upcounting receipt number allocated through fiskaltrust.SecurityMechanisms.                                                                                                                                              | 0-          |
| `ftReceiptMoment`         | `DateTime`        | mandatory                         | Time of receipt processing through fiskaltrust.Middleware, provided in UTC.                                                                                                                                              | 0-          |
| `ftReceiptHeader`         | `string[]`        | null<br />optional                | Additional header for the receipt. Each row can contain up to 4096 characters. Line breaks should be inserted by the cash register independently.                                                                        | 0-          |
| `ftChargeItems`           | `ChargeItem[]`    | null<br />optional                | Additional data sets in the charge items block which the cash register has to print onto the receipt. By default no additional data is provided. If additional data is provided, these data sets state an amount of "0". | 0-          |
| `ftChargeLines`           | `string[]`        | null<br />optional                | Additional text line for the charge items block which the cash register has to print onto the receipt. Each row can contain up to 4096 characters, line breaks should be inserted by the cash register independently.    | 0-          |
| `ftPayItems`              | `PayItem[]`       | null<br />optional                | Additional data set in the pay items block which the cash register has to print onto the receipt. By default no additional data is provided. If additional data is provided, these data sets state an amount of "0".     | 0-          |
| `ftPayLines`              | `string[]`        | null<br />optional                | Additional text line for the pay items block which the cash register has to print onto the receipt. Each row can contain up to 4096 characters, line breaks should be inserted by the cash register independently.       | 0-          |
| `ftSignatures`            | `SignatureItem[]` | empty-array<br />mandatory        | Signature block, which the cash register has to print onto the receipt.                                                                                                                                                  | 0-          |
| `ftReceiptFooter`         | `string[]`        | null<br />optional                | Additional footer for the receipt. Each row can contain up to 4096 characters, line breaks should be inserted by the cash register independently.                                                                        | 0-          |
| `ftState`                 | `Int64`           | 0<br />mandatory                  | Flag indicating the status of the fiskaltrust.Middleware; set accordingly to the reference table in the appendix.                                                                                                        | 0-          |
| `ftStateData`             | `string`          | empty-string<br />optional        | Additional information regarding the status of the fiskaltrust.Middleware, currently accepted only in JSON format.                                                                                                       | 0-          |

<span id="_Toc510009092" class="anchor"></span>*Table 4. Receipt Response*

**C\# class ReceiptResponse:**
```cs
namespace fiskaltrust.ifPOS.v0
{
  public partial class ReceiptResponse
  {
    public string ftCashBoxID { get; set; }
    public string ftQueueID { get; set; }
    public string ftQueueItemID { get; set; }
    public long ftQueueRow { get; set; }
    public string cbTerminalID { get; set; }
    public string cbReceiptReference { get; set; }
    public string ftCashBoxIdentification { get; set; }
    public string ftReceiptIdentification { get; set; }
    public DateTime ftReceiptMoment { get; set; }
    public string[] ftReceiptHeader { get; set; }
    public ChargeItem[] ftChargeItems { get; set; }
    public string[] ftChargeLines { get; set; }
    public PayItem[] ftPayItems { get; set; }
    public string[] ftPayLines { get; set; }
    public SignaturItem[] ftSignatures { get; set; }
    public string[] ftReceiptFooter { get; set; }
    public long ftState { get; set; }
    public string ftStateData { get; set; }
  }
}
```

<span id="_Toc527986826" class="anchor"></span>*Code 2. Definition of class ReceiptResponse*

### Charge Items Entry

Charge items entries are used for receipt requests as well as for receipt responses.

In every request using the ftReceiptCase 0x????000000000001, the sum of the filed `amount` of all `ftChargeItems` and the sum of the field `amount` of all `ftPayItems`should be equal. If that is not the case a warning will be returned except for very specific cases.

The details of fields supported by this data structure are outlined in the table below. The ftChargeItemCase field is particularly important for the correct processing of the receipt. A reference table for the supported values can be found in the appendix.

| **Field Name**         | **Data Type**         | **Default Value **<br />**Mandatory Field** | **Description**                                                                                                                                                                      | **Version** |
|------------------------|-----------------------|---------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| `Position`             | `long`                | 0<br />optional                             | Line number or position number on the Receipt. Used to preserve the order of lines on the receipt.                                                                                   | 0-          |
| `Quantity`             | `Decimal`             | 1.0<br />mandatory                          | Amount or volume (number) of service(s) or items of the entry.                                                                                                                       | 0-          |
| `Description`          | `String`<br />Max 1k  | empty-string<br />mandatory                 | Name, description of customary indication, or type of the service or item.                                                                                                           | 0-          |
| `Amount`               | `Decimal`             | 0.0<br />mandatory                          | Gross total price of service(s). The gross individual price, net total price, and net individual price, have to be calculated using the amount and either VAT rate or VAT amount.    | 0-          |
| `VATRate`              | `Decimal`             | 0.0<br />mandatory                          | VAT rate as percentage.                                                                                                                                                              | 0-          |
| `ftChargeItemCase`     | `Int64`               | 0<br />mandatory                            | Type of service or item according to the refer-ence table in the appendix. It is used in order to determine the processing logic for the corresponding business transaction.         | 0-          |
| `ftChargeItemCaseData` | `String`<br />Max 64k | empty-string<br />optional                  | Additional data about the service, currently accepted only in JSON format.                                                                                                           | 0-          |
| `VATAmount`            | `Decimal`?            | 0.0<br />optional                           | If the VAT amount is indicated, it can be used to calculate the net amount in order to avoid rounding errors which are especially likely to appear in row-based net price additions. | 0-          |
| `AccountNumber`        | `String`<br />Max 1k  | empty-string<br />optional                  | Account number for transfer into bookkeeping.                                                                                                                                        | 0-          |
| `CostCenter`           | `String`<br />Max 1k  | empty-string<br />optional                  | Indicator for transfer into cost accounting (type, center, and payer).                                                                                                               | 0-          |
| `ProductGroup`         | `String`<br />Max 1k  | empty-string<br />optional                  | This value allows the customer the logical grouping of products.                                                                                                                     | 0-          |
| `ProductNumber`        | `String`<br />Max 1k  | empty-string<br />optional                  | Value used to identify the product.                                                                                                                                                  | 0-          |
| `ProductBarcode`       | `String`<br />Max 1k  | empty-string<br />optional                  | Product’s barcode.                                                                                                                                                                   | 0-          |
| `Unit`                 | `String`<br />Max 1k  | empty-string<br />optional                  | Unit of measurement.                                                                                                                                                                 | 0-          |
| `UnitQuantity`         | `Decimal`?            | null<br />optional                          | Quantity of the service(s) of receipt entry, displayed in indicated units.                                                                                                           | 0-          |
| `UnitPrice`            | `Decimal`?            | null<br />optional                          | Gross price per indicated unit.                                                                                                                                                      | 0-          |
| `Moment`               | `DateTime`            | null<br />optional                          | Time of service (year, month, day, hour, minute, second).  Must be provided in UTC, e.g. `2020-06-29T17:45:40.505Z`.                                                                 | 0-          |

<span id="_Ref527915365" class="anchor"></span>*Table 5. Charge Items Entry (ftChargeItems)*

**C# class ChargeItem:**
```cs
namespace fiskaltrust.ifPOS.v0
{
  public class ChargeItem
  {
    public long Position { get; set; }
    public decimal Quantity { get; set; }
    public string Description { get; set; }
    public decimal Amount { get; set; }
    public decimal VATRate { get; set; }
    public long ftChargeItemCase { get; set; }
    public string ftChargeItemCaseData { get; set; }
    public decimal? VATAmount { get; set; }
    public string AccountNumber { get; set; }
    public string CostCenter { get; set; }
    public string ProductGroup { get; set; }
    public string ProductNumber { get; set; }
    public string ProductBarcode { get; set; }
    public string Unit { get; set; }
    public decimal? UnitQuantity { get; set; }
    public decimal? UnitPrice { get; set; }
    public DateTime? Moment { get; set; }
  }
}
```

<span id="_Toc527986827" class="anchor"></span>*Code 3. Definition of class ChargeItem*

### Pay Items Entry

Payment entries are used for receipt requests as well as for receipt responses.

In every request using the ftReceiptCase 0x????000000000001, the sum of the field `amount` of all `ftPayItems` and the sum of the field `amount` of all `ftChargeItems`should be equal. If that is not the case a warning will be returned except for very specific cases.

The ftPayItemCase field is particularly important for the correct processing of the receipt. This field can help to decide if the receipt has to be signed and the sum counter adjusted. A reference table for the supported values can be found in the appendix.

| Field Name          | Data Type             | Default Value<br />Mandatory Field | Description                                                                                                                                               | Version |
|---------------------|-----------------------|------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|---------|
| `Position`          | `long`                | 0<br />optional                    | Line number or position number on the receipt. Used to preserve the order of lines on the receipt.                                                        | 0-      |
| `Quantity`          | `Decimal`             | 1.0<br />mandatory                 | Number of payments. This value will be set to 1 in most of the cases. It can be greater than 1 e.g. when paying with multiple vouchers of the same value. | 0-      |
| `Description`       | `String`<br />Max 1k  | empty-string<br />mandatory        | Name or description of payment                                                                                                                            | 0-      |
| `Amount`            | `Decimal`             | 0.0<br />mandatory                 | Total amount of payment                                                                                                                                   | 0-      |
| `ftPayItemCase`     | `Int64`               | 0<br />mandatory                   | Type of payment according to the reference table in the appendix. It is used in order to determine the processing logic.                                  | 0-      |
| `ftPayItemCaseData` | `String`<br />Max 64k | empty-string<br />optional         | Additional data about the payment, currently accepted only in JSON format.                                                                                | 0-      |
| `AccountNumber`     | `String`<br />Max 1k  | empty-string<br />optional         | Account number for transfer into bookkeeping                                                                                                              | 0-      |
| `CostCenter`        | `String`<br />Max 1k  | empty-string<br />optional         | Indicator for transfer into cost accounting (type, center and payer)                                                                                      | 0-      |
| `MoneyGroup`        | `String`<br />Max 1k  | empty-string<br />optional         | This value allows the logical grouping of payment types.                                                                                                  | 0-      |
| `MoneyNumber`       | `String`<br />Max 1k  | empty-string<br />optional         | This value identifies the payment type.                                                                                                                   | 0-      |
| `Moment`            | `DateTime`?           | now<br />optional                  | Time of payment. Must be provided in UTC, e.g. `2020-06-29T17:45:40.505Z`.                                                                                | 0-      |

<span id="_Toc510009094" class="anchor"></span>*Table 6. Pay Items Entry*

**C# class PayItem:**
```cs
namespace fiskaltrust.ifPOS.v0
{
  public class PayItem
  {
    public long Position { get; set; }
    public decimal Quantity { get; set; }
    public string Description { get; set; }
    public decimal Amount { get; set; }
    public long ftPayItemCase { get; set; }
    public string ftPayItemCaseData { get; set; }
    public string AccountNumber { get; set; }
    public string CostCenter { get; set; }
    public string MoneyGroup { get; set; }
    public string MoneyNumber { get; set; }
    public DateTime? Moment { get; set; }
  }
}
```

<span id="_Toc527986828" class="anchor"></span>*Code 4. Definition of class PayItem*

### <span id="c-signature-entry-224">Signature Entry</span>

The signature entry is only used for the receipt response.

The signature of the receipt must comply with the national law. The signature data returned in the response should be visualized on the receipt in the correct format, which is further described in the appendix section of this document. The signature entries can also be used to visualize hints and messages related to the fiskaltrust.SecurityMechanism.

A reference text regarding the operating state of the fiskaltrust.SecurityMechanism can be sent back depending on the operating mode. This is in particular the case for receipts with special functions.

| Field Name          | Data Type             | Default Value<br />Mandatory Field | Description                                                                                                            | Version |
|---------------------|-----------------------|------------------------------------|------------------------------------------------------------------------------------------------------------------------|---------|
| `ftSignatureFormat` | `Int64`               | 0<br />mandatory                   | Format for displaying signature data according to the reference table in the appendix.                                 | 0-      |
| `ftSignatureType`   | `Int64`               | 0<br />mandatory                   | Type of signature according to the reference table in the appendix, e.g.: signature indicating a failure notification. | 0-      |
| `Caption`           | `String`<br />Max 1k  | empty-string<br />optional         | Heading, which has to be displayed as text above the signature data.                                                   | 0-      |
| `Data`              | `String`<br />Max 64k | empty-string<br />mandatory        | Signature content which has to be displayed in the specified format.                                                   |         |

<span id="_Toc510009095" class="anchor"></span>*Table 7. Signature Entry*

**C# class SignatureItem:**
```cs
namespace fiskaltrust.ifPOS.v0
{
  public class SignaturItem
  {
    public long ftSignatureFormat { get; set; }
    public long ftSignatureType { get; set; }
    public string Caption { get; set; }
    public string Data { get; set; }
  }
}
```

<span id="_Toc527986829" class="anchor"></span>*Code 5. Definition of class SignatureItem*
