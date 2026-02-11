---
slug: /poscreators/middleware-doc/portugal/reference-tables/ftsignaturetype
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
|TBD|TBD|TBD|
