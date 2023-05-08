---
slug: /poscreators/middleware-doc/france/reference-tables
title: Type of receipt: ftReceiptCaseFlag
---

# Reference tables

### ftReceiptCaseFlag

According to French law and regulations, various business transactions can result in specific combinations of types of receipts. For this, bytes 6, 5, 4 and 3 are used as combinable codes. These codes can be added with the logic operator "OR".

| **Value**            | **Description**                                                                                                                                                                                                                                                                | **Version** |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| `0x0000000000010000` | **Failed receipt**<br />Common behaviour, see [general part](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/general/reference-tables#ftreceiptcaseflag).                                                                                                       | 1.2         |
| `0x0000000000020000` | **Training receipt**<br />All requests issued with this flag are chained and signed in a separate chain. The phrase "mode école" is printed on any artefact that is printed while the flag is being used. For national numbering "X" is used.<br />GT counters are not raised. | 1.2         |
| `0x0000000000030000` | **Failed  training receipt**<br />Common behaviour, see [general part](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/general/reference-tables#ftreceiptcaseflag).                                                                                                       | 1.2         |
| `0x0000000000040000` | **Reverse/voided receipt**<br />Common behaviour, see [general part](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/general/reference-tables#ftreceiptcaseflag).    |1.2||
| `0x0000000000050000` | **Failed  reverse/voided receipt**<br />Common behaviour, see [general part](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/general/reference-tables#ftreceiptcaseflag).                                                                                                       | 1.2         |                                                                                           |             |
| `0x0000000000060000` | **Failed  reverse/voided training receipt**<br />Common behaviour, see [general part](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/general/reference-tables#ftreceiptcaseflag).                                                                                                       | 1.2         |
| `0x0000800000000000` | **Receipt request**<br />Common behaviour, see [general part](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/general/reference-tables#ftreceiptcaseflag).                                                                                                      |      1.2       |

<span id="_Toc527986686" class="anchor"></span>

*Table 34. Type of Receipt: ftReceiptCase Flags (FR – BOI-TVA-DECL 30-10-30)*
