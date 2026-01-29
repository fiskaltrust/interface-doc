---
slug: /troubleshooting
title: Troubleshooting Guide
---

# Troubleshooting Guide

This guide helps you diagnose and resolve common issues with the fiskaltrust middleware.

## Quick Diagnosis

### Connection Issues

#### Symptoms
- Timeout errors
- Connection refused errors
- Unable to reach middleware

#### Solutions
1. **Check Network Connectivity**
   ```powershell
   # Test basic connectivity
   Test-NetConnection -ComputerName localhost -Port 1234
   ```

2. **Verify Configuration**
   ```json
   {
     "cashboxid": "check-this-matches",
     "endpoint": "verify-url-and-port"
   }
   ```

3. **Check Service Status**
   ```powershell
   Get-Service fiskaltrust.Middleware
   ```

### Signing Issues

#### Symptoms
- Invalid signature errors
- Missing required fields
- Calculation errors

#### Solutions
1. **Validate Receipt Format**
   ```csharp
   // Ensure all required fields are present
   if (string.IsNullOrEmpty(request.ftCashBoxID))
       throw new ValidationException("CashBoxID is required");
   ```

2. **Check Amount Calculations**
   ```csharp
   // Verify totals match line items
   decimal total = request.cbPayItems.Sum(x => x.Amount);
   if (total != request.cbPayTotal)
       throw new ValidationException("Total mismatch");
   ```

### Performance Issues

#### Symptoms
- Slow response times
- High CPU usage
- Memory problems

#### Solutions
1. **Monitor Resources**
   ```powershell
   # Check CPU and memory usage
   Get-Counter '\Processor(_Total)\% Processor Time'
   Get-Counter '\Memory\Available MBytes'
   ```

2. **Optimize Queue Processing**
   ```csharp
   // Implement batch processing
   public async Task ProcessBatch(IEnumerable<ReceiptRequest> requests)
   {
       foreach (var batch in requests.Chunk(100))
       {
           await Task.WhenAll(batch.Select(r => _client.Sign(r)));
       }
   }
   ```

## Common Error Codes

### 1000 - General Errors
| Code | Description | Solution |
|------|-------------|----------|
| 1001 | Invalid configuration | Check configuration file |
| 1002 | Service not running | Start the service |
| 1003 | Network error | Check connectivity |

### 2000 - Receipt Errors
| Code | Description | Solution |
|------|-------------|----------|
| 2001 | Invalid format | Validate against schema |
| 2002 | Missing field | Check required fields |
| 2003 | Invalid amount | Verify calculations |

## Logging and Diagnostics

### Enable Debug Logging
```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Debug",
      "Microsoft": "Warning"
    }
  }
}
```

### Collect Diagnostic Information
```powershell
# Collect logs
$logPath = "C:\ProgramData\fiskaltrust\Middleware\logs"
Compress-Archive -Path $logPath -DestinationPath "diagnostics.zip"

# Export configuration
Get-Content "C:\ProgramData\fiskaltrust\Middleware\configuration.json"
```

## Recovery Procedures

### Service Recovery
1. Stop the service
   ```powershell
   Stop-Service fiskaltrust.Middleware
   ```

2. Clear temporary files
   ```powershell
   Remove-Item "C:\ProgramData\fiskaltrust\Middleware\temp\*"
   ```

3. Restart the service
   ```powershell
   Start-Service fiskaltrust.Middleware
   ```

### Database Recovery
1. Backup current data
   ```powershell
   Copy-Item "C:\ProgramData\fiskaltrust\Middleware\db" "backup"
   ```

2. Verify backup
   ```powershell
   Test-Path "backup\queue.db"
   ```

## Prevention

### Regular Maintenance
1. Monitor disk space
2. Check log files
3. Update middleware regularly
4. Test backup procedures

### Best Practices
1. Implement proper error handling
2. Use retry mechanisms
3. Monitor performance metrics
4. Keep documentation updated

## Getting Support

### Before Contacting Support
1. Collect relevant logs
2. Document the issue
3. List steps to reproduce
4. Try suggested solutions

### Support Channels
- Email: support@fiskaltrust.cloud
- Portal: https://portal.fiskaltrust.cloud
- GitHub: https://github.com/fiskaltrust/interface-doc/issues

## FAQ

### Q: Why is my service not starting?
A: Check these common causes:
1. Port conflicts
2. Invalid configuration
3. Missing permissions

### Q: How do I handle offline scenarios?
A: Implement these strategies:
1. Local queue storage
2. Automatic retry logic
3. Failover configuration

### Q: What should I do if signatures fail?
A: Follow these steps:
1. Verify request format
2. Check TSE status
3. Validate calculations

## Appendix

### Useful Commands
```powershell
# Check service status
Get-Service fiskaltrust.Middleware

# View recent logs
Get-Content "C:\ProgramData\fiskaltrust\Middleware\logs\latest.log" -Tail 100

# Test network
Test-NetConnection -ComputerName localhost -Port 1234
```

### System Requirements
- .NET Framework 4.7.2+
- Windows 7 SP1 or later
- 2GB RAM minimum
- 1GB free disk space 