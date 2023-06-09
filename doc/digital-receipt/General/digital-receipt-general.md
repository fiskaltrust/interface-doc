---
slug: /poscreators/middleware-doc/digital-receipt/general
title: 'Digital Receipt: General'
---

# Overview 

## Basic version of the digital receipt
The basic version is free of charge and provides the digital receipt via a link that should be distributed as a QR code (e.g. on the customer display of the POS system), which should contain a URL in the following format: 
```
https://receipts.fiskaltrust.cloud/v0/[QueueId]/[QueueItemId]
```
:::caution

For Sandbox environment the URL should contain following format:
```
https://receipts-sandbox.fiskaltrust.cloud/v0/[QueueId]/[QueueItemId]
```
:::

This code (and the respective link) can be generated individually from any POS system, based on the data returned by the `/Sign` method of the fiskaltrust.Middleware (which is used to fiscalize receipts).

The advantage of this basic version is that it can be used without any further implementation efforts in the POS software. On the other hand, this approach can only be used with POS systems that have a customer display, and lacks other advantages of the options described below.

### Process flow
- The POS software calls the Middleware's `/Sign` function with a regular receipt request, and the request is processed by the Middleware.
- The POS software receives the the receipt response from the fiskaltrust.Middleware (which also contains the data for creating a printed receipt).
- The POS software extracts the `ftQueueId` and `ftQueueItemId` properties from the response, and generates the link from this data.
- The POS system displays a QR code that contains this link on the customer display.
- The customer or consumer scans the QR code via their smartphone, opens the link, and is displayed the digital receipt.

The digital receipt is available for 3 months after creating the receipt.

## Carefree version of the digital receipt 
This includes all functionalities of the digital receipt (Basic, Give-away and Promotion). 

The digital receipt is available for 7 years in Austria and 10 years in Germany after creating the receipt. 

## Give-away version of the digital receipt
From the fiskaltrust.Portal, prefabricated adhesive labels or give-away products (such as small gummy bear bags) can be purchased to be resold, which then serve as carriers of a QR code for the digital receipt. There are no delays due to the interaction of the cash register or the operating personnel with the consumer, because the consumer receives a give-away and can retrieve the digital receipt later, regardless of time and location.

The cashier can flexibly scan the QR code on the give-away during the production process or during the payment process and thus establish the connection to the receipt created. If the consumer is interested in the receipt and scans it with their own smartphone after the purchase, they are taken to a web-based view of the receipt without having to install a separate app. In this view, the consumer can also provide feedback on the purchased goods or on the operating personnel at the moment of purchase. This feedback can be evaluated by the PosOperator, the seller of the service, and can easily be put in context with the time of service and the items sold.

The operator's PosDealer can participate by means of placing orders and intermediary in support and billing for each transaction of the POS operator. This applies to every single receipt issued, as the giveaway is issued regardless of how it is viewed and used by the consumer. Since the cost of a QR code label for the digital receipt is less than one third of an 80/80/12 thermal roll at an average length of 20cm per receipt, the margin to be achieved for the PosDealer is higher than for thermal paper (if the PosDealer does not want to contribute an additional investment for giveaways in consumer satisfaction).

### Process flow
- The POS system scans the giveaway QR code and saves it.
- The POS system prepares the data for the receipt request to the `/Sign` method of the fiskaltrust.Middleware, and fills **one** of the following data fields with the scanned QR code data in JSON format (see below):
  - In the `ftReceiptCaseData` property of the receipt request
  - As an item within a `ChargeItem`, using the using the `ftChargeItemCaseData` field.
  - As an item within a `PayItem`, using the using the `ftPayItemCaseData` field.
- The POS software calls the Middleware's `/Sign` function with the computed receipt request, and the request is processed by the Middleware.
- The customer or consumer receives the give-away with the previously scanned QR code, and can then display the digital receipt at any time by scanning it.

### Request details
The scanned link from the QR code must be sent to the Middleware in the following JSON format (in one of the fields described above):
```jsonc
"ftReceiptCaseData":  "{ \"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abc123456789\" }"

// Or:
"ftChargeItemCaseData": "{ \"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abc123456789\" }"

// Or:
"ftPayItemCaseData": "{ \"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abc123456789\" }"
```

A full example containing all three options could e.g. look like this:
```json
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

More examples can be found in our [Postman collection](https://middleware-samples.docs.fiskaltrust.cloud/).

:::caution

Please keep in mind that in a real use case, only **one** of the three mentioned ways to inject the link into the receipt request should be used, depending on what fits the POS software's internal flows best.

:::

### Transaction data from card payment
For payment terminals who are connected to the POS system, transaction data from the card payment can be visualized on the digital receipt.

| Field Name          | Data Type             | Default Value<br />Mandatory Field | Description                                                                                                           | Version |
|---------------------|-----------------------|------------------------------------|-----------------------------------------------------------------------------------------------------------------------|---------|
| `ftPayItemCaseData` | `String`<br />Max 64k | empty-string<br />optional         | Additional data about the payment, currently accepted only in JSON format.                                            | 0-      |

The returned data from Payment Service Provider (PSP) can look like following example from Hobex. Please note that any transaction data, regardless of which PSP is used can be send. 
"{"cbPayItemLines":["VU 123456789 TID 1234567-1\r\n\r\n KUNDENBELEG\r\n01.01.2023 12:00:00\r\n Beleg#: 123456\r\n Genehmigungs#: 123456\r\n Crypto: XXXXXXXXXXXXXXXX\r\n\r\nKAUF\r\nDEBIT MASTERCARD\r\nA0000000000000\r\nXXXXXXXXXXXX0000 12/25\r\nNO CVM Contactless\r\nSVC000 0000000000000000\r\n\r\nBETRAG EUR 10,00\r\n ============\r\n\r\n TX genehmigt!\r\n (RC 0000)\r\n\r\n www.hobex.at\r\n ECR V1.6.4\r\n\r\n"]}"

## Promotion/ReceiptHero version of the digital receipt 
_Coming soon_
