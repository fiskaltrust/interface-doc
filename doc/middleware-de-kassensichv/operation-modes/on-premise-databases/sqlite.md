---
slug: /poscreators/middleware-doc/germany/databases/sqlite
title: SQLite
---

# SQLite Storage

## Support

**from version:** 1.3.0

The use of the SQLite storage provider enables the middleware to be operated with a local, file-based database. The middleware stores all data processed during operation of the queue as well as all configuration data directly in the database.

This storage provider is particularly suitable for the simple construction of smaller, locally operated cash register systems.

## Parameters
| Name                        | Description                                                                                                      | **Default Value**<br />**Mandatory Field** |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| _TarFileExportMode_         | `All` Enables the automatic TAR File export from the TSE on the Queue level. `None` Disables the automatic TAR File export from the TSE on the Queue level. `Erased` TAR files are only exported and saved when they could be deleted from the TSE. (Values: `All` / `None` / `Erased`)                           | ja (default: `true`)  |
| _StoreTemporaryExportFiles_ | Enables storage of temporaty export files in the `fiskaltrust/service/Exports` folder (Values: `true` / `false`) | `false` <br /> optional                      |
