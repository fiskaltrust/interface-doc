---
slug: /getting-started
title: Getting Started with fiskaltrust
---

# Getting Started with fiskaltrust

Welcome to fiskaltrust! This guide will help you get started with integrating our solutions into your point-of-sale system.

## Quick Start Guide

### 1. Prerequisites
Before you begin, ensure you have:
- A fiskaltrust account
- Your POS system requirements documented
- Development environment setup
- Required certificates (if applicable for your country)

### 2. Choose Your Integration Path
fiskaltrust offers multiple integration options:

#### REST API
Best for:
- Web-based POS systems
- Cross-platform applications
- Modern architecture

#### SOAP
Best for:
- Legacy systems
- Windows-based applications
- Systems requiring WS-* standards

#### gRPC
Best for:
- High-performance requirements
- Bi-directional streaming
- Modern microservices

### 3. Basic Implementation Steps

1. **Install the Middleware**
   ```powershell
   # Windows installation example
   ./fiskaltrust-middleware-setup.exe --mode=install
   ```

2. **Configure Your Environment**
   ```json
   {
     "cashboxid": "your-cashbox-id",
     "accesstoken": "your-access-token",
     "endpoint": "your-endpoint"
   }
   ```

3. **Test Your Connection**
   ```csharp
   // C# example
   var client = new FiskaltrustClient(configuration);
   var response = await client.Echo("test");
   ```

### 4. First Receipt
Here's a minimal example of creating your first receipt:

```csharp
var request = new ReceiptRequest
{
    ftCashBoxID = "your-cashbox-id",
    ftPosSystemId = "your-pos-id",
    cbTerminalID = "your-terminal-id",
    cbReceiptReference = "receipt-001",
    cbReceiptMoment = DateTime.UtcNow,
    ftReceiptCase = 0x4445000000000001,
    cbPayItems = new[]
    {
        new PayItem
        {
            Quantity = 1.0m,
            Description = "Test Item",
            Amount = 10.00m,
            VATRate = 19.00m
        }
    }
};

var response = await client.Sign(request);
```

## Next Steps

After completing the basic setup, explore these topics:

1. [Detailed Configuration Guide](./configuration.md)
2. [Security Best Practices](./security.md)
3. [Testing and Certification](./testing.md)
4. [Country-Specific Requirements](./country-requirements.md)

## Common Integration Patterns

### Queue-based Processing
```csharp
// Example of queue-based receipt processing
public async Task ProcessReceiptQueue()
{
    while (await _queue.HasItems())
    {
        var receipt = await _queue.Dequeue();
        await _client.Sign(receipt);
    }
}
```

### Error Handling
```csharp
try
{
    var response = await client.Sign(request);
}
catch (FiskaltrustException ex)
{
    // Handle fiskaltrust-specific errors
    Logger.Error($"Fiskaltrust error: {ex.Message}");
}
catch (Exception ex)
{
    // Handle general errors
    Logger.Error($"General error: {ex.Message}");
}
```

## Troubleshooting

### Common Issues
1. Connection Problems
   - Check network connectivity
   - Verify endpoint configuration
   - Validate credentials

2. Signing Errors
   - Verify receipt format
   - Check required fields
   - Validate amounts and calculations

### Getting Help
- [Documentation](https://docs.fiskaltrust.cloud)
- [Support Portal](https://support.fiskaltrust.cloud)
- [GitHub Issues](https://github.com/fiskaltrust/interface-doc/issues)

## Best Practices

1. **Performance**
   - Implement proper queuing
   - Use connection pooling
   - Cache when appropriate

2. **Security**
   - Secure credential storage
   - Regular updates
   - Audit logging

3. **Reliability**
   - Implement retry logic
   - Handle offline scenarios
   - Regular backups

## Version Compatibility

| Middleware Version | Features | Supported Until |
|-------------------|----------|-----------------|
| 1.3.x            | Basic    | 2024-12-31     |
| 1.2.x            | Legacy   | 2023-12-31     |

## Need Help?

If you need assistance:
1. Check our [FAQ](./faq.md)
2. Search [existing issues](https://github.com/fiskaltrust/interface-doc/issues)
3. Contact [support](mailto:support@fiskaltrust.cloud) 