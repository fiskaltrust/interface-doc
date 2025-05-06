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

## Advanced Use Cases

### 1. Daily Closing Receipt
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "CLOSE-1238",
  "cbReceiptMoment": "2024-03-29T23:59:59.000Z",
  "ftReceiptCase": "0x4954200000000003",
  "cbChargeItems": [
    {
      "Description": "Daily Total",
      "Amount": 5000.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000301"
    },
    {
      "Description": "Daily Total Reduced",
      "Amount": 1000.00,
      "VATRate": 10.00,
      "ftChargeItemCase": "0x495420000000102"
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
      "Amount": 3000.00,
      "ftPayItemCase": "0x495420000000005"
    }
  ]
}
```

### 2. Training Mode Receipt
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "TRAIN-1239",
  "cbReceiptMoment": "2024-03-29T14:30:00.000Z",
  "ftReceiptCase": "0x4954200000000010",
  "cbChargeItems": [
    {
      "Quantity": 1.0,
      "Description": "Training Item",
      "Amount": 100.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000301"
    }
  ],
  "cbPayItems": [
    {
      "Description": "Training Payment",
      "Amount": 100.00,
      "ftPayItemCase": "0x495420000000001"
    }
  ]
}
```

### 3. Pre-Authorization Flow
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "AUTH-1240",
  "cbReceiptMoment": "2024-03-29T15:00:00.000Z",
  "ftReceiptCase": "0x4954200000000020",
  "cbChargeItems": [
    {
      "Description": "Hotel Stay Deposit",
      "Amount": 500.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000301"
    }
  ],
  "cbPayItems": [
    {
      "Description": "Card Pre-Authorization",
      "Amount": 500.00,
      "ftPayItemCase": "0x495420000000005",
      "ftPayItemCaseData": {
        "Provider": {
          "Protocol": "hobex_zvt",
          "Action": "pre_authorization",
          "ProtocolVersion": "1.0"
        }
      }
    }
  ]
}
```

## Implementation Guidelines

### 1. Queue Management
- Implement persistent storage for queued items
- Monitor queue length and processing time
- Handle queue overflow scenarios
- Implement retry mechanism with backoff

### 2. Receipt Lifecycle
1. **Receipt Creation**
   - Generate unique reference
   - Validate business rules
   - Calculate totals

2. **Processing**
   - Send to middleware
   - Handle responses
   - Store signatures

3. **Archival**
   - Store receipt data
   - Backup signatures
   - Maintain audit trail

### 3. Error Recovery Patterns

#### Network Issues
```javascript
async function sendReceiptWithRetry(receipt, maxRetries = 3) {
  let attempt = 0;
  const operationId = generateUUID();
  
  while (attempt < maxRetries) {
    try {
      const response = await sendReceipt(receipt, operationId);
      return response;
    } catch (error) {
      if (error.status === 422) {
        // Duplicate operation, check status
        const status = await checkReceiptStatus(operationId);
        if (status.completed) return status;
      }
      
      attempt++;
      if (attempt < maxRetries) {
        await wait(Math.pow(2, attempt) * 1000); // Exponential backoff
      }
    }
  }
  throw new Error('Max retries exceeded');
}
```

#### Device Recovery
```javascript
async function handleDeviceFailure(error) {
  if (error.code === 'device_not_reachable') {
    // 1. Log incident
    await logDeviceIssue(error);
    
    // 2. Check device status
    const status = await checkDeviceStatus();
    
    // 3. Attempt recovery
    if (status.needsReboot) {
      await initiateDeviceReboot();
      await waitForDeviceOnline();
    }
    
    // 4. Verify recovery
    const health = await checkDeviceHealth();
    return health.isHealthy;
  }
  throw error;
}
```

### 4. Performance Optimization

#### Batch Processing
```javascript
async function processBatchReceipts(receipts) {
  // 1. Group by receipt type
  const groups = groupReceiptsByType(receipts);
  
  // 2. Process in parallel with limits
  const results = await Promise.all(
    Object.entries(groups).map(([type, items]) =>
      processReceiptGroup(type, items, {
        maxConcurrent: 5,
        intervalMs: 100
      })
    )
  );
  
  return results.flat();
}
```

#### Caching Strategy
```javascript
class ReceiptCache {
  constructor() {
    this.cache = new Map();
    this.ttl = 3600000; // 1 hour
  }

