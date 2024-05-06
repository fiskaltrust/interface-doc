# Configuration of the fiskaltrust.Middleware

#### Online Portal

All configuration settings, as well as the relevant extensions, are managed via the online fiskaltrust.Portal. For further information, refer to the appropriate appendix.

#### Queue

At least one Queue must be created for each POS-System. Dependent on local market regulations like in Austria and Germany, the queue represents the component of the cash register to be registered at the local tax authorities.

#### Journal

A journal is an export of internal structured data of the receipts from the Queue(s). There are three types of journals: a protocol journal saving all requests, a journal which records all events happening in the queue (starts, stops, failures), and localized journals depending on the national laws. For more details please refer to the appropriate appendix.

#### Notifications

The information for notifications is extracted from the processing protocol and stored internally in the fiskaltrust.ActionJournal . Helipad retrieves this information and processes it in accordance with country specific law. Special events have a localized reporting requirement. In online mode, notifications can be uploaded, automated and transported further at fiskaltrust.SecurityMechanism. If in offline mode, notifications are transported via zero receipts within the signature block.

#### Configuration Scenarios

Configuration scenarios are highly dependent on local market regulation and the platform of the POS-System. For specific information regarding configuration, please refer to the appropriate appendices:

- Austria

- [Germany](../../middleware-de-kassensichv/operation-modes/on-premise-installation.md)

- France

- [Italy](../../middleware-it-registratore-telematico/operation-modes/on-premise-installation.md)
