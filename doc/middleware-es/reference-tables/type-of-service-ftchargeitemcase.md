---
slug: /poscreators/middleware-doc/spain/reference-tables/ftchargeitemcase
title: 'Type of service: ftChargeItemCase'
---

# Type of Service: ftChargeItemCase

This table expands on the values provided in the table [ftChargeItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-service-ftchargeitemcase), with country-specific values applicable to the Spanish market.

## Format
_CCCC_vlll_gggg_NNSV_ 

#### v - version
version 2

#### V - VAT  
https://europa.eu/youreurope/business/taxation/vat/vat-rules-rates/index_en.htm 

| **Value**            | **Description**| **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0` | **Unknown type of service for ES**<br />With the help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms. | 1.3.67  |
| `1` | **Discounted-1 VAT rate**<br />(as of 1.1.2022, this is 10%). | 1.3.67 |
| `2` | **Discounted 2 VAT rate**<br />(as of 1.1.2022, this is calculated with 5%). | 1.3.67   |
| `3` | **Normal VAT rate**<br />(as of 1.1.2022, this is calculated with 22%). | 1.3.67  |
| `4` | **Super reduced 1 VAT rate**<br /> | 1.3.67 |
| `5` | **Super reduced 2 VAT rate**<br /> | 1.3.67 |
| `6` | **Parking VAT rate**<br />Reversal of tax liability. | 1.3.67 |
| `7` | **Zero VAT rate**<br />In the data, a VAT-rate can be indicated. | 1.3.67 |
| `8` | **Not Taxable**<br />For processing, see (`0x4553000000000001`) | 1.3.67 |


#### S - Type of Service  

| **Value**            | **Description**                                                                                        | **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0` | **Unknown type of service**<br />With the help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms. | 1.3.67  |
| `1` | **Delivery (supply of goods)**<br />| 1.3.67 |
| `2` | **Other service (supply of service)**<br />| 1.3.67   |
| `3` | **Tip**<br /> For owner use V=0 to 7, related to total amount <br /> For Employee use V=8, Not Taxable(as of 1.1.2022, this is calculated with 5%). | 1.3.67  |
| `4` | **Voucher**<br /> For Single-Use-Voucher use V=0 to 7<br />For Multi-Use-Voucher use V=8, Not Taxable<br />Voucher Sale is a positive (+) amount.<br />Voucher Redeem is a negative (-) amount.<br />IsVoid can be applied to reverse amounts.<br />Avoid to use this for Multi-Use-Voucher, use PayItem instead, with ShowInChargeItems flag. For Single-Use-Voucher, apply the ShowInPayItems flag to visualize it similar to payment and to keep the total amount unreduced. | 1.3.67 |
| `5` | **Catalog service**<br /> | 1.3.67 |
| `6` | **Not own sales / Agency business**<br />| 1.3.67 |
| `7` | **Own Consumption**<br />| 1.3.67 |
| `8` | **Grant**<br />For Unreal Grant use V=0 to 7<br />For Real Grant use V=8  |1.3.67| 
| `9` | **Receivable**<br />Receiveable creation is negative (-) amount<br />Receiveable reduction is positive (+) amount.<br />IsVoid can be applied to reverse amounts.<br />Avoid to use this, use PayItem instead.  |1.3.67|   
| `A` | **Cash Transfer**<br />Cash Transfer to till is positive (+) amount<br />Cash Transfer from till is negative (-) amount.<br />Only useable with V=8, Not Taxable. <br />IsVoid can be applied to reverse amounts|1.3.67|    

#### NN - nature of VAT  

| **Value**            | **Description**                                                                                        | **Spec. for Spanish reg.** | **Middleware Version** |
| -------------------- | -------------- |  -------------- | ---------------------- |
| `00` | **usual VAT applies**<br />| | 1.3.67  |
| `20` | **Not Subject**<br />2x can be used to specify more country specific details.| *NS (N2) marker mandatory<br />[20] not subject by aticles 7 and 14<br />[21] not subject, location rules| 1.3.67   |
| `30` | **Exempt**<br /> 3x| *ES (N4) marker mandatory<br />[30] Exempt by article 20<br />[31] Exempt by article 21<br />[32] Exempt by article 22<br />[33] Exempt by article 23 and 24<br />[34] Exempt by article 25<br />[35] Exempt, other cases | 1.3.67  |
| `50` | **Reverse charge**<br /> 5x | *AL (N6) marker mandatory<br />[50] reverse charge | 1.3.67 |


#### lll - local taggin/flag

TBD

#### gggg - global tagging/flag 

| **Value**            | **Description**                                                                                        | **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0001` | **IsVoid**<br />Marks ChargeItem as Void previous position. Quantity and amount are inverted, related to original item. | 1.3.67  |
| `0002` | **IsReturn/IsRefund**<br />Marks ChargeItem as Return of good or service. Quantity and amount are inverted, related to original item. | 1.3.67 |
| `0004` | **Discount**<br />Marks ChargeItem as Discount/Extra for previous position. <br />Positive (+) amount is extra. <br />Negative (-) amount is discount<br />IsVoid or IsReturn/IsRefund will invert this behavior.| 1.3.67  |
| `0008` | **Downpayment**<br /> Marks ChargeItem as a downpayment.<br />Positive (+) amount is the creation of downpayment.<br />Negative (-) amount is reduction of downpayment.<br />IsVoid or IsReturn/IsRefund will invert this behavior. | 1.3.67 |
| `0010` | **Returnable**<br /> Marks ChargeItem as a returnable.<br />Positive (+) amount/quantity is handout.<br />Negative (-) amount/quantity is reverse.<br />IsVoid or IsReturn/IsRefund will invert this behavior.| 1.3.67 |
| `0020` | **TakeAway** <br />Marks ChargeItem as TakeAway item to prove special VAT application | 1.3.67 |
| `8000` | **ShowInPayments**<br />Visualize the item after Total Amount. This inverts amount and does not include the amount into the visualized total amount on the receipt.  | 1.3.67 |

## ftChargeItemCaseFlag
This table shows flags that can be added to each `ftChargeItemCase` with values applicable to the Spanish market. 
