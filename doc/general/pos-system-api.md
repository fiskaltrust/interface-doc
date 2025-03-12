---
slug: /pos-system-api
title: POS System API Documentation v2.1
---

# POS System API Documentation

## Overview

The POS System API (v2.1) is the central entry point to the fiskaltrust.Middleware, providing:
- Receipt fiscalization (signing)
- Payment processing
- Digital receipt handling
- Data export capabilities

## API Design Principles

The POS System API follows these key principles:
- **Idempotent Operations**: Each call is safe to replay using operation IDs
- **Stateful Processing**: Processes are handled as state machines
- **Frictionless Execution**: Optimized for reliable transaction processing

## Authentication

The API requires CashBox credentials from the fiskaltrust.Portal:
- `CashBoxId` (UUID)
- `AccessToken`

These credentials can be found on the CashBox Configuration page in the portal.

## Common Headers

| Header | Required | Description |
|--------|----------|-------------|
| x-operation-id | Yes | UUID for idempotency key |
| x-operation-lifetime | No | Operation timeout in milliseconds (default: 15000) |
| x-terminal-id | No | Terminal identifier |
| x-possystem-id | No | POS system identifier |
| x-cashbox-id | Yes | CashBox identification |
| x-cashbox-accesstoken | Yes | CashBox authentication token |

## Data Models

### Receipt Request

The main data structure for sending receipt data to the middleware:

```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "1234",
  "cbReceiptMoment": "2024-03-29T10:15:00.000Z",
  "ftReceiptCase": "0x4954200000000001",
  "cbChargeItems": [
    {
      "Quantity": 2.0,
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

Required fields:
- `cbReceiptReference`: Unique receipt identifier
- `cbReceiptMoment`: UTC timestamp
- `cbChargeItems`: Array of charge items
- `cbPayItems`: Array of payment items

### Charge Item

Represents a product or service line item:

```json
{
  "Quantity": 1.0,
  "Description": "Product description",
  "Amount": 100.00,
  "VATRate": 22.00,
  "ftChargeItemCase": "0x495420000000301",
  "ProductNumber": "SKU123",
  "Unit": "pcs",
  "UnitPrice": 100.00
}
```

Required fields:
- `Quantity`: Number of items
- `Description`: Item description
- `Amount`: Total amount
- `VATRate`: VAT rate percentage

### Pay Item

Represents a payment line item:

```json
{
  "Quantity": 1.0,
  "Description": "Payment method",
  "Amount": 100.00,
  "ftPayItemCase": "0x495420000000001",
  "MoneyNumber": "TRANS123"
}
```

Required fields:
- `Description`: Payment method description
- `Amount`: Payment amount

### Receipt Response

The middleware's response containing signature data:

```json
{
  "ftQueueID": "UUID",
  "ftQueueItemID": "UUID",
  "ftCashBoxIdentification": "IT-SCU-1234567",
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
  "ftState": "0x4954200000000000"
}
```

Required fields:
- `ftQueueId`: Queue identifier
- `ftQueueItemId`: Queue item identifier
- `ftCashBoxIdentification`: Cash register identifier
- `ftReceiptIdentification`: Receipt number
- `ftReceiptMoment`: Processing timestamp
- `ftSignatures`: Array of signatures
- `ftState`: Processing state

## Endpoints

### Sign Receipt

```http
POST /v2/sign
Content-Type: application/json
x-operation-id: ea4279ee-8684-412f-b8eb-32b5dea52811
```

Signs (fiscalizes) a receipt through the middleware.

### Journal

```http
GET /v2/journal/{queueId}/{type}
```

Retrieves journal entries by type:
- `ReceiptJournal`: Processed receipts
- `ActionJournal`: System events
- `QueueItem`: Queue items

### Configuration

```http
POST /v2/configuration
```

Manages terminal configuration and pairing.

## Response Status Codes

| Code | Description |
|------|-------------|
| 200 | Operation successful |
| 201 | Created successfully |
| 400 | Invalid request |
| 401 | Authentication failed |
| 422 | Duplicate operation ID |
| 500 | Server error |

## Environments

### Production
```
https://possystem-api.fiskaltrust.eu/v2
```

### Sandbox
```
https://possystem-api-sandbox.fiskaltrust.eu/v2
```

## Best Practices

1. **Idempotency**
   - Always include unique `x-operation-id` header
   - Reuse same operation ID for retries
   - Handle 422 status for duplicate operations

2. **Performance**
   - Use batch operations where possible
   - Implement proper error handling
   - Monitor response times

3. **Security**
   - Store credentials securely
   - Use HTTPS for all requests
   - Rotate access tokens periodically

## Support

- Technical Support: support@fiskaltrust.cloud
- API Documentation: https://docs.fiskaltrust.eu/apis/pos-system-api
- GitHub Issues: https://github.com/fiskaltrust/interface-doc/issues

## Additional Resources

- [API Documentation](https://docs.fiskaltrust.eu/apis/pos-system-api)
- [OpenAPI Specification](https://docs.fiskaltrust.cloud/downloads/apis/pos-system-api.yaml)
- [Support](https://support.fiskaltrust.cloud)

## Testing

### Sandbox Environment
```
https://possystem-api-sandbox.fiskaltrust.eu/v2
```

### Production Environment
```
https://possystem-api.fiskaltrust.eu/v2
```

### Test Scenarios
1. Basic receipt signing
2. Error handling
3. Timeout scenarios
4. Network interruptions

## Common Use Cases

### 1. Standard Sales Receipt
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "SALE-1234",
  "cbReceiptMoment": "2024-03-29T10:15:00.000Z",
  "ftReceiptCase": "0x4954200000000001",
  "cbChargeItems": [
    {
      "Quantity": 2.0,
      "Description": "Product A",
      "Amount": 122.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000301",
      "ProductNumber": "SKU123"
    },
    {
      "Quantity": 1.0,
      "Description": "Service B",
      "Amount": 50.00,
      "VATRate": 10.00,
      "ftChargeItemCase": "0x495420000000102"
    }
  ],
  "cbPayItems": [
    {
      "Quantity": 1.0,
      "Description": "Cash",
      "Amount": 172.00,
      "ftPayItemCase": "0x495420000000001"
    }
  ]
}
```

