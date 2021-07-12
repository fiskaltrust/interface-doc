---
slug: /poscreators/middleware-doc/france/receipt-case-definitions
title: Receipt case definitions
---

## Receipt case definitions

#### Voucher (Service/Product)

Issuing a voucher is a process with the requirement of Article 88 of the law n ° 2015-1785 of December 29, 2015 of finances for 2016 and determines the time of sale.

#### Voucher (Value)

A voucher with a certain value constitutes a means of payment and its issuing is thus a process without a requirement of Article 88 of the law n ° 2015-1785 from December 29, 2015 of finances for 2016. Once a business transaction is made and is paid for by redeeming a voucher, it constitutes a process with the mentioned requirement - thus, (value) voucher can usually be found in the pay items block. If it is for technical reasons necessary to enter a (value) voucher obligations in the pay items block, then respective obligations should be transferred as `ftChargeItemCase`.

#### Agency Business

An agency business can be displayed with the `ftChargeItemCase` (`0x4652000000000007`).

#### Delivery Note

#### Tips
