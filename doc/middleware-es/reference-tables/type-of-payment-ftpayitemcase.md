---
slug: /poscreators/middleware-doc/spain/reference-tables/ftpayitemcase
title: 'Type of Payment: ftPayItemCase'
---

# Type of Payment: ftPayItemCase

This table expands on the values provided in table [ftPayItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-payment-ftpayitemcase) with values applicable to the Spanish market.

| **Value**            | **Description**                                                                                | **Middleware version** |
| -------------------- | ---------------------------------------------------------------------------------------------- | ---------------------- |
| `0x4553000000000000` | **Unknown payment type for ES**<br />This is handled like a cash payment in national currency. | TBD                    |
| `0x4553000000000001` | **Cash payment in national currency**<br />cash                                                | TBD                    |
| `0x4553000000000002` | **Cash payment in foreign currency**<br />cash                                                 | TBD                    |
| `0x4553000000000003` | **Crossed cheque**<br />cash                                                                   | TBD                    |
| `0x4553000000000004` | **Debit card payment**<br />noncash                                                            | TBD                    |
| `0x4553000000000005` | **Credit card payment**<br />cash                                                              | TBD                    |
| `0x4553000000000006` | **Voucher payment (coupon) - voucher by money value**<br />cash                                | TBD                    |
| `0x4553000000000007` | **Online payment**<br />noncash                                                                | TBD                    |
| `0x4553000000000008` | **Customer card payment**<br />noncash                                                         | TBD                    |
| `0x4553000000000009` | **Other debit card**<br />noncash                                                              | TBD                    |
| `0x455300000000000A` | **Other credit card**<br />cash                                                                | TBD                    |
| `0x455300000000000B` | **Account receivable**<br />Delivery note/ settlement in foreign currency<br />internal        | TBD                    |
| `0x455300000000000C` | **SEPA transfer**<br />noncash                                                                 | TBD                    |
| `0x455300000000000D` | **Other transfer**<br />noncash                                                                | TBD                    |
| `0x455300000000000E` | **Cash book expense**<br />internal                                                            | TBD                    |
| `0x455300000000000F` | **Cash book contribution**<br />internal                                                       | TBD                    |
| `0x4553000000000010` | **Levy**<br />internal                                                                         | TBD                    |
| `0x4553000000000011` | **Internal/ material consumption**<br />Can be used for bill<br />internal                     | TBD                    |
| `0x4553000000000012` | **Change**<br />tip<br />cash                                                                  | TBD                    |