---
slug: /middleware-de-kassensichv
title: German KassenSichV Documentation
---

# German KassenSichV Documentation

## Overview

This documentation covers the implementation of the German KassenSichV (Kassensicherungsverordnung) requirements in the fiskaltrust.Middleware.

### Regulatory Background

The KassenSichV requires all electronic cash registers and POS systems in Germany to be equipped with a certified technical security device (TSE - Technische Sicherheitseinrichtung) starting January 1, 2020.

### Key Requirements

1. Technical Security Device (TSE)
   - Certified security module
   - Digital record storage
   - Digital signature creation
   - Export interface

2. Digital Records
   - Transaction data
   - Training mode records
   - System events

3. DSFinV-K Compliance
   - Standardized data format
   - Export capabilities
   - Audit readiness

## Implementation Guide

### Prerequisites

1. Hardware Requirements
   - Compatible TSE device
   - Network connectivity
   - Sufficient storage space

2. Software Requirements
   - .NET Framework 4.7.2+
   - Windows 7 SP1 or later
   - Admin privileges for installation

### Installation Steps

1. Install the Middleware
   ```powershell
   # Download and install
   ./fiskaltrust-middleware-setup.exe --mode=install
   ```

2. Configure TSE
   ```json
   {
     "TSE": {
       "Type": "Cryptovision",
       "DevicePath": "COM3",
       "AdminPIN": "12345",
       "TimeAdminPIN": "98765"
     }
   }
   ```

3. Verify Installation
   ```powershell
   # Check service status
   Get-Service fiskaltrust.Middleware
   ```

## Integration Guide

### Receipt Signing Flow

1. Create Receipt Request
   ```csharp
   var request = new ReceiptRequest
   {
       ftCashBoxID = "DE-CASHBOX-ID",
       ftPosSystemId = "DE-POS-ID",
       cbTerminalID = "T1",
       cbReceiptReference = "receipt-001",
       ftReceiptCase = 0x4445000000000001, // German normal receipt
       cbPayItems = new[]
       {
           new PayItem
           {
               Quantity = 1.0m,
               Description = "Article 1",
               Amount = 119.00m,
               VATRate = 19.00m
           }
       }
   };
   ```

2. Send to Middleware
   ```csharp
   var response = await client.Sign(request);
   ```

3. Process Response
   ```csharp
   // Print or store TSE data
   Console.WriteLine($"Signature: {response.ftSignature}");
   Console.WriteLine($"Transaction: {response.ftTransactionId}");
   ```

### Special Cases

#### Training Mode
```csharp
request.ftReceiptCase = 0x4445000000000002; // German training receipt
```

#### Cancellation
```csharp
request.ftReceiptCase = 0x4445000000000003; // German void receipt
```

## Compliance

### DSFinV-K Export

1. Generate Export
   ```csharp
   var export = await client.GenerateDSFinVKExport(
       new DateTime(2024, 1, 1),
       new DateTime(2024, 1, 31)
   );
   ```

2. Verify Export
   ```powershell
   # Validate export structure
   Test-Path "export/cashpoint_closing.csv"
   ```

### TAR Export

1. Generate TAR File
   ```csharp
   var tarFile = await client.GenerateTARExport(
       new DateTime(2024, 1, 1),
       new DateTime(2024, 1, 31)
   );
   ```

2. Verify Export
   ```powershell
   # Check TAR file
   Test-Path "export.tar"
   ```

## Error Handling

### Common Issues

1. TSE Connection Problems
   ```csharp
   try
   {
       await client.Sign(request);
   }
   catch (TSEConnectionException ex)
   {
       // Handle TSE issues
       Logger.Error($"TSE error: {ex.Message}");
   }
   ```

2. Invalid Configuration
   ```csharp
   try
   {
       await client.Initialize();
   }
   catch (ConfigurationException ex)
   {
       // Handle configuration issues
       Logger.Error($"Config error: {ex.Message}");
   }
   ```

### Recovery Procedures

1. TSE Recovery
   ```csharp
   await client.ResetTSE(); // Reset TSE state
   await client.InitializeTSE(); // Reinitialize TSE
   ```

2. Data Recovery
   ```csharp
   // Backup TSE data
   await client.BackupTSEData("backup.tar");
   ```

## Best Practices

### Performance

1. Queue Implementation
   ```csharp
   public class ReceiptQueue
   {
       private readonly Queue<ReceiptRequest> _queue;
       private readonly IFiskaltrustClient _client;

       public async Task ProcessQueue()
       {
           while (_queue.Any())
           {
               var request = _queue.Dequeue();
               await _client.Sign(request);
           }
       }
   }
   ```

2. Batch Processing
   ```csharp
   public async Task ProcessBatch(IEnumerable<ReceiptRequest> requests)
   {
       foreach (var batch in requests.Chunk(100))
       {
           await Task.WhenAll(batch.Select(r => _client.Sign(r)));
       }
   }
   ```

### Security

1. Credential Storage
   ```csharp
   // Use Windows Credential Manager
   var credentials = new SecureString();
   // ... add characters to secure string
   ```

2. Audit Logging
   ```csharp
   public class AuditLogger
   {
       public void LogReceiptRequest(ReceiptRequest request)
       {
           // Log receipt details
           Logger.Info($"Receipt {request.cbReceiptReference} processed");
       }
   }
   ```

## FAQ

### Common Questions

1. **Q: How often should I backup TSE data?**
   A: Daily backups are recommended, with weekly full exports.

2. **Q: What happens if TSE fails?**
   A: Implement fallback procedures and notify authorities within one month.

3. **Q: How long should I keep the data?**
   A: Retain all fiscal data for 10 years.

## Support

### Contact Information

- Technical Support: support@fiskaltrust.de
- Compliance Questions: compliance@fiskaltrust.de
- Emergency Support: +49 xxx xxx xxx

### Resources

- [KassenSichV Law Text](https://www.gesetze-im-internet.de/kassensichv/)
- [BSI Technical Guidelines](https://www.bsi.bund.de/)
- [fiskaltrust Documentation](https://docs.fiskaltrust.cloud)

## Version History

### Current Version (2.0)
- Added DSFinV-K 2.3 support
- Improved error handling
- Enhanced backup procedures

### Previous Versions
- 1.5: Added cloud TSE support
- 1.0: Initial KassenSichV implementation 