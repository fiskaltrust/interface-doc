Examples of using `cbReceiptReference` and `cbPreviousReceiptReference` to connect requests representing a business action:

1. Simple

| **Action**            | **receipt case** | **`cbReceiptReference`** | **`cbPreviousReceiptReference`**                                                                                         | **Description** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| Check-In | `info-internal` | "10001" | empty | Family checks in into the hotel. |
| Consumption | `info-order` | "10001" | empty | Family stays over night. |
| Consumption | `info-order` | "10001" | empty | Family consumes breakfirst. |
| Check-Out Payment | `pos-receipt` | "10001" | empty | Family pays the bill. |

2. Split

| **Action**            | **receipt case** | **`cbReceiptReference`** | **`cbPreviousReceiptReference`**                                                                                         | **Description** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| Check-In | `info-internal` | "10001" | empty | Family checks in into the hotel. |
| Consumption | `info-order` | "10001" | empty | Family stays over night. |
| Consumption | `info-order` | "10001" | empty | Family consumes breakfirst. |
| Check-Out Payment 1 | `pos-receipt` | "567" | "10001" | Wife pays half of the bill. |
| Check-Out Payment 2 | `pos-receipt` | "568" | "10001" | Husband pays other half of the bill. |

3. Merge (one pays for himself and for others)

| **Action**            | **receipt case** | **`cbReceiptReference`** | **`cbPreviousReceiptReference`**                                                                                         | **Description** |
|---------------------------|---------------|-----------------------------------|---------------------------------------------------------------------------------------------------------|-------------|
| Check-In | `info-internal` | "10001" | empty | Family 1 checks in into the hotel. |
| Check-In | `info-internal` | "10002" | empty | Family 2 checks in into the hotel. |
| Consumption | `info-order` | "10001" | empty | Family 1 stays over night. |
| Consumption | `info-order` | "10002" | empty | Family 2 stays over night. |
| Consumption | `info-order` | "10001" | empty | Family 1 consumes breakfirst. |
| Consumption | `info-order` | "10002" | empty | Family 2 consumes breakfirst. |
| Merge Step 1 | `info-internal` | "567" | "10001" | Merge action of Family 1 into new action "567" |
| Merge Step 2 | `info-internal` | "567" | "10002" | Merge action of Family 2 into new action "567" |
| Check-Out Payment | `pos-receipt` | "567" | empty | Family 1 pays bill for themselves and for Family 2 |

