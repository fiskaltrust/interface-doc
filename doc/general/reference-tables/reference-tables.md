---
slug: /poscreators/middleware-doc/general/reference-tables
title: Reference tables
---

## Reference tables

### Service Status: ftState

The ftState is returned with every receipt response. Through this status, fiskaltrust.Middleware can signal its operability or request processing logic.

The value `0xXXXX000000000000` indicates that the fiskaltrust.Middleware is available without reporting problems or notifications - it’s a kind of a "ready" state. The XXXX contains the country specific code for which the service has been configured. The country specific code, is made of the country’s code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex.

The table below describes supported statuses for the ftState field. Those codes can be combined by using the logic operator `OR`<span id="t-service-status-ftstate-22">.</span>

| **Value**            | **Description**                                                                                     | **Middleware Version** |
|----------------------|-----------------------------------------------------------------------------------------------------|------------------------|
| `0xXXXX000000000001` | "out of service"<br />The security mechanism has not yet been activated or was already deactivated. | 1.0                    |
| `0xXXXX000000000002` | Reserved                                                                                            |                        |
| `0xXXXX000000000004` | Reserved                                                                                            |                        |
| `0xXXXX000000000008` | Late Signing Mode<br />End of Fail Receipt required                                                 | 1.0                    |
| `0xXXXX000000000010` | Reserved                                                                                            |                        |
| `0xXXXX000000000020` | Reserved                                                                                            |                        |
| `0xXXXX000000000040` | Message Pending<br />Use Zero-Receipt to show Message on Receipt                                    | 1.0                    |
| `0xXXXX000000000080` | Reserved                                                                                            |                        |

Example of reading ftState parameter

The following example shows how to extract the value of a flag into the ftState property.

```cs
if ((ReceiptResponse.ftState & 0x0000000000000001) != 0)
{
  //your code in case of out of service condition
}

if ((ReceiptResponse.ftState & 0x0000000000000008) != 0)
{
  //your code in case of Late Signing condition
}

if ((ReceiptResponse.ftState & 0x0000000000000040) != 0)
{
  //your code in case of Message Pending condition
}
```

### Type of Receipt: ftReceiptCase

The ftReceiptCase indicates the receipt type and defines how it should be processed by the fiskaltrust.SecurityMechanism. The data type is `Int64` and contains the country specific code, which is a value following the ISO-3166-1-ALPHA-2 standard converted from ASCII into hex and used as byte 8 and 7. For definitions regarding national laws, please refer to the appropriate appendix<span id="t-type-of-receipt-ftreceiptcase-49">.</span>

| **Value**            | **Description**                                                                                                                                      | **Middleware Version** |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------|
| `0x0000000000000000` | "default value"<br />Unknown type of receipt.<br />Automatic processing through the localization setting of the fiskaltrust.Middleware is attempted. | 1.1                    |

#### ftReceiptCaseFlag

Business transactions can result in combinations of receipt types, which would be indicated using codes in bytes 6, 5, 4 and 3. These codes can be combined using the logic operator `OR`<span id="t-type-of-receipt-ftreceiptcaseflag-64">.</span>

