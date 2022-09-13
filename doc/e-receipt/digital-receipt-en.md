---
slug: /poscreators/middleware-doc/general/digital-receipt
title: Digital Receipt
---
# Table of contents
1. [General](#general)
2. [Basic Version of the digital receipt](#basic-version-of-the-digital-receipt)
3. [Process Flow](#process-flow)
4. [Give-Away Version of the Digital Receipt](#give-away-version-of-the-digital-receipt)
5. [Example for the ReceiptRequest](#example-for-the-ReceiptRequest)
6. [Promotion-version of the digital receipt](#promotion-version-of-the-digital-receipt)
7. [Carefree-version of the digital receipt](#carefree-version-of-the-digital-receipt)
8. [Third Party API](#third-party-api)
9. [Receipt Visualisation and Receipt Layout](#receipt-visualisation-and-receipt-layout)

## General

Fiskaltrust offers the functionality of a digital receipt through the fiskaltrust middleware. 

We offer four different types of digital receipt: 
1. Basic 

2. Give-Away 

3. Promotion 

4. Carefree 

In the basic and carefree versions we could develop over an existing integration of the fiskaltrust middleware a digital receipt, without any extra adjustment.  For the two other concepts, like  “Give-away” and “Promotion” some additional meta data would be required, which could be handed over through the existing functional data structure. 

For technical connections without  using the fiskaltrust middleware, a specific API is intended, however this is not available yet at the moment . 

The precondition for the utilization as a POSOperator is an active contract of use and corresponding database. The database including the logo have to be assigned to the respective Queue and the respective outlet. The database must contain the necessary minimum information for the receipts, to get a productive useable system. 

## Basic Version of the digital receipt

The basic version is free of charge and contains the transmission of the digital receipt via the QR-code. The QR-code should contain a URL in the following format: 
https://receipts.fiskaltrust.cloud/v0/[QueueId]/[QueueItemId] and can be generated individually  from the POS system from the return data of the fiskaltrust middleware or the ReceiptResponse. 

Example ReiceiptRequest / ReceiptResponse 

## Process flow

The checkout purchase scans Give-away QR-code and saves it  

The checkout purchase prepares the data for ReceiptRequest and fills one of the following data fields with the scanned QR-code data in JSON-format 

  - as an article inside the chargeitem through the field ChargeitemCaseData 

  - as a currency inside the PayItem through the field PAyItemCaseData 

  - as a receipt through the field ReceiptCaseData 

The checkout purchase calls up the sign function through the RiceiptRequest in the fiskaltrust middleware.

 The customer gets a give away with the QR-code and can get his digital receipt anytime he wants.

 Examples for the ReceiptRequest 

Ajar on the examples with fiskaltrust.Middleware. 

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

            "Description": "Artikel 1", 

            "Amount": 33.06, 

            "VATRate": 20.0, 

            "ftChargeItemCase": 4707387510509010944, 

            "ftChargeItemCaseData":  "{  

\"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abclökaejölasjf\" 

                }", 

            "AccountNumber": "", 

            "CostCenter": "", 

            "ProductGroup": "", 

            "ProductNumber": "1", 

            "ProductBarcode": "", 

            "Unit": "" 

        }, 

        { 

            "Quantity": 1.0, 

            "Description": "Artikel 2", 

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

            "ftPayItemCaseData": "{  

\"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abclökaejölasjf\" 

                }", 

            "AccountNumber": "", 

            "CostCenter": "", 

            "MoneyGroup": "", 

            "MoneyNumber": "" 

        } 

    ], 

    "ftReceiptCase": 4707387510509010945, 

    "ftReceiptCaseData": "{  

\"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abclökaejölasjf\" 

                }" 

} 

```
Markers by background colour. Respectively one of the specifications in enough. The value of the ReceiptTag Properties must be replaced through the specific scanned QR-Code value 

 

As article per ChargeItems 

As currency per Payitem 

As receipt per ReceiptCaseData 

  

## Promotion version of the digital receipt 



## Carefree version of the digital receipt 

## Third party API 

## Receipt visualisation and receipt layout 

Third Party Receipt Data for Payments
Based on the examples with fiskaltrust.Middleware

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
"Description": "Artikel 1",
"Amount": 33.06,
"VATRate": 20.0,
"ftChargeItemCase": 4707387510509010944,
"AccountNumber": "",
"CostCenter": "",
"ProductGroup": "",
"ProductNumber": "1",
"ProductBarcode": "",
"Unit": ""
},
{
"Quantity": 1.0,
"Description": "Artikel 2",
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
"ftPayItemCaseData": "{
\"cbPayItemLines\": [ \"Line1\", \"Line2\", \"Line3\", \"…\" ]
}",
"AccountNumber": "",
"CostCenter": "",
"MoneyGroup": "",
"MoneyNumber": ""
}
],
"ftReceiptCase": 4707387510509010945,
"ftReceiptCaseData": "{
\"ReceiptTag\": \"https://receipts.fiskaltrust.cloud?tag=abclökaejölasjf\"
}"
}
```