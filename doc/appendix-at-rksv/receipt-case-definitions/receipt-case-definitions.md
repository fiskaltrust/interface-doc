---
slug: /poscreators/middleware-doc/austria/receipt-case-definitions
title: Receipt case definitions
---

## Receipt case definitions

This chapter expands on the definitions of Receipt Cases covered in Chapter ["Receipt Case Definitions"](../../general/receipt-case-definitions/receipt-case-definitions.md) of the General Part, with country-specific information applicable to the Austrian market.

### Voucher (Service/Product)

The issuance is a process with RKSV requirement and determines the time of sale. The redemption of a voucher, and thus the distribution of the goods, constitutes a process without RKSV requirement but has to be recorded according to §131 BAO. A data set with ftReceiptCase "delivery note" or "protocol data" can be issued to process this recording.

### Voucher (Value)

A voucher with a specific value constitutes a means of payment, and its issuance is thus a process without RKSV requirement. Once a business transaction is made and paid for by redeeming a voucher, it constitutes a process with RKSV requirement - therefore, (value) voucher can usually be found in the pay items block. If however, it is for technical reasons necessary to enter a (value) voucher obligations in the pay items block, then respective obligations should be transferred as ftChargeItemCase: for issuance, this is (`0x4154000000000023`), and for intake (redemption) this is (`0x4154000000000022`).

### Agency Business

### Delivery Note

### Tips

Tips are to be divided into two categories:

  - Tips that go to the company are regular sales and must be indicated with the respective ftChargeItemCase: "other normal services", "discounted 1"/ "discounted 2", "special" or "zero".
  - Tips that do not go to the company must be treated like obligations or not own sales in the charge items block. In general, tips that don’t go to the company but, e.g. to staff, can be processed in the pay items block.
