---
slug: /poscreators/middleware-doc/germany/reference-tables/ftsignatureformat
title: 'Format of signature: ftSignatureFormat'
---

# Format of Signature: ftSignatureFormat
The Middleware uses the same _ftSignatureFormats_ in Germany as in all other countries, as described in the [general part](../../general/reference-tables/reference-tables.md#format-of-signature-ftsignatureformat). 

:::info

Please note that starting from June 2021, it's possible to **either** print the fiscalization details as a QR code **or** as text (while previously, the textual information was mandatory). Printing both is still allowed. More details can be found in the [enactment by the German government](https://dserver.bundestag.de/btd/19/290/1929085.pdf). 

:::

As of today, there are two options when printing receipts: either print all details as text, or print the QR code which contains (mostly) the same information. The Middleware returns all required data, so that the PosCreator is free to choose either. We've added a flag to the `ftSignatureFormat` value that can be used to determine if printing is optional when using the QR code (as the current QR code format specified by the DSFinV-K is missing some values).

## ftSignatureFormatFlag

| Value | Description | Middleware-Version | 
|-------|-------------|--------------------|
| `0x0000000000010000` | **Printing is optional** <br />When included in the _ftSignatureFormat_, printing the signature to the physical receipt is _not_ required. Please note that the returned QR code is used to replace several therefore optional signatures - if the used hardware does not support printing QR codes, these values are required to be printed instead. The Queue configuration parameter `FlagOptionalSignatures` (which can be set in the Portal) can be set to `false` to disable adding this flag to any items. | 1.3.23- |