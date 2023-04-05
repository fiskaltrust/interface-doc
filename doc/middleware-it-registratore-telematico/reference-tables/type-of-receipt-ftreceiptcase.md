---
slug: /poscreators/middleware-doc/italy/reference-tables/ftreceiptcase
title: 'Type of receipt: ftReceiptCase'
---

# Type of Receipt: ftReceiptCase

The `ftReceiptCase` indicates the receipt type and defines how the fiskaltrust.SecurityMechanism should process it following Italian law.

For Italy (IT), the country code is `0x4954`. Thus, the value of an unknown `ftReceiptCase` in Italy is `0x4954000000000000`.

| **Value** | **Description** | **Middleware version** |
|-----------|-----------------|-------------------------|
| `0x4954000000000000` | **Unknown type for country-code "IT"**<br /><br />This receipt case is handled like a "pos-receipt" (`0x4954000000000001`). See below: | 1.3.45 |
| `0x4954000000000001` | **POS receipt**<br /><br />Represents the main kind of receipt processed by a POS system. Creates a turnover and/or a change in the amount of cash in the till or similar operations. <br /><br />Use the `ftChargeItems` and `ftPayItems` to hand over details about goods, services and payments for processing. The `ftChargeItems` and `ftPayItems` should contain the full final state of the receipt. | 1.3.45 |
| `0x4954000000000002` | **Zero-receipt**<br /><br />Used for communication test and functional test of the fiskaltrust.SecurityMechanism.<br /><br />The request is only valid when the charge items block (`ftChargeItems`) and the pay items block (`ftPayItems`) in the `ftReceiptRequest` are empty arrays. | 1.3.45 |
| `0x4954000000000003` | **Initial operation receipt / start-receipt**<br /><br />The request is only valid with the same property requirements as a zero-receipt. It initializes a new fiskaltrust.SecurityMechanism<br /><br />On successful initialization, a notification is created which includes the Queue ID, SCU ID, and all locally relevant additional information.<br /><br />The request is only valid when the charge items block (`ftChargeItems`) and the pay items block (`ftPayItems`) in the `ftReceiptRequest` are empty arrays. <br /><br /> | 1.3.45 |
| `0x4954000000000004` | **Out of operation receipt / stop-receipt**<br /><br />The request is only valid with the same property requirements as a zero-receipt. It is disabling the fiskaltrust.SecurityMechanism. <br /><br />On successful deactivation, a notification is created which includes the Queue ID, SCU ID, and all locally relevant additional information.<br /><br />The request is only valid when the charge items block (`ftChargeItems`) and the pay items block (`ftPayItems`) in the `ftReceiptRequest` are empty arrays.<br /><br /> | 1.3.45 |
| `0x4954000000000005` | **Monthly-closing**<br /><br />This is a zero-receipt. It is recommended to send this receipt at the end of each month to define the time of the accounting closure. | 1.3.45 |
| `0x4954000000000006` | **Yearly-closing**<br /><br />This is a zero-receipt. It is recommended to send this receipt at the end of each year to define the time of the accounting closure. | 1.3.45 |
| `0x4954000000000006` | **Daily-closing**<br /><br />This is a zero-receipt. It is recommended to send this receipt at the end of each day to define the time of the POS system closure. | 1.3.45 |

## ftReceiptCaseFlag
This table expands on the values provided in table [ftReceiptCaseFlag in General Part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag) with values applicable to the Italian market.

| Value | Description | Middleware-Version |
|-------|-------------|--------------------|
| 0x0000800000000000 | **Receipt request.** <br />Common behavior, see [general part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag). | 1.3.45 |
| 0x0000000000040000 | **Reverse/voided receipt.** <br />The Receipt Reference of the selling Receipt has to be set in cbPreviousReceiptReference. Common behavior, see [general part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag). | 1.3.45 |
