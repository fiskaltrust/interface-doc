---
slug: /poscreators/middleware-doc/germany/reference-tables/ftsignaturetype
title: 'Type of signature: ftSignatureType'
---

# Type of Signature: ftSignatureType

The `ftSignatureType` indicates the type and origin of the signature. The data type is `Int64` and can contain a country-specific code, a value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex and used as byte 8 and 7.

**Generally, all values returned in the response's signature block have to be printed on the receipt.**

For definitions regarding national laws, please refer to the appropriate appendix<span id="t-type-of-signature-ftsignaturetype-127">.</span>

Option 1: QR Code
Option 2: Text
TODO: Describe

| **Value**            | **Description**          | **Must be printed** | **Middleware-Version** |
|----------------------|--------------------------|---------------------|------------------------|
| `0x4445000000000001` | Signature according to KassenSichV (QR-code content) | Only when using QR | 1.3                 |
| `0x4445000000000002` | Archiving required | No  | 1.3                |
| `0x4445000000000003` | Notification | Yes (if existing) | 1.3                 |
| `0x4445000000000010` | Start-transaction-result | No | 1.3                 |
| `0x4445000000000011` | Finish-transaction-payload |  No | 1.3                 |
| `0x4445000000000012` | Finish-transaction-result |  Only when using text | 1.3                 |
| `0x4445000000000013` | Receipt / qr-version | No | 1.3                 |
| `0x4445000000000014` | Receipt / POS serial number | Only when using text | 1.3                 |
| `0x4445000000000015` | Receipt / processtype | Only when using text | 1.3                 |
| `0x4445000000000016` | Receipt / processdata | Only when using text | 1.3                 |
| `0x4445000000000017` | Receipt / transaction number | Only when using text | 1.3                 |
| `0x4445000000000018` | Receipt / signature counter | Only when using text | 1.3                 |
| `0x4445000000000019` | Receipt / start time (start-transaction) | No | 1.3                 |
| `0x444500000000001A` | Receipt / logtime | Only when using text | 1.3                 |
| `0x444500000000001B` | Receipt / signature algorithm | Only when using text | 1.3                 |
| `0x444500000000001C` | Receipt / logtime-format | Only when using text | 1.3                 |
| `0x444500000000001D` | Receipt / signature | Only when using text | 1.3                 |
| `0x444500000000001E` | Receipt / public-key |  Only when using text | 1.3                 |
| `0x444500000000001F` | Receipt /  process start (action) | Yes  | 1.3                 |
| `0x4445000000000020` | Update-transaction-payload |  No  | 1.3.14                 |
| `0x4445000000000021` | Update-transaction-result |  No  | 1.3.16                 |
| `0x4445000000000022` | Certification identification (e.g. BSI-K-TR-1234-5678). Also contains information about the certification state (for non certified TSEs) and the state of the environmental protection. |  Yes  | 1.3.16                 |



