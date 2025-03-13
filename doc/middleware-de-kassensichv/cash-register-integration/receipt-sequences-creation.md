---
slug: /poscreators/middleware-doc/germany/receipt-sequences-creation
title: Receipt sequences creation
---

# Receipt sequences creation

In the chapter [Single receipt creation](single-receipt-creation.md), the creation of single receipts using either implicit and/or explicit flow has been described.

In this chapter, we will describe how to connect those single receipts to receipt sequences to integrate complex business cases.

### Why and when is this needed?

Suppose orders, delivery notes, invoices and payments are being processed at different times, and the electronic recording system processes the business action not as a whole but in separate processes. 

In that case, the business activities and other activities **must be traceable in their creation and processing**, and a unique identification number for the business action must exist.
The same applies if different electronic recording systems are used in the course of the business action. 

More details on the legal basis you can find [here](https://docs.fiskaltrust.cloud/docs/product-description/germany/products-and-services/legal-basis).

## Referencing previous actions within a queue

#### Use case examples

- Multiple (long lasting) transactions/orders/consumptions before payment is made (gastronomy, ...)
- NFC-based/membership-based order solutions (e.g. accommodation/wellness, employee cards)
- Down payments

#### How to use

Connect requests representing a business action with ['cbReceiptReference'](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/germany/data-structures#single-fields).

#### Workflow example

![referencing-previous-receipts](media/referencing-previous-receipts.svg)
([click to expand](media/referencing-previous-receipts.svg))

Two friends are having a beer in a bar.  Because it is good German beer, they are ordering another one. They pay with one bill.

#### Code examples

Code examples of receipt sequences can be found in our [Postman collection](https://middleware-samples.docs.fiskaltrust.cloud/#e9b0b712-2dda-4c4c-a061-16d72daa723b).

## Splitting actions

#### Use case examples

- pos-receipt(s) paid by multiple people
- Voiding/cancelling receipts
- Correction of orders (f.e. gastronomy)

#### How to use

Use ['cbReceiptPreviousReference'](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/germany/data-structures#single-fields) to point to a 'cbReceiptReference' of a previous request to split or void a receipt.

#### Workflow example

![splitting-receipts](media/splitting-receipts.svg)

([click to expand](media/splitting-receipts.svg))

Two friends are having a beer in a bar.  Each of them is paying his own consumption. Therefore, the receipt has to be split.

### Code examples

Code examples of splitting receipts can be found in our [Postman collection](https://middleware-samples.docs.fiskaltrust.cloud/#86967a8f-a1fe-4262-975e-c4a155209cb3).

## Merging actions

#### Use case examples

- invitation
- if you need to invoice more than one purchase receipt at a time/it can be paid all together

#### How to use

Merge receipts by combining ['cbReceiptReference' and 'cbReceiptPreviousReference'](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/germany/data-structures#single-fields). Use ftReceiptCase 'Info-internal' to create a new 'cbReceiptReference' and refer via 'cbPreviousReceiptReference' to the order you want to merge. Repeat this for each order you want to merge using the same 'cbReceiptReference' and using 'cbPreviousReceiptPreference' to point to the order to be merged.

#### Workflow example

![merging-receipts](media/merging-receipts.svg)

([click to expand](media/merging-receipts.svg))

Two friends are having a beer in a bar. One of them has birthday. To celebrate that, he invites the guests on the table next to them to pay what they have ordered and consumed so far. Therefore, their receipt has to be merged with the other receipt.

#### Code examples

Code examples of merging receipts can be found in our [Postman collection](https://middleware-samples.docs.fiskaltrust.cloud/#b81fedc6-919a-46e4-899a-52582606a6d7).

## Changing the area in which the receipt is created

#### Use case examples

Changing the area of value creation; e.g.

- Consumption in Restaurant-Hotel -> Restaurant-Wellness -> Bar-Sauna
- Moving between different tables within a Restaurant
- Providing information how business actions are connected to each other across multiple POS-Systems

#### How to use

Document the field/section in which the receipt is created with [cbArea](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/general/data-structures#receipt-request).

#### Workflow example

![switching-cbarea](media/switching-cbarea.svg)

([click to expand](media/switching-cbarea.svg))

Two friends are having a beer in a bar on a big table. They change to a smaller table so that a bigger group of people can sit on their previous table to order some food.

## Referencing actions of external queues or external Systems

#### Use case examples

Multiple POS-Systems are involved in the business action and only one of them is used for invoice/receipt creation, e.g.:

- Restaurant/Bar using multiple queues; orders are done with one queue and payment with another queue
- Restaurant/Wellness/Hotel using different POS-Systems; one system is used for final invoice creation
- Membership cards/vouchers with multiple POS-Systems involved

### Option A: ChargeItems collected via "internal" queue are payed at an external system or queue

#### How to use

ChargeItems are collected via ftReceiptCase 'Info-internal' or 'Info-order'. 'cbArea' can be used as an identifier for documenting the business action across multiple POS-Systems. The obligation to issue receipts arises at the external POS-System.

#### Workflow example

![chargeitem-internal-payment-external](media/chargeitem-internal-payment-external.svg)

([click to expand](media/chargeitem-internal-payment-external.svg))

A couple checks-in in a hotel for one night. They have a beer at the hotel bar, which uses a different POS-System than at the reception. The couple wishes the consumption to be paid via accomodation invoice at checkout. Therefore, an 'info-internal' is used instead of a 'POS receipt'. 'cbArea' is used to provide the information about the connected business action using the room number as unique identifier.

### Option B: ChargeItems collected at an external system or queue are payed at the internal queue

#### How to use

Use 'info-internal' with ['ftReceiptCaseData' according to the requirements of the DSFinV-K-specification](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/germany/dsfinv-k#file-bon_referenzen-referencescsv) to reference to an business-action recorded by an external queue or POS-System which needs to be merged with your ongoing internal business-action. By creating a new 'cbReceiptReference', you create the precondition to merge the receipt the external system with your internal receipts of the ongoing business-action. Repeat this step to collect and reference to multiple external POS-Systems with related business-actions to be charged. The obligation to issue receipts arises at the POS-System where the POS receipt is being created.

##### Prerequisites

For this workflow, the combination of following receipt-sequences is needed:

- Referencing previous receipts within a queue, using 'cbReceiptReference',
- Merging receipts, using 'cbReceiptreference' and 'cbPreviousReceiptReference',
- Providing additional information about how the business actions are connected to each other, using 'cbArea',
- Providing information about the external POS receipt, using 'ftReceiptCaseData'

#### Workflow example

![chargeitem-external-payment-internal](media/chargeitem-external-payment-internal.svg) 

([click to expand](media/chargeitem-external-payment-internal.svg))

1. A couple performs a check-in at the reception of a hotel for one night.
2. An info-order for the overnight-stay is created.
3. After the check-in, it decides to have a beer at the hotel-bar, which uses a different POS-System (or fiskaltrust.queue). The consumption of the hotel-bar shall be paid with the final invoice of the overnight-stay. The room number is for 'cbArea' to provide information why the business actions across the different POS-Systems are connected. 
4. For the check-out, the receipt of the consumption of the hotel-bar and the receipt of the overnight stay need to be merged. Therefore, 'info-internal' receipts with a new, common 'cbReceiptReference' are created. One 'info-internal' receipt is used to reference to the external POS receipt using 'ftReceiptCaseData'. 
5. The other 'info-internal' receipt is used to reference to the internal 'info-order' of the overnight-stay using 'cbPreviousReceiptReference'. 
6. A 'POS receipt' is created, including all collected charge-items from external and internal POS-System(s), and the pay-items of the internal POS-System. The receipt is printed and handed over to the couple.

#### Code examples

Code examples of referencing external receipts can be found in our [Postman collection](https://middleware-samples.docs.fiskaltrust.cloud/#06a34ac5-7c4f-441e-ba2b-4f02badc409c).

## Money substitutes based sequences (vouchers, membership cards,...)

### Issuing and redeeming multi-purpose vouchers/cards

#### Use case examples

- Consumption in Hospitality/Wellness/Spa with cards/bracelets
- Use of employee cards in cafeteria/canteen
- Multi-purpose vouchers

#### How to use

Issuing and redeeming a multi-purpose voucher can be achieved with charge- and payitems or within payitems only as shown in [following examples](https://middleware-samples.docs.fiskaltrust.cloud/#ef0d52d6-ac2f-4c75-b16c-d4d1380e3257) in the Postman collection. 

#### Workflow

![multi-purpose-voucher](media/multi-purpose-voucher.svg)

([click to expand](media/multi-purpose-voucher.svg))

A customer at Club Med charges his bracelet with 100 €, which is used within the club area as a money substitute. Multiple consumptions are made using different POS-Systems. Each POS-System uses its own different POS receipt IDs, and 'cbArea' is changing as well. At check-out, the customer is getting paid out the remaining credit on the bracelet. 

In this example, we are using the payitem option for managing the multi-purpose voucher transactions. A negative amount of 'ftPayItemCase' `0x444500000000000D` gets converted to a multi-purpose voucher purchase. 'ftPayItemCaseData' is being used to add the additional information of the use of the NFC-bracelet (e.g."NFC-bracelet NR. 321"). In this case, the NFC-bracelet can be used as identifier across multiple involved POS-Systems.

After charging the bracelet, the customer redeems the voucher in several cases. A positive amount of 'ftPayItemCase' `0x444500000000000D` gets converted to a multi-purpose voucher redemption. The negative amount of payment indicates the credit available after the redemption.

In the last business action, the customer wants to have his credit payed out. The positive amount of 'ftPayItemCase' `0x444500000000000D` is set to the actual credit value so that the payment amount is zero.

#### Code examples

- [Issuing](https://middleware-samples.docs.fiskaltrust.cloud/#c8cba72c-6fbe-4e34-b47d-2fc498d12c2f) and [redeeming](https://middleware-samples.docs.fiskaltrust.cloud/#fa77f359-eda8-4686-8c70-efb125058985) multi-purpose voucher using pay-items

- [Issuing](https://middleware-samples.docs.fiskaltrust.cloud/#ee38c78e-a056-440c-ac46-ec1926bc92ad) and [redeeming](https://middleware-samples.docs.fiskaltrust.cloud/#58e9564f-c9bc-4920-8740-f3e468db1b2f) multi-purpose voucher using charge- and pay-items
