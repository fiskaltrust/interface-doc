---
slug: /middleware-it-registratore-telematico/receipt-case-definitions
title: Receipt Case Definitions and Common Use Cases v2.0
---

# Receipt Case Definitions and Common Use Cases

## Standard Sales Receipt

### Cash Sale with Multiple VAT Rates
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "1234",
    "ftReceiptCase": "0x4954200000000001",
    "cbChargeItems": [
        {
            "Quantity": 2.0,
            "Description": "Product A",
            "Amount": 122.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000301"
        },
        {
            "Quantity": 1.0,
            "Description": "Product B",
            "Amount": 110.00,
            "VATRate": 10.00,
            "ftChargeItemCase": "0x495420000000101"
        }
    ],
    "cbPayItems": [
        {
            "Quantity": 1.0,
            "Description": "Cash",
            "Amount": 232.00,
            "ftPayItemCase": "0x495420000000001"
        }
    ]
}
```

### Mixed Payment Methods
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "1235",
    "ftReceiptCase": "0x4954200000000001",
    "cbChargeItems": [
        {
            "Quantity": 1.0,
            "Description": "Service A",
            "Amount": 244.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000302"
        }
    ],
    "cbPayItems": [
        {
            "Quantity": 1.0,
            "Description": "Cash",
            "Amount": 100.00,
            "ftPayItemCase": "0x495420000000001"
        },
        {
            "Quantity": 1.0,
            "Description": "Card Payment",
            "Amount": 144.00,
            "ftPayItemCase": "0x495420000000005"
        }
    ]
}
```

### B2B Invoice with VAT ID
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "INV-1236",
    "ftReceiptCase": "0x4954200000201002",
    "cbReceiptAmount": 1220.00,
    "cbUser": "John Doe",
    "cbArea": "Main Store",
    "cbCustomer": {
        "Name": "ACME Corp",
        "Address": "Via Roma 123, 00184 Roma RM",
        "VATId": "IT12345678901"
    },
    "cbChargeItems": [
        {
            "Quantity": 10.0,
            "Description": "Product A",
            "Amount": 1220.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000301",
            "ProductNumber": "A-123",
            "Unit": "pcs"
        }
    ],
    "cbPayItems": [
        {
            "Quantity": 1.0,
            "Description": "Bank Transfer",
            "Amount": 1220.00,
            "ftPayItemCase": "0x49542000000000A"
        }
    ]
}
```

### Void Receipt with Reference
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "VOID-1234",
    "ftReceiptCase": "0x4954200000040001",
    "cbPreviousReceiptReference": "1234",
    "cbChargeItems": [
        {
            "Quantity": -2.0,
            "Description": "Product A",
            "Amount": -122.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000301"
        },
        {
            "Quantity": -1.0,
            "Description": "Product B",
            "Amount": -110.00,
            "VATRate": 10.00,
            "ftChargeItemCase": "0x495420000000101"
        }
    ],
    "cbPayItems": [
        {
            "Quantity": -1.0,
            "Description": "Cash",
            "Amount": -232.00,
            "ftPayItemCase": "0x495420000000001"
        }
    ]
}
```

### Refund with Customer Data
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "REF-1237",
    "ftReceiptCase": "0x4954200000100001",
    "cbCustomer": {
        "Name": "Mario Rossi",
        "Address": "Via Veneto 1, Roma",
        "FiscalCode": "RSSMRA80A01H501U"
    },
    "cbChargeItems": [
        {
            "Quantity": -1.0,
            "Description": "Product Return",
            "Amount": -122.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000301"
        }
    ],
    "cbPayItems": [
        {
            "Quantity": -1.0,
            "Description": "Cash Refund",
            "Amount": -122.00,
            "ftPayItemCase": "0x495420000000001"
        }
    ]
}
```

### Daily Closing with Totals
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "CLOSE-1",
    "ftReceiptCase": "0x4954200000002011",
    "cbChargeItems": [
        {
            "Description": "Daily Total",
            "Amount": 5000.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000301"
        },
        {
            "Description": "Daily Total",
            "Amount": 2000.00,
            "VATRate": 10.00,
            "ftChargeItemCase": "0x495420000000101"
        }
    ],
    "cbPayItems": [
        {
            "Description": "Cash Total",
            "Amount": 3000.00,
            "ftPayItemCase": "0x495420000000001"
        },
        {
            "Description": "Card Total",
            "Amount": 4000.00,
            "ftPayItemCase": "0x495420000000005"
        }
    ]
}
```

## Response Examples

### Standard Response with RT Data
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftQueueID": "IT-QUEUE-1234567",
    "ftQueueItemID": "1234567890",
    "ftQueueRow": 1234,
    "cbTerminalID": "T1",
    "cbReceiptReference": "1234",
    "ftCashBoxIdentification": "POS-1",
    "ftReceiptIdentification": "ft1234567890",
    "ftReceiptMoment": "2024-03-29T10:15:00.000Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": "0x4954200000000001",
            "ftSignatureType": "0x4954200000000001",
            "Caption": "RT Device",
            "Data": "RT-12345678"
        },
        {
            "ftSignatureFormat": "0x4954200000000003",
            "ftSignatureType": "0x4954200000000010",
            "Caption": "Receipt QR Code",
            "Data": "https://scontrino.fiskaltrust.it/1234567890"
        }
    ],
    "ftState": 0x4954200000000000
}
```

### Error Response - Device Not Reachable
```json
{
    "ftState": "0x4954200000000001",
    "ftSignatures": [
        {
            "ftSignatureFormat": "0x4954200000000001",
            "ftSignatureType": "0x4954200000000301",
            "Caption": "Error",
            "Data": "RT device not reachable"
        }
    ]
}
```

### Response with Lottery Code
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftQueueID": "IT-QUEUE-1234567",
    "ftQueueItemID": "1234567890",
    "ftSignatures": [
        {
            "ftSignatureFormat": "0x4954200000000001",
            "ftSignatureType": "0x4954200000000015",
            "Caption": "Lottery Code",
            "Data": "ABCD1234EFGH5678"
        }
    ],
    "ftState": 0x4954200000000000
} 