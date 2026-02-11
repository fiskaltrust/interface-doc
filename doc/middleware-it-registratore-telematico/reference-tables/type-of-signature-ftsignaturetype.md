---
slug: /poscreators/middleware-doc/italy/reference-tables/ftsignaturetype
title: 'Type of signature: ftSignatureType'
---

# Type of Signature: ftSignatureType

The `ftSignatureType` indicates the type and origin of the signature. The data type is `Int64` and can contain a country-specific code, a value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex and used as byte 8 and 7.


For definitions regarding national laws, please refer to the appropriate appendix.

## Format

_CCCC_vlll_gggg_tsss 

#### v - version
version 2

#### t - Type/Category 
| **Value** | **Description** | **Middleware-Version** |
|-----------|-----------------|------------------------|
|  `0` | Uncategorized, Normal use (notification)  | 1.3.45 |
|  `1` | Information (notification), low priority   | 1.3.45 |
|  `2` | Alert (notification), high priority  | 1.3.45 |
|  `3` | Failure (notification), high priority  | 1.3.45 |

#### gggg - global flags  
| **Value** | **Description** | **Middleware-Version** |
|-----------|-----------------|------------------------|
|  `0001` | Archiving required. <br />Signatures marked with this flag are known to be archived related to market specific bookkeeping requirements. In case of offline usage or pure open-source usage, receipts/artefacts having this flag need to be handled as bookkeeping/accounting-relevant item.   | 1.3.45 |
|  `0010` | Printing/Visualization is optional  | 1.3.45 |
|  `0020` | Do not print/visualize  | 1.3.45 |
|  `0040` | Printed receipt only  | 1.3.45 |
|  `0080` | Digital receipt only   | 1.3.45 |

#### sss - SignatureCase 
| **Value** | **Description** | **Caption** | **Middleware-Version** |
|-----------|-----------------|-----------------|------------------------|
|  `001` | Print below [PayItemBlock] / Document fiscalization <br /><br />**RT-Printer**<br />[DATE(DD-MM-YYYY)] [TIME(HH:MM)][NEWLINE]<br />DOCUMENTO N. [z-Number]-[Document-Number][NEWLINE]<br />Codice Lotteria: [LotteryID][NEWLINE]<br />Codice Fiscale: [CustomerID][NEWLINE]<br />RT [SERIALNUMBER][NEWLINE]<br /><br />**RT-Server**<br />[DATE(DD-MM-YYYY)] [TIME(HH:MM)][NEWLINE]<br />DOCUMENTO N. [z-Number]-[Document-Number][NEWLINE]<br />Codice Lotteria: [LotteryID][NEWLINE]<br />Codice Fiscale: [CustomerID][NEWLINE]<br />Server RT [SERIALNUMBER][NEWLINE]<br />Cassa [ftCashboxIdentification][NEWLINE]<br />-----FIRMA ELETTRONICA-----[NEWLINE]<br />[SHA-METADATA][NEWLINE]<br />---------------------------[NEWLINE]<br /><br />**FE (Fattura Elettronica)**<br />[DATE(DD-MM-YYYY)] [TIME(HH:MM)][NEWLINE]<br />[VAT-ID][NEWLINE]<br />[ftReceiptIdentification][NEWLINE]<br />[ftCashboxIdentification][NEWLINE]<br />If number/signature is present/not null   | [www.fiskaltrust.it] | 1.3.45 |
|  `002` | Print below [Header] / Document Type<br /><br />**Document-Type (1) Vendita**<br />di vendita o prestazione[NEWLINE]<br /><br />**Document-Type (3) Reso**<br />emesso per ANNULLAMENTO[NEWLINE]<br />[NEWLINE]<br />Documento di riferimento:<br />N. [reference-z-Number]-[reference-Document-Number] del [reference-Document-Date(DD-MM-YYYY)][NEWLINE]<br />N. [reference-z-Number]-[reference-Document-Number] del [reference-Document-Date(DD-MM-YYYY)][NEWLINE]<br />RT [reference-RT-Printer-Serialnumber][NEWLINE] <br />Server RT [reference-RT-Server-Serialnumber][NEWLINE]<br />Cassa [reference-ftCashboxIdentification][NEWLINE]<br />XXX(\*) del [reference-Document-Date(DD-MM-YYYY)][NEWLINE]<br /><br />**Document-Type (5) Annullo**<br />emesso per RESO MERCE[NEWLINE]<br />[NEWLINE]<br />Documento di riferimento:<br />N. [reference-z-Number]-[reference-Document-Number] del [reference-Document-Date(DD-MM-YYYY)][NEWLINE]<br />N. [reference-z-Number]-[reference-Document-Number] del [reference-Document-Date(DD-MM-YYYY)][NEWLINE]RT [reference-RT-Printer-Serialnumber][NEWLINE]<br />Server RT [reference-RT-Server-Serialnumber][NEWLINE]<br />Cassa [reference-ftCashboxIdentification][NEWLINE]<br />XXX(\*) del [reference-Document-Date(DD-MM-YYYY)][NEWLINE]<br />If number is on same system<br /><br />If number is on different system<br />If number is unknown XXX(\*)<br />"POS" in the case of a POS receipt;<br />"VR" in the case of returnable containers;<br />“ND” in other cases | DOCUMENTO COMMERCIALE  | 1.3.45 |
|  `010` | RT printer/server serial number |  | 1.3.45 |
|  `011` | RT printer/server Z-Number |  | 1.3.45 |
|  `012` | RT printer/server Document-Number |  | 1.3.45 |
|  `013` | RT printer/server Document-Moment |  | 1.3.45 |
|  `014` | RT printer/server Document Type  |  | 1.3.45 |
|  `015` | RT printer/server LotteryID  |  | 1.3.45 |
|  `016` | RT printer/server CustomerID  |  | 1.3.45 |
|  `017` | RT server SHA Metadata |  | 1.3.45 |
|  `018` | Amount  |  | 1.3.45 |
|  `020` | RT Reference ZNumber  |  | 1.3.45 |
|  `021` | RT Reference DocNumber  |  | 1.3.45 |
|  `022` | RT Reference Document Moment  |  | 1.3.45 |