### 2. Mixed Payment Methods
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "MIXED-1235",
  "cbReceiptMoment": "2024-03-29T10:20:00.000Z",
  "ftReceiptCase": "0x4954200000000001",
  "cbChargeItems": [
    {
      "Quantity": 1.0,
      "Description": "High-value Item",
      "Amount": 1000.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000301"
    }
  ],
  "cbPayItems": [
    {
      "Description": "Cash",
      "Amount": 500.00,
      "ftPayItemCase": "0x495420000000001"
    },
    {
      "Description": "Credit Card",
      "Amount": 500.00,
      "ftPayItemCase": "0x495420000000005",
      "ftPayItemCaseData": {
        "Provider": {
          "Protocol": "worldline_wpi_2",
          "Action": "payment",
          "ProtocolVersion": "2.0"
        }
      }
    }
  ]
}
```

### 3. B2B Invoice with Customer Data
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "INV-1236",
  "cbReceiptMoment": "2024-03-29T10:25:00.000Z",
  "ftReceiptCase": "0x4954200000201002",
  "cbCustomer": {
    "Name": "ACME Corp",
    "Address": "Via Roma 123, 00184 Roma RM",
    "VATId": "IT12345678901"
  },
  "cbChargeItems": [
    {
      "Quantity": 10.0,
      "Description": "Enterprise License",
      "Amount": 1000.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000302",
      "ProductNumber": "LIC-ENT-001"
    }
  ],
  "cbPayItems": [
    {
      "Description": "Bank Transfer",
      "Amount": 1000.00,
      "ftPayItemCase": "0x49542000000000A"
    }
  ]
}
```

