---
slug: /poscreators/middleware-doc/digital-receipt/implementation/digital-receipt-implementation
title: 'Digital receipt implementation'
---

# Digital receipt transmission 

Before start implementing, please read the getting started section first to make sure you are choosing the best suiting transmitting method for your Point of Sales software. 

fiskaltrust provides two distinct approaches for transmitting receipt requests to the fiskaltrust.Middleware. The first approach is the POS API Helper, which is primarily recommended for testing environments (Sandbox) and the InStore App. Configuring the POS API Helper within the fiskaltrust.Portal requires minimal implementation effort at your Point of Sale software.

However, it's important to highlight that the POS API Helper does not log the delivery statuses of the digital receipt, as mentioned in the section Evaluation of document retrievals for financial administration (Finanzverwaltung). The absence of these logs prevents a tax auditor from reviewing the statuses of printing, acceptance, and submission in the event of an audit. This could result in non-compliance, particularly in Austria, due to the lack of logged records for "Belegausgabepflicht" and "Belegannahmepflicht," rendering verification impossible.

To address this, the POS API provides comprehensive logging of digital receipt interactions, encompassing printing, acceptance, submission, and delivery statuses. This logging fulfills the requirements for "Belegausgabepflicht" and "Belegannahmepflicht" in Austria, as well as "Belegausgabepflicht" in Germany.

It's worth noting that employing the InStore App alongside the POS API Helper guarantees full compliance. The app features built-in capabilities to effectively log events, ensuring adherence to regulatory standards.

# Extract the [QueueID] and [QueueItemID]

Only required when POS API Helper will be uses: The Point of Sale software calls the Middleware's sign endpoint with a regular receipt request. The request is processed by the Middleware. After that, the POS software receives the receipt response from the fiskaltrust.Middleware (which also contains the data for creating a printed receipt). The Point of Sale software extracts the ftQueueId and ftQueueItemId properties from the response, and generates the link out of this data. Final step is the visualization of the QR-Code containing the URL to the digital receipt on the customer display, handheld, self-checkout or any other suitable devices.

The Point of Sale software calls the Middleware's /sign endpoint + POS API Helper or POS API with a regular receipt request. The request is processed by the Middleware. After that, the POS software receives the receipt response from the fiskaltrust.Middleware (which also contains the data for creating a printed receipt). The Point of Sale software extracts the ftQueueId and ftQueueItemId properties from the response, and generates the link out of this data. Final step is the visualization of the QR-Code containing the URL to the digital receipt on the customer display, handheld, self-checkout or any other suitable devices.

Response details:

```
"{
"ftCashBoxID":"124358e8-9cbd-4332-9076-7ed8b72306ac"
"ftQueueID":"c719b59a-9ff0-891a-98a1-030776d8c46f"
"ftQueueItemID":"f838d7c8-3113-4c3a-914a-46d7de555d11"
"ftQueueRow":"41"
"cbTerminalID":"T2"
"cbReceiptReference":"pos-action-identification-02"
"ftCashBoxIdentification":"bonstart"
"ftReceiptIdentification":"ft27#IT11"
"ftReceiptMoment":"2023-08-03T13:12:56.3989064Z"
}"
```

# Create receipts with /sign endpoint + POS-API Helper

