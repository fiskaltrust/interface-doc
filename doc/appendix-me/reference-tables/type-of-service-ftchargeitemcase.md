---
slug: /poscreators/middleware-doc/montenegro/reference-tables/ftchargeitemcase
title: 'Type of service: ftChargeItemCase'
---

# Type of Service: ftChargeItemCase

This table expands on the values provided in the table [ftChargeItemCase in General Part](../../general/reference-tables/reference-tables.md#type-of-service-ftchargeitemcase), with country-specific values applicable to the German market.


| **Value** | **Description** | **VAT rate** | **Middleware version** |
|---|---|---|---|
| `0x4D45000000000000` | Unknown type of service for ME (VAT rate from the `VatRate` property is directly passed to the _central invoice service_) | custom | 1.3- |
| `0x4D45000000000001` | Undefined type of service for ME (normal VAT rate). | 21 % | 1.3- |
| `0x4D45000000000002` | Undefined type of service for ME (reduced VAT rate) | 7 %   | 1.3- |
| `0x4D45000000000003` | Undefined type of service for ME (not taxable/exempt from VAT) | - | 1.3- |
| `0x4D45000000000004` | Undefined type of service for ME (zero) | 0% | 1.3- |
| `0x4D45000000000005` | Undefined type of service for ME (unknown VAT) <br />VAT rate from the `VatRate` property is directly passed to the _central invoice service_) | custom | 1.3- |
| `0x4D45000000000011` | Delivery (normal VAT rate). | 21 % | 1.3- |
| `0x4D45000000000012` | Delivery (reduced VAT rate) | 7 %   | 1.3- |
| `0x4D45000000000013` | Delivery (not taxable/exempt from VAT) | - | 1.3- |
| `0x4D45000000000014` | Delivery (zero) | 0% | 1.3- |
| `0x4D45000000000015` | Delivery (unknown VAT) <br />VAT rate from the `VatRate` property is directly passed to the _central invoice service_) | custom | 1.3- |
| `0x4D45000000000019` | Other services (normal VAT rate). | 21 % | 1.3- |
| `0x4D4500000000001A` | Other services (reduced VAT rate) | 7 %   | 1.3- |
| `0x4D4500000000001B` | Other services (not taxable/exempt from VAT) | - | 1.3- |
| `0x4D4500000000001C` | Other services (zero) | 0% | 1.3- |
| `0x4D4500000000001D` | Other services (unknown VAT) <br />VAT rate from the `VatRate` property is directly passed to the _central invoice service_) | custom | 1.3- |
| `0x4D45000000000020` | Cash deposit into the till | - | 1.3- |
| `0x4D45000000000021` | Cash withdrawal from the till | - | 1.3- |

## ftChargeItemCaseFlag

This table shows flags that can be added to each `ftChargeItemCase` with values applicable to the Montenegran market. 

| Value | Description | Middleware version |
|---|---|---|
| 0x0000000000010000 | **ChargeItem is a voucher.** <br />In case a voucher was sold, this flag has to be set and the `ftChargeItemCaseData` property has to contain the expiration date and the serial number(s) of the voucher in JSON format: `ftChargeItemCaseData: "{\"ExpirationDate\": \"2022-12-24\", \"VoucherSerialNumbers\": [ \"2-2020-12345678\", \"optionally-more-numbers\" ]}"` (please note that this property accepts a string, and the content data needs to be accordingly escaped as shown in this example). | 1.3- |
| 0x0000000000020000 | **ChargeItem is exported to a country outside of Montenegro.** <br />In case the ChargeItem represents a goods or services meant for export, this flag has to be set. | 1.3- |
| 0x0000000000040000 | **ChargeItem is not an investment.** <br />In case the ChargeItem is not an investment for the buyer according to Montenegran law, this flag has to be set. | 1.3- |
| 0x0000000000070000 | **Discount applied on this ChargeItem does reduces base price.** <br />In case there's a discount applied to this ChargeItem which is reducing the tax base price of the item according to Montenegran law, this flag has to be set. The percentage has to be provided as:  `ftChargeItemCaseData: "{\" DiscountPercentage\": 20}"` | 1.3- |
| 0x0000000000080000 | **Discount applied on this ChargeItem does not reduces base price.** <br />In case there's a discount applied to this ChargeItem which is not reducing the tax base price of the item according to Montenegran law, this flag has to be set. | 1.3- |
