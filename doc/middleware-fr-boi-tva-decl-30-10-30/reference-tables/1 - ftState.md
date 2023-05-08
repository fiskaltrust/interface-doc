---
slug: /poscreators/middleware-doc/france/reference-tables
title: Service Status: ftState
---

# Reference tables

### Service Status: ftState

The ftState is returned with every receipt response. Through this status, fiskaltrust.Middleware can signal its operability or request processing logic.

The country-specific code is made of the country's code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For France (FR), the country code is `0x4652`, which results in `0x4652000000000000` as the value for the "ready" status.

The table below describes supported statuses for the ftState field. Those codes can be combined by using the logic operator `OR`<span id="t-service-status-ftstate-22">.</span>

| **Value**            | **Description**                                                                                     | **Middleware Version** |
|----------------------|-----------------------------------------------------------------------------------------------------|------------------------|
| `0x4652000000000040` | Message Pending<br />Use Zero-Receipt to show Message on Receipt                                    | 1.0                    |
