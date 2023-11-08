---
slug: /poscreators/middleware-doc/italy/reference-tables/ftreceiptcase
title: 'Type of receipt: ftReceiptCase'
---

# Type of Receipt: ftReceiptCase

The `ftReceiptCase` indicates the receipt type and defines how the fiskaltrust.SecurityMechanism should process it following Italian law.

For Italy (IT), the country code is `0x4954`. Thus, the value of an unknown `ftReceiptCase` in Italy is `0x4954000000000000`.

## Format

_CCCC_vlll_gggg_txcc_ 

| **Value**            | **Description**                                                                                     |
|----------------------|-----------------------------------------------------------------------------------------------------|
|t|ReceiptCaseType|
|txcc|ReceiptCase|
|gggg|global tagging/flag|

txcc - ftReceiptcase

| **Value** | **Description** | **Middleware version** |
|-----------|-----------------|-------------------------|
| `0000 ` | **Unknown type for country-code "IT"**<br /><br />This receipt case is handled like a "pos-receipt" (`0001 `). See below: | 1.3.45 |
| `0001 ` | **POS receipt**<br /><br />Represents the main kind of receipt processed by a POS system. Creates a turnover and/or a change in the amount of cash in the till or similar operations. <br /><br />Use the `ftChargeItems` and `ftPayItems` to hand over details about goods, services and payments for processing. The `ftChargeItems` and `ftPayItems` should contain the full final state of the receipt. | 1.3.45 |
| `0002 ` | **Payment transfer receipt type**<br /><br />| 1.3.45 |
| `0003 ` | Point-Of-Sale receipt without fiskalization obligation or with exeption on fiskalization regulation | 1.3.45 |
| `0004 ` | **E-Commerce receipt type**<br /><br />| 1.3.45 |
| `0005 ` | **Delivery Note**<br /><br />| 1.3.45 |
| `1000 ` | **Unknown invoice type**<br /><br />| 1.3.45 |
| `1001 ` | **B2C invoice type**<br /><br />| 1.3.45 |
| `1002  ` | **B2B invoice type**<br /><br />| 1.3.45 |
| `1003  ` | **B2G invoice type**<br /><br />| 1.3.45 |
| `2000  ` | **Zero Receipt**<br /><br />Used for communication test and functional test of the fiskaltrust.SecurityMechanism. The request is only valid when the charge items block (ftChargeItems) and the pay items block (ftPayItems) in the ftReceiptRequest are empty arrays.| 1.3.45 |
| `2001  ` | **(reserved) One Receipt**<br /><br />| 1.3.45 |
| `2010  ` | **Shift Closing Receipt**<br /><br />| 1.3.45 |
| `2011  ` | **Daily Closing Receipt**<br /><br />| 1.3.45 |
| `2012  ` | **Monthly Closing Receipt**<br /><br />| 1.3.45 |
| `2013  ` | **Yearly Closing Receipt**<br /><br />| 1.3.45 |
| `3000  ` | **Protocol (unspecified type)**<br /><br />| 1.3.45 |
| `3001  ` | **Protocol (technical event)**<br /><br />| 1.3.45 |
| `3002  ` | **Protocol (audit event / accounting event)**<br /><br />| 1.3.45 |
| `3003  ` | **Internal usage / Material consumption**<br /><br />| 1.3.45 |
| `3004  ` | **Order**<br /><br />| 1.3.45 |
| `4001  ` | **Queue-Start-Receipt (Initial operations receipt)**<br /><br />| 1.3.45 |
| `4002  ` | **Queue-Stop-Receipt (Out of operations receipt)**<br /><br />| 1.3.45 |



## ftReceiptCaseFlag
This table expands on the values provided in table [ftReceiptCaseFlag in General Part](../../general/reference-tables/reference-tables.md#ftreceiptcaseflag) with values applicable to the Italian market.

| Value | Description | Middleware-Version |
|-------|-------------|--------------------|
| TBD | **TBD** <br />| 1.3.45 |
