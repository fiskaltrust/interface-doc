---
slug: /poscreators/middleware-doc/germany/reference-tables/ftstate
title: 'Service Status: ftState'
---

### Service status: ftState

The table below describes supported statuses for the ftState field in accordance with the German law. These codes can be added through the logic operator "OR".

The country-specific code is made of the country’s code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Germany (DE) this is `0x4445`, which results in `0x4445000000000000` as the value for the "ready" status.

The table below describes supported statuses for the ftState field. Those codes can be combined by using the logic operator `OR`<span id="t-service-status-ftstate-22">.</span>

| **Value**            | **Description**                                                                                     | **Middleware Version** |
|----------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `0x4445000000000002` | TSE device communication broken<br />The security mechanism was not able to communicate with the TSE device for at least one cycle. If this is the case no more communication trials are done to avoid long waiting times for each ReceiptRequest/ReceiptResponse sequence. To leave this state throw a Zero-Receipt, which forces a communication retry towards the TSE device.<br /> Receipts created in a state where no communication is possible with the TSE device are protected by the security mechanism of fiskaltrust. | 1.0                 |
| `0xXXXX000000000004` | Reserved                                                                                            |                     |
| `0xXXXX000000000010` | Reserved                                                                                            |                     |
| `0xXXXX000000000020` | Reserved                                                                                            |                     |
| `0xXXXX000000000080` | Reserved                                                                                            |                     |
