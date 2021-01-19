# Business action examples using `cbReceiptReference` and `cbPreviousReceiptReference`

Examples of using `cbReceiptReference` and `cbPreviousReceiptReference` to connect requests representing a business action:

## Simple

| **Action**            | **receipt case** | **`cbReceiptReference`** | **`cbPreviousReceiptReference`**                                                                                         | **Description** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| Check-In | `info-internal` | "10001" | empty | Family checks in into the hotel. |
| Consumption | `info-order` | "10001" | empty | Family stays over night. |
| Consumption | `info-order` | "10001" | empty | Family consumes breakfast. |
| Check-Out Payment | `pos-receipt` | "10001" | empty | Family pays the bill. |

## Split

The bill is being split.

| **Action**            | **receipt case** | **`cbReceiptReference`** | **`cbPreviousReceiptReference`**                                                                                         | **Description** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| Check-In | `info-internal` | "10001" | empty | Family checks in into the hotel. |
| Consumption | `info-order` | "10001" | empty | Family stays over night. |
| Consumption | `info-order` | "10001" | empty | Family consumes breakfast. |
| Check-Out Payment 1 | `pos-receipt` | "567" | "10001" | Wife pays half of the bill. |
| Check-Out Payment 2 | `pos-receipt` | "568" | "10001" | Husband pays the other half of the bill. |

## Merge 

One pays for himself and others.

| **Action**            | **receipt case** | **`cbReceiptReference`** | **`cbPreviousReceiptReference`**                                                                                         | **Description** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| Check-In | `info-internal` | "10001" | empty | Family 1 checks in into the hotel. |
| Check-In | `info-internal` | "10002" | empty | Family 2 checks in into the hotel. |
| Consumption | `info-order` | "10001" | empty | Family 1 stays over night. |
| Consumption | `info-order` | "10002" | empty | Family 2 stays over night. |
| Consumption | `info-order` | "10001" | empty | Family 1 consumes breakfast. |
| Consumption | `info-order` | "10002" | empty | Family 2 consumes breakfast. |
| Merge Step 1 | `info-internal` | "567" | "10001" | Merge action of Family 1 into new action "567" |
| Merge Step 2 | `info-internal` | "567" | "10002" | Merge action of Family 2 into new action "567" |
| Check-Out Payment | `pos-receipt` | "567" | empty | Family 1 pays the bill for themselves and for Family 2 |
