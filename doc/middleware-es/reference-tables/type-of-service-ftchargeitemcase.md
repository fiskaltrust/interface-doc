---
slug: /poscreators/middleware-doc/spain/reference-tables/ftchargeitemcase
title: 'Type of service: ftChargeItemCase'
---

# Type of Service: ftChargeItemCase

This table expands on the values provided in the table [ftChargeItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-service-ftchargeitemcase), with country-specific values applicable to the Spanish market.


| **Value**            | **Description**                                                                                        | **Middleware Version** |
| -------------------- | -------------- | ---------------------- |
| `0x4553000000000000` | **Unknown type of service for ES**<br />With the help of the VAT-rates table saved within fiskaltrust.SecurityMechanisms, an allocation to standard /reduced-1 /reduced-2 / super-reduced/zero is attempted. | TBD  |
| `0x4553000000000001` | **Undefined type of service for ES reduced**<br />(as of 1.1.2022, this is calculated with 10%). | TBD   |
| `0x4553000000000003` | **Undefined type of service for ES normal**<br />(as of 1.1.2022, this is 21%. | TBD |
| `0x4553000000000004` | **Undefined type of service for ES special (super-reduced)**<br />Includes all rates that are not contained in the previous ones (as of 1.1.2022, this is 4%). | TBD |
| `0x4553000000000005` | **Undefined type of service for ES zero**<br />Includes data indicated with 0% sales tax and data where the sales tax is unknown, for example, about an outgoing invoice. Also, in cases where the sales tax should not be apparent, for example, in differential taxation, the data can be issued with this code. | TBD |
| `0x4553000000000006` | **Reverse charge**<br />Reversal of tax liability.                                                     | TBD |
| `0x4553000000000007` | **Not own sales**<br />In the data, a VAT-rate can be indicated.                                       | TBD |
| `0x4553000000000008` | **Delivery reduced-1**<br />For processing, see (`0x4553000000000001`)                                 | TBD |
| `0x4553000000000009` | **Delivery reduced-2**<br />For processing, see (`0x4553000000000002`)                                 | TBD |
| `0x455300000000000A` | **Delivery normal**<br />For processing, see (`0x4553000000000003`)                                    | TBD |
| `0x455300000000000B` | **Delivery special**<br />For processing, see (`0x4553000000000004`)                                   | TBD |
| `0x455300000000000C` | **Delivery zero**<br />For processing, see (`0x4553000000000005`)                                      | TBD |
| `0x455300000000000D` | **Other services reduced-1**<br />For processing, see (`0x4553000000000001`)                           | TBD |
| `0x455300000000000E` | **Other services reduced-2**<br />For processing, see (`0x4553000000000002`)                           | TBD |
| `0x455300000000000F` | **Other services normal**<br />For processing, see (`0x4553000000000003`)                              | TBD |
| `0x4553000000000010` | **Other services special**<br />For processing, see (`0x4553000000000004`)                             | TBD |
| `0x4553000000000011` | **Other services zero**<br />For processing, see (`0x4553000000000005`)                                | TBD |
| `0x4553000000000012` | **Catalogue services reduced-1**<br />For processing, see (`0x4553000000000001`)                       | TBD |
| `0x4553000000000013` | **Catalogue services reduced-2**<br />For processing, see (`0x4553000000000002`)                       | TBD |
| `0x4553000000000014` | **Catalogue services normal**<br />For processing, see (`0x4553000000000003`)                          | TBD |
| `0x4553000000000015` | **Catalogue services special**<br />For processing, see (`0x4553000000000004`)                         | TBD |
| `0x4553000000000016` | **Catalogue services zero**<br />For processing, see (`0x4553000000000005`)                            | TBD | 
| `0x4553000000000017` | **Own consumption reduced-1**<br />For processing, see (`0x4553000000000001`)                          | TBD |
| `0x4553000000000018` | **Own consumption reduced-2**<br />For processing, see (`0x4553000000000002`)                          | TBD |
| `0x4553000000000019` | **Own consumption normal**<br />For processing, see (`0x4553000000000003`)                             | TBD |
| `0x455300000000001A` | **Own consumption special**<br />For processing, see (`0x4553000000000004`)                            | TBD |
| `0x455300000000001B` | **Own consumption zero**<br />For processing, see (`0x4553000000000005`)                               | TBD |
| `0x455300000000001C` | **Prepayment reduced-1**<br />For processing, see (`0x4553000000000001`)                               | TBD |
| `0x455300000000001D` | **Prepayment reduced-2**<br />For processing, see (`0x4553000000000002`)                               | TBD |
| `0x455300000000001E` | **Prepayment normal**<br />For processing, see (`0x4553000000000003`)                                  | TBD |
| `0x455300000000001F` | **Prepayment special**<br />For processing, see (`0x4553000000000004`)                                 | TBD |
| `0x4553000000000020` | **Prepayment zero**<br />For processing, see (`0x4553000000000005`)                                    | TBD |
| `0x4553000000000021` | **Account of a third party/ third party name/ collection**<br />For processing, see (`0x4553000000000007`)| TBD |
| `0x4553000000000022` | **Obligation**                                                                                         | TBD |

## ftChargeItemCaseFlag
This table shows flags that can be added to each `ftChargeItemCase` with values applicable to the Spanish market. 

| Value              | Description              | Middleware-Version |
| ------------------ | ------------------------ | ------------------ |