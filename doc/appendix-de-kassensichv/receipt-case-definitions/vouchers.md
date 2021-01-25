# Voucher (goods/services)

The issuing and redemption of vouchers are processes with DSFinV-K requirements. According to the [EU directive](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX%3A32016L1065), in regards to the treatment of vouchers, there are two kinds of vouchers to be considered:

- Single-purpose voucher (DE: Einzweckgutscheine)
- Multi-purpose voucher (DE: Mehrzweckgutscheine)

The difference is, that for single-purpose vouchers, the VAT rate is known already at transfer (issue) because it refers to a single purpose (service or good). On the other hand, in case of multi-purpose vouchers, the VAT rate is unknown because it can be redeemed for different purposes (goods or services). A multi-purpose voucher is a money substitute.

## Single-purpose voucher handling

The issuing of single-purpose vouchers is covered by our charge item cases (`ftChargeItemCase`): `0x4445000000000061`, `0x4445000000000062`, `0x4445000000000063`, `0x4445000000000064`, `0x4445000000000065`, `0x4445000000000066` and `0x4445000000000067`.

The redemption of single-purpose vouchers is covered by `ftChargeItemCase`: `0x4445000000000069`, `0x444500000000006A`, `0x444500000000006B`, `0x444500000000006C`, `0x444500000000006D`, `0x444500000000006E`, `0x444500000000006F`. When used in the request, the charge item amount of the good or service should be a positive value and the charge item amount of the voucher should be negative (e.g. +15 and -15).

### Alternatives

If the cash register can not handle the redemption of single-purpose vouchers within the charge items, then it can alternatively use a pay item having the pay item case (`ftPayItemCase`): `0x444500000000000A`. When used like this in the request, the charge item amount of the good or service should be a positive value, and the pay item amount of the voucher should also be a positive value (e.g. +15 and +15).

### Examples

Please find examples of requests with single-purpose vouchers [here](../examples/vouchers.md#single-purpose-voucher-issuance).

## Multi-purpose voucher handling

The issuing of multi-purpose vouchers is covered within the pay items by `ftPayItemCase`: `0x444500000000000D`. Negative amounts get converted to an issuing. Since there is no specific good or service covered by the voucher, the issuing is not taxable and no VAT rate must be specified. Same applies for redemption since the VAT rate is determined by the charge items for the goods or services of the request. For redemption of a multi-purpose voucher, one can use `ftPayItemCase`: `0x444500000000000D` with a positive amount. 

Furthermore, for the issuing of multi-purpose vouchers, one can use a charge item instead of a pay item. The `ftChargeItemCase`: `0x4445000000000060` has to be used.

### Alternatives

If the cash register can not handle the redemption within a pay item, then it can alternatively use a charge item having `ftChargeItemCase`: `0x4445000000000068` with a negative amount. 

### Examples

Please find examples of requests with multi-purpose vouchers [here](../examples/vouchers.md#multi-purpose-voucher-issuance).

## General

For all voucher requests you can optionally submit the voucher number. It can be sent via `ftPayItemCaseData` or `ftChargeItemCaseData` in JSON format. To send, add the key value pair `VoucherNr` e.g. `"ftPayItemCaseData":"{ ..., "VoucherNr":"UAUA91829182HH", ... }"`.

Please also find a postman collection containing all examples here:  [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/e0afcde3e32e902f2fef)
