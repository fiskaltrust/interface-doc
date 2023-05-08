---
slug: /poscreators/middleware-doc/austria/reference-tables
title: Type of Payment: ftPayItemCase
---

### Type of Payment: ftPayItemCase

This table expands on the values provided in the table ["Type of Payment: ftPayItemCase"](../../general/reference-tables/reference-tables.md#t-type-of-payment-ftpayitemcase-90) with values applicable to the Austrian market.

| **Value**            | **Description**                                                                                                                   | **Middleware-Version** |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------|---------------------|
| `0x4154000000000000` | "default value"<br />unknown payment type: automatic processing through the fiskaltrust.SecurityMechanisms settings is attempted. | 1.0               |
| `0x4154000000000000` | "unknown payment type for AT"<br />This is handled like a cash payment in national currency.                                      | 1.0             |
| `0x4154000000000001` | "cash payment in national currency"                                                                                               | 1.0               |
| `0x4154000000000002` | "cash payment in foreign currency"                                                                                                | 1.0               |
| `0x4154000000000003` | "crossed cheque"                                                                                                                  | 1.0               |
| `0x4154000000000004` | "debit card payment"                                                                                                              | 1.0               |
| `0x4154000000000005` | "credit card payment"                                                                                                             | 1.0               |
| `0x4154000000000006` | "voucher payment (coupon)"                                                                                                        | 1.0               |
| `0x4154000000000007` | "online payment"                                                                                                                  | 1.0               |
| `0x4154000000000008` | "customer card payment"                                                                                                           | 1.0               |
| `0x4154000000000009` | "other debit card"                                                                                                                | 1.0               |
| `0x415400000000000A` | "other credit card"                                                                                                               | 1.0               |
| `0x415400000000000B` | "account receivable"<br />delivery note/ settlement in foreign currency                                                           | 1.0               |
| `0x415400000000000C` | "SEPA transfer"                                                                                                                   | 1.0            |
| `0x415400000000000D` | "other transfer"                                                                                                                  | 1.0               |
| `0x415400000000000E` | "cash book expense"                                                                                                               | 1.0               |
| `0x415400000000000F` | "cash book contribution"                                                                                                          | 1.0               |
| `0x4154000000000010` | "levy"<br />AT: Anzahlung                                                                                                         | 1.0               |
| `0x4154000000000011` | "internal/ material consumption"                                                                                                  | 1.0               |
| `0x4154000000000012` | "change"<br />tip                                                                                                                 | 1.0               |

<span id="_Toc527986677" class="anchor"></span>

*Table 25. Type of Payment: ftPayItemCase (AT - RKSVO)*
