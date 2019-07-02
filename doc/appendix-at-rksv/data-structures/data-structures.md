## Data Structures

This chapter expands on the descriptions of the data structures covered in Chapter <!-- TODO: Chapter reference --> 6.4 of the General Part on page 2 <!-- TODO: page references -->5, with country specific information applicable to the Austrian market.

### Receipt Request

There are no special requirements or laws for the Austrian market.

### Receipt Response

This table describes additional fields of the Receipt Response applicable to the Austrian market.

| **Field name**            | **Data type** | **Default Value Mandatory Field** | **Description**                                                                                         | **Version** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| `ftCashBoxIdentification` | `string`      | mandatory                         | Cash register identification number in accordance with the RKSV.                                        | 0-          |
| `ftReceiptIdentification` | `string`      | mandatory                         | Upcounting receipt number allocated through fiskaltrust.SecurityMechanisms in accordance with the RKSV. | 0-          |

<span id="_Toc510009100" class="anchor"></span>*Table 18. Receipt Response (AT - RKSVO)*

### Charge Items Entry

This entry determines which counter will be used to sum up the value of the sales tax field (normal, discounted-1, discounted-2, zero or special) for the individual services. It is required for signature creation.

This table describes additional fields of the Charge Items Entry applicable to the Austrian market.

| **Field Name** | **Data Type** | **Default Value Mandatory Field** | **Description**                                                                                        | **Version** |
|----------------|---------------|-----------------------------------|--------------------------------------------------------------------------------------------------------|-------------|
| `Description`  | `string`      | empty-string<br />mandatory       | Name, description of customary indication, or type of the service or item in accordance with the RKSV. | 0-          |

<span id="_Toc510009101" class="anchor"></span>*Table 19. Charge Items Entry (ftChargeItems) (AT - RKSVO)*

### Pay Items Entry

There are no special requirements or laws for the Austrian market.

### Signature Entry

In addition to the description provided in Chapter <!-- TODO: Chapter reference --> 6.4.5 of the General part, a Signature Entry for Austrian market may contain a FinanzOnline notification, which can be sent back depending on the operating mode. This is in particular the case for receipts with special functions.

| **Field Name**      | **Data Type** | **Default Value**<br />**Mandatory Field** | **Description**                                                                                                                                                                       | **Version** |
|---------------------|---------------|--------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| `ftSignatureFormat` | `Int64`       | 0<br />mandatory                           | Format for displaying signature data according to the reference table in the appendix.                                                        | 0-          |
| `ftSignatureType`   | `Int64`       | 0<br />mandatory                           | Type of signature according to the reference table in the appendix, for example signature according to the RKSV or FinanzOnline notification. | 0-          |

<span id="_Toc510009102" class="anchor"></span>*Table 20. Signature Entry (AT - RKSVO)*
