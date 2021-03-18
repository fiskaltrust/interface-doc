---
slug: /poscreators/middleware-doc/general/receipt-sequences
title: Receipt sequences
---

# Receipt sequences

In the chapter [Cash register integration](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/general/cash-register-integration#receipt-creation-process), the creation of single receipts using either implicit and/or explicit flow has been described.

In this chapter, the options to connect single receipts to receipt sequences for integrating complex business cases are described.

## Referencing previous receipts within a queue

You can use [cbReceiptReference](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/germany/data-structures#single-fields) to connect requests representing a business action:

![referencing-previous-receipts](images/referencing-previous-receipts.png)
Two friends are having a beer in a bar.  Because it is German beer, they are ordering another one. They pay with one bill.

## Splitting receipts

You can use [cbReceiptPreviousReference](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/germany/data-structures#single-fields) to point to a cbReceiptReference of a previous request to split or void a receipt:

<img src="images/splitting-receipts.png" alt="splitting-receipts" style="zoom:50%;" />

Two friends are having a beer in a bar.  Each of them is paying his own consumption. Therefore, the receipt has to be split.

## Merging receipts

You can merge receipts by combining [cbReceiptReference and cbReceiptPreviousReference](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/germany/data-structures#single-fields):

![merging-receipts](images/merging-receipts.png)

Two friends are having a beer in a bar. One of them has birthday. To celebrate that, he invites the guests on the table next to them to pay what they have ordered and consumed so far. Therefore, their receipt has to be merged with the other receipt.

## Referencing receipts of external queues or external Systems