## Function Structures

This chapter expands on the descriptions of the function structures covered in Chapter <!-- TODO: Chapter reference --> 6.5 of the General Part, with country specific information applicable to the Austrian market.

### iPOS Interface

#### Echo Function

In case of the Austrian product SignaturCloud, there is a special condition when the Echo-Function is called with null as a Message, which forces to reinitialize the fiskaltrust.Queue at service side.

#### Sign Function

The sign function meets the RKSV requirements when the fiskaltrust.SecurityMechanism is run in the following mode: the country set for creating the queue is AT and the cbReceiptCase has the flag `0x4154000000000000`.

#### Journal Function

A list with possible values for the request parameter ftJournalType for the Austrian market is provided in the reference table <!-- TODO: table references --> on page 8 <!-- TODO: page references -->4.

### RKSV-DEP Export

This interface allows requesting the RKSV-DEP by means of ftJournalType `0x4154…01`. It is required to retrieve data at the cash register in case of a check or an inspection (for example through fiscal authorities).

In addition, a security file of the RKSV-DEP is generated with each monthly report. The file name of this backup file can also be retrieved. The name of the file is composed as follows:

`QueueID + CurrentDateTime + CashboxId + LastSettlementMonth + "\_rksv\_dep.json"`

The CurrentDateTime is provided in the `yyyyMMddhhmmssfff` format.

### IATSSCD Interface

This interface is applicable only for the Austrian market and enables direct communication with the signature creation device for own purposes: it can be used for testing if the service is running ("Echo" call), for getting the certificate ("Certificate" call), or signing autonomously ("Sign" call).

#### ZDA Indicator Request

The ZDA indicator can be requested with the function:

`string ZDA();`

#### Certificate Request

The signature certificate can be requested with the public key of the signature creation device with the function:

`byte[] Certificate();`

#### Signature Function

The data can be signed with the function:

`byte[] Sign(byte[] data);`
