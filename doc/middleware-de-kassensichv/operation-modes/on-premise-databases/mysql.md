---
slug: /poscreators/middleware-doc/germany/databases/mysql
title: MySQL
---

# MySQL Storage

## Support

**from version:** 1.3.0

The use of the MySQL storage provider enables the middleware to be operated with an external MySQL database system. The middleware stores all the data processed during the operation of the queue and all configuration data directly in the database.

This storage provider is particularly suitable for setting up fail-safe systems or for integrating middleware into existing system architectures.

## Parameters

| Name                        | Description                                                                                                      | **Default Value**<br />**Mandatory Field** |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| _connectionstring_          | MySQL connection string to the database system                                                                   | mandatory                                  |
| _TarFileExportMode_         | `All` Enables the automatic TAR File export from the TSE on the Queue level. `None` Disables the automatic TAR File export from the TSE on the Queue level. `Erased` TAR files are only exported and saved when they could be deleted from the TSE. (Values: `All` / `None` / `Erased`)                           | optional (default: `All`)  |
| _StoreTemporaryExportFiles_ | Enables storage of temporaty export files in the `fiskaltrust/service/Exports` folder (Values: `true` / `false`) | `false` <br /> optional                      |
