---
slug: /poscreators/middleware-doc/france/reference-tables
title: Type of Journal: ftJournalType
---

# Reference tables

## Type of Journal: ftJournalType

The `ftJournalType` is used in connection with the journal function and defines the journal stream given back according to the French law. In the `ftJournalType`, the ISO-3166-1-ALPHA-2 from ASCII value is converted into hex and used as byte 8 and 7. For France (FR) this is 0x4652.

| **Value**            | **Description**                     | **Version** |
|----------------------|-------------------------------------|-------------|
| `0x4652000000000000` | Status information for queue FR     | 1.2         |
| `0x4652000000000001` | Ticket ("T" group) export           | 1.2         |
| `0x4652000000000002` | Payment Prove ("P" group) export    | 1.2         |
| `0x4652000000000003` | Invoice ("I" group) export          | 1.2         |
| `0x4652000000000004` | Grand Total ("G" group) export      | 1.2         |
| `0x4652000000000007` | Bill ("B" group) export             | 1.2         |
| `0x4652000000000008` | Archive ("A" group) export          | 1.2         |
| `0x4652000000000009` | Log ("L" group) export              | 1.2         |
| `0x465200000000000A` | Copy ("C" group) export             | 1.2         |
| `0x465200000000000B` | Training ("X" group) export         | 1.2         |
| `0x4652000000000010` | Export (in conjunction with Archiv) | 1.2         |

*Table 38. Type of Journal: ftJournalType (FR - BOI-TVA-DECL 30-10-30)*

### ftJournalTypeFlag

Journals can be extracted in combination with these flags, indicated using codes in byte 5. These codes can be combined using the logic operator `OR`.

| **Value**            | **Description**                                                           | **Version** |
|----------------------|---------------------------------------------------------------------------|-------------|
| `0x0000000000010000` | Receive Archive as zip-file created with ReceiptCase `0x4652000000000015` | 1.2         |
