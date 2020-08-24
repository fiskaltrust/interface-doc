### Type of Signature: ftSignatureType

The ftSignatureType indicates type and origin of the signature. The data type is `Int64` and can contain a country specific code which is a value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex and used as byte 8 and 7.

For definitions regarding national laws, please refer to the appropriate appendix<span id="t-type-of-signature-ftsignaturetype-127">.</span>

| **Value**            | **Description**          | **Middleware-Version** |
|----------------------|--------------------------|---------------------|
| `0x4445000000000001` | Signature according to kasssichv (qr-code content)                  | 1.3                 |
| `0x4445000000000002` | Archiving required  | 1.3                |
| `0x4445000000000003` | notification       | 1.3                 |
| `0x4445000000000010` | start-transaction-result     | 1.3                 |
| `0x4445000000000011` | finish-transaction-payload     | 1.3                 |
| `0x4445000000000012` | finish-transaction-result     | 1.3                 |
| `0x4445000000000013` | receipt / qr-version     | 1.3                 |
| `0x4445000000000014` | receipt / POS serial number     | 1.3                 |
| `0x4445000000000015` | receipt / processtype     | 1.3                 |
| `0x4445000000000016` | receipt / processdata     | 1.3                 |
| `0x4445000000000017` | receipt / transaction number     | 1.3                 |
| `0x4445000000000018` | receipt / signature counter     | 1.3                 |
| `0x4445000000000019` | receipt / start time (start-transaction)    | 1.3                 |
| `0x444500000000001A` | receipt / logtime     | 1.3                 |
| `0x444500000000001B` | receipt / signature algorithm     | 1.3                 |
| `0x444500000000001C` | receipt / logtime-format     | 1.3                 |
| `0x444500000000001D` | receipt / signature     | 1.3                 |
| `0x444500000000001E` | receipt / public-key     | 1.3                 |
| `0x444500000000001F` | receipt /  process start (action)    | 1.3                 |


*Table 15. Type of Signature: ftSignatureType*

