---
slug: /poscreators/middleware-doc/germany/reference-tables/ftjournaltype
title: 'Type of Journal: ftJournalType'
---

### Type of journal: ftJournalType

This table expands on the values provided in table of Chapter ["Type of Journal: ftJournalType"](../../general/reference-tables/reference-tables.md#c-type-of-journal-ftjournaltype-129) of the General part with values applicable to the German market<span id="t-type-of-journal-ftjournaltype-190">.</span>

| **Value**            | **Description**                | **Version** |
|----------------------|--------------------------------|-------------|
| `0x4445000000000000` | Status information for QueueDE | 1.3.1       |
| `0x4445000000000001` | .TAR-File from TSE device. Please note that the TSE's log messages are automatically exported during each daily closing receipt and deleted on the device afterwards for performance reasons. Hence, this export will only return the log files created since the last daily closing. To get the full TAR file, please use the type `0x4445000000000003`.       | 1.3.1       |
| `0x4445000000000002` | DSFinV-K export as .ZIP file   | 1.3.6       |
| `0x4445000000000003` | .TAR-File from Middleware database. This export should be prefered over `0x4445000000000001` generally, as it's populated from the already exported data and therefore faster than the direct TSE export.        | 1.3.11      |
