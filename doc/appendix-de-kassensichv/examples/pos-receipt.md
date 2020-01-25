

implicit flow

ReciptRequest

`
{
  "ftCashBoxID": "cashboxid-guid",
  "ftPosSystemId": "possystemid-guid",
  "cbTerminalID": "terminalid",
  "cbReceiptReference": "233348",
  "cbReceiptMoment": "2019-10-25T13:32:45.133Z",
  "cbChargeItems": [
    {
      "Position": 1,
      "Quantity": 1.0,
      "Description": "Bier 0,5 lt",
      "Amount": 3.80,
      "VATRate": 19.0000,
      // 0x4445000000000011 (delivery normal)
      "ftChargeItemCase": 4919338167972134929,
      "ftChargeItemCaseData": "",
      "VATAmount": 0.61,
      "CostCenter": "1",
      "AccountNumber": "Accountnumber",
      "ProductGroup": "Bier",
      "ProductNumber": "101",
      "ProductBarcode": "",
      "Unit": "Stk",
      "UnitQuantity": 1,
      "UnitPrice": 3.8,
      "Moment": "2019-10-25T13:32:45.133Z"
    },
    {
      "Position": 2,
      "Quantity": 1.0,
      "Description": "Schnitzel",
      "Amount": 9.20,
      "VATRate": 7.00,
      // 0x4445000000000012 (delivery reduced-1)
      "ftChargeItemCase": 4919338167972134930,
      "ftChargeItemCaseData": "",
      "VATAmount": 0.60,
      "CostCenter": "1",
      "AccountNumber": "Accountnumber",
      "ProductGroup": "Speisen",
      "ProductNumber": "102",
      "ProductBarcode": "",
      "Unit": "Stk",
      "UnitQuantity": 1,
      "UnitPrice": 9.20,
      "Moment": "2019-10-25T13:32:45.133Z"
    }
  ],
  "cbPayItems": [
    {
      "Position": 1,
      "Quantity": 1,
      "Description": "Bar",
      "Amount": 13.0,
      // 0x4445000000000001 (cash payment)
      "ftPayItemCase": 4919338167972134913,
      "ftPayItemCaseData": "",
      "AccountNumber": "Accountnumber",
      "CostCenter": "Costcenter123",
      "MoneyGroup": "BAR",
      "MoneyNumber": "1234",
      "Moment": "2019-10-25T13:32:45.133Z"
    }
  ],
  // 0x4445 0000 0000 0001 (pos-receipt) + 0x0000 0001 0000 0000 (implicit flow)
  "ftReceiptCase": 4919338168240570369,
  "ftReceiptCaseData": "",
  "cbReceiptAmount": 13.00,
  "cbUser": "Chef",
  "cbArea": "Tisch 01",
  "cbSettlement": "Test1"
}
`


ReceiptResponse

