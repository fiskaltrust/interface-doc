---
slug: /poscreators/middleware-doc/france/data-structures
title: Data structures
---

# Data Structures

This chapter expands on the descriptions of the data structures covered in the Chapter ["Data structures"](../../general/data-structures/data-structures.md) of the General Part, with country-specific information applicable to the French market.

## Receipt Request

This table describes fields of the receipt request applicable to the French market in general and for defined ReceiptCases.

### General fields

| Field name                | Data type    | Default Value Mandatory Field | Description                                                                                              | Version |
|---------------------------|--------------|-------------------------------|----------------------------------------------------------------------------------------------------------|---------|
| `cbUser`                  |String<br/>max 1k|empty-string<br/>mandatory  |Identification of the user (Number, name, ...), who creates the receipt. Although all string values are supported, we suggest using data structures serialized into JSON format. |1.2      |
| `cbReceiptAmount`         |`Decimal`?    | null<br />mandatory           | Total receipt amount incl. taxes (gross receipt amount).                                                 | 1.2     |
| `ftPosSystemId`           |`guid/string` | mandatory                     | This field identifies and documents the type and software version of the PosSystem sending the request. It is used for audits and as a base for commission calculation. The PosSystem itself has to be created in the portal and its ID can be implemented as a constant value by the PosCreator. | 1.2      |

### Bill / Note

The Bill (in French called _Note_ or _Addition_) is a receipt usually used in the hospitality sector. Usually this receipt is given to the guest before the payment process to show the consumption and the outstanding amount. This receipt must not contain VAT data (net/tax amounts or tax rates) and means of payment.
If the order can be directly assigned to a table, seat or room in a catering establishment or is recorded in the POS system, this must be stored in the data.

| Field name                   | Data type            | Default Value Mandatory Field | Description                                                                                              | Version |
|------------------------------|----------------------|-------------------------------|----------------------------------------------------------------------------------------------------------|---------|
| `cbArea`                     |`string`<br/>max 1k   | empty-string<br />mandatory   | The number/identification of the table, room or place connected to a consumption<br />Although all string values are supported, we suggest using data structures serialized into JSON format. | 1.2     |
| `cbPreviousReceiptReference` | `string`<br />max 1k | empty-string<br />optional<br />mandatory on value changed in `cbArea` | `cbReceiptReference` of the original receipt. Has to be used if the value in `cbArea` for the preceding receipt changes. | 1.2      |

#### Change of table or room

In order to reflect changes of table or rooms several possibilities can be taken in consideration.

1. An entry in the protocol with ReceiptCase `0x4652000000000012` can be made.
1. The complete bill can be voided with the ReceiptCaseFlag `0x0000000000040000` and be done as new Bill for the new table/room.
1. The next note is done with a new number in `cbArea` and the `cbPreviousReceiptReference` is set to the value of the note done on the old table. If after the bill a ticket (without another note) is issued the same procedure can be used.

#### Example

##### Saving a table number

```...
"cbArea": "{\"table\" : \"101\"}"
...
```

##### Saving a room number

```...
"cbArea": "{\"room\" : \"W1101\"}"
...
```

### Copy

By using the ReceiptCase `0x4652000000000016` the following fields are mandatory.

| **Field Name**               | **Data Type**        | **Default Value Mandatory Field** | **Description**                                                        | **Version** |
|------------------------------|----------------------|-----------------------------------|------------------------------------------------------------------------|-------------|
| `ftReceiptCaseData`          | `string`<br />max 1k | empty-string<br />optional<br />mandatory for copy | Information about the reason of creating a duplicate. | 1.2         |
| `cbPreviousReceiptReference` | `string`<br />max 1k | empty-string<br />optional<br />mandatory for copy | `cbReceiptReference` of the original receipt. Used to create a counter for the number of copies issued for the original receipt. | 1.2      |

#### Example

```...
"ftReceiptCaseData" : "{\"CopyReason\" : \"Ticket réimprimé à la demande du client\"}",
"cbPreviousReceiptReference" : "HP202112-001"
...
```

### Training mode

`ftReceiptCaseData` Entry is used to hand over additional required information to a data line for a receipt in JSON format.
For French law fulfilment, a `ManagerId` is required, if the receipt is sent as training receipt.

