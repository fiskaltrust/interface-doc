---
slug: /poscreators/middleware-doc/italy/reference-tables/ftpayitemcase
title: 'Type of Payment: ftPayItemCase'
---

# Type of Payment: ftPayItemCase

This table expands on the values provided in table [ftPayItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-payment-ftpayitemcase) with values applicable to the Italian market.

## Format

_CCCC_vlll_gggg_xxPP_ 

#### v - version
version 2

#### PP - payment type
| **Value**            | **Description**                                                                                | **Middleware version** |
| -------------------- | ---------------------------------------------------------------------------------------------- | ---------------------- |
| `00` | **Unknown payment type for IT**<br />This is handled like a cash payment in national currency. | 1.3.45                    |
| `01` | **Cash payment**<br />cash                                                | 1.3.45                    |
| `02` | **NonCash**<br />cash                                                 | 1.3.45                    |
| `03` | **Crossed cheque**<br />cash                                                                   | 1.3.45                    |
| `04` | **Debit card payment**<br />cash                                                            | 1.3.45                    |
| `05` | **Credit card payment**<br />cash                                                              | 1.3.45                    |
| `06` | **Voucher payment (coupon) - voucher by money value**<br />cash                                | 1.3.45                    |
| `07` | **Online payment**<br />noncash                                                                | 1.3.45                    |
| `08` | **Loyalty program Customer card payment**<br />|1.3.45|
| `09` | **Accounts receivable**<br />| 1.3.45                    |
| `0A` | **SEPA transfer**<br />| 1.3.45                    |
| `0B` | **Other Bank transfer**<br />| 1.3.45                    |
| `0C` | **Transfer to Cashbook / Vault / Owner / Employee**<br />Positive (+) amount contributes to cashbox/vault. This higher the amount in cashbox/vault.<br />Negative (-) amount lowers the amount in cashbox/vault. |1.3.45|
| `0D` | **Internal / Material consumption**<br />| 1.3.45|
| `0E` | **Grant**<br />| 1.3.45|
| `0F` | **Ticket Restaurant / (Sodexo, edenred, usw.)**<br />| 1.3.45|

#### v - version
version 2

#### gggg - global tagging/flag
| **Value**            | **Description**                                                                                | **Middleware version** |
| -------------------- | ---------------------------------------------------------------------------------------------- | ---------------------- |
| `0001` | **IsVoid**<br />Marks PayItem as Void previous position. Quantity and amount are inverted, related to original item. <br />IsVoid is used in cases where the exchange of money has not been executed yet. | 1.3.45|
| `0002` | **IsReturn/IsRefund**<br />Marks PayItem as Return of good or service. Quantity and amount are inverted, related to original item.<br />IsReturn/IsRefund  is used in cases where the exchange of money has been executed already.| 1.3.45|
| `0004` |**(reserved)**<br />| 1.3.45|
| `0008` |**Downpayment**<br />Marks PayItem as a downpayment. <br />Positive (+) amount is reduction of downpayment. <br/>Negative (-) amount is creation of downpayment.| 1.3.45|
| `0010` | **IsForeignCurrency**<br />Amount is still in EUR, at the moment of acceptance. ftPayItemData requires two data elements with “foreignCurrencySymbol” and “foreignCurrencyAmount” to persist data for daily closing and later bookkeeping transactions| 1.3.45|
| `0020` | **IsChange**<br />Usually contains a negative (-) amount.<br /> (IsVoid => can be inverted)| 1.3.45                    |
| `0040` | **IsTip**<br />Must be a negative (-) amount to flow out of payment method.<br />ShowInChargeItems flag can be used to raise the total amount by the tip amount, to have a more convenient visualization.| 1.3.45                    |
| `0080` | **IsDigital/IsElectronic**<br />Electronic money, digital money  | 1.3.45                    |
| `0100` | **IsInterface/AmountVerified**<br />Was verified by interface, automated amount transfer | 1.3.45                    |
| `8000` | **ShowInChargeItems**<br />Visualize the item before Total Amount. This inverts amount and does include the amount into the visualized total amount on the receipt. |1.3.45|