  async getReceipt(reference) {
    const cached = this.cache.get(reference);
    if (cached && Date.now() - cached.timestamp < this.ttl) {
      return cached.data;
    }
    
    const receipt = await fetchReceipt(reference);
    this.cache.set(reference, {
      data: receipt,
      timestamp: Date.now()
    });
    
    return receipt;
  }
}
```

## Security Guidelines

### 1. Credential Management
```javascript
class CredentialManager {
  constructor() {
    this.keyStore = new SecureKeyStore();
  }

  async rotateAccessToken() {
    const currentToken = await this.keyStore.getAccessToken();
    const newToken = await requestNewToken(currentToken);
    await this.keyStore.setAccessToken(newToken);
    return newToken;
  }

  async getEncryptedCredentials() {
    const credentials = await this.keyStore.getCredentials();
    return encryptCredentials(credentials);
  }
}
```

### 2. Request Signing
```javascript
async function signRequest(request) {
  const timestamp = new Date().toISOString();
  const payload = `${request.method}${request.path}${timestamp}`;
  const signature = await generateHMAC(payload, getSecretKey());
  
  return {
    ...request,
    headers: {
      ...request.headers,
      'x-request-signature': signature,
      'x-request-timestamp': timestamp
    }
  };
}
```

## Monitoring and Logging

### 1. Health Checks
```javascript
async function performHealthCheck() {
  const checks = [
    checkMiddlewareConnection(),
    checkDeviceStatus(),
    checkQueueHealth(),
    checkDatabaseConnection()
  ];
  
  const results = await Promise.all(checks);
  return {
    healthy: results.every(r => r.status === 'healthy'),
    details: results
  };
}
```

### 2. Audit Logging
```javascript
class AuditLogger {
  async logOperation(operation) {
    const entry = {
      timestamp: new Date().toISOString(),
      operationId: operation.id,
      type: operation.type,
      user: operation.user,
      details: operation.details,
      status: operation.status
    };
    
    await this.store.save(entry);
    await this.notifyMonitoring(entry);
  }
}
```

## Italian Fiscal Requirements

### Receipt Types (ftReceiptCase)

| Receipt Case | Value | Description | RT Signature Required |
|-------------|-------|-------------|----------------------|
| `0x4954200000000001` | POS Receipt | Standard point-of-sale receipt | Yes |
| `0x4954200000000003` | Daily Closing | End-of-day closing receipt (Chiusura giornaliera) | Yes |
| `0x4954200000000010` | Training Mode | Training/demo mode receipt | No |
| `0x4954200000100001` | Void/Refund | Void or refund receipt (Reso) | Yes |
| `0x4954200000201002` | Invoice | Electronic invoice (Fattura elettronica) | Yes |
| `0x4954200000000020` | Pre-Authorization | Payment pre-authorization | No |

### VAT Rates and Nature Codes

| VAT Rate | Nature Code | Description | ftChargeItemCase |
|----------|-------------|-------------|------------------|
| 22% | - | Standard rate | `0x495420000000301` |
| 10% | - | Reduced rate | `0x495420000000102` |
| 5% | - | Super-reduced rate | `0x495420000000101` |
| 4% | - | Special reduced rate | `0x495420000000100` |
| 0% | N1 | Excluded Art. 15 | `0x495420000000401` |
| 0% | N2 | Not subject | `0x495420000000402` |
| 0% | N3 | Not taxable | `0x495420000000403` |
| 0% | N4 | Exempt | `0x495420000000404` |
| 0% | N5 | Margin scheme | `0x495420000000405` |

### Payment Methods (ftPayItemCase)

| Code | Description | RT Requirements |
|------|-------------|-----------------|
| `0x495420000000001` | Cash | Standard reporting |
| `0x495420000000005` | Credit/Debit Card | Electronic payment |
| `0x495420000000007` | Mobile Payment | Electronic payment |
| `0x49542000000000A` | Bank Transfer | Bank transaction |
| `0x49542000000000B` | Voucher | Special handling |

### RT Device Integration

#### Device States
```json
{
  "ftState": {
    "0x4954200000000000": "Ready",
    "0x4954200000000001": "Processing",
    "0x4954200000000002": "Error",
    "0x4954200000000003": "Offline",
    "0x4954200000000004": "Maintenance"
  }
}
```

#### Signature Format
```json
{
  "ftSignatures": [
    {
      "ftSignatureFormat": "0x4954200000000001",
      "ftSignatureType": "0x4954200000000001",
      "Caption": "RT Device",
      "Data": {
        "rtSerialNumber": "RT12345678",
        "zRepNumber": "0001",
        "documentNumber": "1234",
        "signature": "MEUCIQDJsJ3..."
      }
    }
  ]
}
```

### Italian-Specific Examples

#### 1. Electronic Invoice Receipt
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "FT-2024-1234",
  "cbReceiptMoment": "2024-03-29T10:15:00.000Z",
  "ftReceiptCase": "0x4954200000201002",
  "cbCustomer": {
    "Name": "ACME SRL",
    "Address": "Via Roma 123, 00184 Roma RM",
    "VATId": "IT12345678901",
    "FiscalCode": "ABCDEF12G34H567I",
    "PEC": "acme@pec.it",
    "SDICode": "SUBM70N"
  },
  "cbChargeItems": [
    {
      "Quantity": 1.0,
      "Description": "Professional Services",
      "Amount": 1000.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000301",
      "VATNature": "",
      "ProductNumber": "SERV-001"
    },
    {
      "Quantity": 1.0,
      "Description": "Exempt Service",
      "Amount": 500.00,
      "VATRate": 0.00,
      "ftChargeItemCase": "0x495420000000404",
      "VATNature": "N4",
      "ProductNumber": "SERV-002"
    }
  ],
  "cbPayItems": [
    {
      "Description": "Bank Transfer",
      "Amount": 1500.00,
      "ftPayItemCase": "0x49542000000000A",
      "PaymentReference": "BON-2024-1234"
    }
  ]
}
```

