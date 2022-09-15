---
slug: /poscreators/middleware-doc/germany/databases/ef
title: Entity Framework
---

# Entity Framework Storage

## Support

**from version:** 1.3.0

With the help of the Entity Framework Storage Provider, it is possible to operate the fiskaltrust.Middleware with an external Microsoft SQL Server database system. The middleware stores all the data processed during the operation of the queue and all configuration data directly in the database.

This storage provider is particularly suitable for setting up fail-safe systems or for integrating middleware into existing system architectures.

## Parameters

| Name                        | Description                                                                                                      | **Default Value**<br />**Mandatory Field** |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| _connectionstring_          | EF-compatible connection string to the database system                                                           | mandatory                                  |
| _TarFileExportMode_         | `All` Enables the automatic TAR File export from the TSE on the Queue level. `None` Disables the automatic TAR File export from the TSE on the Queue level. `Erased` TAR files are only exported and saved when they could be deleted from the TSE. (Values: `All` / `None` / `Erased`)                           | ja (default: `true`)  |
| _StoreTemporaryExportFiles_ | Enables storage of temporaty export files in the `fiskaltrust/service/Exports` folder (Values: `true` / `false`) | `false` <br /> optional                      |