![sign+pos-api-helper](https://github.com/fiskaltrust/interface-doc/assets/124153755/b4496ff6-5040-4d5f-90ae-45d03abab862)

This sequence diagram describes the process of generating a digital receipt with the /sign endpoint and the POS-API Helper using the fiskaltrust receipt solution. The participants in the process are the POS software, Middleware, POS-API Helper, fiskaltrust and the consumer. 

In store, the POS software processes the payment or checkout. Then the POS software sends a sign message to the middleware for fiscalization purposes. The POS-API Helper receives the request, to send asynchronous the receipt to the fiskaltrust backend. Once the receipt received at the fiskaltrust backend fully fiscalized. The POS software gets the receipt response, containing the ftQueueID and ftQueueItemID. Then the POS shows a QR-Code on a customer-facing display/device, which can be scanned by the consumer using their mobile phone. 

The consumer accesses the receipt by scanning the QR-Code displayed on the customer-facing display/device with their mobile phone. The consumer requests the receipt from fiskaltrust and receives an HTML document as the receipt. 

# Configure POS-API Helper 

The POS API Helper is available in all countries. This Helper is responsible for uploading data from the local Queue to the digital receipt endpoint. This Helper is configured in the fiskaltrust.Portal and assigned to each CashBox that uses digital receipts. You can add the POS API Helper to change to a direct upload behavior of digital receipts within seconds.

## Configuration

To proceed with the configuration, login to your fiskaltrust.Portal account first. 

### Queue 

| Steps  | Description |
| ------------- | ------------- |
| 1  | Navigate to the configuration section and go to Queue  |
| 2  | Configure Queue  |
| 3  | Copy the URLs to your local machine (Required for CashBox configuration later)   |
| 4  | For all countries: Change port to the next free port (+1) and <br/> a.	if no suffix exists after the port: add the suffix "/name_queue" to the URL ("name" can be freely chosen) <br/> b.	if suffix already exists: add the suffix "_queue" to the URL  |
| 5  | Germany & France only: Change grpc port to the next free port (if port is free no need to go up to the next free port) and add the suffix "/name_queue" to the URL ("name" can be freely chosen)  |
| 6  | Save changes  |

### Helper 

| Steps  | Description |
| ------------- | ------------- |
| 1  | Navigate to Helper  |
| 2  | Create new helper  |
| 3  | Add description  |
| 4  | Select  package name "fiskaltrust.service.helper.posapi"   |
| 5  | Select latest package version   |
| 6  | Select the outlet of CashBox    |
| 7  | Save configuration   |
| 8  | Klick configure helper   |
| 9  | All Counties: Insert the previously saved Queue URLs to the Helper URLs and add the suffix "/name" to the URL (analogue to the naming in queue configuration). Germany & France only: Add also GRPC URL with next free port and add the suffix "/name" to the URL (analogue to the naming in queue configuration).   |
| 10  | Save configuration and close   |

### CashBox 

| Steps  | Description |
| ------------- | ------------- |
| 1  | Navigate to CashBox   |
| 2  | Select your CashBox and click edit by list  |
| 3  | Navigate to Helpers  |
| 4  | Activate the POS API Helper  |
| 5  | Save configuration  |
| 6  | Klick rebuild configuration  |

### Restart

Restart the fiskaltrust.Middleware to apply changes. 

# Create receipts with /print endpoint – receive receipt /response via POS-API (preferred) 

The POS-API is the latest addition to the digital receipt ecosystem. The POS API is a superset of the Middleware's "original" IPOS interface, and uses the same models for /sign, /journal and /echo. The core features of this API provides a variety of different functionalities for Point of Sales software and is the central entry point to the fiskaltrust.Middleware. For the digital receipt the /print endpoint is required, to digitally print digital receipts.

This means that existing implementations can very easily be reused by adjusting them to the asynchronous flow. The IPOS interface will continue to be fully supported by the Middleware.

As most operations especially /print requests may take an extended amount of time, this API is designed in a completely asynchronous way. After sending a request to one of the endpoints listed below, the API immediately returns a message identifier (i.e. an UID), which can then be used to query for the result via the /response endpoint. Please note: The /sign operation does not necessary needs to be implemented for digital receipt application. 

A general sample of this process flow is illustrated in the picture below:

![pos-api](https://github.com/fiskaltrust/interface-doc/assets/124153755/384e56b2-b17e-41e1-b8fe-49a7879763d2)

## Availability

The production API can be reached at https://pos-api.fiskaltrust.cloud; as for all fiskaltrust services, the sandbox instance should be used for development and testing: https://pos-api-sandbox.fiskaltrust.cloud.

The exact same endpoints will also be added to the on-premise Launcher (natively in version 2.0, and via additional Helper packages for the versions below).

## Authentication

Authentication is handled via the headers CashBoxID and Accesstoken, which are mandatory for each request. Those values can be obtained by creating a CashBox in the one of the country-specific fiskaltrust.Portal.

## Operation flow (digital receipt)

Typically, a full receipt flow when using digital receipt (sign, print and response) would look like this:

1. Call the /sign endpoint and asynchronously wait for the result
2. If the signing was successful, call the /print endpoint and asynchronously wait for the result
3. If the printing was successful, call the /response endpoint and asynchronously wait for the result
4. Call the /print endpoint to get the digital receipt status

## Asynchronously signs a receipt, according to local regulations

This method can be used to sign different types of receipts according to the local fiscalization regulations. After signing the receipt according to the fiscal law, this method asynchronously returns the data that will be visualized on the digital receipt. The format of the receipt request is documented in the Middleware API docs, and the exact behavior of the method is determined by the cases sent within the properties (e.g. ftReceiptCase, ftChargeItemCase and ftPayItemCase).

POST:

https://pos-api-sandbox.fiskaltrust.cloud/v0/sign

https://pos-api.fiskaltrust.cloud/v0/sign

Header parameters:

cashboxid (required): string 
accesstoken (required): string

Request body schema (JSON):

```
{
  "ftCashBoxID": "string",
  "ftQueueID": "string",
  "ftPosSystemId": "string",
  "cbTerminalID": "string",
  "cbReceiptReference": "string",
  "cbReceiptMoment": "2019-08-24T14:15:22Z",
  "cbChargeItems": [
    {
      "position": 0,
      "quantity": 0,
      "description": "string",
      "amount": 0,
      "vatRate": 0,
      "ftChargeItemCase": 0,
      "ftChargeItemCaseData": "string",
      "vatAmount": 0,
      "accountNumber": "string",
      "costCenter": "string",
      "productGroup": "string",
      "productNumber": "string",
      "productBarcode": "string",
      "unit": "string",
      "unitQuantity": 0,
      "unitPrice": 0,
      "moment": "2019-08-24T14:15:22Z"
    }
  ],
  "cbPayItems": [
    {
      "position": 0,
      "quantity": 0,
      "description": "string",
      "amount": 0,
      "ftPayItemCase": 0,
      "ftPayItemCaseData": "string",
      "accountNumber": "string",
      "costCenter": "string",
      "moneyGroup": "string",
      "moneyNumber": "string",
      "moment": "2019-08-24T14:15:22Z"
    }
  ],
  "ftReceiptCase": 0,
  "ftReceiptCaseData": "string",
  "cbReceiptAmount": 0,
  "cbUser": "string",
  "cbArea": "string",
  "cbCustomer": "string",
  "cbSettlement": "string",
  "cbPreviousReceiptReference": "string"
}
```

Responses:

200 - Returns a unique identifier, which can be used to obtain the result of the operation via the response endpoint.

Response sample (JSON):

```
{
  "type": "sign",
  "identifier": "fdf2a983-0c30-4d40-bda3-e4e339551e5e"
}
```

400 - Bad request (Please check the request)

401 - Unauthorized (No or qrong Accesstoken or CashBoxID in header)

## Asynchronously create a digital receipt

This method is used to "print" a digital receipt, based on the receipt request and response pair from signing a receipt via the sign endpoint. The asynchronously created response contains the URL to the digital receipt. 

POST:

https://pos-api-sandbox.fiskaltrust.cloud/v0/print

https://pos-api.fiskaltrust.cloud/v0/print

Header parameters:

cashboxid (required): string 
accesstoken (required): string 

Request body schema (JSON):

```
{
  "request": {
    "ftCashBoxID": "string",
    "ftQueueID": "string",
    "ftPosSystemId": "string",
    "cbTerminalID": "string",
    "cbReceiptReference": "string",
    "cbReceiptMoment": "2019-08-24T14:15:22Z",
    "cbChargeItems": [
      {
        "position": 0,
        "quantity": 0,
        "description": "string",
        "amount": 0,
        "vatRate": 0,
        "ftChargeItemCase": 0,
        "ftChargeItemCaseData": "string",
        "vatAmount": 0,
        "accountNumber": "string",
        "costCenter": "string",
        "productGroup": "string",
        "productNumber": "string",
        "productBarcode": "string",
        "unit": "string",
        "unitQuantity": 0,
        "unitPrice": 0,
        "moment": "2019-08-24T14:15:22Z"
      }
    ],
    "cbPayItems": [
      {
        "position": 0,
        "quantity": 0,
        "description": "string",
        "amount": 0,
        "ftPayItemCase": 0,
        "ftPayItemCaseData": "string",
        "accountNumber": "string",
        "costCenter": "string",
        "moneyGroup": "string",
        "moneyNumber": "string",
        "moment": "2019-08-24T14:15:22Z"
      }
    ],
    "ftReceiptCase": 0,
    "ftReceiptCaseData": "string",
    "cbReceiptAmount": 0,
    "cbUser": "string",
    "cbArea": "string",
    "cbCustomer": "string",
    "cbSettlement": "string",
    "cbPreviousReceiptReference": "string"
  },
  "response": {
    "ftCashBoxID": "string",
    "ftQueueID": "string",
    "ftQueueItemID": "string",
    "ftQueueRow": 0,
    "cbTerminalID": "string",
    "cbReceiptReference": "string",
    "ftCashBoxIdentification": "string",
    "ftReceiptIdentification": "string",
    "ftReceiptMoment": "2019-08-24T14:15:22Z",
    "ftReceiptHeader": [
      "string"
    ],
    "ftChargeItems": [
      {
        "position": 0,
        "quantity": 0,
        "description": "string",
        "amount": 0,
        "vatRate": 0,
        "ftChargeItemCase": 0,
        "ftChargeItemCaseData": "string",
        "vatAmount": 0,
        "accountNumber": "string",
        "costCenter": "string",
        "productGroup": "string",
        "productNumber": "string",
        "productBarcode": "string",
        "unit": "string",
        "unitQuantity": 0,
        "unitPrice": 0,
        "moment": "2019-08-24T14:15:22Z"
      }
    ],
    "ftChargeLines": [
      "string"
    ],
    "ftPayItems": [
      {
        "position": 0,
        "quantity": 0,
        "description": "string",
        "amount": 0,
        "ftPayItemCase": 0,
        "ftPayItemCaseData": "string",
        "accountNumber": "string",
        "costCenter": "string",
        "moneyGroup": "string",
        "moneyNumber": "string",
        "moment": "2019-08-24T14:15:22Z"
      }
    ],
    "ftPayLines": [
      "string"
    ],
    "ftSignatures": [
      {
        "ftSignatureFormat": 0,
        "ftSignatureType": 0,
        "caption": "string",
        "data": "string"
      }
    ],
    "ftReceiptFooter": [
      "string"
    ],
    "ftState": 0,
    "ftStateData": "string"
  }
}
```

Responses:

200 - Returns a unique identifier, which can be used to obtain the result of the operation via the response endpoint.

Response sample (JSON):

```
{
    "type": "print",
    "identifier": "0ccf5ada-7d0d-4531-bc2c-9c602d26e4fe"
}
```

400 - Bad request "not supported" (Please check the request) 

401 – Unauthorized (No or wrong Accesstoken or CashBoxID in header)



## Return the /response of a previous async call

This method is used to obtain the result of a previously executed asynchronous operation. Callers should pass the result object from this referenced operation into the body, and the method will either return the requested response, or HTTP 204 in case the operation has not finished yet.

The response type of this methos depends on the type of the referenced asynchronous operation. For the digital receipt the PrintResponse can be used to obtain the URL to the digital receipt:

Request sample for print operation:
```
{
  "type": "print",
  "identifier": "fdf2a983-0c30-4d40-bda3-e4e339551e5e"
}
```
Response sample:
```
{
    "message": "Receipt published for processing",
    "receiptUrl": "https://receipts-sandbox.fiskaltrust.cloud/60914be9-fd1a-49f1-a541-2698b923ae39/4b1c7efc-d6af-41cd-9517-83e4e90238e2"
}
```

Please find further implementation details for the response endpoint:

https://docs.fiskaltrust.cloud/de/apis/pos-api#tag/POS-API/paths/~1v0~1response/post 

# Give away version (QR-Label)

This method provides the digital receipt via QR-Label, a receipt tag that should be distributed via an barcode scanner from the Point of Sale into the Middleware. There are three options in following JSON format available. 
For this implementation the POS-API Helper or POS API is required to change the upload behavior  for the digital. 

```
"ftReceiptCaseData":  "{ \"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abc123456789\" }"

"ftChargeItemCaseData": "{ \"ReceiptTag\": "https://receipts.fiskaltrust.cloud?tag=abc123456789\" }"

"ftPayItemCaseData": "{ \"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abc123456789\" }"

```

A full example containing all three options could e.g. look like this:

```
{
    "ftCashBoxID": "00000000-0000-0000-0000-000000000000",
    "ftPosSystemID": "00000000-0000-0000-0000-000000000000",
    "cbTerminalID": "1",
    "cbReceiptReference": "1",
    "cbReceiptMoment":"{{current_moment}}",
    "cbChargeItems": [
        {
            "Quantity": 1.0,
            "Description": "Article 1",
            "Amount": 33.06,
            "VATRate": 20.0,
            "ftChargeItemCase": 4707387510509010944,
            "ftChargeItemCaseData":  "{ \"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abc123456789\" }",
            "AccountNumber": "",
            "CostCenter": "",
            "ProductGroup": "",
            "ProductNumber": "1",
            "ProductBarcode": "",
            "Unit": ""
        },
        {
            "Quantity": 1.0,
            "Description": "Article 2",
            "Amount": 5.69,
            "VATRate": 20.0,
            "ftChargeItemCase": 4707387510509010944,
            "ftChargeItemCaseData": "",
            "AccountNumber": "",
            "CostCenter": "",
            "ProductGroup": "",
            "ProductNumber": "2",
            "ProductBarcode": "",
            "Unit": ""
        }
    ],
    "cbPayItems": [
        {
            "Quantity": 1.0,
            "Description": "Bar",
            "Amount": 38.75,
            "ftPayItemCase": 4707387510509010944,
            "ftPayItemCaseData": "{ \"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abclökaejölasjf\" }",
            "AccountNumber": "",
            "CostCenter": "",
            "MoneyGroup": "",
            "MoneyNumber": ""
        }
    ],
    "ftReceiptCase": 4707387510509010945,
    "ftReceiptCaseData": "{ \"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abclökaejölasjf\" }"
}
```
Please keep in mind that in a real use case, only one of the three mentioned ways to inject the link into the receipt request should be used, depending on what fits the POS software's internal flows best.

# Failure or disruption of internet connection

## Austria 

In the event of a failure or disruption of the internet connection, where no receipts can be uploaded to the fiskaltrust backed, you are required by Austrian law to print the receipt and make it available for the consumer. 
If you receive the ftState 0x4154000000000001 or 0x4154000000000004 as a ReceiptResponse, no digital receipt should be visualized as a QR-Code or scanned as Give-Away. The receipt needs to be printed.

The country-specific code is made of the country's code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Austria (AT) this is 0x4154, which results in 0x4154000000000001 as the value for the "out of service" status.

| Value  | Description | Middleware version |
| ------------- | ------------- | ------------- |
| 0x4154000000000001  | "out of service" No RKSV signatures are generated or sent back. No RKSV-DEP is written, as nothing is being signed. The E131-DEP records requests and responses.  | 1.0  |
| 0x4154000000000004  | "SSCD permanently out of service" The status "SSCD temporary out of service" was activated more than 48h ago. Thus a FinanzOnline notification has been generated. For conduct and termination of this mode, see "SSCD temporary out of service".  | 1.0  |

The following example shows how to extract the value of a flag into the ftState property.

```
if ((ReceiptResponse.ftState & 0x4154000000000001) != 0) 
{ 
    //your code in case of out of service condition 
}
if ((ReceiptResponse.ftState & 0x4154000000000004) != 0)
 { 
    //your code in case of SSCD permanently out of service condition
 }
```

## Germany 

In the event of a failure or disruption of the internet connection, we recommend to print the receipt and make it available to the customer. If you receive the ftState 0x4154000000000001 or 0x4154000000000004 as a ReceiptResponse, no digital receipt should be visualized as a QR-Code or scanned as Give-Away - the receipt should be printed out. The country-specific code is made of the country's code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Germany (DE) this is 0x4445, which results in 0x4445000000000002 as the value for the "security mechanism was not able to communicate with the TSE device for at least one cycle" status.

| Value  | Description | Middleware value |
| ------------- | ------------- | ------------- |
| 0x4445000000000002  | The security mechanism was not able to communicate with the TSE device for at least one cycle. If this is the case, no more communication attempts are done to avoid long waiting times for each Receipt request/Receipt response sequence. To leave this state, a Zero-Receipt must be sent, which forces a communication retry towards the TSE device. Receipts created in a state where no communication is possible with the TSE device are protected by the security mechanism of fiskaltrust.  | 1.0  |
| 0x4445000000000100  | The Middleware is in the process of switching SCUs. This state is returned in case any receipts are processed between the initialize-switch receipt and the finish-switch receipt. These receipts are protected by the fiskaltrust.SecurityMechanism, but not sent to any TSE, as no SCU is connected at this point.  | 1.3.19  |

The following example shows how to extract the value of a flag into the ftState property.

```
if ((ReceiptResponse.ftState & 0x4445000000000002) != 0)
{ 
    //your code in case of out of service condition 
}
if ((ReceiptResponse.ftState & 0x4445000000000100) != 0)
 { 
    //your code in case of SSCD permanently out of service condition
 }
```

# Mandatory fields for digital receipt visualization 

This chart shows the required data fields to visualize the hole dataset of the digital receipts properly, like the services or items sold, payment methods like voucher or card payment transaction data from your PSP. 

| Field name  | Sample data | Mandatory field | Visualized on receipt | Description |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| cbTerminalID  | Terminal 1  | mandatory  | no  | The unique identification of the cash register within a ftCashBoxID  |
| cbReceiptReference  | 7657a361-ffe1-4633-86d8-500ee4d1cb0a  | mandatory  | no  | Reference number send by the cash register  |
| cbReceiptMoment  | 2023-08-01T08:17:32.003Z  | mandatory  | yes  | The time of receipt creation. Must be provided in UTC  |

cbChargeItems (List of services or items sold)
| Field name  | Sample data | Mandatory field | Visualized on receipt | Description |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| Quantity  | 1  | mandatory  | yes  | Amount or volume (number) of service(s) or items of the entry  |
| Description  | Kaffee  | mandatory  | yes  | Name, description of customary indication, or type of the service or item  |
| Amount  | 3.2  | mandatory  | yes  | Gross total price of service(s). The gross individual price, net total price, and net individual price, have to be calculated using the amount and either VAT rate or VAT amount  |
| VATRate  | 20  | mandatory  | yes  | VAT rate as percentage  |
| ftChargeItemCase  | 0x4154000000000003  | mandatory  | no  | Type of service or item according to the reference table in the appendix. It is used in order to determine the processing logic for the corresponding business transaction  |
| ftChargeItemCaseData  | "{\"ftChargeItemCaseData\":[\"Mit Hafermilch\\r\\nund Zucker\"]}"  | optional  | currently not*  | Additional data about the service, currently accepted only in JSON format  |
| VATAmount  | 0.5333333333333333  | optional  | yes  | If the VAT amount is indicated, it can be used to calculate the net amount in order to avoid rounding errors which are especially likely to appear in row-based net price additions  |
| AccountNumber  | 1234  | optional  | no  | Account number for transfer into bookkeeping  |
| CostCenter  | 1  | optional  | no  | Indicator for transfer into cost accounting (type, center, and payer)  |
| ProductGroup  | Kaffee  | optional  | no  | This value allows the customer the logical grouping of products  |
| ProductNumber  | 123  | optional  | no  | Value used to identify the product  |
| ProductBarcode  | 16514646137  | optional  | currently not*  | Product’s barcode  |
| Unit  | Stk  | optional  | no  | Unit of measurement  |
| UnitQuantity  |   | optional  | no  | Quantity of the service(s) of receipt entry, displayed in indicated units  |
| UnitPrice  | 2.56  | optional  | no  | ross price per indicated unit  |
| Moment  | 2023-08-01T07:47:53.68Z  | mandatory  | no  | Time of service (year, month, day, hour, minute, second). Must be provided in UTC  |

cbPayItems (List of payment received)

| Field name  | Sample data | Mandatory field | Visualized on receipt | Description |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| Quantity  | 1  | mandatory  | no  | Number of payments. This value will be set to 1 in most of the cases. It can be greater than 1 e.g. when paying with multiple vouchers of the same value  |
| Description  | Hobex   | mandatory  | yes  |Name or description of payment  |
| Amount  | 3.2  | mandatory  | yes  | Total amount of payment  |
| ftChargeItemCase  | 0x4154000000000003  | mandatory  | no  | Type of service or item according to the refer-ence table in the appendix. It is used in order to determine the processing logic for the corresponding business transaction  |
| ftPayItemCaseData  | "ftPayItemCaseData":<br/>"{\"cbPayItemLines\":[\"* *  Kundenbeleg  * *\\r\\nTest\\r\\nMusterstr. 1\\r\\n5020 Salzburg\\r\\nDatum: 05.07.2023\\r\\nUhrzeit: 08:46:26 Uhr\\r\\nBeleg-Nr. 0001\\r\\nTrace-Nr. 000123\\r\\nKartenzahlung\\r\\nContactless\\r\\ngirocard\\r\\nNr.\\r\\n###############7123 0000\\r\\nGenehmigungs-Nr. 880123\\r\\nTerminal-ID 52051123\\r\\nPos-Info 00 075 01\\r\\nAS-Zeit 05.07. 08:46 Uhr\\r\\nWeitere Daten 0000000001\\r\\n/////1F0312//\\r\\nBetrag EUR 8,60\\r\\nZahlung erfolgt\\r\\nBitte Beleg aufbewahren\\r\\n\"]}","Moment":"2023-08-09T07:12:46.0000000Z"}]}"  | optional  | yes  | Additional data about the payment transaction data, only accepted in JSON format. This can be the transaction data from card payment data from your PSP or the remaining value of a voucher  |
| CostCenter  | 1  | optional  | no  | Indicator for transfer into cost accounting (type, center and payer)  |
| MoneyGroup  | 1  | optional  | no  | This value allows the logical grouping of payment types  |
| MoneyNumber  | 1  | optional  | no  | This value identifies the payment type  |
| ftReceiptCase  | 0x4154000000000001  | mandatory  | no  | The ftReceiptCase indicates the receipt type and defines how it should be processed by the fiskaltrust.SecurityMechanism in accordance with the local law  |
| cbReceiptAmount  | 3.2  | optional  | yes  | Total receipt amount incl. taxes (gross receipt amount). If it is not provided, it can be calculated with the sum of the amounts of the cbChargeItems. It can be useful and important for systems working with net amounts, as it helps to apply different methods of calculation and rounding  |
| cbUser  | Hr. Müller  | optional  | currently not*  | Identification of the user, who creates the receipt. Although all string values are supported, we suggest using data structures serialized into JSON format  |

*Implementation for visualization on the digital receipt planned, but not yet available  