### 4. Refund Receipt
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "REF-1237",
  "cbReceiptMoment": "2024-03-29T10:30:00.000Z",
  "ftReceiptCase": "0x4954200000100001",
  "cbPreviousReceiptReference": "SALE-1234",
  "cbChargeItems": [
    {
      "Quantity": -1.0,
      "Description": "Product A Return",
      "Amount": -61.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000301"
    }
  ],
  "cbPayItems": [
    {
      "Description": "Cash Refund",
      "Amount": -61.00,
      "ftPayItemCase": "0x495420000000001"
    }
  ]
}
```

## Payment Protocols

### Available Payment Protocols

| Protocol | Description | Supported Actions |
|----------|-------------|------------------|
| bluecode | Mobile payment via Bluecode | payment, cancel, refund |
| hobex_zvt | Card terminal via ZVT | payment, cancel, refund, pre_authorization |
| hobex_restapi | Direct REST API integration | payment, cancel, refund, pre_authorization |
| payone_softpos_wpi | SoftPOS integration | payment, cancel, refund |
| worldline_wpi_2 | Worldline Payment Interface | payment, cancel, refund |

### Payment Protocol Examples

#### 1. Card Payment (hobex_zvt)
```json
{
  "Protocol": "hobex_zvt",
  "Action": "payment",
  "cbPayItem": {
    "Description": "Card Payment",
    "Amount": 100.00,
    "ftPayItemCase": "0x495420000000005",
    "ftPayItemCaseData": {
      "Provider": {
        "ProtocolRequest": {
          "TerminalId": "12345678",
          "PrinterFlag": 1
        }
      }
    }
  }
}
```

#### 2. Mobile Payment (bluecode)
```json
{
  "Protocol": "bluecode",
  "Action": "payment",
  "cbPayItem": {
    "Description": "Bluecode Payment",
    "Amount": 50.00,
    "ftPayItemCase": "0x495420000000007",
    "ftPayItemCaseData": {
      "Token": "BC123456789",
      "Provider": {
        "ProtocolRequest": {
          "MerchantId": "MERCHANT123"
        }
      }
    }
  }
}
```

## Error Handling

### Common Error Scenarios

1. **Device Not Reachable**
```json
{
  "error": "device_not_reachable",
  "message": "RT device is not responding",
  "details": {
    "deviceId": "RT-12345",
    "lastContact": "2024-03-29T10:00:00Z"
  }
}
```

2. **Invalid Receipt Format**
```json
{
  "error": "validation_error",
  "message": "Receipt validation failed",
  "details": {
    "field": "cbChargeItems",
    "reason": "Total amount mismatch with payment items"
  }
}
```

3. **Payment Protocol Error**
```json
{
  "error": "payment_error",
  "message": "Payment processing failed",
  "details": {
    "protocol": "hobex_zvt",
    "errorCode": "CARD_DECLINED",
    "terminalId": "12345678"
  }
}
```

### Error Recovery Strategies

1. **Device Connection Issues**
   - Retry with exponential backoff
   - Maximum 3 retries
   - Use same operation ID for retries
   - Check device status before retrying

2. **Payment Processing Issues**
   - Check payment status before retrying
   - Use payment reversal if needed
   - Maintain transaction log
   - Implement reconciliation process

3. **Data Validation Issues**
   - Validate data before sending
   - Check amount calculations
   - Verify VAT rates
   - Ensure unique receipt references

## Best Practices

### 1. Receipt Processing
- Generate unique receipt references
- Include all required fields
- Validate amounts before sending
- Handle special characters in descriptions
- Use correct VAT rates and cases

### 2. Payment Integration
- Implement proper error handling
- Support payment reversals
- Handle timeout scenarios
- Maintain payment logs
- Implement reconciliation

### 3. Security
- Secure credential storage
- Regular token rotation
- TLS 1.2 or higher
- IP whitelisting
- Request signing

### 4. Performance
- Batch operations when possible
- Implement caching
- Monitor response times
- Handle rate limits
- Optimize payload size

## Support Resources

### Documentation
- [API Reference](https://docs.fiskaltrust.eu/apis/pos-system-api)
- [Integration Guide](https://docs.fiskaltrust.eu/docs/poscreators/getting-started)
- [Security Guidelines](https://docs.fiskaltrust.eu/docs/poscreators/security)

### Tools
- [Postman Collection](https://docs.fiskaltrust.eu/downloads/postman)
- [Test Environment](https://sandbox.fiskaltrust.eu)
- [Middleware Configurator](https://portal.fiskaltrust.eu)

### Support Channels
- Technical Support: support@fiskaltrust.cloud
- API Questions: api@fiskaltrust.cloud
- Security Issues: security@fiskaltrust.cloud 