---
slug: /pos-system-api
title: POS System API Documentation
---

# POS System API Documentation

## Overview

The POS System API is the central entry point to the fiskaltrust.Middleware, providing functionalities for:
- Receipt fiscalization (signing)
- Payment processing
- Digital receipt handling
- Data export capabilities

### API Design Principles

The POS System API follows a processual principle with state machine-like behavior to ensure:
- Frictionless process execution
- Safe replay capabilities
- Idempotent operations
- State-based process handling

## Authentication

### Prerequisites
- CashBox credentials from the fiskaltrust.Portal
- CashBoxId and AccessToken

### Configuration
```json
{
    "CashBoxId": "your-cashbox-id",
    "AccessToken": "your-access-token"
}
```

## API Versioning

The API uses semantic versioning:
- Major version changes contain breaking changes
- Minor version changes are backward compatible
- Latest version is used by default
- Explicit version can be specified in URL

## Endpoints

### Echo

Used for health checks and communication testing.

#### Request
```http
POST /v2/echo
Content-Type: application/json
x-operation-id: ea4279ee-8684-412f-b8eb-32b5dea52811
```

#### Headers
| Name | Required | Description |
|------|----------|-------------|
| x-operation-id | Yes | Idempotency key for safe retries |
| x-operation-lifetime | No | Operation timeout in ms |
| x-terminal-id | No | Terminal identifier |
| x-possystem-id | No | POS system identifier |

#### Response
```json
{
    "status": "success"
}
```

### Sign

Fiscalizes (signs) receipts through the middleware.

#### Request
```http
POST /v2/sign
Content-Type: application/json
x-operation-id: unique-operation-id
```

```json
{
    "ftCashBoxID": "your-cashbox-id",
    "ftPosSystemId": "your-pos-id",
    "cbTerminalID": "T1",
    "cbReceiptReference": "receipt-001",
    "ftReceiptCase": "0x4445000000000001",
    "cbPayItems": [
        {
            "Quantity": 1.0,
            "Description": "Article 1",
            "Amount": 119.00,
            "VATRate": 19.00
        }
    ]
}
```

#### Response
```json
{
    "ftSignature": "signature-data",
    "ftTransactionId": "transaction-id"
}
```

### Journal

Retrieves journal entries and exports.

#### Request
```http
GET /v2/PeekJournalItem/{QueueId}/{StorageType}/{Id}
```

Parameters:
- QueueId (UUID)
- StorageType (Enum: OperationItem, OperationStateJournal, PayItem, etc.)
- Id (UUID)

### Configuration

Handles configuration and pairing operations.

#### Pair Request
```http
POST /v2/pair
Content-Type: application/json
```

```json
{
    "Pin": "your-pin"
}
```

#### Response
```json
{
    "CashBoxID": "assigned-cashbox-id",
    "AccessToken": "your-access-token"
}
```

## Error Handling

### Common Error Codes
| Code | Description | Resolution |
|------|-------------|------------|
| 400 | Malformed request | Check request format |
| 401 | Invalid credentials | Verify CashBoxId and AccessToken |
| 422 | Unprocessable Content | Check for duplicate operation-id |
| 500 | Server error | Contact support |

### Error Response Format
```json
{
    "error": "error_code",
    "message": "Error description",
    "details": {
        "field": "Field with error",
        "reason": "Detailed explanation"
    }
}
```

## Best Practices

### Idempotency
1. Always include x-operation-id header
2. Use UUID for operation IDs
3. Implement retry logic with same operation ID

### Performance
1. Use batch operations where possible
2. Implement proper error handling
3. Monitor response times

### Security
1. Store credentials securely
2. Use HTTPS for all requests
3. Rotate access tokens periodically

## Integration Patterns

### Synchronous Flow
```csharp
var client = new FiskaltrustClient(config);
var operationId = Guid.NewGuid().ToString();

try {
    var response = await client.Sign(request, operationId);
    // Process response
} catch (FiskaltrustException ex) {
    if (ex.IsRetryable) {
        // Retry with same operationId
    }
}
```

### Asynchronous Flow
```csharp
var client = new FiskaltrustClient(config);
var operationId = Guid.NewGuid().ToString();

// Submit request
await client.SubmitAsync(request, operationId);

// Poll for result
var result = await client.GetResult(operationId);
while (result.Status == "processing") {
    await Task.Delay(1000);
    result = await client.GetResult(operationId);
}
```

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