`
{
    "ftCashBoxID": "cashboxid-guid",
    "ftQueueID": "queueid-guid",
    "ftQueueItemID": "queueitemid-guid",
    "ftQueueRow": 96,
    "cbTerminalID": "1",
    "cbReceiptReference": "1",
    "ftCashBoxIdentification": "[ftCashBoxIdentification]",
    "ftReceiptIdentification": "ft[queue-receiptnumerator-hex]#IT[finishTransactionNr]",
    "ftReceiptMoment": "2019-10-25T13:32:46.133Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            //0x4445000000000001 (qr-code according kasssichv)
            "ftSignatureType": 4919338167972134913,
            "caption": "www.fiskaltrust.de",
            "data": "V0;[ftCashBoxIdentification];Kassenbeleg-V1;Beleg^3.80_9.20_0.00_0.00_0.00^13.00:Bar;[finishTransactionNr];[signatureCounter];[startTransactionMoment];[finishTransactionMoment];[signatureAlgorithm];[logTimeFormat e.g. unixtime];[signature];[publickey]"
        },
        {
            "ftSignatureFormat":13,
            //0x4445000000000010 (start-transaction-result)
            "ftSignatureType": 4919338167972134928,
            "caption": "start-transaction-signature",
            "data": "[startTransactionResult]"
        },
        {
            "ftSignatureFormat":13,
            //0x4445000000000011 (finish-transaction-payload)
            "ftSignatureType": 4919338167972134929,
            "caption": "finish-transaction-payload",
            "data": "[finishTransactionPayload]"
        },
        {
            "ftSignatureFormat": 13,
            //0x4445000000000012 (finish-transaction-result)
            "ftSignatureType": 4919338167972134930,
            "caption": "finish-transaction-payload",
            "data": "[finishTransactionResult]"
        },
        {
            "ftSignatureFormat": 1,
            //0x4445000000000013 (qr-code-version)
            "ftSignatureType": 4919338167972134931,
            "caption": "qr-code-version",
            "data": "V0"
        },
        {
            "ftSignatureFormat": 1,
            //0x4445000000000014 (processType)
            "ftSignatureType": 4919338167972134933,
            "caption": "processType",
            "data": "Kassenbeleg-V1"
        },
        {
            "ftSignatureFormat": 1,
            //0x4445000000000015 (processData)
            "ftSignatureType": 4919338167972134934,
            "caption": "processData",
            "data": "Beleg^3.80_9.20_0.00_0.00_0.00^13.00:Bar"
        },
        {
            "ftSignatureFormat": 1,
            //0x4445000000000017 (<transaktions-zähler>)
            "ftSignatureType": 4919338167972134935,
            "caption": "transaktions-nummer",
            "data": "[finish-transaktions-zähler]"
        },
        {
            "ftSignatureFormat": 1,
            //0x4445000000000018 (<finish-signatur-zäher>)
            "ftSignatureType": 4919338167972134936,
            "caption": "<signatur-zaehler> ",
            "data": "[finish-signatur-zaehler]"
        },
        {
            "ftSignatureFormat": 1,
            // 0x4445000000000019  <start-zeit>
            "ftSignatureType": 4919338167972134937,
            "caption": "<start-zeit>",
            "data": "[start-zeit]"
        },
        {
            "ftSignatureFormat": 1,
            //0x444500000000001A <log-time>
            "ftSignatureType": 4919338167972134938,
            "caption": "<log-time>",
            "data": "[log-time]"
        },
        {
            "ftSignatureFormat": 1,
            //0x444500000000001B <sig-alg>
            "ftSignatureType": 4919338167972134939,
            "caption": "<sig-alg>",
            "data": "[<sig-alg>]"
        },
        {
            "ftSignatureFormat": 1,
            //0x444500000000001C <log-time-format>
            "ftSignatureType": 4919338167972134940,
            "caption": "<log-time-format>",
            "data": "[<log-time-format>]"
        },
        {
            "ftSignatureFormat": 1,
            //0x444500000000001D <signatur>
            "ftSignatureType": 4919338167972134941,
            "caption": "<signatur>",
            "data": "[<signatur>]"
        },
        {
            "ftSignatureFormat": 1,
            //0x444500000000001E <public-key>
            "ftSignatureType": 4919338167972134942,
            "caption": "<public-key>",
            "data": "[<public-key>]"
        }
    ],
    "ftState": 4707387510509011000
}
`








explicit flow

- start-transaction

ReciptRequest

`
{
  "ftCashBoxID": "cashboxid-guid",
  "ftPosSystemId": "possystemid-guid",
  "cbTerminalID": "terminalid",
  "cbReceiptReference": "233348",
  "cbReceiptMoment": "2019-10-25T13:32:45.133Z",
  "cbChargeItems": [ ],
  "cbPayItems": [  ],
  // 0x4445 0000 0000 0008 (pos-receipt) 
  "ftReceiptCase": 4919338167972134920,
  "cbUser": "Chef",
  "cbArea": "Tisch 01",
  "cbSettlement": "Test1"
}
`


ReceiptResponse

