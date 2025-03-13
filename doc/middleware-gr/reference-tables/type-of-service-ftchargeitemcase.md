---
slug: /poscreators/middleware-doc/greece/reference-tables/ftchargeitemcase
title: 'Type of service: ftChargeItemCase'
---

# Type of Service: ftChargeItemCase

This table expands on the values provided in the table [ftChargeItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-service-ftchargeitemcase), with country-specific values applicable to the Greek market.

## Format
_CCCC_vlll_gggg_NNSV_ 

#### v - version
version 2

#### V - VAT  
https://europa.eu/youreurope/business/taxation/vat/vat-rules-rates/index_en.htm 

| **Value**            | **Description**|
| -------------------- | -------------- | 
| `0` | **Unknown type of service for GR**<br />With the help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms. | 
| `1` | **Discounted-1 VAT rate**<br /> | 
| `2` | **Discounted 2 VAT rate**<br /> | 
| `3` | **Normal VAT rate**<br /> | 
| `4` | **Super reduced 1 VAT rate**<br /> |
| `5` | **Super reduced 2 VAT rate**<br /> | 
| `6` | **Parking VAT rate**<br /> |
| `7` | **Zero VAT rate**<br /> | 
| `8` | **Not Taxable**<br /> | 


#### S - Type of Service  

| **Value**            | **Description**                                                                                        | 
| -------------------- | -------------- |
| `0` | **Unknown type of service**<br />With the help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms. | 
| `1` | **Delivery (supply of goods)**<br />| 
| `2` | **Other service (supply of service)**<br />|
| `3` | **Tip**<br /> For owner use V=0 to 7, related to total amount <br /> For Employee use V=8, Not Taxable. | 1.3.67  |
| `4` | **Voucher**<br /> For Single-Use-Voucher use V=0 to 7<br />For Multi-Use-Voucher use V=8, Not Taxable<br />Voucher Sale is a positive (+) amount.<br />Voucher Redeem is a negative (-) amount.<br />IsVoid can be applied to reverse amounts.<br />Avoid to use this for Multi-Use-Voucher, use PayItem instead, with ShowInChargeItems flag. For Single-Use-Voucher, apply the ShowInPayItems flag to visualize it similar to payment and to keep the total amount unreduced. | 
| `5` | **Catalog service**<br /> | 
| `6` | **Not own sales / Agency business**<br />| 
| `7` | **Own Consumption**<br />| 
| `8` | **Grant**<br />For Unreal Grant use V=0 to 7<br />For Real Grant use V=8  | 
| `9` | **Receivable**<br />Receiveable creation is negative (-) amount<br />Receiveable reduction is positive (+) amount.<br />IsVoid can be applied to reverse amounts.<br />Avoid to use this, use PayItem instead.  |1.3.67|   
| `A` | **Cash Transfer**<br />Cash Transfer to till is positive (+) amount<br />Cash Transfer from till is negative (-) amount.<br />Only useable with V=8, Not Taxable. <br />IsVoid can be applied to reverse amounts|1.3.67|    

#### NN - nature of VAT  

TBD

#### lll - local taggin/flag

TBD

#### gggg - global tagging/flag 

| **Value**            | **Description**                                                                                        | 
| -------------------- | -------------- | 
| `0001` | **IsVoid**<br />Marks ChargeItem as Void previous position. Quantity and amount are inverted, related to original item. | 
| `0002` | **IsReturn/IsRefund**<br />Marks ChargeItem as Return of good or service. Quantity and amount are inverted, related to original item. | 
| `0004` | **Discount**<br />Marks ChargeItem as Discount/Extra for previous position. <br />Positive (+) amount is extra. <br />Negative (-) amount is discount<br />IsVoid or IsReturn/IsRefund will invert this behavior.| 1.3.67  |
| `0008` | **Downpayment**<br /> Marks ChargeItem as a downpayment.<br />Positive (+) amount is the creation of downpayment.<br />Negative (-) amount is reduction of downpayment.<br />IsVoid or IsReturn/IsRefund will invert this behavior. | 
| `0010` | **Returnable**<br /> Marks ChargeItem as a returnable.<br />Positive (+) amount/quantity is handout.<br />Negative (-) amount/quantity is reverse.<br />IsVoid or IsReturn/IsRefund will invert this behavior.| 
| `0020` | **TakeAway** <br />Marks ChargeItem as TakeAway item to prove special VAT application | 
| `8000` | **ShowInPayments**<br />Visualize the item after Total Amount. This inverts amount and does not include the amount into the visualized total amount on the receipt.  | 

## ftChargeItemCaseFlag
This table shows flags that can be added to each `ftChargeItemCase` with values applicable to the Greek market. 
