---
slug: /poscreators/middleware-doc/germany/reference-tables/ftsignaturetype
title: 'Type of signature: ftSignatureType'
---

# Type of Signature: ftSignatureType
The `ftSignatureType` indicates the type and origin of the signature. The data type is `Int64` and can contain a country-specific code (following the ISO-3166-1-ALPHA-2 standard), converted from ASCII into hex and used as byte 8 and 7 (e.g. `0x4445` for `DE`).

:::info

Please note that starting from June 2021, it's possible to **either** print the fiscalization details as a QR code **or** as text (while previously, the textual information was mandatory). Printing both is still allowed. More details can be found in the [enactment by the German government](https://dserver.bundestag.de/btd/19/290/1929085.pdf). 

:::

As of today, there are two options when printing receipts: either print all details as text, or print the QR code which contains (mostly) the same information. The Middleware returns all required data, so that the PosCreator is free to choose either. 
| **Value**            | **Description**                                         | **Must be printed**      | **Middleware-Version** |
|----------------------|---------------------------------------------------------|--------------------------|------------------------|
| `0x4445000000000001` | Signature according to DSFinV-K (QR code content)       | Only when using **QR**   | 1.3                    |
| `0x4445000000000002` | Archiving required                                      | No                       | 1.3                    |
| `0x4445000000000003` | Notification                                            | Yes (if existing)        | 1.3                    |
| `0x4445000000000010` | _Start transaction_ result                              | No                       | 1.3                    |
| `0x4445000000000011` | _Finish transaction_ payload                            | No                       | 1.3                    |
| `0x4445000000000012` | _Finish transaction_ result                             | Only when using **text** | 1.3                    |
| `0x4445000000000013` | QR code version                                         | No                       | 1.3                    |
| `0x4445000000000014` | POS serial number                                       | Only when using **text** | 1.3                    |
| `0x4445000000000015` | TSE process type                                        | Only when using **text** | 1.3                    |
| `0x4445000000000016` | TSE process data                                        | Only when using **text** | 1.3                    |
| `0x4445000000000017` | Transaction number                                      | Only when using **text** | 1.3                    |
| `0x4445000000000018` | Signature counter                                       | Only when using **text** | 1.3                    |
| `0x4445000000000019` | Start time of the _start transaction_                   | No                       | 1.3                    |
| `0x444500000000001A` | Log time of the _finish transaction_                    | Only when using **text** | 1.3                    |
| `0x444500000000001B` | Signature algorithm                                     | Only when using **text** | 1.3                    |
| `0x444500000000001C` | Log time format                                         | Only when using **text** | 1.3                    |
| `0x444500000000001D` | Signature                                               | Only when using **text** | 1.3                    |
| `0x444500000000001E` | Public key of the TSE                                   | Only when using **text** | 1.3                    |
| `0x444500000000001F` | Process start (first action)                            | Yes*                     | 1.3                    |
| `0x4445000000000020` | Update-transaction-payload                              | No                       | 1.3.14                 |
| `0x4445000000000021` | Update-transaction-result                               | No                       | 1.3.16                 |
| `0x4445000000000022` | Certification identification (e.g. BSI-K-TR-1234-5678). Also contains information about the certification state (for non certified TSEs) and the state of the environmental protection. | Yes                      | 1.3.16                 |


\* This value must be printed when using long-running business sequences and/or the implicit flow and **is not included in the QR code**. It is computed with the following formula: `min(cbReceiptMoment, min(chargeItems.Moment), min(payItems.Moment))`




