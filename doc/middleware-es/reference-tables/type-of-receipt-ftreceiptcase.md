---
slug: /poscreators/middleware-doc/spain/reference-tables/ftreceiptcase
title: 'Type of receipt: ftReceiptCase'
---

# Type of Receipt: ftReceiptCase

The `ftReceiptCase` indicates the receipt type and defines how the fiskaltrust.SecurityMechanism should process it following Spanish law.

For Spain (ES), the country code is `0x4553`. Thus, the value of an unknown `ftReceiptCase` in Germany is `0x4553000000000000`.

| **Value** | **Description** | **Middleware version** |
|-----------|-----------------|-------------------------|
| `0x4553000000000000` | **Unknown type for country-code "ES"**<br /><br />This receipt case is handled like a "pos-receipt" (`0x4553000000000001`). See below: | Beleg <br /> Kassenbeleg-V1 | TBD |
| `0x4553000000000001` | **POS receipt**<br /><br />Represents the main kind of receipt processed by a POS system. Creates a turnover and/or a change in the amount of cash in the till or similar operations. <br /><br />Use the `ftChargeItems` and `ftPayItems` to hand over details about goods, services and payments for processing. The `ftChargeItems` and `ftPayItems` should contain the full final state of the receipt. | TBD |
| `0x4553000000000002` | **Zero-receipt**<br /><br />Used for communication test and functional test of the fiskaltrust.SecurityMechanism.<br /><br />The request is only valid when the charge items block (`ftChargeItems`) and the pay items block (`ftPayItems`) in the `ftReceiptRequest` are empty arrays. | TBD |
| `0x4553000000000003` | **Initial operation receipt / start-receipt**<br /><br />The request is only valid with the same property requirements as a zero-receipt. It initializes a new fiskaltrust.SecurityMechanism<br /><br />On successful initialization, a notification is created which includes the Queue ID, SCU ID, and all locally relevant additional information.<br /><br />The request is only valid when the charge items block (`ftChargeItems`) and the pay items block (`ftPayItems`) in the `ftReceiptRequest` are empty arrays. <br /><br /> | TBD |
| `0x4553000000000004` | **Out of operation receipt / stop-receipt**<br /><br />The request is only valid with the same property requirements as a zero-receipt. It is disabling the fiskaltrust.SecurityMechanism. <br /><br />On successful deactivation, a notification is created which includes the Queue ID, SCU ID, and all locally relevant additional information.<br /><br />The request is only valid when the charge items block (`ftChargeItems`) and the pay items block (`ftPayItems`) in the `ftReceiptRequest` are empty arrays.<br /><br /> | TBD |
| `0x4553000000000005` | **Monthly-closing**<br /><br />This is a zero-receipt. It is recommended to send this receipt at the end of each month to define the time of the accounting closure. | TBD |
| `0x4553000000000006` | **Yearly-closing**<br /><br />This is a zero-receipt. It is recommended to send this receipt at the end of each year to define the time of the accounting closure. | TBD |
| `0x4553000000000006` | **Daily-closing**<br /><br />This is a zero-receipt. It is recommended to send this receipt at the end of each day to define the time of the POS system closure. | TBD |

## ftReceiptCaseFlag
This table expands on the values provided in table [ftReceiptCaseFlag in General Part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag) with values applicable to the German market.

| Value | Description | Middleware-Version |
|-------|-------------|--------------------|
| 0x0000800000000000 | **Receipt request.** <br />Common behavior, see [general part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag). | TBD |
