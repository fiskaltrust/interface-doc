---
slug: /poscreators/interface-doc/cash-register-integration/multi-markets-implementation
title: Multi-markets implementation
---
### Multi-market implementation

#### Mapping Table
The table below shows a comparison of the different business cases (e.g. ftRecipt cases, ftChargeItem cases and ftPayItem cases) for every market.
This guide provides a guideline of which business cases should be implemented in which market.
More details for ft Recipts cases, ft PayItems cases and ft ChargeItems cases can be found for each market on the appropriate country specific appendix.

|**business cases** | **AT** | **DE** |**FR** |**ME**|
|----------------------|-----------|-----------------------|--------------------------------------|-----------------------------|
|**ftReceipt cases**||||||
|Initial operation/start receipt|`0x415400000000000`|`0x4445000000000003`|`0x4652000000000010`|`0x4D45000000000003`|
|Opening balance||||`0x4D45000000000007`|
|Stop receipt|`0x4154000000000004`|`0x4445000000000004`|`0x4652000000000011`|`0x4D45000000000004`|
|Zero receipt|`0x4154000000000002`|*optional* `0x4445000000000002`|`0x465200000000000F`|`0x4D45000000000002`|
|Daily closing|| `0x4445000000000007`|`0x4652000000000005`||
|Monthly closing|`0x4154000000000005`|*optional* `0x4445000000000005`|`0x4652000000000005`|`0x4D45000000000005`|
|Yearly closing|`0x4154000000000006`|*optional* `0x4445000000000006`|`0x4652000000000007`|`0x4D45000000000006`|
|Initiate SCU switch||`0x4445000000000017`|||
|Finish SCU switch||`0x4445000000000018`|||
|Fail transaction Receipt||`0x444500000000000B` (single) `0x444500010000000B` (multiple) |||
|Cash withdrawal||||`0x4D45000000000008`|
|Cash sales / POS-receipt / Ticket|`0x4154000000000001`|`0x4445000100000001`|`0x4652000000000001`||
|Archives|||`0x4652000000000015`||
|
|**ftPayItems cases**||
|Credit card payment|`0x4154000000000005`|`0x4445000000000005`|`0x4652000000000005`|`0x4D45000000000005`|
|**ftChargeItems cases**|
|Unknown type of service/product|`0x4154000000000000`|`0x4445000000000000`|`0x4652000000000000`|`0x4D4500000000000`|