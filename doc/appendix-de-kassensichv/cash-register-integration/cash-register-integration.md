---
slug: /poscreators/middleware-doc/germany/cash-register-integration
title: Cash register integration
---

# Cash register integration

This chapter describes the cash register integration in accordance with German law. The general rules for cash register integration are described in the General Part of this document.

## Receipt Creation Process

This chapter describes the general process of creating receipts with fiskaltrust.Middleware and its workflow, according to German law. It requires giving a scope to an ongoing [action](../terminology/terminology.md) over time. This scope is named a [transaction](../terminology/terminology.md). Calls to fiskaltrust.Middleware are processed just in time and cannot be asynchronous over multiple minutes. Therefore and in accordance with German law, a single call is maybe not able to scope a complete transaction. To solve this, multiple calls are used, scoping the same transaction.

The "**transaction**" describes the steps, at least at the beginning and end of the action, within the SCU.

The "**flow**" describes the communication between the POS System and the fiskaltrust.Middleware to trigger transactions. This can be done either 

- **implicitly** (a "Start-Transaction" is done automatically - implicitly - behind the scenes upfront the final call), or
- **explicitly** (every single transaction like "Start" and "Finish" are initiated)

![flow-vs-transaction](media/flow-vs-transaction.png)

*Flow and Transaction (DE - KassenSichV)*

### The implicit flow

#### When to use

This is the regular workflow of the fiskaltrust-SecurityMechanism in the German market for actions. 

##### Advantages

- No open TSE-transactions to be managed.
- Reduces complexity of business-process handling.

#### How to use

