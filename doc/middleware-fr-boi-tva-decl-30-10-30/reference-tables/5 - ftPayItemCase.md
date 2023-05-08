---
slug: /poscreators/middleware-doc/france/reference-tables
title: Type of Payment: ftPayItemCase
---

# Reference tables

## Type of Payment: ftPayItemCase

The `ftPayItemCase` defines the type of payment within the pay items block and how the fiskaltrust.SecurityMechanism processes individual payment of the receipt.

| **Value**            | **Description**                                                                                                                    | **Middleware Version** |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------|------------------------|
| `0x4652000000000000` | **Default value**<br />Unknown payment type: Automatic processing through the fiskaltrust.SecurityMechanism settings is attempted. | 1.2                    |
| `0x4652000000000000` | **Unknown payment type for FR**<br />This is handled like a cash payment in national currency.                                     | 1.2                    |
| `0x4652000000000001` | **Cash payment in national currency**<br />cash                                                                                    | 1.2                    |
| `0x4652000000000002` | **Cash payment in foreign currency**<br />cash                                                                                     | 1.2                    |
| `0x4652000000000003` | **Crossed cheque**<br />cash                                                                                                       | 1.2                    |
| `0x4652000000000004` | **Debit card payment**<br />noncash                                                                                                | 1.2                    |
| `0x4652000000000005` | **Credit card payment**<br />cash                                                                                                  | 1.2                    |
| `0x4652000000000006` | **Voucher payment (coupon) - voucher by money value**<br />cash                                                                    | 1.2                    |
| `0x4652000000000007` | **Online payment**<br />noncash                                                                                                    | 1.2                    |
| `0x4652000000000008` | **Customer card payment**<br />noncash                                                                                             | 1.2                    |
| `0x4652000000000009` | **Other debit card**<br />noncash                                                                                                  | 1.2                    |
| `0x465200000000000A` | **Other credit card**<br />cash                                                                                                    | 1.2                    |
| `0x465200000000000B` | **Account receivable**<br />Delivery note/ settlement in foreign currency<br />internal                                            | 1.2                    |
| `0x465200000000000C` | **SEPA transfer**<br />noncash                                                                                                     | 1.2                    |
| `0x465200000000000D` | **Other transfer**<br />noncash                                                                                                    | 1.2                    |
| `0x465200000000000E` | **Cash book expense**<br />internal                                                                                                | 1.2                    |
| `0x465200000000000F` | **Cash book contribution**<br />internal                                                                                           | 1.2                    |
| `0x4652000000000010` | **Levy**<br />internal                                                                                                             | 1.2                    |
| `0x4652000000000011` | **Internal/ material consumption**<br />Can be used for bill<br />internal                                                         | 1.2                    |
| `0x4652000000000012` | **Change**<br />tip<br />cash                                                                                                      | 1.2                    |

<span id="_Toc527986688" class="anchor"></span>

*Table 36. Type of Payment: ftPayItemCase (FR - BOI-TVA-DECL 30-10-30)*