#### 2. Daily Closing with Lottery
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "CLOSE-2024-0123",
  "cbReceiptMoment": "2024-03-29T23:59:59.000Z",
  "ftReceiptCase": "0x4954200000000003",
  "cbChargeItems": [
    {
      "Description": "Daily Total Standard VAT",
      "Amount": 10000.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000301"
    },
    {
      "Description": "Daily Total Reduced VAT",
      "Amount": 5000.00,
      "VATRate": 10.00,
      "ftChargeItemCase": "0x495420000000102"
    },
    {
      "Description": "Daily Total Exempt",
      "Amount": 1000.00,
      "VATRate": 0.00,
      "ftChargeItemCase": "0x495420000000404"
    }
  ],
  "cbPayItems": [
    {
      "Description": "Cash Total",
      "Amount": 8000.00,
      "ftPayItemCase": "0x495420000000001"
    },
    {
      "Description": "Electronic Payments Total",
      "Amount": 8000.00,
      "ftPayItemCase": "0x495420000000005"
    }
  ],
  "ftLotteryData": {
    "dailyTotalTickets": 50,
    "validTransmissions": 48,
    "pendingTransmissions": 2
  }
}
```

### RT Device Error Handling

#### Common RT Device Errors
```json
{
  "error": "rt_device_error",
  "message": "RT device error occurred",
  "details": {
    "errorCode": "RT-001",
    "description": "Paper end",
    "severity": "warning",
    "action": "Replace paper roll"
  }
}
```

#### RT Connection Issues
```javascript
async function handleRTDeviceError(error) {
  if (error.code === 'rt_device_error') {
    // 1. Check RT status
    const rtStatus = await checkRTDeviceStatus();
    
    // 2. Handle specific RT errors
    switch (rtStatus.errorCode) {
      case 'RT-001': // Paper end
        await notifyOperator('Replace paper roll');
        break;
      case 'RT-002': // Communication error
        await reconnectRTDevice();
        break;
      case 'RT-003': // Memory almost full
        await performDataTransmission();
        break;
      default:
        await notifyTechnicalSupport(rtStatus);
    }
    
    // 3. Verify RT recovery
    return await verifyRTDeviceStatus();
  }
  throw error;
}
```

### Italian Compliance Guidelines

1. **RT Device Management**
   - Regular status checks
   - Paper level monitoring
   - Memory usage tracking
   - Automatic data transmission

2. **Receipt Requirements**
   - Unique progressive numbering
   - RT serial number inclusion
   - Proper VAT calculation
   - Correct nature codes

3. **Daily Operations**
   - End-of-day closing
   - Data transmission verification
   - Lottery data management
   - Error log maintenance

4. **Data Retention**
   - Electronic storage requirements
   - Backup procedures
   - Archive management
   - Access control 

## Advanced Implementation Examples

### 1. Lottery Receipt Integration
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "LOT-2024-001",
  "cbReceiptMoment": "2024-03-29T14:30:00.000Z",
  "ftReceiptCase": "0x4954200000000001",
  "cbChargeItems": [
    {
      "Quantity": 1.0,
      "Description": "Eligible Product",
      "Amount": 100.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000301"
    }
  ],
  "cbPayItems": [
    {
      "Description": "Card Payment",
      "Amount": 100.00,
      "ftPayItemCase": "0x495420000000005"
    }
  ],
  "ftLotteryData": {
    "customerCode": "ABCD1234EFGH5678",
    "eligibleAmount": 100.00,
    "transmissionState": "pending"
  }
}
```

