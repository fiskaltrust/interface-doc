---
slug: /poscreators/middleware-doc/italy/reference-tables/ftchargeitemcase
title: 'Type of service: ftChargeItemCase'
---

# Type of Service: ftChargeItemCase

This table expands on the values provided in the table [ftChargeItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-service-ftchargeitemcase), with country-specific values applicable to the Italian market.


| **Value**            | **Description**                                                                                        | **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0x4954000000000000` | **Unknown type of service for IT**<br />With the help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms, an allocation to standard /reduced-1 /reduced-2 / super-reduced/zero is attempted. | 1.3.45  |
| `0x4954000000000001` | **Undefined type of service for IT normal**<br />(as of 1.1.2022, this is 22%). | 1.3.45 |
| `0x4954000000000002` | **Undefined type of service for IT reduced-1**<br />(as of 1.1.2022, this is calculated with 10%). | 1.3.45   |
| `0x4954000000000003` | **Undefined type of service for IT reduced-2**<br />(as of 1.1.2022, this is calculated with 5%). | 1.3.45  |
| `0x4954000000000004` | **Undefined type of service for IT special (super-reduced)**<br />Includes all rates that are not contained in the previous ones (as of 1.1.2022, this is 4%). | 1.3.45 |
| `0x4954000000000005` | **Undefined type of service for IT zero**<br />Includes data indicated with 0% sales tax and data where the sales tax is unknown, for example, about an outgoing invoice. Also, in cases where the sales tax should not be apparent, for example, in differential taxation, the data can be issued with this code. | 1.3.45 |
| `0x4954000000000006` | **Reverse charge**<br />Reversal of tax liability.                                                     | 1.3.45 |
| `0x4954000000000007` | **Not own sales**<br />In the data, a VAT-rate can be indicated.                                       | 1.3.45 |
| `0x4954000000000008` | **Delivery normal Vat 22%**<br />For processing, see (`0x4954000000000001`)                            | 1.3.45 |
| `0x4954000000000009` | **Delivery reduced-1 Vat 10%**<br />For processing, see (`0x4954000000000002`)                         | 1.3.45 |
| `0x495400000000000A` | **Delivery reduced-2 Vat 5%**<br />For processing, see (`0x4954000000000003`)                          | 1.3.45 |
| `0x495400000000000B` | **Delivery reduced special Vat 4%**<br />For processing, see (`0x4954000000000004`)                    | 1.3.45 |
| `0x495400000000000C` | **Delivery zero**<br />For processing, see (`0x4954000000000005`)                                      | 1.3.45 |
| `0x495400000000000D` | **Other services normal**<br />For processing, see (`0x4954000000000001`)                           | 1.3.45 |
| `0x495400000000000E` | **Other services reduced-1**<br />For processing, see (`0x4954000000000002`)                           | 1.3.45 |
| `0x495400000000000F` | **Other services reduced-2**<br />For processing, see (`0x4954000000000003`)                              | 1.3.45 |
| `0x4954000000000010` | **Other services special**<br />For processing, see (`0x4954000000000004`)                             | 1.3.45 |
| `0x4954000000000011` | **Other services zero**<br />For processing, see (`0x4954000000000005`)                                | 1.3.45 |
| `0x4954000000000012` | **Catalogue services normal**<br />For processing, see (`0x4954000000000001`)                       | 1.3.45 |
| `0x4954000000000013` | **Catalogue services reduced-1**<br />For processing, see (`0x4954000000000002`)                       | 1.3.45 |
| `0x4954000000000014` | **Catalogue services reduced-2**<br />For processing, see (`0x4954000000000003`)                          | 1.3.45 |
| `0x4954000000000015` | **Catalogue services special**<br />For processing, see (`0x4954000000000004`)                         | 1.3.45 |
| `0x4954000000000016` | **Catalogue services zero**<br />For processing, see (`0x4954000000000005`)                            | 1.3.45 | 
| `0x4954000000000017` | **Own consumption normal**<br />For processing, see (`0x4954000000000001`)                          | 1.3.45 |
| `0x4954000000000018` | **Own consumption reduced-1**<br />For processing, see (`0x4954000000000002`)                          | 1.3.45 |
| `0x4954000000000019` | **Own consumption reduced-2**<br />For processing, see (`0x4954000000000003`)                             | 1.3.45 |
| `0x495400000000001A` | **Own consumption special**<br />For processing, see (`0x4954000000000004`)                            | 1.3.45 |
| `0x495400000000001B` | **Own consumption zero**<br />For processing, see (`0x4954000000000005`)                               | 1.3.45 |
| `0x495400000000001C` | **Prepayment normal**<br />For processing, see (`0x4954000000000001`)                               | 1.3.45 |
| `0x495400000000001D` | **Prepayment reduced-1**<br />For processing, see (`0x4954000000000002`)                               | 1.3.45 |
| `0x495400000000001E` | **Prepayment reduced-2**<br />For processing, see (`0x4954000000000003`)                                  | 1.3.45 |
| `0x495400000000001F` | **Prepayment special**<br />For processing, see (`0x4954000000000004`)                                 | 1.3.45 |
| `0x4954000000000020` | **Prepayment zero**<br />For processing, see (`0x4954000000000005`)                                    | 1.3.45 |
| `0x4954000000000021` | **Account of a third party/ third party name/ collection**<br />For processing, see (`0x4954000000000007`)| 1.3.45 |
| `0x4954000000000022` | **Obligation**                                                                                         | 1.3.45 |
| `0x4954000000000023` | **Discount/Surcharge negativ value is discount, positiv value surcharge: normal Vat 22%**<br /> | 1.3.45 |
| `0x4954000000000024` | **Discount/Surcharge negativ value is discount, positiv value surcharge: reduced-1 Vat 10%**<br /> | 1.3.45 |
| `0x4954000000000025` | **Discount/Surcharge negativ value is discount, positiv value surcharge: reduced-2 Vat  5%**<br /> | 1.3.45 |
| `0x4954000000000026` | **Discount/Surcharge negativ value is discount, positiv value surcharge: special Vat  4%**<br /> | 1.3.45 |
| `0x4954000000000027` | **Discount/Surcharge negativ value is discount, positiv value surcharge: zero Vat  0%**<br /> | 1.3.45 |
| `0x4954000000000028` | **Coupon sales Single use voucher: normal Vat 22%**<br /> | 1.3.47-rc1 |
| `0x4954000000000029` | **Coupon sales Single use voucher: reduced-1 Vat 10%**<br /> | 1.3.47-rc1 |
| `0x4954000000000030` | **Coupon sales Single use voucher: reduced-2 Vat  5%**<br /> | 1.3.47-rc1|
| `0x4954000000000031` | **Coupon sales Single use voucher: special Vat  4%**<br /> | 1.3.47-rc1 |
| `0x4954000000000032` | **Coupon sales Single use voucherv: zero Vat  0%**<br /> | 1.3.47-rc1 |
| `0x4954000000000033` | **Coupon redeem Single use voucher: normal Vat 22%**<br /> | 1.3.47-rc1 |
| `0x4954000000000034` | **Coupon redeem Single use voucher: reduced-1 Vat 10%**<br /> | 1.3.47-rc1 |
| `0x4954000000000035` | **Coupon redeem Single use voucher: reduced-2 Vat  5%**<br /> | 1.3.47-rc1|
| `0x4954000000000036` | **Coupon redeem Single use voucher: special Vat  4%**<br /> | 1.3.47-rc1 |
| `0x4954000000000037` | **Coupon redeem Single use voucherv: zero Vat  0%**<br /> | 1.3.47-rc1 |

## ftChargeItemCaseFlag
This table shows flags that can be added to each `ftChargeItemCase` with values applicable to the Italian market. 

| **Value**            | **Description**                                                                                        | **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0x4954000000010000` | On void receipt, Operationtype: Acconto | 1.3.45 |
| `0x4954000000020000` | On void receipt, Operationtype: Free Of Charge | 1.3.45 |
| `0x4954000000030000` | On void receipt, Operationtype: Single Use Voucher | 1.3.45 |
