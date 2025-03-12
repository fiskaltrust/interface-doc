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

## Support

### Resources
- [API Documentation](https://docs.fiskaltrust.eu/apis/pos-system-api)
- [GitHub Issues](https://github.com/fiskaltrust/interface-doc/issues)
- [Support Portal](https://portal.fiskaltrust.cloud)

### Contact
- Technical Support: support@fiskaltrust.cloud
- API Questions: api@fiskaltrust.cloud 