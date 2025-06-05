---
slug: /poscreators/middleware-doc/italy/reference-tables/ftchargeitemcase
title: 'Type of service: ftChargeItemCase'
---

# Type of Service: ftChargeItemCase

This table expands on the values provided in the table [ftChargeItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-service-ftchargeitemcase), with country-specific values applicable to the Italian market.

## Format
_CCCC_vlll_gggg_NNSV_ 

#### v - version
version 2

#### V - VAT  
https://europa.eu/youreurope/business/taxation/vat/vat-rules-rates/index_en.htm 

| **Value**            | **Description**| **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0` | **Unknown type of service for IT**<br />With the help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms. | 1.3.45  |
| `1` | **Discounted-1 VAT rate**<br />(as of 1.1.2022, this is 10%). | 1.3.45 |
| `2` | **Discounted 2 VAT rate**<br />(as of 1.1.2022, this is calculated with 4%). | 1.3.45   |
| `3` | **Normal VAT rate**<br />(as of 1.1.2022, this is calculated with 22%). | 1.3.45  |
| `4` | **Super reduced 1 VAT rate**<br />(as of 1.1.2022, this is calculated with 5%). | 1.3.45 |
| `5` | **Super reduced 2 VAT rate**<br /> | 1.3.45 |
| `6` | **Parking VAT rate**<br />Reversal of tax liability. | 1.3.45 |
| `7` | **Zero VAT rate**<br />In the data, a VAT-rate can be indicated. | 1.3.45 |
| `8` | **Not Taxable**<br />For processing, see (`0x4954000000000001`) | 1.3.45 |


#### S - Type of Service  

| **Value**            | **Description**                                                                                        | **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0` | **Unknown type of service**<br />With the help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms. | 1.3.45  |
| `1` | **Delivery (supply of goods)**<br />| 1.3.45 |
| `2` | **Other service (supply of service)**<br />| 1.3.45   |
| `3` | **Tip**<br /> For owner use V=0 to 7, related to total amount <br /> For Employee use V=8, Not Taxable(as of 1.1.2022, this is calculated with 5%). | 1.3.45  |
| `4` | **Voucher**<br /> For Single-Use-Voucher use V=0 to 7<br />For Multi-Use-Voucher use V=8, Not Taxable<br />Voucher Sale is a positive (+) amount.<br />Voucher Redeem is a negative (-) amount.<br />IsVoid can be applied to reverse amounts.<br />Avoid to use this for Multi-Use-Voucher, use PayItem instead, with ShowInChargeItems flag. For Single-Use-Voucher, apply the ShowInPayItems flag to visualize it similar to payment and to keep the total amount unreduced. | 1.3.45 |
| `5` | **Catalog service**<br /> | 1.3.45 |
| `6` | **Not own sales / Agency business**<br />| 1.3.45 |
| `7` | **Own Consumption**<br />| 1.3.45 |
| `8` | **Grant**<br />For Unreal Grant use V=0 to 7<br />For Real Grant use V=8  |1.3.45| 
| `9` | **Receivable**<br />Receiveable creation is negative (-) amount<br />Receiveable reduction is positive (+) amount.<br />IsVoid can be applied to reverse amounts.<br />Avoid to use this, use PayItem instead.  |1.3.45|   
| `A` | **Cash Transfer**<br />Cash Transfer to till is positive (+) amount<br />Cash Transfer from till is negative (-) amount.<br />Only useable with V=8, Not Taxable. <br />IsVoid can be applied to reverse amounts|1.3.45|    

#### NN - nature of VAT  

