---
slug: /poscreators/middleware-doc/france/receipt-case-definitions
title: Receipt case definitions
---

## Receipt case definitions

#### Voucher (Service/Product)

Issuing a voucher is a process with the requirement of Article 88 of the law n ° 2015-1785 of December 29, 2015 of finances for 2016 and determines the time of sale.

#### Voucher (Value)

A voucher with a certain value constitutes a means of payment and its issuing is thus a process without a requirement of Article 88 of the law n ° 2015-1785 from December 29, 2015 of finances for 2016. Once a business transaction is made and is paid for by redeeming a voucher, it constitutes a process with the mentioned requirement - thus, (value) voucher can usually be found in the pay items block. If it is for technical reasons necessary to enter a (value) voucher obligations in the pay items block, then respective obligations should be transferred as ftChargeItemCase.

#### Agency Business

An agency business can be displayed with the ftChargeItemCase (`0x4652000000000007`).

#### Delivery Note

#### Tips

Tips are defined in the [General part](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/general/receipt-case-definitions#tips)

#### Duplicata

A duplicata or copy of a document is printed, this must be done as a separate document. The layout and the information contained is the same as for the original document. 
Starting August 1st 2023, a new anti-waste law is enforced, about the ban of systematic printing of the receipt. 

The general rule is that if a receipt is printed at the time of the transaction, then the receipt printed is the original.  

If the receipt is printed after the time of the transaction is considered a duplicata. 