### 2. Split Payment with Multiple VAT Rates
```json
{
  "ftCashBoxID": "UUID",
  "ftPosSystemId": "UUID",
  "cbTerminalID": "T1",
  "cbReceiptReference": "SPLIT-2024-001",
  "cbReceiptMoment": "2024-03-29T15:45:00.000Z",
  "ftReceiptCase": "0x4954200000000001",
  "cbChargeItems": [
    {
      "Quantity": 1.0,
      "Description": "Standard Rate Item",
      "Amount": 122.00,
      "VATRate": 22.00,
      "ftChargeItemCase": "0x495420000000301"
    },
    {
      "Quantity": 1.0,
      "Description": "Reduced Rate Item",
      "Amount": 110.00,
      "VATRate": 10.00,
      "ftChargeItemCase": "0x495420000000102"
    },
    {
      "Quantity": 1.0,
      "Description": "Exempt Item",
      "Amount": 50.00,
      "VATRate": 0.00,
      "ftChargeItemCase": "0x495420000000404",
      "VATNature": "N4"
    }
  ],
  "cbPayItems": [
    {
      "Description": "Cash Payment",
      "Amount": 150.00,
      "ftPayItemCase": "0x495420000000001"
    },
    {
      "Description": "Card Payment",
      "Amount": 132.00,
      "ftPayItemCase": "0x495420000000005",
      "ftPayItemCaseData": {
        "Provider": {
          "Protocol": "worldline_wpi_2",
          "Action": "payment"
        }
      }
    }
  ]
}
```

### 3. Advanced Error Recovery Patterns

#### Timeout Handling
```javascript
async function handleReceiptTimeout(receipt, operationId) {
  // 1. Check operation status
  const status = await checkOperationStatus(operationId);
  
  if (status.state === 'unknown') {
    // 2. Verify RT device state
    const rtStatus = await checkRTDeviceStatus();
    
    if (rtStatus.lastReceipt?.reference === receipt.cbReceiptReference) {
      // Receipt was processed but response was lost
      return await retrieveReceiptData(receipt.cbReceiptReference);
    }
    
    // 3. Receipt was not processed, retry with same operationId
    return await sendReceipt(receipt, operationId);
  }
  
  return status;
}
```

#### Queue Management with Persistence
```javascript
class PersistentQueue {
  constructor() {
    this.storage = new LocalStorage('receipt-queue');
    this.maxRetries = 3;
  }

  async enqueue(receipt) {
    const queueItem = {
      id: generateUUID(),
      receipt,
      attempts: 0,
      status: 'pending',
      created: new Date().toISOString()
    };
    
    await this.storage.save(queueItem);
    return queueItem.id;
  }

  async processQueue() {
    const items = await this.storage.getPending();
    
    for (const item of items) {
      try {
        if (item.attempts >= this.maxRetries) {
          await this.markFailed(item.id);
          continue;
        }
        
        const result = await sendReceipt(item.receipt, item.id);
        await this.markCompleted(item.id, result);
      } catch (error) {
        await this.incrementAttempts(item.id, error);
      }
    }
  }
}
```

### 4. RT Device State Management

#### Device Health Monitoring
```javascript
class RTDeviceMonitor {
  constructor() {
    this.healthCheckInterval = 60000; // 1 minute
    this.criticalErrors = new Set(['RT-002', 'RT-003']);
  }

  async startMonitoring() {
    setInterval(async () => {
      try {
        const health = await this.checkDeviceHealth();
        await this.processHealthStatus(health);
      } catch (error) {
        await this.handleMonitoringError(error);
      }
    }, this.healthCheckInterval);
  }

  async processHealthStatus(health) {
    if (!health.isHealthy) {
      if (this.criticalErrors.has(health.errorCode)) {
        await this.notifyTechnicalSupport(health);
      }
      
      await this.logDeviceStatus({
        timestamp: new Date().toISOString(),
        status: health.status,
        errorCode: health.errorCode,
        lastContact: health.lastContact
      });
    }
  }
}
```

