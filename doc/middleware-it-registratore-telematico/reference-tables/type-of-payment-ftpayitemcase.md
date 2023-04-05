---
slug: /poscreators/middleware-doc/italy/reference-tables/ftpayitemcase
title: 'Type of Payment: ftPayItemCase'
---

# Type of Payment: ftPayItemCase

This table expands on the values provided in table [ftPayItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-payment-ftpayitemcase) with values applicable to the Italian market.

| **Value**            | **Description**                                                                                | **Middleware version** |
| -------------------- | ---------------------------------------------------------------------------------------------- | ---------------------- |
| `0x4954000000000000` | **Unknown payment type for IT**<br />This is handled like a cash payment in national currency. | 1.3.45                    |
| `0x4954000000000001` | **Cash payment in national currency**<br />cash                                                | 1.3.45                    |
| `0x4954000000000002` | **Cash payment in foreign currency**<br />cash                                                 | 1.3.45                    |
| `0x4954000000000003` | **Crossed cheque**<br />cash                                                                   | 1.3.45                    |
| `0x4954000000000004` | **Debit card payment**<br />noncash                                                            | 1.3.45                    |
| `0x4954000000000005` | **Credit card payment**<br />cash                                                              | 1.3.45                    |
| `0x4954000000000006` | **Voucher payment (coupon) - voucher by money value**<br />cash                                | 1.3.45                    |
| `0x4954000000000007` | **Online payment**<br />noncash                                                                | 1.3.45                    |
| `0x4954000000000008` | **Customer card payment**<br />noncash                                                         | 1.3.45                    |
| `0x4954000000000009` | **Other debit card**<br />noncash                                                              | 1.3.45                    |
| `0x495400000000000A` | **Other credit card**<br />cash                                                                | 1.3.45                    |
| `0x495400000000000B` | **Account receivable**<br />Delivery note/ settlement in foreign currency<br />internal        | 1.3.45                    |
| `0x495400000000000C` | **SEPA transfer**<br />noncash                                                                 | 1.3.45                   |
| `0x495400000000000D` | **Other transfer**<br />noncash                                                                | 1.3.45                   |
| `0x495400000000000E` | **Cash book expense**<br />internal                                                            | 1.3.45                    |
| `0x495400000000000F` | **Cash book contribution**<br />internal                                                       | 1.3.45                   |
| `0x4954000000000010` | **Levy**<br />internal                                                                         | 1.3.45                    |
| `0x4954000000000011` | **Internal/ material consumption**<br />Can be used for bill<br />internal                     | 1.3.45                   |
| `0x4954000000000012` | **Change**<br />tip<br />cash                                                                  | 1.3.45                    |
