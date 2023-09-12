---
slug: /poscreators/middleware-doc/italy/reference-tables/ftchargeitemcase
title: 'Type of service: ftChargeItemCase'
---

# Type of Service: ftChargeItemCase

This table expands on the values provided in the table [ftChargeItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-service-ftchargeitemcase), with country-specific values applicable to the Italian market.

## Format
_CCCC_vlll_gggg_NNSV_ 


#### V - VAT  
https://europa.eu/youreurope/business/taxation/vat/vat-rules-rates/index_en.htm 
| **Value**            | **Description**                                                                                        | **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0` | **Unknown type of service for IT**<br />With the help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms. | 1.3.45  |
| `1` | **Discounted-1 VAT rate**<br />(as of 1.1.2022, this is 22%). | 1.3.45 |
| `2` | **Discounted 2 VAT rate**<br />(as of 1.1.2022, this is calculated with 10%). | 1.3.45   |
| `3` | **Normal VAT rate**<br />(as of 1.1.2022, this is calculated with 5%). | 1.3.45  |
| `4` | **Super reduced 1 VAT rate**<br />I| 1.3.45 |
| `5` | **Super reduced 2 VAT rate**<br /> | 1.3.45 |
| `6` | **Parking VAT rate**<br />Reversal of tax liability.                                                     | 1.3.45 |
| `7` | **Zero VAT rate**<br />In the data, a VAT-rate can be indicated.                                       | 1.3.45 |
| `8` | **Not Taxable**<br />For processing, see (`0x4954000000000001`)                            | 1.3.45 |


#### S - Type of Service  

| **Value**            | **Description**                                                                                        | **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0` | **Unknown type of service**<br />With the help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms. | 1.3.45  |
| `1` | **Delivery (supply of goods)**<br />| 1.3.45 |
| `2` | **Other service (supply of service)**<br />| 1.3.45   |
| `3` | **Tip**<br /> For owner use V=0 to 7, related to total amount <br /> For Employee use V=8, Not Taxable(as of 1.1.2022, this is calculated with 5%). | 1.3.45  |
| `4` | **Voucher**<br /> For Single-Use-Voucher use V=0 to 7<br />For Multi-Use-Voucher use V=8, Not Taxable<br />Voucher Sales is positive (+) amount.<br />Voucher Redeem is negative (-) amount.<br />IsVoid can be applied to reverse amounts. <br />Avoid to use this for Multi-Use-Voucher, use PayItem instead, with ShowInChargeItems flag. For Single-Use-Voucher apply ShowInPayItems flag to visualize it similar to a payment and to keep total amount unreduced. | 1.3.45 |
| `5` | **Catalog service**<br /> | 1.3.45 |
| `6` | **Not own sales / Agency business**<br />| 1.3.45 |
| `7` | **Own Consumption**<br />| 1.3.45 |
| `8` | **Grant**<br />For Unreal Grant use V=0 to 7<br />For Real Grant use V=8  |1.3.45| 
| `9` | **Receivable**<br />Receiveable creation is negative (-) amount<br />Receiveable reduction is positive (+) amount.<br />IsVoid can be applied to reverse amounts.<br />Avoid to use this, use PayItem instead.  |1.3.45|   
| `A` | **Cash Transfer**<br />Cash Transfer to till is positive (+) amount<br />Cash Transfer from till is negative (-) amount.<br />Only useable with V=8, Not Taxable. <br />IsVoid can be applied to reverse amounts|1.3.45|    

#### NN - nature of VAT  

| **Value**            | **Description**                                                                                        | **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `00` | **usual VAT applies**<br />| 1.3.45  |
| `10` | **Not Taxable**<br />1x can be used to specify more country specific details. For example, IGL| 1.3.45 |
| `20` | **Not Subject**<br />2x can be used to specify more country specific details.| 1.3.45   |
| `30` | **Exempt**<br /> 3x| 1.3.45  |
| `40` | **Margin scheme**<br /> Do not print/show VAT rate and amount on receipt/invoice.<br />4x can be used to specify more country specific details. | 1.3.45 |
| `50` | **Reverse charge**<br /> 5x | 1.3.45 |
| `60` | **VAT paid in other EU country** <br />6x| 1.3.45 |
| `70` | **VAT distribution**<br />7x | 1.3.45 |
| `80` | **Excluded**<br /> 8x| 1.3.45 |


#### lll - local taggin/flag

TBD

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
