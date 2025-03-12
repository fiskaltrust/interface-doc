---
slug: /pos-system-api
title: POS System API Documentation v2.0
---

# POS System API Documentation

## Overview

The POS System API (v2.1) is the central entry point to the fiskaltrust.Middleware, providing:
- Receipt fiscalization (signing)
- Payment processing
- Digital receipt handling
- Data export capabilities

## API Design Principles

The POS System API follows a processual principle with state machine-like behavior to ensure:
- **Idempotent Operations**: Each call is safe to replay
- **Stateful Processing**: Processes are handled as state machines
- **Frictionless Execution**: Optimized for reliable transaction processing

### Authentication

The API requires CashBox credentials from the fiskaltrust.Portal:
- `CashBoxId`
- `AccessToken`

These credentials can be found on the CashBox Configuration page in the portal.

### Versioning

The API uses semantic versioning:
- Major version changes contain breaking changes
- Minor version changes are backward compatible
- Latest version is used by default
- Explicit version can be specified in URL

### Common Headers

| Header | Required | Description |
|--------|----------|-------------|
| x-operation-id | Yes | Idempotency key for safe retries |
| x-operation-lifetime | No | Operation timeout in milliseconds |
| x-terminal-id | No | Terminal identifier |
| x-possystem-id | No | POS system identifier |

## Endpoints

### Echo

Used for health checks and communication testing.

```http
POST /v2/echo
Content-Type: application/json
x-operation-id: ea4279ee-8684-412f-b8eb-32b5dea52811
```

### Sign

Fiscalizes (signs) receipts through the middleware.

```http
POST /v2/sign
Content-Type: application/json
x-operation-id: unique-operation-id
```

### Journal

Retrieves journal entries and exports.

```http
GET /v2/PeekJournalItem/{QueueId}/{StorageType}/{Id}
```

Parameters:
- QueueId (UUID)
- StorageType (Enum: OperationItem, OperationStateJournal, PayItem, etc.)
- Id (UUID)

### Configuration

#### Pair Request
```http
POST /v2/pair
Content-Type: application/json

{
    "Pin": "your-pin"
}
```

## Response Handling

### Success Response
```json
{
    "ftCashBoxID": "IT-SCU-1234567",
    "ftQueueID": "queue-id",
    "ftQueueItemID": "item-id",
    "ftState": 0x4954200000000000
}
```

### Error Response
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

## Status Codes

| Code | Description |
|------|-------------|
| 200 | Operation successful |
| 201 | Operation created successfully |
| 400 | Malformed request |
| 401 | Invalid credentials |
| 422 | Unprocessable Content (duplicate operation-id) |
| 500 | Server error |

## Environments

### Sandbox
```
https://possystem-api-sandbox.fiskaltrust.eu/v2
```

### Production
```
https://possystem-api.fiskaltrust.eu/v2
```

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

### Asynchronous Flow with Callbacks
```csharp
var client = new FiskaltrustClient(config);
var operationId = Guid.NewGuid().ToString();

// Configure callback
var callbackUrl = "https://your-callback-url";
await client.SignAsync(request, operationId, callbackUrl);

// Callback will receive:
public class CallbackPayload {
    public string OperationID { get; set; }
    public string QueueID { get; set; }
    public string State { get; set; }
    public string StateMessage { get; set; }
    public string StateData { get; set; }
}
```

## Additional Resources

- [API Documentation](https://docs.fiskaltrust.eu/apis/pos-system-api)
- [OpenAPI Specification](https://docs.fiskaltrust.cloud/downloads/apis/pos-system-api.yaml)
- [Support](https://support.fiskaltrust.cloud)

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