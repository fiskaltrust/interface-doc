---
slug: /poscreators/middleware-doc/general/receipt-case-definitions
title: Receipt Case Definitions
---

## Receipt Case Definitions

The below list is provided to ensure the common understanding of different types of business cases and to facilitate the implementation of their correct handling by the fiskaltrust.Middleware.

### POS Sales Receipt

A POS Sales Receipt can contain multiple and different types of services, items, and payments. POS sales receipt can generate turnover depending on the type of the receipt. A POS sales receipt can optionally, depending on the country's law, support the sum-up for a daily, monthly, yearly, and/or periodically closing, before it is transferred to bookkeeping/accounting.

### Invoice

An Invoice can contain multiple and different types of services, items, and payments. Usually, an invoice includes a detailed information about the customer.

### Voucher for single usage

A voucher for single use is usually a voucher for a single product. The turnover is created and VAT is already known and owed right in the moment of voucher’s sale.

There is no turnover created when the voucher is redeemed. This action is also not relevant to VAT. It is a kind of a hand-out or a delivery note.

### Voucher for multiple usage

A voucher for multiple use is usually a voucher with a value. There is no turnover created when the voucher is handed out.

Turnover is created in the moment when the voucher is redeemed. This is usually done by a POS Sales Receipt using the voucher as a payitem.

### Agency Business

Agency businesses are not own sales but sales made on behalf of a 3<sup>rd</sup> party. Thus, no own sales can be processed on the same receipt as an agency business.

For further information, refer to the appropriate Appendix for the specific country.

### Delivery Note

A delivery note can not be processed mixed with cash transaction receipts. Delivery notes are indicated with the ftReceiptCase "delivery note" and the individual positions can be annotated with the respective ftChargeItemCase data.

For further information, refer to the appropriate Appendix for the specific country.

### Tips

Tips are to be divided into two categories:

  - Tips that go to the company are normal sales.
  - Tips that do not go to the company, are to be treated like obligations or not own sales in the charge items block.

For further information, refer to the appropriate Appendix for the specific country.
