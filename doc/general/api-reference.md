---
slug: /api-reference
title: API Reference
---

# API Reference

## Available APIs

### [POS System API](./pos-system-api.md)
The POS System API is the central entry point to the fiskaltrust.Middleware. It provides:
- Receipt signing and fiscalization
- Journal operations
- Configuration management
- Error handling

[Learn more about the POS System API](./pos-system-api.md)

## API Overview

### Authentication
All APIs require proper authentication using:
- CashBoxId
- AccessToken

### Versioning
Our APIs follow semantic versioning:
- Major version changes (v1 -> v2) include breaking changes
- Minor version changes (v2.1 -> v2.2) are backward compatible
- Latest version is used by default
- Explicit version can be specified in URL

### Common Headers
| Header | Required | Description |
|--------|----------|-------------|
| x-operation-id | Yes | Idempotency key |
| Authorization | Yes | Bearer token |
| Content-Type | Yes | application/json |

### Error Handling
All APIs use standard HTTP status codes and return detailed error messages:
```json
{
    "error": "error_code",
    "message": "Human readable message",
    "details": {
        "field": "Specific field with error",
        "reason": "Detailed explanation"
    }
}
```

## Integration Support

### SDKs
- [.NET SDK](https://github.com/fiskaltrust/middleware-interface-dotnet)
- [Java SDK](https://github.com/fiskaltrust/middleware-interface-java)
- [Node.js SDK](https://github.com/fiskaltrust/middleware-interface-nodejs)

### Sample Code
Find implementation examples in our [samples repository](https://github.com/fiskaltrust/middleware-demo).

## Need Help?
- [API Documentation](https://docs.fiskaltrust.cloud)
- [Support Portal](https://portal.fiskaltrust.cloud)
- [GitHub Issues](https://github.com/fiskaltrust/interface-doc/issues) 