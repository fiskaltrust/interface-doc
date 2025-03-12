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

| Code | Description | Details |
|------|-------------|---------|
| 0001 | Point-Of-Sale receipt | Standard sales receipt |
| 0002 | Payment transfer | Cash management |
| 1001 | B2C invoice | Consumer invoice |
| 1002 | B2B invoice | Business invoice |
| 2011 | Daily Closing | End of day processing |
| 4001 | Queue-Start-Receipt | Initial operations |

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

| Code | Description | Rate |
|------|-------------|------|
| 3 | Normal VAT rate | 22% |
| 1 | Reduced VAT rate 1 | 10% |
| 2 | Reduced VAT rate 2 | 5% |
| 4 | Super reduced | 4% |
| 7 | Zero VAT rate | 0% |

### Nature of VAT Codes

| Code | Description | Marker |
|------|-------------|--------|
| 10 | Not Taxable | NI (N3) |
| 20 | Not Subject | NS (N2) |
| 30 | Exempt | ES (N4) |
| 40 | Margin scheme | RM (N5) |
| 50 | Reverse charge | AL (N6) |

## Payment Types (ftPayItemCase)

### Format
`_4954_2000_gggg_xxPP`

Where:
- `4954`: Country code for Italy
- `2000`: Version 2.0
- `gggg`: Global flags
- `xx`: Reserved
- `PP`: Payment type

### Payment Types

| Code | Description |
|------|-------------|
| 01 | Cash |
| 02 | Non-Cash |
| 04 | Debit Card |
| 05 | Credit Card |
| 06 | Voucher |
| 07 | Online |

## Signature Types (ftSignatureType)

### Format
`_4954_2000_gggg_tsss`

Where:
- `4954`: Country code for Italy
- `2000`: Version 2.0
- `gggg`: Global flags
- `t`: Type category
- `sss`: Signature case

### Signature Cases for Italy

| Code | Description | Details |
|------|-------------|---------|
| 001 | RT Fiscalization | Primary fiscal signature |
| 010 | RT Serial Number | Device identification |
| 011 | RT Z-Number | Daily counter |
| 012 | RT Document Number | Receipt counter |
| 013 | RT Document Moment | Timestamp |
| 014 | RT Document Type | Transaction type |
| 015 | RT Lottery ID | Receipt lottery code |
| 016 | RT Customer ID | Customer identification |
| 017 | RT SHA Metadata | Security hash |

## State Flags (ftState)

### Format
`_4954_2000_gggg_gggg`

### Local State Flags for Italy

| Code | Description |
|------|-------------|
| 001 | RT device not reachable |
| 002 | Daily closing required |
| 004 | Network error |
| 008 | Paper low/end |

## Journal Types (ftJournalType)

### Format
`_4954_2000_gggg_tjjj`

### Journal Cases for Italy

| Code | Description |
|------|-------------|
| 000 | Queue Status |
| 001 | RT Export |
| 002 | Daily Report |
| 003 | Monthly Report | 