`
{
    "ftCashBoxID": "cashboxid-guid",
    "ftQueueID": "queueid-guid",
    "ftQueueItemID": "queueitemid-guid",
    "ftQueueRow": 96,
    "cbTerminalID": "1",
    "cbReceiptReference": "1",
    "ftCashBoxIdentification": "[ftCashBoxIdentification]",
    "ftReceiptIdentification": "ft[ftQueueRow]#T[finishTransactionNr]",
    "ftReceiptMoment": "2019-10-25T13:32:46.133Z",
    "ftSignatures": [
        {
            "ftSignatureFormat":13,
            //0x4445000000000010 (start-transaction-result)
            "ftSignatureType": 4919338167972134928,
            "caption": "start-transaction-signature",
            "data": "[startTransactionResult]"
        }
    ],
    "ftState": 4707387510509011000
}



- pos-receipt

ReciptRequest

`
{
  "ftCashBoxID": "cashboxid-guid",
  "ftPosSystemId": "possystemid-guid",
  "cbTerminalID": "terminalid",
  "cbReceiptReference": "233348",
  "cbReceiptMoment": "2019-10-25T13:32:45.133Z",
  "cbChargeItems": [
    {
      "Position": 1,
      "Quantity": 1.0,
      "Description": "Bier 0,5 lt",
      "Amount": 3.80,
      "VATRate": 19.0000,
      // 0x4445000000000011 (delivery normal)
      "ftChargeItemCase": 4919338167972134929,
      "ftChargeItemCaseData": "",
      "VATAmount": 0.61,
      "CostCenter": "1",
      "AccountNumber": "Accountnumber",
      "ProductGroup": "Bier",
      "ProductNumber": "101",
      "ProductBarcode": "",
      "Unit": "Stk",
      "UnitQuantity": 1,
      "UnitPrice": 3.8,
      "Moment": "2019-10-25T13:32:45.133Z"
    },
    {
      "Position": 2,
      "Quantity": 1.0,
      "Description": "Schnitzel",
      "Amount": 9.20,
      "VATRate": 7.00,
      // 0x4445000000000012 (delivery reduced-1)
      "ftChargeItemCase": 4919338167972134930,
      "ftChargeItemCaseData": "",
      "VATAmount": 0.60,
      "CostCenter": "1",
      "AccountNumber": "Accountnumber",
      "ProductGroup": "Speisen",
      "ProductNumber": "102",
      "ProductBarcode": "",
      "Unit": "Stk",
      "UnitQuantity": 1,
      "UnitPrice": 9.20,
      "Moment": "2019-10-25T13:32:45.133Z"
    }
  ],
  "cbPayItems": [
    {
      "Position": 1,
      "Quantity": 1,
      "Description": "Bar",
      "Amount": 13.0,
      // 0x4445000000000001 (cash payment)
      "ftPayItemCase": 4919338167972134913,
      "ftPayItemCaseData": "",
      "AccountNumber": "Accountnumber",
      "CostCenter": "Costcenter123",
      "MoneyGroup": "BAR",
      "MoneyNumber": "1234",
      "Moment": "2019-10-25T13:32:45.133Z"
    }
  ],
  // 0x4445 0000 0000 0001 (pos-receipt) 
  "ftReceiptCase": 4919338167972134913,
  "ftReceiptCaseData": "",
  "cbReceiptAmount": 13.00,
  "cbUser": "Chef",
  "cbArea": "Tisch 01",
  "cbSettlement": "Test1"
}
`


ReceiptResponse

`
{
    "ftCashBoxID": "cashboxid-guid",
    "ftQueueID": "queueid-guid",
    "ftQueueItemID": "queueitemid-guid",
    "ftQueueRow": 96,
    "cbTerminalID": "1",
    "cbReceiptReference": "1",
    "ftCashBoxIdentification": "[ftCashBoxIdentification]",
    "ftReceiptIdentification": "ft[ftQueueRow]#T[finishTransactionNr]",
    "ftReceiptMoment": "2019-10-25T13:32:46.133Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            //0x4445000000000001 (qr-code according kasssichv)
            "ftSignatureType": 4919338167972134913,
            "caption": "www.fiskaltrust.de",
            "data": "V0;[ftCashBoxIdentification];Kassenbeleg-V1;Beleg^3.80_9.20_0.00_0.00_0.00^13.00:Bar;[finishTransactionNr];[signatureCounter];[startTransactionMoment];[finishTransactionMoment];[signatureAlgorithm];[logTimeFormat e.g. unixtime];[signature];[publickey]"
        },
        {
            "ftSignatureFormat":13,
            //0x4445000000000010 (start-transaction-result)
            "ftSignatureType": 4919338167972134928,
            "caption": "start-transaction-signature",
            "data": "[startTransactionResult]"
        },
        {
            "ftSignatureFormat":13,
            //0x4445000000000011 (finish-transaction-payload)
            "ftSignatureType": 4919338167972134929,
            "caption": "finish-transaction-payload",
            "data": "[finishTransactionPayload]"
        },
        {
            "ftSignatureFormat": 13,
            //0x4445000000000012 (finish-transaction-result)
            "ftSignatureType": 4919338167972134930,
            "caption": "finish-transaction-payload",
            "data": "[finishTransactionResult]"
        },
        {
            "ftSignatureFormat": 1,
            //0x4445000000000013 (qr-code-version)
            "ftSignatureType": 4919338167972134931,
            "caption": "qr-code-version",
            "data": "V0"
        },
        {
            "ftSignatureFormat": 1,
            //0x4445000000000014 (processType)
            "ftSignatureType": 4919338167972134933,
            "caption": "processType",
            "data": "Kassenbeleg-V1"
        },
        {
            "ftSignatureFormat": 1,
            //0x4445000000000015 (processData)
            "ftSignatureType": 4919338167972134934,
            "caption": "processData",
            "data": "Beleg^3.80_9.20_0.00_0.00_0.00^13.00:Bar"
        },
        {
            "ftSignatureFormat": 1,
            //0x4445000000000017 (<transaktions-zähler>)
            "ftSignatureType": 4919338167972134935,
            "caption": "transaktions-nummer",
            "data": "[finish-transaktions-zähler]"
        },
        {
            "ftSignatureFormat": 1,
            //0x4445000000000018 (<finish-signatur-zäher>)
            "ftSignatureType": 4919338167972134936,
            "caption": "<signatur-zaehler> ",
            "data": "[finish-signatur-zaehler]"
        },
        {
            "ftSignatureFormat": 1,
            // 0x4445000000000019  <start-zeit>
            "ftSignatureType": 4919338167972134937,
            "caption": "<start-zeit>",
            "data": "[start-zeit]"
        },
        {
            "ftSignatureFormat": 1,
            //0x444500000000001A <log-time>
            "ftSignatureType": 4919338167972134938,
            "caption": "<log-time>",
            "data": "[log-time]"
        },
        {
            "ftSignatureFormat": 1,
            //0x444500000000001B <sig-alg>
            "ftSignatureType": 4919338167972134939,
            "caption": "<sig-alg>",
            "data": "[<sig-alg>]"
        },
        {
            "ftSignatureFormat": 1,
            //0x444500000000001C <log-time-format>
            "ftSignatureType": 4919338167972134940,
            "caption": "<log-time-format>",
            "data": "[<log-time-format>]"
        },
        {
            "ftSignatureFormat": 1,
            //0x444500000000001D <signatur>
            "ftSignatureType": 4919338167972134941,
            "caption": "<signatur>",
            "data": "[<signatur>]"
        },
        {
            "ftSignatureFormat": 1,
            //0x444500000000001E <public-key>
            "ftSignatureType": 4919338167972134942,
            "caption": "<public-key>",
            "data": "[<public-key>]"
        }
    ],
    "ftState": 4707387510509011000
}
`

