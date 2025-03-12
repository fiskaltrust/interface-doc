---
slug: /middleware-it-registratore-telematico/receipt-case-definitions
title: Receipt Case Definitions and Common Use Cases v2.0
---

# Receipt Case Definitions and Common Use Cases

## Standard Sales Receipt

### Cash Sale
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "1234",
    "ftReceiptCase": "0x4954200000000001",
    "cbChargeItems": [
        {
            "Quantity": 1.0,
            "Description": "Product A",
            "Amount": 122.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000301"
        }
    ],
    "cbPayItems": [
        {
            "Quantity": 1.0,
            "Description": "Cash",
            "Amount": 122.00,
            "ftPayItemCase": "0x495420000000001"
        }
    ]
}
```

### Void Receipt
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "1235",
    "ftReceiptCase": "0x4954200000040001",
    "cbChargeItems": [
        {
            "Quantity": -1.0,
            "Description": "Product A",
            "Amount": -122.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000301"
        }
    ],
    "cbPayItems": [
        {
            "Quantity": -1.0,
            "Description": "Cash",
            "Amount": -122.00,
            "ftPayItemCase": "0x495420000000001"
        }
    ]
}
```

### Refund Receipt
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "1236",
    "ftReceiptCase": "0x4954200000100001",
    "cbChargeItems": [
        {
            "Quantity": -1.0,
            "Description": "Product A",
            "Amount": -122.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000301"
        }
    ],
    "cbPayItems": [
        {
            "Quantity": -1.0,
            "Description": "Cash",
            "Amount": -122.00,
            "ftPayItemCase": "0x495420000000001"
        }
    ]
}
```

## Special Cases

### Tip Receipt
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "1237",
    "ftReceiptCase": "0x4954200000000001",
    "cbChargeItems": [
        {
            "Quantity": 1.0,
            "Description": "Service",
            "Amount": 100.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000302"
        },
        {
            "Quantity": 1.0,
            "Description": "Tip",
            "Amount": 10.00,
            "VATRate": 0.00,
            "ftChargeItemCase": "0x495420000000308"
        }
    ],
    "cbPayItems": [
        {
            "Quantity": 1.0,
            "Description": "Card Payment",
            "Amount": 110.00,
            "ftPayItemCase": "0x495420000000005"
        }
    ]
}
```

### Single-Purpose Voucher Sale
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "1238",
    "ftReceiptCase": "0x4954200000000001",
    "cbChargeItems": [
        {
            "Quantity": 1.0,
            "Description": "Gift Card €50",
            "Amount": 50.00,
            "VATRate": 22.00,
            "ftChargeItemCase": "0x495420000000304"
        }
    ],
    "cbPayItems": [
        {
            "Quantity": 1.0,
            "Description": "Cash",
            "Amount": 50.00,
            "ftPayItemCase": "0x495420000000001"
        }
    ]
}
```

### Daily Closing
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftPosSystemId": "POS-1",
    "cbTerminalID": "T1",
    "cbReceiptReference": "CLOSE-1",
    "ftReceiptCase": "0x4954200000002011"
}
```

## Response Examples

### Standard Response
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
        }
    ],
    "ftState": 0x4954200000000000
}
```

## Error Cases

### Device Not Reachable
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

### Daily Closing Required
```json
{
    "ftState": "0x4954200000000002",
    "ftSignatures": [
        {
            "ftSignatureFormat": "0x4954200000000001",
            "ftSignatureType": "0x4954200000000302",
            "Caption": "Warning",
            "Data": "Daily closing required"
        }
    ]
} 