Sign-call with a [ftReceiptCase for implicit flow](https://docs.fiskaltrust.cloud/docs/poscreators/middleware-doc/germany/reference-tables/ftreceiptcase#type-of-receipt-ftreceiptcase) + ftReceiptCaseFlag `0x0000000100000000`.
The up-counting transaction number defined in TR-03153 is responded behind the hash-tag in the property 'ftReceiptIdentification' of 'ReceiptResponse', prefixed by "IT".

**Please be aware that for the implicit flow, ADDITIONALLY the start time of the first transaction of the business-action (e.g. start time of the first order) has to be printed on the receipt as the start-time of the action.**


![implicit-flow-start-finish-transaction](media/implicit-flow-start-finish-transaction.png)

*Implicit Flow - Start/Finish Transaction (DE - KassenSichV)*

#### Examples

##### Short lasting actions, e.g. Retail

In this example, a customer wants to pay for a good or service and no more orders are expected. A ftReceiptCase `0x4445000000000001` (POS receipt) + ftReceiptCaseFlag `0x0000000100000000` (Implicit Flag) is beeing sent to the middleware. The call includes all collected charge- and payitems of the business action (f.e. retail - trousers + T-shirt, including payment with credit card).

The response's signature block includes all information needed to be printed on the receipt (time of receipt creation - which is the returned value of cbReceiptMoment of the sign-request, start time of the action, and end time of the action). 

![implicit-flow-single-sign-call](media/implicit-flow-single-sign-call.png)

See the code example of a request and the response at [DE-action-start-de | fiskaltrust Documentation Platform.](https://docs.fiskaltrust.cloud/docs/faq/examples/DE-action-start-de#standard-action---implicit-flow)

##### Long lasting actions, multiple orders, e.g. gastronomy, hospitality

In this example, ongoing orders are expected over a longer period of time before a payment is made. Therefore, a ftReceiptCase `0x44450000000000010` (Info-order without pay-items) + ftReceiptCaseFlag `0x0000000100000000` (Implicit Flag) is beeing sent to the middleware. This is beeing repeated for every new order, using 'cbReceiptReference' to connect the new order with the previous corresponding one.

For the payment (which may include a last order as well), a ftReceiptCase `0x4445000000000001` (POS receipt including at least the pay-items) + ftReceiptCaseFlag `0x0000000100000000` (Implicit Flag) is beeing sent to the middleware like in the previous example above to close this business action.

The response's signature block of the POS receipt includes all information needed to be printed on the receipt (time of receipt creation - which is the returned value of cbReceiptMoment of the first sign-request of cbReceiptReference-connected orders, start time of the action, and end time of the action). 

![implicit-flow-multiple-sign-calls](media/implicit-flow-multiple-sign-calls.png)

See the code example of multiple requests and responses at [DE-action-start-de | fiskaltrust Documentation Platform.](https://docs.fiskaltrust.cloud/docs/faq/examples/DE-action-start-de#long-lasting-action---implicit-flow)

See our [Postman Collection for implicit transactions](https://middleware-samples.docs.fiskaltrust.cloud/#1c202467-aa7d-4f17-b588-95a1a322015e).

<details>
  <summary>Background information</summary>
There has to be a "Start-Transaction" and a "Finish-Transaction" executed against the TSE. In order to speed up these two steps into one call to the 'Sign' method, a special 'ReceiptCaseFlag' is used. Each time this is used in combination with a usual 'ReceiptCase', a "Start-Transaction" is done behind the scenes upfront the final call, using the given 'ReceiptCase'.

Please be aware:

- Using a unique identifier in 'cbReceiptReference' that was already used with a 'Sign' call with 'ReceiptCase' "Start-Transaction" will end up in an exception.
- Because the implicit flow triggers a "Start-Transaction" AND a "Finish-Transaction" against the TSE, for each implicit 'Sign' call two TSE-signatures are consumed.

</details>

### The explicit flow

The regular workflow of the fiskaltrust.SecurityMechanism in the German market for actions running longer than 45s (German max transaction update time delta), defines the steps required for the creation of a receipt as follows:

##### Start-Transaction

Already before you know how your action will complete, you have to create and reserve a transaction number, to be able to track when the action started. This is done by a special call to the 'Sign' method using the 'ReceiptCase' "Start-Transaction". Details of this 'ReceiptRequest' have to match a Zero-Receipt, so no 'ChargeItems' and no 'PayItems' are allowed. In addition to the Zero-Receipt requirements, it is required to add a unique identification to the property 'cbReceiptReference'. This unique identifier can only be used once (at least between each daily closing) in a system. It creates a bracket around an ongoing action. For all further 'Sign' method calls which belong to the same action, it is mandatory to use the same unique identifier in the property 'cbReceiptReference'. Only one ongoing action/transaction per unique identifier is allowed. Calling two times the 'Sign' method using 'ReceiptCase' "Start-Transaction" with the same unique identifier ends up in an exception. If there are communication errors, use the 'ReceiptCaseFlag' "ReceiptRequest" to check if an action/transaction was already created.  
According to the German law and BSI TR-03153, a call to the 'Sign' method using the 'ReceiptCase' "Start-Transaction" takes care of starting a transaction inside the TSE. The up-counting transaction number, defined in TR-03153, is responded by the fiskaltrust.Middleware behind the hash-tag in the property 'ftReceiptIdentification' of 'ReceiptResponse', prefixed by "ST". For example "ftReceiptIdentification": "ft[queue-receiptnumerator-hex]#ST[tse-transaction]".

![explicit-flow-start-transaction](media/explicit-flow-start-transaction.png)

*Explicit Flow - Start Transaction (DE - KassenSichV)*

##### Update-Transaction

Changes in ongoing actions have to be tracked. This is done by a special call to the 'Sign' method using the 'ReceiptCase' "Update-Transaction". Details of the 'ReceiptRequest' should show up the current overall 'ChargeItems' and 'PayItems' of the ongoing action. To identify the action/transaction, the unique identifier used in "Start-Transaction", handed over by the property 'cbReceiptReference', is utilised. Calling the 'Sign' method using a unique identifier that wasn't used to create a transaction, or was already used to finalise a transaction, will end up in an exception. According to the German law and BSI TR-03153, a call to the 'Sign' method using the 'ReceiptCase' "Update-Transaction" handles the updating a transaction inside the TSE. The same transaction number as responded at the call of "Start-Transaction" is responded behind the hash-tag in the property 'ftReceiptIdentification' of 'ReceiptResponse', prefixed by "UT".  
It is not mandatory to call 'Sign' using 'ReceiptCase' "Update-Transaction" before finalising a transaction. It is also possible to call 'Sign' using 'ReceiptCase' "Update-Transaction" multiple times for a single unique identifier/for a single transaction.

![explicit-flow-update-transaction](media/explicit-flow-update-transaction.png)

*Explicit Flow - Update Transaction (DE - KassenSichV)*

##### Delta-Transaction

The main functionality is the same as when calling the 'Sign' method using 'ReceiptCase' "Update-Transaction". The differences are the details used in 'ChargeItems' and 'PayItems'; they hey depict exactly the same delta that occurred since the last call using 'Start-Transaction' or the last call using 'Delta-Transaction'. There should be a system-wide decision for the implementation to use only one of the 'ReceiptCases' - 'Update-Transaction' or 'Delta-Transaction'.  
According to the German law and BSI TR-03153, a call to the 'Sign' method using the 'ReceiptCase' "Delta-Transaction" handles the updating of a transaction inside the TSE. The same transaction number as responded at the call of "Start-Transaction" is responded behind the hash-tag in the property 'ftReceiptIdentification' of 'ReceiptResponse', prefixed by "DT".  
It is not mandatory to call 'Sign' using 'ReceiptCase' "Delta-Transaction" before finalising a transaction. It is also possible to call 'Sign' using 'ReceiptCase' "Delta-Transaction" multiple times for a single unique identifier/for a single transaction.

![explicit-flow-delta-transaction](media/explicit-flow-delta-transaction.png)

*Explicit Flow - Delta Transaction (DE - KassenSichV)*

##### End-Transaction

According to German law and BSI TR-03153, each call to the 'Sign' method using other 'ReceiptCase' than "Start-Transaction", "Update-Transaction", "Delta-Transaction" and any 'Zero-Receipts', causes the end of a transaction inside the TSE.  
To identify the action/transaction that should be finalised the unique identifier in the property 'cbReceiptReference' inside the 'ReceiptRequest' is used. No matter if you used "Update-Transaction", "Delta-Transaction" or none of them, the 'ChargeItems' and 'PayItems' have to include the complete final state of all items involved.  
The transaction number, defined in TR-03153, is responded behind the hash-tag in the property 'ftReceiptIdentification' of 'ReceiptResponse', prefixed by "T".

![explicit-flow-end-transaction](media/explicit-flow-end-transaction.png)

*Explicit Flow - End Transaction (DE - KassenSichV)*



### Receipt for special functions

This section describes receipt types used for special functions on the German market and expands the common descriptions.

#### Zero Receipt

You can find examples of special cases of zero receipts applicable to the German market in the following chapters.

#### Start Receipt (Initial Receipt)

There are many requirements for implementing a new, or a replaced German security mechanism (TSE). This kind of receipt can be used once in a lifetime of the queue/SCU combination and also initialises the underlying German security mechanism (TSE) for usage.
This receipt must be archived. On successful operation, for customers of the product "Finanzamtmeldung", tax authorities are notified automatically and behind the scenes about the active usage of the ftCashboxIdentification, and the serial number of the German security mechanism (TSE).

#### Stop Receipt (Closing Receipt)

Once the queue has been closed with a stop receipt, the German security mechanism's usage is deactivated.
On successful operation, for customers of the product "Finanzamtmeldung", tax authorities are notified automatically and behind the scenes about the deactivation.

