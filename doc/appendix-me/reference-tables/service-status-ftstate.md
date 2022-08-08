---
slug: /poscreators/middleware-doc/montenegro/reference-tables/ftstate
title: 'Service Status: ftState'
---

# Service Status: ftState

The country-specific code is made of the country's code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Montenegro (ME) this is `0x4D45`, which results in `0x4D45000000000000` as the value for the "ready" status.

The table below describes its supported statuses for the `ftState` field following Montenegran law. These codes can be added through the logic operator `OR`.

| **Value**            | **Description**                                                                                     | **Middleware version** |
|----------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `0x4D45000000000002` | The security mechanism was not able to communicate with the _central invoice register_ web service for at least one cycle. If this is the case, no more communication attempts are done to avoid long waiting times for each Receipt request/Receipt response sequence. To leave this state, a Zero-Receipt must be sent, which forces a communication retry towards the web service.<br /> Receipts created in a state where no communication is possible with the central invoice register device are protected by the security mechanism of fiskaltrust and re-sent when the communication is restored with a zero receipt. | 1.3                 |
|----------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `0x4D45000000000003` | An error occurred when processing the request, see further details in ftStateData. | 1.3      
|----------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `0x4D45000000000004` | CashDeposit missing! This receipt could not be processed, as the first receipt each day must be a cash-deposit according to Montenegrin law. | 1.3    
|----------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `0x4D45000000000005` | Invoice already received! The field cbReceiptReference must be unique, but has already been used. Please make sure to use an unique cbReceiptReference for each receipt. | 1.3    
