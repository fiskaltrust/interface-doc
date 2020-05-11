## Receipt Case Definitions

This chapter expands on the definitions of Receipt Cases covered in Chapter ["Receipt Case Definitions"](../../general/receipt-case-definitions/receipt-case-definitions.md) of the General Part, with country specific information applicable to the German market.

### Voucher (Service/Product)

### Returnable

Income from returnables (DE:Pfand) and their return with settlement of the pledged amount (DE: Pfandrückzahlung) are processes with DSFinV-K requirements. 

#### Income from returnables (DE: Pfand)

In the current version (2.1) of the [DSFinV-K documentation] one can find following description regarding returnables:

From a VAT point of view refering to the income from returnables (DE: Pfand), a distinction must be made here as to whether a transport container provided against a separately agreed deposit is a (self-contained) transport aid or merely a so-called goods container. Whereas transport aids basically serve to simplify the transport and storage of goods (e.g. pallets, boxes), goods are enclosed in inner/outer containers which are necessary for the delivery of the goods to the end consumer (e.g. bottles). 

From the point of view of turnover tax, the provision of transport aids against a deposit represents an independent delivery which is subject to the general tax rate according to § 12 Abs. 1 UStG (currently 7% VAT). 

In contrast, the encirclement of goods, as a so-called dependent secondary service, shares the fate of the actual main service/product. (e.g. delivery of milk 7% VAT - deposit on milk bottle also 7% VAT). 

However, this might not cover all cases. For more details, please see also for example the document [Umsatzsteuerrechtliche Behandlung der Hin- und Rückgabe von Transportbehältnissen](https://www.bundesfinanzministerium.de/Content/DE/Downloads/BMF_Schreiben/Steuerarten/Umsatzsteuer/Umsatzsteuer-Anwendungserlass/2013-11-05-hin-und-rueckgabe-von-transportbehaeltnissen.pdf?__blob=publicationFile&v=2) published by the BSI.

With fiskaltrust you can use the charge item case (`ftChargeItemCase`): `0x4445000000000022` for transport aids (if its not "not taxable": `0x4445000000000025` or "free of tax": `0x4445000000000026`).

For goods containers - depending on the VAT rate you need - you can use one of the following `ftChargeItemCase`: `0x4445000000000021`, `0x4445000000000022`, `0x4445000000000023`, `0x4445000000000024`, `0x4445000000000025`, `0x4445000000000026` or `0x4445000000000027`.

#### Return with settlement of the pledged amount (DE: Pfandrückzahlung)

Analogue to the income from returnables (or non-cash loans) with reversed signs. 

For transport aids you can use the charge item case (`ftChargeItemCase`): `0x444500000000002A` with negative amount.

For goods containers - depending on the VAT rate you need - you can use one of the following `ftChargeItemCase`: `0x4445000000000029`, `0x444500000000002A`, `0x444500000000002B`, `0x444500000000002C`, `0x444500000000002D`, `0x444500000000002E` or `0x444500000000002F`.
