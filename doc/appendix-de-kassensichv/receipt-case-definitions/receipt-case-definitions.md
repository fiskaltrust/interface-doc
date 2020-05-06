## Receipt Case Definitions

This chapter expands on the definitions of Receipt Cases covered in Chapter ["Receipt Case Definitions"](../../general/receipt-case-definitions/receipt-case-definitions.md) of the General Part, with country specific information applicable to the German market.

### Voucher (Service/Product)

The issuance and redemption of vouchers are processes with DSFinV-K requirements. There are two kinds of vouchers to be considered:

- Single purpose vouchers (DE: Einzweckgutscheine)
- Multi purpose vouchers (DE: Mehrzweckgutscheine)

The difference is that for single purpose vouchers the VAT rate is known already at issuance because it refers to a single purpose (service or product). In case of multi purpose vouchers the VAT rate is not known because it can be redeemed for different purposes (services and/or products).

Handling the issuance and redemption of single purpose vouchers depends on the type of business that the pos operator operates:

1. If she operates a business with profit determination in regards of **§ 4 Abs. 1 EStG** than she must not consider the VAT rate at issuance and the charge item case (`ftChargeItemCase`) `0x4445000000000065` should be used at issuance. At redemption a charge item case considering the VAT rate must be used (one of this: `0x4445000000000069`, `0x444500000000006A`, `0x444500000000006B`, `0x444500000000006C`, `0x444500000000006E` or `0x444500000000006F`). 

2. On the other side, if she operates a business with profit determination in regards of **§ 4 Abs. 3 EStG** than she must consider the VAT as shoon as she issues the voucher. In this case one of the following VAT specific charge item cases can be used for issuance: `0x4445000000000061`, `0x4445000000000062`, `0x4445000000000063`, `0x4445000000000064`, `0x4445000000000066` or `0x4445000000000067`. And for redemption the charge item case `0x444500000000006D`should be used.


The issuance of multi purpose vouchers is covered by the charge item case (`ftChargeItemCase`): `0x4445000000000060`. Since there is no specific product or service coverded by the voucher the issuance is not taxable and the VAT rate must be specified on redemption.