| **Field Name**  | **Data Type**        | **Default Value Mandatory Field** | **Description**                                                       | **Version** |
|-----------------|----------------------|-----------------------------------|-----------------------------------------------------------------------|-------------|
| `ManagerId`     | `string`<br />max 1k | empty-string<br />optional<br />mandatory in training mode | Identification of the user, who started the training mode. | 1.2      |

#### Example

```...
"ftReceiptCaseData" : "{\"ManagerId\" : \"17\"}"
...
```

### Receipt Response

This table describes additional fields of the receipt response applicable to the French market.

| Field name                | Data type | Default Value Mandatory Field | Description                                                                                               | Version |
|---------------------------|-----------|-------------------------------|-----------------------------------------------------------------------------------------------------------|---------|
| `ftCashBoxIdentification` | `string`  | mandatory                     | Cash register identification.                                                                             | 1.2     |
| `ftReceiptIdentification` | `string`  | mandatory                     | Allocated through fiskaltrust.SecurityMechanism up counting receipt number depending on the receipt type. | 1.2     |

### ChargeItems Entry

The ChargeItems entry is defined according to the French law. This entry determines which counter will be used, to sum up the value of the sales tax field (normal, discounted-1, discounted-2, zero or special) for the individual services. It is required for signature creation.

This table describes additional fields of the ChargeItems Entry applicable to the French market.

| **Field Name**         | **Data Type**         | **Default Value Mandatory Field** | **Description**                                                       | **Version** |
|------------------------|-----------------------|-----------------------------------|-----------------------------------------------------------------------|-------------|
| `Description`          | `string`              | mandatory          | Name or description of customary indication or type of other service.                | 1.2         |
| `VATAmount`            | `Decimal`             | 0.0<br />mandatory | For French law fulfilment the VAT amount is required. It is used to calculate the net amount in order to avoid rounding errors which are especially likely to appear in row-based net price additions. | 1.2          |
| `ftChargeItemCaseData` | `string`<br />Max 64k | mandatory          | Additional data about the service in JSON format.                                    | 1.2         |
| `Unit`                 | `string`<br />Max 1k  | mandatory          | Unit of measurement, e. g. pièce, kg, litre, room, nuit, ...                         | 1.2         |
| `UnitPrice`            | `Decimal`             | mandatory          | Gross price per indicated unit.                                                      | 1.2         |

#### ChargeItemCaseData Entry

`ChargeItemCaseData` Entry is used to hand over additional required information to a data line for a receipt in JSON format.
For French law fulfilment, a net-amount by line is required. This is added by a field called `NetAmount`.

| **Field Name** | **Data Type** | **Default Value Mandatory Field** | **Description**                                        | **Version** |
|----------------|---------------|-----------------------------------|--------------------------------------------------------|-------------|
| `NetAmount`    | `Decimal`     | 0.0<br /> mandatory               | POS-device given net-amount, by line, to be processed. | 1.2         |

##### Example

```...
{"ftChargeItemCaseData": \"NetAmount\" : 7.43}
...
```

### PayItems Entry

There are no special requirements or laws for the French market.

### Signature Entry

A Signature Entry can include an electronic signature for printing on the receipt and further information regarding the operational state of the fiskaltrust.SecurityMechanism. Furthermore, but only when receipts with special functions are used, the previous state of the totalizers (in case of a temporal closure), can also be sent back in this block.
**All SignatureItems send back to the POS-System must be printed on the receipt, therefore it's mandatory to print the content of the fields _Caption_ and _Data_.**

This table describes additional fields of the Signature Entry applicable to the French market.

| **Field Name**      | **Data Type** | **Default Value**<br />**Mandatory Field** | **Description**                                                                        | **Version** |
|---------------------|---------------|--------------------------------------------|----------------------------------------------------------------------------------------|-------------|
| `ftSignatureFormat` | `Int64`       | 0<br />mandatory                           | Format for displaying signature data according to the reference table in the appendix. | 1.2         |
| `ftSignatureType`   | `Int64`       | 0<br />mandatory                           | Type of signature according to the reference table in the appendix.                    | 1.2         |
