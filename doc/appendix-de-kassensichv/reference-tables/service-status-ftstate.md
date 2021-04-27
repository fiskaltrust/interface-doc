---
slug: /poscreators/middleware-doc/germany/reference-tables/ftstate
title: 'Service Status: ftState'
---

# Service Status: ftState

The country-specific code is made of the country's code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Germany (DE) this is `0x4445`, which results in `0x4445000000000000` as the value for the "ready" status.

The table below describes its supported statuses for the ftState field following German law. These codes can be added through the logic operator `OR`<span id="t-service-status-ftstate-22">.</span>

| **Value**            | **Description**                                                                                     | **Middleware Version** |
|----------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `0x4445000000000002` | The security mechanism was not able to communicate with the TSE device for at least one cycle. If this is the case, no more communication attempts are done to avoid long waiting times for each Receipt request/Receipt response sequence. To leave this state, a Zero-Receipt must be sent, which forces a communication retry towards the TSE device.<br /> Receipts created in a state where no communication is possible with the TSE device are protected by the security mechanism of fiskaltrust. \| 1.0 | 1.0                 |
| `0xXXXX000000000004` | Reserved                                                                                            |                     |
| `0xXXXX000000000010` | Reserved                                                                                            |                     |
| `0xXXXX000000000020` | Reserved                                                                                            |                     |
| `0xXXXX000000000080` | Reserved                                                                                            |                     |