| **Value**            | **Description**                                                                                        | **Spec. for Italian reg.** | **Middleware Version** |
| -------------------- | -------------- |  -------------- | ---------------------- |
| `00` | **usual VAT applies**<br />| | 1.3.45  |
| `10` | **Not Taxable**<br />1x can be used to specify more country specific details. For example, IGL|*NI (N3) marker mandatory<br />[10] not taxable - exports<br />[11] non-taxable - intra-community supplies<br />[12] non-taxable - transfers to San Marino<br />[13] non-taxable - transactions assimilated to export supplies<br />[14] non-taxable - following declarations of intent<br />[15] non-taxable - other operations which do not contribute to the formation of the ceiling | 1.3.45 |
| `20` | **Not Subject**<br />2x can be used to specify more country specific details.| *NS (N2) marker mandatory<br />[20] not subject to VAT pursuant to articles from 7 to 7-septies of Presidential Decree 633/72<br />[21] not subject, other cases| 1.3.45   |
| `30` | **Exempt**<br /> 3x| *ES (N4) marker mandatory<br />[30] exempt | 1.3.45  |
| `40` | **Margin scheme**<br /> Do not print/show VAT rate and amount on receipt/invoice.<br />4x can be used to specify more country specific details. | *RM (N5) marker mandatory<br />[40] margin scheme / VAT not shown on the invoice | 1.3.45 |
| `50` | **Reverse charge**<br /> 5x | *AL (N6) marker mandatory<br />[50] reverse charge - disposal of scrap and other salvage materials<br />[51] reverse charge - sale of gold and silver pursuant to law 7/2000 as well as used jewelery to OPO<br />[52] reverse charge - subcontracting in the construction sector<br />[53] reverse charge - sale of buildings<br />[54] reverse charge - supply of mobile phones<br />[55] reverse charge - supply of electronic products<br />[56] reverse charge - performance in the construction sector and related sectors<br />[57] reverse charge - energy sector transactions<br />[58] reverse charge - other cases | 1.3.45 |
| `60` | **VAT paid in other EU country** <br />6x| (N7) marker mandatory<br />[60] paid in another EU country (provision of telecommunications, broadcasting and electronic services pursuant to art. 7-octies, paragraph 1 letter a, b, art. 74-sexies of Presidential Decree 633/72) | 1.3.45 |
| `70` | **VAT distribution**<br />7x | *VI (VI) is a fiscal VAT (IVA) regime that certain retailers can adopt. It allows the global registration of the daily takings amount without distinguishing the individual VAT rates. It only ever applies to goods. | 1.3.45 |
| `80` | **Excluded**<br /> 8x| *EE (N1) marker mandatory<br />[80] excluded pursuant to art. 15 of Presidential Decree 633/72 | 1.3.45 |


#### lll - local taggin/flag

None

#### gggg - global tagging/flag 

| **Value**            | **Description**                                                                                        | **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0001` | **IsVoid**<br />Marks ChargeItem as Void previous position. Quantity and amount are inverted, related to original item. | 1.3.45  |
| `0002` | **IsReturn/IsRefund**<br />Marks ChargeItem as Return of good or service. Quantity and amount are inverted, related to original item. | 1.3.45 |
| `0004` | **Discount**<br />Marks ChargeItem as Discount/Extra for previous position. <br />Positive (+) amount is extra. <br />Negative (-) amount is discount<br />IsVoid or IsReturn/IsRefund will invert this behavior.| 1.3.45  |
| `0008` | **Downpayment**<br /> Marks ChargeItem as a downpayment.<br />Positive (+) amount is the creation of downpayment.<br />Negative (-) amount is reduction of downpayment.<br />IsVoid or IsReturn/IsRefund will invert this behavior. | 1.3.45 |
| `0010` | **Returnable**<br /> Marks ChargeItem as a returnable.<br />Positive (+) amount/quantity is handout.<br />Negative (-) amount/quantity is reverse.<br />IsVoid or IsReturn/IsRefund will invert this behavior.| 1.3.45 |
| `0020` | **TakeAway** <br />Marks ChargeItem as TakeAway item to prove special VAT application | 1.3.45 |
| `8000` | **ShowInPayments**<br />Visualize the item after Total Amount. This inverts amount and does not include the amount into the visualized total amount on the receipt.  | 1.3.45 |

## ftChargeItemCaseFlag
This table shows flags that can be added to each `ftChargeItemCase` with values applicable to the Italian market. 
