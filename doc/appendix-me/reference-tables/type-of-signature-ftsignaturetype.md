---
slug: /poscreators/middleware-doc/montenegro/reference-tables/ftsignaturetype
title: 'Type of signature: ftSignatureType'
---

# Type of Signature: ftSignatureType

The `ftSignatureType` indicates the type and origin of the signature. The data type is `Int64` and can contain a country-specific code, a value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex and used as byte 8 and 7.


| **Value**            | **Description**          | **Middleware version** |
|----------------------|--------------------------|------------------------|
| `0x4D45000000000001` | QR code content | 1.3.40- |
| `0x4D45000000000002` | Archiving required | 1.3.40- |
| `0x4D45000000000003` | Taxpayer identifying code (IIC/IKOF) | 1.3.40- |

:::note

The Types `0x4D45000000000001` "QR code content" and `0x4D45000000000003` "Taxpayer identifying code (IIC/IKOF)" are also returned if the government fiscalization service is not reachable and thus the receipt could not be signed. This is different to Germany where e.g. the QR code is only returned when the receipt could be signed.

:::

