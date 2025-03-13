---
slug: /poscreators/middleware-doc/portugal/reference-tables/ftreceiptcase
title: 'Type of receipt: ftReceiptCase'
---

# Type of Receipt: ftReceiptCase

The `ftReceiptCase` indicates the receipt type and defines how the fiskaltrust.SecurityMechanism should process it following Portuguese law.

For Portugal (PT), the country code is `0x5054`. Thus, the value of an unknown `ftReceiptCase` in Portugal is `0x5054000000000000`.

## Format

_CCCC_vlll_gggg_txcc_ 

#### v - version
version 2

| **Value**            | **Description**                                                                                     |
|----------------------|-----------------------------------------------------------------------------------------------------|
|t|ReceiptCaseType|
|txcc|ReceiptCase|
|gggg|global tagging/flag|
|lll|local tagging/flag|

#### t - ReceiptCaseType

| **Value** | **Category** | **Description** |
|-----------|-----------------|-------------------------|
| `0` | Receipt  | A basic receipt that is generated as part of a POS sale. A receipt usually serves as proof of payment. The receipt is used after the transaction is done (if goods are received). This is the usual process that is done at a POS.  |
| `1` | Invoice  | An invoice is generated for those cases where payment isn't handled immediately.  |
| `2` | DailyOperations  | This category contains receipt cases that the Middleware requires for various downstream processes (e.g. book keeping)  |
| `3` | Log  | Logs can be used for storing / securing events that need are needed for additional processing or downstream processes. (e.g. log for cash drawer opened)  |
| `4` | Lifecycle  | These operations are used for changing the overall state of the Middleware. Depending on the local regulations these receipts are handed over as part of a notification (e.g. FinanzOnline) |


#### txcc - ReceiptCase

| **Value** | **Description** | **Middleware version** |
|-----------|-----------------|-------------------------|
| `0000` | **Unknown type for country-code "PT"**<br /><br />This receipt case is handled like a "pos-receipt" (`0001 `). See below: | 1.3.45 |
| `0001` | **POS receipt**<br /><br />Represents the main kind of receipt processed by a POS system. Creates a turnover and/or a change in the amount of cash in the till or similar operations. <br /><br />Use the `ftChargeItems` and `ftPayItems` to hand over details about goods, services and payments for processing. The `ftChargeItems` and `ftPayItems` should contain the full final state of the receipt. | 1.3.45 |
| `0002` | **Payment transfer receipt type**<br /><br />| 1.3.45 |
| `0003` | **Point-Of-Sale receipt without fiscalization**<br /><br />	Obligation or with exeption on fiscalization regulation | 1.3.45 |
| `0004` | **E-Commerce receipt type**<br /><br />| 1.3.45 |
| `0005` | **Delivery Note**<br /><br />| 1.3.45 |
| `1000` | **Unknown invoice type**<br /><br />| 1.3.45 |
| `1001` | **B2C invoice type**<br /><br />| 1.3.45 |
| `1002` | **B2B invoice type**<br /><br />| 1.3.45 |
| `1003` | **B2G invoice type**<br /><br />| 1.3.45 |
| `2000` | **Zero Receipt**<br /><br />Used for communication test and functional test of the fiskaltrust.SecurityMechanism. The request is only valid when the charge items block (ftChargeItems) and the pay items block (ftPayItems) in the ftReceiptRequest are empty arrays.| 1.3.45 |
| `2001` | **(reserved) One Receipt**<br /><br />| 1.3.45 |
| `2010` | **Shift Closing Receipt**<br /><br />| 1.3.45 |
| `2011` | **Daily Closing Receipt**<br /><br />| 1.3.45 |
| `2012` | **Monthly Closing Receipt**<br /><br />| 1.3.45 |
| `2013` | **Yearly Closing Receipt**<br /><br />| 1.3.45 |
| `3000` | **Protocol (unspecified type)**<br /><br />| 1.3.45 |
| `3001` | **Protocol (technical event)**<br /><br />| 1.3.45 |
| `3002` | **Protocol (audit event / accounting event)**<br /><br />| 1.3.45 |
| `3003` | **Internal usage / Material consumption**<br /><br />| 1.3.45 |
| `3004` | **Order**<br /><br />| 1.3.45 |
| `3010` | **Copy Receipt / Print existing Receipt**<br /><br />| 1.3.45 |
| `4001` | **Queue-Start-Receipt (Initial operations receipt)**<br /><br />| 1.3.45 |
| `4002` | **Queue-Stop-Receipt (Out of operations receipt)**<br /><br />| 1.3.45 |
| `4011` | **Initiate SCU-switch**<br /><br />| 1.3.45 |
| `4012` | **Finish SCU-switch**<br /><br />| 1.3.45 |

#### gggg - global tagging/flag 

| **Value** | **Description** | **Middleware version** |
|-----------|-----------------|-------------------------|
| `0001` | **Process as Late Signing Receipt**<br /><br />The cash register lost connection to the queue and processed receipts without communicating with the queue. All processed receipts marked with the hint “Security mechanism not reachable” need to be sent to the queue with this maker.  | 1.3.45 |
| `0002` | **Training Receipt**  | 1.3.45 |
| `0004` | **IsVoid**<br /><br />Marks Receipt as Void to previous one. Mark lineitems also as IsVoid to signal clear data.  | 1.3.45 |
| `0008` | **Process as Handwritten Receipt**<br /><br />During a power outage, the Cash register will not work, and the merchant hands out handwritten receipts. These handwritten receipts need to be sent to the Security Mechanism by using this flag.  | 1.3.45 |
| `0010` | **IssuerIsSmallBusiness**<br /><br />Businesses below a country-specific size in revenue need not declare VAT.<br />With this marker, the receipt shows no VAT, all prices are gross, and a country-specific hint must be printed.  | 1.3.45 |
| `0020` | **ReceiverIsBusiness **<br /><br />Specific data need to be placed onto the receipt. | 1.3.45 |
| `0040` | **ReceiverIsKnown**<br /><br />Characteristics related to VAT taxes are given. For example, Name, Adress, VAT-ID, other local info.  | 1.3.45 |
| `0080` | **IsSaleInForeignCountry**<br /><br />  | 1.3.45 |
| `0100` | **IsReturn/IsRefund**<br /><br />Marks Receipt as Return of good or service. | 1.3.45 |
| `0800` | **Group by Position-Number / 100**<br /><br />100 = first position, 101 first subitem, 102 second subitem.<br />The sum of all chargeitems within a position must count toward the total receipt amount.<br />If the quantity and amount are 0,00, the quantity and amount will not be visualized for this line on the digital receipt. Independent if main our subitem.  | 1.3.45 |
| `8000` | **ReceiptRequest**<br /><br />If you don’t receive a response, try this flag first before taking any other action.<br />This will return a stored result for example in case of a timeout when cashregister calls queue. | 1.3.45 |


#### lll - local tagging/flag 

| **Value** | **Description** | **Middleware version** |
|-----------|-----------------|-------------------------|
|TBD|TBD|TBD|