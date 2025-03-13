---
slug: /poscreators/middleware-doc/germany/cash-register-integration
title: Cash register integration
---

# Cash register integration

This chapter describes the cash register integration in accordance with German law. The general rules for cash register integration are described in the General Part of this document.

## Printing receipts
Like in all other supported countries, the German Middleware returns all compliance-relevant data that need to be printed onto the receipt. In Germany, it's either possible to print a QR code **or** to print the data otherwise contained in this QR code as text. 

We generally recommend using QR codes wherever possible to reduce the amount of required paper. 

### Printing receipts with QR codes
As the Middleware returns additional data in the `ftSignatures` field that is e.g. used by ourselves to create the DSFinV-K, we introduced a flag for the `ftSignatureFormat` field that signalizes if a signature needs to be printed or is optional. More details about this flag are describede [here](../reference-tables/type-of-signature-ftsignatureformat.md)

Hence, when printing QR codes, all returned signatures should be printed that **do not** have the _ftSignatureFormatFlag_ `0x0000000000010000` ("printing is optional").

### Printing receipts without QR codes
For supporting cases where the used printer does not support QR codes, the Middleware's returened signatures also contain all required information in textual form. The following items from the response's `ftSignatures` property needs to be printed:

| **Description**                         | **Caption**             | **ftSignatureType**  |
| --------------------------------------- | ----------------------- | -------------------- |
| Certification ID of the TSE             | `<certification-id>`    | `0x4445000000000022` |
| Serial number of the TSE                | `<tse-seriennummer>`    | `0x4445000000000023` |
| Serial number of the cash register      | `<kassen-seriennummer>` | `0x4445000000000014` |
| Process type of the TSE transaction     | `<processType>`         | `0x4445000000000015` |
| Process data of the TSE transaction     | `<processData>`         | `0x4445000000000016` |
| TSE transaction number                  | `<transaktions-nummer>` | `0x4445000000000017` |
| TSE signature counter                   | `<signatur-zaehler>`    | `0x4445000000000018` |
| TSE start time                          | `<start-zeit>`          | `0x4445000000000019` |
| TSE log time                            | `<log-time>`            | `0x444500000000001A` |
| TSE signature algorithm                 | `<sig-alg>`             | `0x444500000000001B` |
| TSE log time format                     | `<log-time-format>`     | `0x444500000000001C` |
| TSE signature                           | `<signatur>`            | `0x444500000000001D` |
| Overall start time of the business case | `<vorgangsbeginn>`      | `0x444500000000001F` |
