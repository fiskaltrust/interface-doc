---
slug: /poscreators/middleware-doc/italy/reference-tables/ftstate
title: 'Service Status: ftState'
---

# Service Status: ftState

The country-specific code is made of the country's code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Italy (IT) this is `0x4954`, which results in `0x4954000000000000` as the value for the "ready" status.

The table below describes its supported statuses for the ftState field following Italian law. These codes can be added through the logic operator `OR`<span id="t-service-status-ftstate-22">.</span>

| **Value**            | **Description**                                                                                     | **Middleware Version** |
|----------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `0x4954000000000002` | The security mechanism was not able to communicate with the fiscal device for at least one cycle. If this is the case, no more communication attempts are done to avoid long waiting times for each Receipt request/Receipt response sequence. To leave this state, a Zero-Receipt must be sent, which forces a communication retry towards the fiscal device.<br /> Receipts created in a state where no communication is possible with the fiscal device are protected by the security mechanism of fiskaltrust. | 1.0                 |
