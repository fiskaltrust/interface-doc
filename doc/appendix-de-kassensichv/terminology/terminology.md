# Terminology

| Term | Description |
|---|---|
| Action (DE: Vorgang) | An "action" in the context of the KassenSichV is a related recording process of an electronic recording system. An action can comprise one or more business-actions as well as other procedures, occurrences and events. Each action must trigger at least one transaction logged by the certified technical safety device (DE: TSE).<br />The term "action" is used as a generic term for "business-actions" and other actions to be secured. |
| Transaction (DE: Transaktion) | In the context of the logging of an action at least one transaction must be generated within the certified technical safety device (DE: TSE). While an "action" refers to the processes in the recording system, a "transaction" describes the safeguarding steps within the certified technical security device (at least at the beginning and end of the action) to the action in the respective recording system. |
| Business-action (DE: Geschäftsvorfall) | Business-actions are all legal and economic transactions that document, influence or change the profit or loss or the asset composition of an enterprise within a certain period of time. |
| Flow | The "flow" describes the communication between the POS System and the fiskaltrust.Middleware to trigger transactions. This can be done either explicitly (each transaction has to be initiated "explicitly"; e.g. "Start" or "Finish") or implicitly (a "Start-Transaction" is done behind the scenes automatically - implicitly - upfront to the final call). |

