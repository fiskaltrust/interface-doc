---
slug: /middleware-it-registratore-telematico/reference-tables
title: Reference Tables v2.0
---

# Reference Tables for Italian Middleware v2.0

## Receipt Cases (ftReceiptCase)

### Format
`_4954_2000_gggg_txcc`

Where:
- `4954`: Country code for Italy (IT)
- `2000`: Version 2.0
- `gggg`: Global flags
- `t`: Receipt type
- `xcc`: Receipt case

### Receipt Types

| Type | Category | Description |
|------|----------|-------------|
| 0 | Receipt | Basic POS sale receipt |
| 1 | Invoice | Invoice for deferred payment |
| 2 | Daily Operations | Required for downstream processes |
| 3 | Log | Event logging and security |
| 4 | Lifecycle | Queue state management |

### Receipt Cases

| Code | Description | Details | RT Requirements |
|------|-------------|---------|-----------------|
| 0001 | Point-Of-Sale receipt | Standard sales receipt | Requires RT signature |
| 0002 | Payment transfer | Cash management | Requires RT signature |
| 0003 | Non-fiscal receipt | No fiscalization required | No RT signature |
| 0004 | E-Commerce receipt | Online transaction | Requires RT signature |
| 1001 | B2C invoice | Consumer invoice | Requires RT signature |
| 1002 | B2B invoice | Business invoice | Requires RT signature |
| 2011 | Daily Closing | End of day processing | Requires RT signature |
| 3001 | Technical event | System event logging | No RT signature |
| 4001 | Queue-Start-Receipt | Initial operations | Requires RT signature |

### Global Flags (gggg)

| Flag | Description |
|------|-------------|
| 0001 | Late signing |
| 0002 | Training mode |
| 0004 | Void receipt |
| 0008 | Handwritten receipt |
| 0010 | Small business |
| 0020 | Business customer |
| 0040 | Known customer |
| 0100 | Return/Refund |

## Charge Items (ftChargeItemCase)

### Format
`_4954_2000_gggg_NNSV`

Where:
- `4954`: Country code for Italy
- `2000`: Version 2.0
- `gggg`: Global flags
- `NN`: Nature of VAT
- `S`: Service type
- `V`: VAT rate

### VAT Types for Italy

| Code | Description | Rate | Marker |
|------|-------------|------|---------|
| 3 | Normal VAT rate | 22% | A |
| 1 | Reduced VAT rate 1 | 10% | B |
| 2 | Reduced VAT rate 2 | 5% | C |
| 4 | Super reduced | 4% | D |
| 7 | Zero VAT rate | 0% | H |

### Nature of VAT Codes

| Code | Description | Marker | Details |
|------|-------------|---------|---------|
| 10 | Not Taxable | NI (N3) | Exports and similar transactions |
| 11 | Non-taxable - intra-community | NI (N3.1) | EU transactions |
| 12 | Non-taxable - San Marino | NI (N3.2) | San Marino transactions |
| 20 | Not Subject | NS (N2) | Out of scope |
| 21 | Not subject - other | NS (N2.2) | Other cases |
| 30 | Exempt | ES (N4) | Art. 10 DPR 633/72 |
| 40 | Margin scheme | RM (N5) | Used goods, art, antiques |
| 50 | Reverse charge | AL (N6) | Construction sector |
| 51 | Reverse charge - other | AL (N6.1) | Other sectors |

### Service Types (S)

| Code | Description | Requirements |
|------|-------------|--------------|
| 1 | Goods delivery | Standard VAT rules |
| 2 | Services | Standard VAT rules |
| 3 | Tip | Special handling |
| 4 | Voucher | Special rules based on type |
| 5 | Catalog service | Standard VAT rules |
| 6 | Agency business | Special documentation |
| 7 | Own consumption | Special VAT rules |

## Payment Types (ftPayItemCase)

### Format
`_4954_2000_gggg_xxPP`

Where:
- `4954`: Country code for Italy
- `2000`: Version 2.0
- `gggg`: Global flags
- `PP`: Payment type

### Payment Types

| Code | Description | RT Requirements |
|------|-------------|-----------------|
| 01 | Cash | Must be reported |
| 02 | Non-Cash | Must be reported |
| 04 | Debit Card | Must be reported |
| 05 | Credit Card | Must be reported |
| 06 | Voucher | Special handling |
| 07 | Online | Must be reported |
| 08 | Loyalty program | Special handling |
| 09 | Account receivable | Must be reported |
| 0C | Internal transfer | Special handling |

## Signature Types (ftSignatureType)

### Format
`_4954_2000_gggg_tsss`

### Signature Cases for Italy

| Code | Description | Format | Required |
|------|-------------|---------|----------|
| 001 | RT Fiscalization | QR Code | Yes |
| 010 | RT Serial Number | Text | Yes |
| 011 | RT Z-Number | Text | Yes |
| 012 | RT Document Number | Text | Yes |
| 013 | RT Document Moment | Text | Yes |
| 014 | RT Document Type | Text | Yes |
| 015 | RT Lottery ID | Text | Optional |
| 016 | RT Customer ID | Text | Conditional |
| 017 | RT SHA Metadata | Base64 | Yes |

### Signature Formats

| Format | Description |
|--------|-------------|
| 0001 | Text |
| 0002 | URL |
| 0003 | QR Code |
| 0004 | Code128 |
| 000D | Base64 |

## Journal Types (ftJournalType)

### Format
`_4954_2000_gggg_tjjj`

### Journal Cases for Italy

| Code | Description | Period |
|------|-------------|---------|
| 000 | Queue Status | On demand |
| 001 | RT Export | Daily |
| 002 | Daily Report | Daily |
| 003 | Monthly Report | Monthly |
| 004 | Annual Report | Yearly |

## State Flags (ftState)

### Format
`_4954_2000_gggg_gggg`

### Local State Flags for Italy

| Code | Description | Action Required |
|------|-------------|----------------|
| 001 | RT device not reachable | Check connection |
| 002 | Daily closing required | Perform closing |
| 004 | Network error | Check network |
| 008 | Paper low/end | Replace paper |
| 010 | Memory almost full | Perform export |
| 020 | Time drift detected | Sync time | 