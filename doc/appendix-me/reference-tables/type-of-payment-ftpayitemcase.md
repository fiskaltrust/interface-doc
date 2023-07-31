---
slug: /poscreators/middleware-doc/montenegro/reference-tables/ftpayitemcase
title: 'Type of Payment: ftPayItemCase'
---

# Type of Payment: ftPayItemCase

This table expands on the values provided in table [ftPayItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-payment-ftpayitemcase) with values applicable to the Montenegrin market.

| **Value**  | **Description** | **Payment type in CIS** | **Middleware version** |
|---|---|---|---|
| `0x4D45000000000000` | Unknown payment type for ME<br />This is handled like a cash payment in national currency. | BANKNOTE | 1.3- |
| `0x4D45000000000001` | Cash payment in national currency | BANKNOTE | 1.3- |
| `0x4D45000000000002` | Cash payment in foreign currency | BANKNOTE | 1.3-  |
| `0x4D45000000000003` | Crossed cheque | OTHER | 1.3-  |
| `0x4D45000000000004` | Debit card payment with a card issued to a natural person | CARD | 1.3- |
| `0x4D45000000000005` | Credit card payment with a card issued to a natural person | CARD | 1.3- |
| `0x4D45000000000006` | Debit card payment with a card issued to a taxpayer/non-natural person | BUSINESSCARD | 1.3- |
| `0x4D45000000000007` | Credit card payment with a card issued to a taxpayer/non-natural person | BUSINESSCARD | 1.3- |
| `0x4D45000000000008` | Online payment | OTHER | 1.3- |
| `0x4D45000000000009` | Customer card payment (gift cards and similar prepaid cards) | COMPANY | 1.3- |
| `0x4D4500000000000A` | SEPA transfer   | OTHER | 1.3-  |
| `0x4D4500000000000B` | Other bank transfer | OTHER | 1.3- |
| `0x4D4500000000000C` | Internal / material consumption | - | 1.3- |
| `0x4D4500000000000D` | Change in national currency | BANKNOTE | 1.3- |
| `0x4D4500000000000E` | Change in foreign curreny | BANKNOTE | 1.3- |
| `0x4D4500000000000F` | One-time voucher | SVOUCHER | 1.3- |
| `0x4D45000000000010` | Invoice to be paid in summary invoice (cash) | ORDER | 1.3- |
| `0x4D45000000000011` | Invoice to be paid in summary invoice (non-cash) | ORDER | 1.3- |
| `0x4D45000000000012` | Advance payment | ADVANCE | 1.3- |
| `0x4D45000000000013` | Transaction account | ACCOUNT | 1.3- |
| `0x4D45000000000014` | Factoring | FACTORING | 1.3- |
| `0x4D45000000000015` | Other non-cash payment types | OTHER | 1.3- |
| `0x4D45000000000016` | Other cash payment types | OTHER-CASH | 1.3- |

