## Receipt Case Definitions

This chapter expands on the definitions of Receipt Cases covered in Chapter ["Receipt Case Definitions"](../../general/receipt-case-definitions/receipt-case-definitions.md) of the General Part, with country specific information applicable to the German market.

### Voucher (Service/Product)

The issuance and redemption of vouchers are processes with DSFinV-K requirements. According to the [EU directive](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX%3A32016L1065) as regards the treatment of vouchers there are two kinds of vouchers to be considered:

- Single-purpose voucher (DE: Einzweckgutscheine)
- Multi-purpose voucher (DE: Mehrzweckgutscheine)

The difference is, that for single-purpose vouchers, the VAT rate is known already at transfer (issue) because it refers to a single purpose (service or product). On the other hand, in case of multi purpose vouchers the VAT rate is not known because it can be redeemed for different purposes (goods or services).

The issuance of single-purpose vouchers is covered by our charge item cases (`ftChargeItemCase`): `0x4445000000000061`, `0x4445000000000062`, `0x4445000000000063`, `0x4445000000000064`, `0x4445000000000065`, `0x4445000000000066` and `0x4445000000000067`. 

The redemption of single-purpose vouchers is covered by `ftChargeItemCase`: `0x4445000000000069`, `0x444500000000006A`, `0x444500000000006B`, `0x444500000000006C`, `0x444500000000006D`, `0x444500000000006E`, `0x444500000000006F`. When used in the request, the charge item amount of the good or service should be a positive value and the charge item amount of the voucher should be negative (e.g. +1 and -1).

If the cash register can not handle the redemption of single-purpose vouchers within the charge items than it can alternatively use a pay item having the pay item case (`ftPayItemCase`): `0x444500000000000A`. When used like this in the request, the charge item amount of the good or service should be a positive value and the pay item amount of the voucher should also be a positive value (e.g. +1 and +1).

The issuance of multi-purpose vouchers is covered within the pay items by `ftPayItemCase`: `0x444500000000000D`. Negative amounts get converted to an issuance. Since there is no specific product or service coverded by the voucher, the issuance is not taxable and no VAT rate must be specified. Same applies for redemption since the VAT rate is included in the charge items for the products or services of the request. For redemption of a multi-purpose voucher, one can use `ftPayItemCase`: `0x444500000000000D` with a positive amount. 

If the cash register can not handle the redemption within a pay item, then it can alternatively use a charge item having `ftChargeItemCase`: `0x4445000000000068`. 

Furthermore for the issuance of multi-purpose vouchers, one can alternatively use a charge item instead of a pay item. The `ftChargeItemCase`: `0x4445000000000060` has to be used.
