## Cash Register Integration

This chapter describes the cash register integration in accordance with the German law. The general rules for cash register integration are described in General Part of this document.

### Receipt Creation Process

This chapter describes the general process of creating receipts with fiskaltrust.Service and its workflow, in accordance with the German law. It requires to give a scope to an ongoing action over time. This scope is named a transaction. Calls to fiskaltrust.Service are processed just in time and cannot be async over multiple minutes. Therefore and in accordance with German law, a single call is maybe not able to scope a complete transaction. To solve this, multiple calls are used, scoping the same transaction.

#### The fiskaltrust.SecurityMechanism explicit transaction

The regular workflow of the fiskaltrust.SecurityMechanism in the German market for actions running longer than 45s (German max transaction update time delta), defines the steps required for the creation of a receipt as follows:

##### Start-Transaction

Already before you know how your action ends up you have to create/reserve a transaction number, to be able to track when the action started. this is done by a special call to the ´Sign´ method using the ´ReceiptCase´ "Start-Transaction". Details of this ´ReceiptRequest´ has to match a Zero-Receipt, so no ´ChargeItems´ and no ´PayItems´ are allowed. In addition to the requirements of a Zero-Receipt it is required to add a unique identification to the property ´cbReceiptReference´. This unique identifier can only be used once (at least between each daily closing) in a system and will create a bracket around an ongoing action. For all further ´Sign´ method calls it is mandatory to use the same unique identifier in the property ´cbReceiptReference´. Only one ongoing action/transaction by unique identifier is allowed, calling two times ´Sign´ method using ´ReceiptCase´ "Start-Transaction" with the same unique identifier ends up in an exception. If there are communication errors use the ´ReceiptCaseFlag´ "ReceiptRequest" to check if an action/transaction was already created.  
According to the German law and BSI TR-03153 a call to the ´Sign´ method using the ´ReceiptCase´ "Start-Transaction" take care of starting a transaction inside the TSE. The up-counting transaction number defined in TR-03153 is responded behind hash-tag in property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "ST".

##### Update-Transaction

Changes in ongoing actions have to be tracked. This is done by a special call to the ´Sign´ method using the ´ReceiptCase´ "Update-Transaction". Details of the ´ReceiptRequest´ should show up the current overall ´ChargeItems´ and ´PayItems´ of the ongoing action. To identify the action/transaction once again the unique identifier used in "Start-Transaction", handed over by the property ´cbReceiptReference ´ is used. Calling the ´Sign´ method using an unique identifier that wasn't used to create a transaction or was already used to finalize a transaction will end up in an exception. According to the German law and BSI TR-03153 a call to the ´Sign´ method using the ´ReceiptCase´ "Update-Transaction" take care of updating a transaction inside the TSE. The same transaction number as responded at the call of "Start-Transaction" is responded behind the hash-tag in the property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "UT".  
It is not mandatory to call ´Sign´ using ´ReceiptCase´ "Update-Transaction" before you finalize a transaction. It is also possible to call ´Sign´ using ´ReceiptCase´ "Update-Transaction" multiple times for a single unique identifier/for a single transaction.

##### Delta-Transaction

The main functionality is the same as it is when calling ´Sign´ method using ´ReceiptCase´ "Update-Transaction". The differences are the details used in ´ChargeItems´ and ´PayItems´, they show up exactly the delta happened until last call using ´Start-Transaction´ or last call using ´Delta-Transaction´. For all the implementation there should be a system-wide decision taken to use only one of the ´ReceiptCases´, ´Update-Transaction´ or this one.  
According to the German law and BSI TR-03153 a call to the ´Sign´ method using the ´ReceiptCase´ "Delta-Transaction" take care of updating a transaction inside the TSE. The same transaction number as responded at the call of "Start-Transaction" is responded behind the hash-tag in the property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "DT".  
It is not mandatory to call ´Sign´ using ´ReceiptCase´ "Delta-Transaction" before you finalize a transaction. It is also possible to call ´Sign´ using ´ReceiptCase´ "Delta-Transaction" multiple times for a single unique identifier/for a single transaction.

##### End-Transaction

According to the German law and BSI TR-03153 each call to the ´Sign´ method using other ´ReceiptCase´ than "Start-Transaction", "Update-Transaction", "Delta-Transaction" and any kind of Zero-Receipts take care of ending a transaction inside the TSE.  
To identify the action/transaction that should be finalized the unique identifier in the property ´cbReceiptReference´ inside the ´ReceiptRequest´ is used. No matter if you used "Update-Transaction", "Delta-Transaction" or none of them, the ´ChargeItems´ and ´PayItems´ have to include the complete final state of all items involved.  
The transaction number defined in TR-03153 is responded behind hash-tag in property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "T".

#### The fiskaltrust.SecurityMechanism implicit transaction

The regular workflow of the fiskaltrust.SecurityMechanism in the German market for actions running immediately has the same requirements as long-running ones. In details, this means, according to BSI TR-03153, there has to be a "Start-Transaction" and a "Finish-Transaction" executed against the TSE. To speed up these two steps into one call to the ´Sign´ method there is a special ´ReceiptCaseFlag´ introduced. Each time this is used in combination with a usual ´ReceiptCase´ a "Start-Transaction" is done behind the scenes upfront to the final call using the given ´ReceiptCase´.
Using a unique identifier in `cbReceiptIdentification´ that was already used with a ´Sign´ call with ´ReceiptCase´ "Start-Transaction" will end up in an exception.
The up-counting transaction number defined in TR-03153 is responded behind hash-tag in property ´ftReceiptIdentification´ of ´ReceiptResponse´ prefixed by "IT".

### Receipt for special functions

This section describes receipt types used for special functions on the German market and expands the common descriptions.

#### Zero Receipt

In the following chapters, you can find examples of special cases of zero receipts applicable to the German market.

#### Start Receipt (Initial Receipt)

There is a number of requirements for the implementation of a new, or a replaced German security mechanism (TSE). This kind of receipt can be used once in a lifetime of the queue/scu combination and initializes also the underlying German security mechanism (TSE) for usage.
This receipt must be archived. On successful operation, a notification to the tax authority is also created, which reports the active usage of the ftCashboxIdentification and the serial number of the German security mechanism (TSE).

#### Stop Receipt (Closing Receipt)

Once the queue has been closed with a stop receipt, the usage of the German security mechanism is deactivated.
On successful operation, a notification to the tax authority is also created, which reports the deactivation.

