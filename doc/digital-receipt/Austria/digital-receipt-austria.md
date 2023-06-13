---
slug: /poscreators/middleware-doc/digital-receipt/austria
title: 'Digital Receipt: Austria'
---

# Compliance AT

Regulations for digital receipts in Austria:

An digital receipt within the meaning of Section 132a (1) BAO is a receipt that is issued and received in an digital format or is immediately available to the person making the cash payment. It can be issued, for example by web in an digital format (e.g. as a PDF or text file), but also in a structured file format (e.g. HTML). The receipt must be created and signed by the cash register directly in connection with the cash payment, and then actually reach the disposal area of the receipt recipient. Technical delays such as e.g. uploading to a server are irrelevant if the receipts are stored immediately in the DEP and promptly in an audit-proof memory and for a verification by a financial management body is available. It is up to the issuer of the digital receipt whether this is to be done digitally (by using a smartphone, etc.) or in paper form. The transmission is an obligation of the entrepreneur, a mere granting of the possibility of viewing and photographing the content of the receipt displayed on a screen does not fulfill the obligation to issue receipts. A special form of digital transmission is not required. Whether the transfer to the area of disposal of the recipient of the receipt takes place through the activity of the service provider or the person making the payment is irrelevant for the fulfillment of the obligation to issue the receipt. This type of receipt is to be documented in the electronic recording system.

fiskaltrust has commissioned an external assessment with the aim of examining whether various options for digital document creation correspond to the RKSV from a technical point of view. In this report, these approaches were examined both in principle on the basis of the concept and on the basis of concrete implementations.

You can request the report at the following e-mail address: hello@fiskaltrust.eu
In the event of a failure or disruption of the internet connection, you are required by Austrian law to print the receipt and make it available to the customer. If you receive the ftState 0x4154000000000001 or 0x4154000000000004 as a ReceiptResponse, no digital receipt should be be visualized as a QR-Code or scanned as Give-Away - the receipt must be printed out.

The country-specific code is made of the country's code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Austria (AT) this is 0x4154, which results in 0x4154000000000001 as the value for the "out of service" status.

||||
|---|---|---|
|Value|Description|Middleware value|
|0x4154000000000001|"out of service" No RKSV signatures are generated or sent back. No RKSV-DEP is written, as nothing is being signed. The E131-DEP records requests and responses.|1.0|
|0x4154000000000004|"SSCD permanently out of service" The status "SSCD temporary out of service" was activated more than 48h ago. Thus a FinanzOnline notification has been generated. For conduct and termination of this mode, see "SSCD temporary out of service".|1.0|

The following example shows how to extract the value of a flag into the ftState property.
```cs
if ((ReceiptResponse.ftState & 0x4154000000000001) != 0) 
{ 
    //your code in case of out of service condition 
}
if ((ReceiptResponse.ftState & 0x4154000000000004) != 0)
 { 
    //your code in case of SSCD permanently out of service condition
 }
```
