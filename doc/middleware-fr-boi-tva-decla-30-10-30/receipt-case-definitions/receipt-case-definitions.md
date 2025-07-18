---
slug: /poscreators/middleware-doc/france/receipt-case-definitions
title: Receipt case definitions
---

## Receipt case definitions

#### Voucher (Service/Product)

Issuing a voucher is a process with the requirement of Article 88, law n°2015-1785 of December 29<sup>th</sup> 2015 of finances for 2016 and determines the time of sale.

#### Voucher (Value)

A voucher with a certain value constitutes a means of payment and its issuing is thus a process without a requirement of Article 88, law n°2015-1785 from December 29<sup>th</sup> 2015 of finances for 2016. Once a business transaction is made and is paid for by redeeming a voucher, it constitutes a process with the mentioned requirement - thus, (value) voucher can usually be found in the pay items block. If it is for technical reasons necessary to enter a (value) voucher obligations in the pay items block, then respective obligations should be transferred as ftChargeItemCase.

#### Agency Business

An agency business can be displayed with the ftChargeItemCase (`0x4652000000000007`).

#### Delivery Note

#### Tips

Tips are defined in the [General part](../../general/receipt-case-definitions/receipt-case-definitions.md#tips)

#### Duplicata

A duplicata or copy of a document is printed, this must be done as a separate document. The layout and the information contained is the same as for the original document. 
Starting August 1<sup>st</sup> 2023, a new anti-waste law is enforced, about the ban of systematic printing of the receipt. 

##### General Rules:

- If a receipt is printed at the time of the transaction, it is considered the original.
- If a receipt is printed after the transaction, it is classified as a duplicata.

These regulations also apply to digital formats such as PDFs.

#### Advance deposit invoice (Facture d'accompte)

<!-- markdown-link-check-disable-next-line -->
When a deposit or prepayment is made, VAT must be applied immediately, even if the goods or services have not yet been delivered. This is stated in [Article 269 of the General Tax Code (CGI)](https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000044983827#:~:text=La%20taxe%20est%20exigible%20%3A,%C3%A0%20concurrence%20du%20montant%20encaiss%C3%A9.). This means that a deposit invoice must be issued at the time the payment is made. 
Be aware that different sectors (e.g.construction) may have specific rules for deposits and their invoices.
