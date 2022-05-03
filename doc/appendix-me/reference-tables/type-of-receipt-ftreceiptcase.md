---
slug: /poscreators/middleware-doc/montenegro/reference-tables/ftreceiptcase
title: 'Type of receipt: ftReceiptCase'
---

# Type of Receipt: ftReceiptCase

The `ftReceiptCase` indicates the receipt type and defines how the fiskaltrust.SecurityMechanism should process it following Montenegran law.

For Montenegro (ME), the country code is `0x4D45`. Thus, the value of an unknown `ftReceiptCase` in Montenegro is `0x4D45000000000000`.

| **Value** | **Description** | **Middleware version** |
|-----------|-----------------|-------------------------|
| `0x4D45000000000000` | **Unknown type for country-code "ME"**<br /><br />This receipt case is handled like a "pos-receipt" (`0x4D45000000000001`). See below: | 1.3- |
| `0x4D45000000000001` | **POS receipt**<br /><br />Represents the main kind of receipt processed by a POS-System. Creates a turnover and/or change in the amount of cash in the till or similar operations. <br /><br />Use the `ftChargeItems` and `ftPayItems` to hand over details for processing. The `ftChargeItems` and `ftPayItems` should contain the full final state of the receipt, not a partial state. | 1.3- |
| `0x4D45000000000002` | **Zero-receipt**<br /><br />Used for communication test and functional test of the fiskaltrust.SecurityMechanism.  <br /><br />If the Middleware is in _failed mode_, zero-receipts will try to restore the communication. If this succeeds, the Middleware re-sends receipts that were processed by the Middleware while it was in failed mode to the _central invoice register_, according to national requirements. | 1.3- |
| `0x4D45000000000003` | **Initial operation receipt / start-receipt**<br /><br />The request is only valid with the same property requirements as a zero-receipt. It initializes a new fiskaltrust.SecurityMechanism including and registers the instance at the _central invoice register_.<br /><br />The request is only valid when the charge items block (`ftChargeItems`) and the pay items block (`ftPayItems`) in the `ftReceiptRequest` are empty arrays. <br /><br /> | 1.3- |
| `0x4D45000000000004` | **Out of operation receipt / stop-receipt**<br /><br />The request is only valid with the same property requirements as a zero-receipt. It is disabling the fiskaltrust.SecurityMechanism and de-registers the instance from the _central invoice register_. <br /><br />The request is only valid when the charge items block (`ftChargeItems`) and the pay items block (`ftPayItems`) in the `ftReceiptRequest` are empty arrays. | 1.3- |
| `0x4D45000000000005` | **Monthly-closing**<br /><br />This is a zero-receipt. It is recommended to send this receipt at the end of each month to define the time of the accounting closure, but there's no legal requirement to track the end of the month in Montenegran fiscalization. | 1.3- |
| `0x4D45000000000006` | **Yearly-closing**<br /><br />This is a zero receipt. It is **mandatory** to send a yearly-closing receipt in Montenegro at the end of the fiscal year, as this resets the yearly counter the Middleware has to send to the _central invoice register_. | 1.3- |
| `0x4D45000000000007` | **Opening balance**<br /><br />Used to register the initial cash amount that is deposited in the cash register before the beginning of each business day. It is **mandatory** to send this receipt in Montenegro on each day before the first POS receipt is processed, as this data has to be sent to the _central invoice register_. | 1.3- |
| `0x4D45000000000008` | **Cash withdrawal**<br /><br />Used to register cash withdrawals from the till (e.g. in the evening when closing the store). It is **mandatory** to send this receipt in Montenegro whenever cash is withdrawn, as this data has to be sent to the _central invoice register_. | 1.3- |

## ftReceiptCaseFlag
This table expands on the values provided in table [ftReceiptCaseFlag in General Part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag) with values applicable to the German market.

| Value | Description | Middleware-Version |
|-------|-------------|--------------------|
| 0x0000000000010000 | **Failed receipt** <br />Common behaviour, see [general part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag). | 1.3- |
| 0x0000000000040000 | **Reverse/voided receipt**<br />To cancel a receipt, resend it with this flag added to the _ftReceiptCase_ and inverse the _cbPayItems_ and _cbChargeItems_ (Same behavior as described in the [general part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag)). | 1.3- |
| 0x0000800000000000 | **Receipt request.** <br />Common behavior, see [general part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag). | 1.3- |
