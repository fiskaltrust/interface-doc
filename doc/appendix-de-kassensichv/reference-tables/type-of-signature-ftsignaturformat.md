---
slug: /poscreators/middleware-doc/germany/reference-tables/ftsignatureformat
title: 'Format of signature: ftSignatureFormat'
---

# Format of Signature: ftSignatureFormat
The Middleware uses the same _ftSignatureFormats_ in Germany as in all other countries, as described in the [general part](../../general/reference-tables/reference-tables.md#format-of-signature-ftsignatureformat). 

A single additional flag was added to mark optional signatures that are not legally required to be printed.

## ftSignatureFormatFlag

| Value | Description | Middleware-Version | 
|-------|-------------|--------------------|
| `0x0000000000010000` | **Printing is optional** <br />When included in the _ftSignatureFormat_, printing the signature to the physical receipt is _not_ required. Please note that the returned QR code is used to replace several therefore optional signatures - if the used hardware does not support printing QR codes, these values are required to be printed instead. | 1.3.23- |