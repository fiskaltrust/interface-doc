---
slug: /poscreators/middleware-doc/italy/databases/ef
title: Entity Framework
---

# Entity Framework Storage

## Support

**from version:** 1.3.45

With the help of the Entity Framework Storage Provider, it is possible to operate the fiskaltrust.Middleware with an external Microsoft SQL Server database system. The middleware stores all the data processed during the operation of the queue and all configuration data directly in the database.

This storage provider is particularly suitable for setting up fail-safe systems or for integrating middleware into existing system architectures.

## Parameters

| Name               | Description                                            | **Default Value**<br />**Mandatory Field** |
|--------------------|--------------------------------------------------------|--------------------------------------------|
| _connectionstring_ | EF-compatible connection string to the database system | mandatory                                  |
