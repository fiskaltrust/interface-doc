---
slug: /poscreators/middleware-doc/italy/platforms/linux
title: Linux
---

# fiskaltrust.Middleware for Linux and macOs

Starting with version 1.3.45, it's possible to run the Italian Middleware on Linux. Just configure a CashBox and download the Launcher via the respective button in the CashBox overview. Like on Windows, the downloaded zip file contains scripts to install and test the Middleware. Other than that, no specific software needs to be installed as the Italian Middleware is running on the Launcher 2.0 which is self-contained and has no external dependencies.

## Requirements

In general, it's possible to run the Middleware on each Linux distribution (_Ubuntu_, _Debian_, _Raspbian_, _CentOS_ and _Fedora_, including their derivatives). Most testing at fiskaltrust is performed with Ubuntu and Debian, and we hence recommend to use these distributions.

|                                                                 | Version    | Architecture     |
|-----------------------------------------------------------------|------------|------------------|
| Debian        | >= 10     | 64bit           |
| Ubuntu        | >= 16.04  | 64bit           |

## Supported packages

### Local data storage/Linux distribution support matrix

|                                                                 | Ubuntu     | Debian     | Other distributions              |
|-----------------------------------------------------------------|------------|------------|----------------------------------|
| **[SQLite-Storage](../on-premise-databases/sqlite.md)**         | **tested** | **tested** | should work (not tested)         |
| **[MySQL-storage](on-premise-databases/mysql.md)**              | **tested** | **tested** | should work (not tested)         |
| **[EF-storage](on-premise-databases/entity-framework.md)**      | not tested | not tested |                                  |


Both Entity Framework and SQLite queues can be launched on Linux, starting from version 1.3.45.

If you haven't already decided for a communication technology, we strongly recommend gRPC, as it provides a cleaner, more stable interface. Please refer to our demo project (currently available in [C#](https://github.com/fiskaltrust/middleware-demo-dotnet), [Java](https://github.com/fiskaltrust/middleware-demo-java), [Node.js](https://github.com/fiskaltrust/middleware-demo-node) and [others](https://github.com/fiskaltrust)) for sample implementations.
