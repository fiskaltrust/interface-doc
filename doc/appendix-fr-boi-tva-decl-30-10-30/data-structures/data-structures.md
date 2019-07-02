## Data Structures

This chapter expands on the descriptions of the data structures covered in Chapter <!-- TODO: Chapter reference --> <span class="underline">6.4</span> of the General Part on page 2 <!-- TODO: page references -->5, with country specific information applicable to the French market.

### Receipt Request

There are no special requirements or laws for the French market.

### Receipt Response

This table describes additional fields of the Receipt Response applicable to the French market.

| Field name                | Data type | Default Value Mandatory Field | Description                                                                                              | Version |
|---------------------------|-----------|-------------------------------|----------------------------------------------------------------------------------------------------------|---------|
| `ftCashBoxIdentification` | `string`  | mandatory                     | Cash register identification.                                                                            | 0-      |
| `ftReceiptIdentification` | `string`  | mandatory                     | Allocated through fiskaltrust.SecurityMechanism upcounting receipt number depending on the receipt type. | 0-      |

<span id="_Toc527986682" class="anchor"></span>*Table 30. Receipt Response*

### Charge Items Entry

Charge Items entriy is defined accordingly to the French law. This entry determines which counter will be used to sum up the value of the sales tax field (normal, discounted-1, discounted-2, zero or special) for the individual services. It is required for signature creation.

This table describes additional fields of the Charge Items Entry applicable to the French market.

| **Field Name** | **Data Type** | **Default Value Mandatory Field** | **Description**                                                       | **Version** |
|----------------|---------------|-----------------------------------|-----------------------------------------------------------------------|-------------|
| `Description`  | `string`      | empty-string<br />mandatory       | Name or description of customary indication or type of other service. | 0-          |

<span id="_Toc527986683" class="anchor"></span>*Table 31. Charge Items Entry (ftChargeItems)*

### Pay Items Entry

There are no special requirements or laws for the French market.

### Signature Entry

A Signature Entry can include an electronic signature for printing on the receipt but also some further information regarding the operational state of the fiskaltrust.SecurityMechanism.

Furthermore, but only in the case when receipts with special functions are used, the previous state of the totalizers (in case of a temporal closure), can also be sent back in this block.

This table describes additional fields of the Signature Entry applicable to the French market.

| **Field Name**      | **Data Type** | **Default Value**<br />**Mandatory Field** | **Description**                                                                                                                                                                       | **Version** |
|---------------------|---------------|--------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| `ftSignatureFormat` | `Int64`       | 0<br />mandatory                           | Format for displaying signature data according to the reference table in the appendix.                                                        | 0-          |
| `ftSignatureType`   | `Int64`       | 0<br />mandatory                           | Type of signature according to the reference table in the appendix, for example signature according to the RKSV or FinanzOnline notification. | 0-          |

<span id="_Toc527986684" class="anchor"></span>*Table 32. Signature Entry*
