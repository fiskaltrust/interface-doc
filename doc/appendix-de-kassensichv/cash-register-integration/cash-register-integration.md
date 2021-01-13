## Cash Register Integration

This chapter describes the cash register integration in accordance with German law. The general rules for cash register integration are described in General Part of this document.

### Receipt Creation Process

This chapter describes the general process of creating receipts with fiskaltrust.Middleware and its workflow, following German law. It requires to give a scope to an ongoing action over time. This scope is named a transaction. Calls to fiskaltrust.Middleware are processed just in time and cannot be async over multiple minutes. Therefore and in accordance with German law, a single call is maybe not able to scope a complete transaction. To solve this, multiple calls are used, scoping the same transaction.

#### The fiskaltrust.SecurityMechanism explicit transaction

The regular workflow of the fiskaltrust.SecurityMechanism in the German market for actions running longer than 45s (German max transaction update time delta), defines the steps required for the creation of a receipt as follows:

##### Start-Transaction

Already before you know how your action will complete, you have to create and reserve a transaction number, to be able to track when the action started. This is done by a special call to the 'Sign' method using the 'ReceiptCase' "Start-Transaction". Details of this 'ReceiptRequest' has to match a Zero-Receipt, so no 'ChargeItems' and no 'PayItems' are allowed. In addition to the Zero-Receipt requirements, it is required to add a unique identification to the property 'cbReceiptReference'. This unique identifier can only be used once (at least between each daily closing) in a system. It creates a bracket around an ongoing action. For all further 'Sign' method calls which belong to the same action, it is mandatory to use the same unique identifier in the property 'cbReceiptReference'. Only one ongoing action/transaction per unique identifier is allowed. Calling two times the 'Sign' method using 'ReceiptCase' "Start-Transaction" with the same unique identifier ends up in an exception. If there are communication errors, use the 'ReceiptCaseFlag' "ReceiptRequest" to check if an action/transaction was already created.  
According to the German law and BSI TR-03153, a call to the 'Sign' method using the 'ReceiptCase' "Start-Transaction" takes care of starting a transaction inside the TSE. The up-counting transaction number, defined in TR-03153, is responded by the queue behind the hash-tag in the property 'ftReceiptIdentification' of 'ReceiptResponse', prefixed by "ST". For example "Signature counter#STTransactionnumber".

##### Update-Transaction

Changes in ongoing actions have to be tracked. This is done by a special call to the 'Sign' method using the 'ReceiptCase' "Update-Transaction". Details of the 'ReceiptRequest' should show up the current overall 'ChargeItems' and 'PayItems' of the ongoing action. To identify the action/transaction, the unique identifier used in "Start-Transaction", handed over by the property 'cbReceiptReference', is utilised. Calling the 'Sign' method using a unique identifier that wasn't used to create a transaction, or was already used to finalise a transaction, will end up in an exception. According to the German law and BSI TR-03153, a call to the 'Sign' method using the 'ReceiptCase' "Update-Transaction" takes care of updating a transaction inside the TSE. The same transaction number as responded at the call of "Start-Transaction" is responded behind the hash-tag in the property 'ftReceiptIdentification' of 'ReceiptResponse', prefixed by "UT".  
It is not mandatory to call 'Sign' using 'ReceiptCase' "Update-Transaction" before finalising a transaction. It is also possible to call 'Sign' using 'ReceiptCase' "Update-Transaction" multiple times for a single unique identifier/for a single transaction.

##### Delta-Transaction

The main functionality is the same as when calling the 'Sign' method using 'ReceiptCase' "Update-Transaction". The differences are the details used in 'ChargeItems' and 'PayItems'; they show up exactly the delta happened since the last call using 'Start-Transaction' or the last call using 'Delta-Transaction'. There should be a system-wide decision for the implementation to use only one of the 'ReceiptCases' - 'Update-Transaction' or 'Delta-Transaction'.  
According to the German law and BSI TR-03153, a call to the 'Sign' method using the 'ReceiptCase' "Delta-Transaction" takes care of updating a transaction inside the TSE. The same transaction number as responded at the call of "Start-Transaction" is responded behind the hash-tag in the property 'ftReceiptIdentification' of 'ReceiptResponse', prefixed by "DT".  
It is not mandatory to call 'Sign' using 'ReceiptCase' "Delta-Transaction" before finalising a transaction. It is also possible to call 'Sign' using 'ReceiptCase' "Delta-Transaction" multiple times for a single unique identifier/for a single transaction.

##### End-Transaction

According to German law and BSI TR-03153, each call to the 'Sign' method using other 'ReceiptCase' than "Start-Transaction", "Update-Transaction", "Delta-Transaction" and any 'Zero-Receipts', takes care of ending a transaction inside the TSE.  
To identify the action/transaction that should be finalised the unique identifier in the property 'cbReceiptReference' inside the 'ReceiptRequest' is used. No matter if you used "Update-Transaction", "Delta-Transaction" or none of them, the 'ChargeItems' and 'PayItems' have to include the complete final state of all items involved.  
The transaction number, defined in TR-03153, is responded behind the hash-tag in the property 'ftReceiptIdentification' of 'ReceiptResponse', prefixed by "T".

#### The fiskaltrust.SecurityMechanism implicit transaction

The regular workflow of the fiskaltrust-SecurityMechanism in the German market for actions running for a short period has the same requirements as long-running ones. There has to be a "Start-Transaction" and a "Finish-Transaction" executed against the TSE. In order to speed up these two steps into one call to the 'Sign' method, a special 'ReceiptCaseFlag' is used. Each time this is used in combination with a usual 'ReceiptCase', a "Start-Transaction" is done behind the scenes upfront the final call, using the given 'ReceiptCase'.
Using a unique identifier in 'cbReceiptReference' that was already used with a 'Sign' call with 'ReceiptCase' "Start-Transaction" will end up in an exception.
The up-counting transaction number defined in TR-03153 is responded behind the hash-tag in the property 'ftReceiptIdentification' of 'ReceiptResponse', prefixed by "IT".

### Receipt for special functions

This section describes receipt types used for special functions on the German market and expands the common descriptions.

#### Zero Receipt

You can find examples of special cases of zero receipts applicable to the German market in the following chapters.

#### Start Receipt (Initial Receipt)

There are many requirements for implementing a new, or a replaced German security mechanism (TSE). This kind of receipt can be used once in a lifetime of the queue/SCU combination and also initialises the underlying German security mechanism (TSE) for usage.
This receipt must be archived. On successful operation, for customers of the product "Finanzamtmeldung", tax authorities are notified about the active usage of the ftCashboxIdentification and the serial number of the German security mechanism (TSE) automatically behind the scenes.

#### Stop Receipt (Closing Receipt)

Once the queue has been closed with a stop receipt, the German security mechanism's usage is deactivated.
On successful operation, for customers of the product "Finanzamtmeldung", tax authorities are notified about the deactivation automatically behind the scenes.

