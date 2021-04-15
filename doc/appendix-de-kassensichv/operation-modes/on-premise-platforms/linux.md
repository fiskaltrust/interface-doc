---
slug: /poscreators/middleware-doc/germany/platforms/linux
title: Linux
---

# fiskaltrust.Middleware for Linux and macOs

Starting with version 1.3.3, it's possible to run the German Middleware on Linux, using [Mono](https://www.mono-project.com/). Just configure a Cashbox and download the Linux launcher via the respective button in the Cashbox overview. Like on Windows, the downloaded zip file contains scripts to install and test the Middleware.

## Requirements

In general, it's possible to run the Middleware on each Linux distribution that is supported by Mono (_Ubuntu_, _Debian_, _Raspbian_, _CentOS_ and _Fedora_, including their derivatives). Most testing at fiskaltrust is performed with Ubuntu and Debian, and we hence recommend to use these distributions.

**Please make sure to install the latest Mono version**. The default versions in the package repositories are usually extremely outdated, so please follow the official [Mono guidelines](https://www.mono-project.com/download/stable/#download-lin-ubuntu) to get the latest packages. We recommend to use at least version 6.8.0, if possible.

Other than that, no specific software needs to be installed (aside from the dependencies Mono has).

## Supported packages

### Local data storage/Linux distribution support matrix

|                                                              | Ubuntu     | Debian     | Other distributions running Mono |
| ------------------------------------------------------------ | ---------- | ---------- | -------------------------------- |
| local mySQL Storage                                          | **tested** | **tested** | should work (not tested)         |
| local [SQLite-Storage](../on-premise-databases/sqlite.md)    | **tested** | **tested** | should work (not tested)         |
| local [EF-Storage](../on-premise-databases/entity-framework.md) | not tested | not tested |                                  |
| local in-memory storage                                      | not tested | not tested |                                  |

Both Entity Framework and SQLite queues can be launched on Linux, starting from version 1.3.3. 

### SCD/Linux distribution support matrix

|                                                           | Ubuntu                                 | Debian     | Other distributions running Mono |
| --------------------------------------------------------- | -------------------------------------- | ---------- | -------------------------------- |
| [A-Trust Cloud TSE](../scd/a-trust.md)                    | not tested                             | not tested |                                  |
| [Cryptovision Hardware-TSE](../scd/cryptovision.md)       | **tested**                             | **tested** | should work (not tested)         |
| [Deutsche Fiskal Cloud-TSE](../scd/deutsche-fiskal.md)    | Ubuntu LTS 20.04 certified, not tested | not tested |                                  |
| [Diebold-Nixdorf Hardware-TSE](../scd/diebold-nixdorf.md) | not tested                             | not tested |                                  |
| [Epson Hardware-TSE](../scd/epson.md)                     | not tested                             | not tested |                                  |
| [fiskaly Cloud-TSE](../scd/fiskaly.md)                    | **tested**                             | **tested** | should work (not tested)         |
| [Swissbit Hardware TSE](../scd/swissbit.md)               | **tested**                             | **tested** | should work (not tested)         |
| [Swissbit Cloud TSE](../scd/swissbit-cloud.md)            | Ubuntu LTS 20.04 certified, not tested | not tested |                                  |

## Limitations

Currently, the Middleware only supports gRPC and REST when executed on Linux. This means that SOAP is right now not supported (due to open bugs in Mono's WCF implementation). 

If you haven't already decided for a communication technology, we strongly recommend gRPC, especially in Linux scenarios, as it provides a cleaner, more stable interface. Please refer to our demo project (currently available in [C#](https://github.com/fiskaltrust/middleware-demo-dotnet), [Java](https://github.com/fiskaltrust/middleware-demo-java), [Node.js](https://github.com/fiskaltrust/middleware-demo-node) and [others](https://github.com/fiskaltrust)) for sample implementations.

## REST limitations

When using REST, the HTTP endpoint slightly differs from the Windows version, as the version prefix cannot be included because of the mentioned Mono issues. Hence, a REST URL on Linux would look like this: `http://localhost:1500/a4c4e466-721a-4011-a9a5-a23827a21b45/sign` (instead of `../v1/sign`).

In addition, if REST is used, a gRPC endpoint needs to be configured as the **primary** endpoint of the Queue and the SCU, so it can be properly used by our packages.

We will unify the experiences on Linux and Windows in an upcoming version.