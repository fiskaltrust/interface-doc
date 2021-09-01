---
slug: /poscreators/middleware-doc/germany/reference-tables/ftsignaturetype
title: 'Type of signature: ftSignatureType'
---

# Type of Signature: ftSignatureType

The `ftSignatureType` indicates the type and origin of the signature. The data type is `Int64` and can contain a country-specific code, a value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex and used as byte 8 and 7.

:::tip

The German Middleware returns multiple additional signature items that are later used while generating our DSFinV-K export and **do not need to be printed**. To identify those, we have added a flag to the `ftSignatureFormat`, which is described [here](type-of-signature-ftsignaturformat.md)

:::



For definitions regarding national laws, please refer to the appropriate appendix<span id="t-type-of-signature-ftsignaturetype-127">.</span>

| **Value**            | **Description**          | **Middleware-Version** |
|----------------------|--------------------------|---------------------|
| `0x4445000000000001` | Signature according to KassenSichV (QR-code content)             | 1.3                 |
| `0x4445000000000002` | Archiving required  | 1.3                |
| `0x4445000000000003` | Notification      | 1.3                 |
| `0x4445000000000010` | Start-transaction-result     | 1.3                 |
| `0x4445000000000011` | Finish-transaction-payload    | 1.3                 |
| `0x4445000000000012` | Finish-transaction-result    | 1.3                 |
| `0x4445000000000013` | Receipt / qr-version    | 1.3                 |
| `0x4445000000000014` | Receipt / POS serial number | 1.3                 |
| `0x4445000000000015` | Receipt / processtype | 1.3                 |
| `0x4445000000000016` | Receipt / processdata | 1.3                 |
| `0x4445000000000017` | Receipt / transaction number | 1.3                 |
| `0x4445000000000018` | Receipt / signature counter | 1.3                 |
| `0x4445000000000019` | Receipt / start time (start-transaction) | 1.3                 |
| `0x444500000000001A` | Receipt / logtime | 1.3                 |
| `0x444500000000001B` | Receipt / signature algorithm | 1.3                 |
| `0x444500000000001C` | Receipt / logtime-format | 1.3                 |
| `0x444500000000001D` | Receipt / signature | 1.3                 |
| `0x444500000000001E` | Receipt / public-key | 1.3                 |
| `0x444500000000001F` | Receipt /  process start (action) | 1.3                 |
| `0x4445000000000020` | Update-transaction-payload | 1.3.14                 |
| `0x4445000000000021` | Update-transaction-result | 1.3.16                 |
| `0x4445000000000022` | Certification identification (e.g. BSI-K-TR-1234-5678). Also contains information about the certification state (for non certified TSEs) and the state of the environmental protection. | 1.3.16                 |