| **Value**            | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | **Middleware Version** |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------|
| `0x0000000000010000` | "failed receipt"<br />Receipt was created and handed out in a moment when the communication between the fiskaltrust.Middleware and the cash register terminal was not possible.<br />The transferred receipt contains data, which has been created during an outage of the fiskaltrust.Middleware. The original receipts are available in handwritten or digital format and are to be transferred. The first ReceiptRequest including this flag sets the fiskaltrust.Middleware in a "late signing mode". In order to leave this mode, an "end of failure" Receipt Request has to be made by the cash register terminal using a Zero Receipt. This can be necessary e.g. after a power or server outage.<br />["Zero Receipt"](../cash-register-integration/cash-register-integration-regular-workflow.md#c-zero-receipt-60) section. | 1.0                    |
| `0x0000000000020000` | "training receipt"<br />Used to separate the normal usage of the cash register system from the training mode. This flag can be added to each Receipt Request when training/testing is performed. This receipt will not produce any tax relevant changes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | 1.0                    |
| `0x0000000000040000` | "reverse receipt" or "voided receipt"<br />Used to separate regular receipts from the receipts which were voided by setting the negative values for **either** Amount **or** Quantity (not both) in Chargeitems and Payitems of the receipt. The cbPreviousReceiptReference should be set to the ReceiptReference of the Receipt which should be voided.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | 1.0                    |
| `0x0000000000080000` | "handwritten receipt "<br />The transferred receipt contains data which has been collected in a handwritten receipt. There is no requirement for a precise time annotation on a handwritten receipt; we recommend using 12:00 for this purpose.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | 1.0                    |
| `0x0000800000000000` | "receipt request".<br />Used to retrieve an already processed receipt from the fiskaltrust.Middleware using the cbReceiptReference field. The cbTerminalID can also be included in this request. Chargeitems and payitems have to be exactly the same as in the requested receipt. If a matching receipt is found, its content will be returned. If nothing is found a null value is returned. This can be nescessary if a communication problem occurs while fiskaltrust.Middleware processes a request.                                                                                                                                                                                                                                                                                                            | 1.1                    |
|                      | To prevent a duplication of requested receipt, the cash register terminal can place an additional parameter inside the queue to influence the behavior of this "receipt request" when no receipt is found.<br />Parameter name: "receiptrequestmode"<br />Parameter values:<br />0 (default) … null is returned<br />1 … request is handled in the same way as new request. If processing is successful, the created ReceiptResponse is returned.                                                                                                                                                                                                                                                                                                                                                                    | 1.2                    |

These flags are based on national laws and regulations, for further information please refer to the appropriate country specific appendix.

### Type of Service: ftChargeItemCase

The ftChargeItemCase defines the type of service or item in the charge item block and thus how the fiskaltrust.SecurityMechanism processes the individual receipts with regards to receipt generation. The data type is `Int64` and contains a country specific code which is a value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex and used as byte 8 and 7.

For definitions regarding national laws, please refer to the appropriate country specific appendix<span id="t-type-of-service-ftchargeitemcase">.</span>

| **Value**            | **Description**                                                                                                                                 | **Middleware-Version** |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|------------------------|
| `0xXXXX000000000000` | "default value"<br />Unknown type of service: Automatic processing through the localization setting of the fiskaltrust.Middleware is attempted. | 1.0                    |

### Type of Payment: ftPayItemCase

The ftPayItemCase indicates the type of payment within the pay items block and defines how the fiskaltrust.SecurityMechanism processes the individual payment in terms of the receipt. The data type is `Int64` and contains a country specific code which is a value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex and used as byte 8 and 7.

For definitions regarding national laws, please refer to the appropriate appendix<span id="t-type-of-payment-ftpayitemcase-90">.</span>

| **Value**            | **Description**                                                                                                                              | **Middleware Version** |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------|------------------------|
| `0xXXXX000000000000` | "default value"<br />unknown payment type: Automatic processing through the localization setting of the fiskaltrust.Middleware is attempted. | 1.0                    |

### Format of Signature: ftSignatureFormat

The ftSignatureFormat tells the cash register or input station which display format is required for the signature block section on the receipt<span id="t-type-of-signature-ftsignatureformat-112">.</span>

| **Value** | **Description**                                                 | **Middleware Version** |
|-----------|-----------------------------------------------------------------|------------------------|
| `0x00`    | Unknown / no format defined                                     | 1.0                    |
| `0x01`    | Text                                                            | 1.0                    |
| `0x02`    | Link                                                            | 1.0                    |
| `0x03`    | QR-Code (2D Code)                                               | 1.0                    |
| `0x04`    | Code128 (Barcode)                                               | 1.0                    |
| `0x05`    | OCR-A (optical character recognition, possible for Base32 data) | 1.0                    |
| `0x06`    | PDF417-(2D Code)                                                | 1.0                    |
| `0x07`    | DATAMATRIX-(2D Code)                                            | 1.0                    |
| `0x08`    | AZTEC-(2D Code)                                                 | 1.0                    |
| `0x09`    | EAN-8 (Barcode)                                                 | 1.0                    |
| `0x0A`    | EAN-13 (Barcode)                                                | 1.0                    |
| `0x0B`    | UPC-A (Barcode)                                                 | 1.0                    |
| `0x0C`    | Code39 (Barcode, possible for Base32 data)                      | 1.0                    |
| `0x0D`    | Base64                                                          | 1.3                    |


### Type of Signature: ftSignatureType

The ftSignatureType indicates type and origin of the signature. The data type is `Int64` and can contain a country specific code which is a value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex and used as byte 8 and 7.

For definitions regarding national laws, please refer to the appropriate appendix<span id="t-type-of-signature-ftsignaturetype-127">.</span>

| **Value**            | **Description**          | **Middleware-Version** |
|----------------------|--------------------------|------------------------|
| `0x0000000000000000` | unknown                  | 1.0                    |
| `0x0000000000001000` | information notification | 1.0                    |
| `0x0000000000002000` | alert notification       | 1.0                    |
| `0x0000000000003000` | failure notification     | 1.0                    |

### <span id="c-type-of-journal-ftjournaltype-129">Type of Journal: ftJournalType</span>

The ftJournalType is used with the journal function and specifies the content and format of the returned journal stream. The data type is `Int64` and contains a country specific code which is a value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex and used as byte 8 and 7.

For definitions regarding national laws, please refer to the appropriate appendix.

| **Value**            | **Description**                              | **Middleware-Version** |
|----------------------|----------------------------------------------|------------------------|
| `0x0000000000000000` | Version information                          | 1.1                    |
| `0x0000000000000001` | fiskaltrust.ActionJournal in internal format | 1.1                    |
| `0x0000000000000002` | ReceiptJournal in internal format            | 1.1                    |
| `0x0000000000000003` | QueueItemJournal in internal format          | 1.1                    |
