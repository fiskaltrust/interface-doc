## Data Structures

This chapter expands on the descriptions of the data structures covered in the Chapter ["Data structures"](../../general/data-structures/data-structures.md) of the General Part, with country specific information applicable to the French market.

### Receipt Request

This table describes fields of the Receipt Request applicable to the French market.

| Field name                | Data type | Default Value Mandatory Field | Description                                                                                              | Version |
|---------------------------|-----------|-------------------------------|----------------------------------------------------------------------------------------------------------|---------|
| `cbReceiptAmount`       |`Decimal`?	| null<br>mandatory	                | Total receipt amount incl. taxes (gross receipt amount).                                                 | 1.2      |
| `ftPosSystemId`          |guid/string |null<br>mandatory	                |	This field identifies and documents the type and software version of the PosSystem sending the request. It is used for audits and as a base for commission calculation. The PosSystem itself has to be created in the portal and its ID can be implemented as a constant value by the PosCreator. | 1.2      |

#### ReceiptCaseData Entry

ReceiptCaseData Entry is used to hand over additional required Informations to a data line for a receipt.
The Format is limited to JSON.
For French law fulfullment a  ManagerId is required, if the receipt is sent as training receipt.

| **Field Name** | **Data Type** | **Default Value Mandatory Field** | **Description**                                                       | **Version** |
|----------------|---------------|-----------------------------------|-----------------------------------------------------------------------|-------------|
| `ManagerId`	                |`String`<br>Max 1k |	empty-string<br>optional<br>mandatory in training mode | Identification of the user, who started the training mode. | 1.2      |

##### ReceiptCaseData Entry Example

`{
   \"ManagerId\" : \"17\"
}`

### Receipt Response

This table describes additional fields of the Receipt Response applicable to the French market.

| Field name                | Data type | Default Value Mandatory Field | Description                                                                                              | Version |
|---------------------------|-----------|-------------------------------|----------------------------------------------------------------------------------------------------------|---------|
| `ftCashBoxIdentification` | `string`  | mandatory                     | Cash register identification.                                                                            | 1.2      |
| `ftReceiptIdentification` | `string`  | mandatory                     | Allocated through fiskaltrust.SecurityMechanism upcounting receipt number depending on the receipt type. | 1.2      |

<span id="_Toc527986682" class="anchor"></span>*Table 30. Receipt Response*

### ChargeItems Entry

Charge Items entriy is defined accordingly to the French law. This entry determines which counter will be used to sum up the value of the sales tax field (normal, discounted-1, discounted-2, zero or special) for the individual services. It is required for signature creation.

This table describes additional fields of the Charge Items Entry applicable to the French market.

| **Field Name** | **Data Type** | **Default Value Mandatory Field** | **Description**                                                       | **Version** |
|----------------|---------------|-----------------------------------|-----------------------------------------------------------------------|-------------|
| `Description`  | `string`      | empty-string<br />mandatory       | Name or description of customary indication or type of other service. | 1.2          |
| `VATAmount`            | `Decimal`            | 0.0<br />mandatory                           | For French law fulfillment the VAT amount is required. It is used to calculate the net amount in order to avoid rounding errors which are especially likely to appear in row-based net price additions. | 1.2          |
| `ftChargeItemCaseData` | `string`<br />Max 64k | empty-string<br />mandatory                  | Additional data about the service, currently accepted only in JSON format.                                                                                                           | 1.2          |

<span id="_Toc527986683" class="anchor"></span>*Table 31. Charge Items Entry (ftChargeItems)*

#### ChargeItemCaseData Entry

ChargeItemCaseData Entry is used to hand over additional required Informations to a data line for a receipt.
The Format is limited to JSON.
For French law fulfullment a net-amount by line is required. this is added here by a field called "NetAmount".

| **Field Name** | **Data Type** | **Default Value Mandatory Field** | **Description**                                                       | **Version** |
|----------------|---------------|-----------------------------------|-----------------------------------------------------------------------|-------------|
| `NetAmount` | `Decimal` | 0.0<br /> mandatory | POS-device given net-amout, by line, to be processed. | 1.2 |

##### ChargeItemCaseData Entry Example

`{
   \"NetAmount\" : 7.43
}`

### Pay Items Entry

There are no special requirements or laws for the French market.

### Signature Entry

A Signature Entry can include an electronic signature for printing on the receipt but also some further information regarding the operational state of the fiskaltrust.SecurityMechanism.

Furthermore, but only in the case when receipts with special functions are used, the previous state of the totalizers (in case of a temporal closure), can also be sent back in this block.

This table describes additional fields of the Signature Entry applicable to the French market.

| **Field Name**      | **Data Type** | **Default Value**<br />**Mandatory Field** | **Description**                                                                                                                                                                       | **Version** |
|---------------------|---------------|--------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| `ftSignatureFormat` | `Int64`       | 0<br />mandatory                           | Format for displaying signature data according to the reference table in the appendix.                                                        | 1.2          |
| `ftSignatureType`   | `Int64`       | 0<br />mandatory                           | Type of signature according to the reference table in the appendix. | 1.2          |

<span id="_Toc527986684" class="anchor"></span>*Table 32. Signature Entry*
