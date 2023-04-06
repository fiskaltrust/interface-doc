---
slug: /poscreators/middleware-doc/germany/databases/mysql
title: MySQL
---

# MySQL Storage

## Support

**from version:** 1.3.45

The use of the MySQL storage provider enables the middleware to be operated with an external MySQL database system. The middleware stores all the data processed during the operation of the queue and all configuration data directly in the database.

This storage provider is particularly suitable for setting up fail-safe systems or for integrating middleware into existing system architectures.

## Parameters

| Name                        | Description                                                                                                      | **Default Value**<br />**Mandatory Field** |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| _connectionstring_          | MySQL connection string to the database system                                                                   | mandatory                                  |