#### Automatic Recovery Procedures
```javascript
class RTDeviceRecovery {
  async attemptRecovery(device) {
    const procedures = [
      this.checkConnection,
      this.resetCommunication,
      this.checkPaper,
      this.checkMemory,
      this.rebootDevice
    ];
    
    for (const procedure of procedures) {
      try {
        const result = await procedure(device);
        if (result.success) {
          await this.logRecovery(device, procedure.name);
          return result;
        }
      } catch (error) {
        await this.logRecoveryAttempt(device, procedure.name, error);
      }
    }
    
    throw new Error('Recovery failed after all attempts');
  }

  async checkMemory(device) {
    const memory = await device.getMemoryStatus();
    
    if (memory.usedPercentage > 80) {
      await this.performDataTransmission(device);
    }
    
    return { success: memory.usedPercentage < 90 };
  }
}
```

### 5. Data Transmission Management

#### Automated Data Export
```javascript
class DataTransmissionManager {
  constructor() {
    this.transmissionSchedule = {
      daily: '23:50',
      backup: '12:00'
    };
  }

  async scheduleDailyTransmission() {
    const now = new Date();
    const scheduledTime = this.parseTime(this.transmissionSchedule.daily);
    
    if (now >= scheduledTime) {
      await this.performDataTransmission();
    }
  }

  async performDataTransmission() {
    const data = await this.collectTransmissionData();
    
    try {
      const result = await this.sendToAuthority(data);
      await this.logTransmission(result);
      
      if (result.status === 'success') {
        await this.updateLastTransmission(result);
      }
    } catch (error) {
      await this.handleTransmissionError(error);
    }
  }
}
```

#### Transmission Verification
```javascript
class TransmissionVerification {
  async verifyTransmission(transmissionId) {
    const verification = {
      transmissionId,
      timestamp: new Date().toISOString(),
      checks: []
    };
    
    // 1. Check local data
    const localData = await this.getLocalData(transmissionId);
    verification.checks.push({
      type: 'local_data',
      status: localData ? 'success' : 'failed'
    });
    
    // 2. Check authority receipt
    const authorityReceipt = await this.getAuthorityReceipt(transmissionId);
    verification.checks.push({
      type: 'authority_receipt',
      status: authorityReceipt ? 'success' : 'failed',
      receiptNumber: authorityReceipt?.number
    });
    
    // 3. Compare checksums
    const checksumMatch = await this.compareChecksums(
      localData?.checksum,
      authorityReceipt?.checksum
    );
    verification.checks.push({
      type: 'checksum',
      status: checksumMatch ? 'success' : 'failed'
    });
    
    return verification;
  }
}
```

### 6. Security Implementation Examples

#### Access Token Management
```javascript
class TokenManager {
  constructor() {
    this.tokenStorage = new SecureStorage('ft-tokens');
    this.refreshThreshold = 300000; // 5 minutes
  }

  async getValidToken() {
    const current = await this.tokenStorage.get();
    
    if (!current || this.isExpiringSoon(current)) {
      return await this.refreshToken(current);
    }
    
    return current;
  }

  async refreshToken(currentToken) {
    const newToken = await this.requestNewToken(currentToken);
    await this.tokenStorage.save(newToken);
    return newToken;
  }

  isExpiringSoon(token) {
    const expiresAt = new Date(token.expiresAt).getTime();
    const now = Date.now();
    return expiresAt - now < this.refreshThreshold;
  }
}
```

#### Request Encryption
```javascript
class RequestEncryption {
  constructor(publicKey) {
    this.publicKey = publicKey;
  }

  async encryptSensitiveData(data) {
    const sessionKey = await this.generateSessionKey();
    const encryptedData = await this.encryptWithSessionKey(data, sessionKey);
    const encryptedKey = await this.encryptSessionKey(sessionKey);
    
    return {
      data: encryptedData,
      key: encryptedKey,
      algorithm: 'AES-256-GCM',
      iv: this.generateIV()
    };
  }

  async encryptWithSessionKey(data, key) {
    const encoder = new TextEncoder();
    const encoded = encoder.encode(JSON.stringify(data));
    
    const encrypted = await crypto.subtle.encrypt(
      {
        name: 'AES-GCM',
        iv: this.iv
      },
      key,
      encoded
    );
    
    return Buffer.from(encrypted).toString('base64');
  }
} 