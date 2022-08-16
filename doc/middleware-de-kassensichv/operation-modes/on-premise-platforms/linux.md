---
slug: /poscreators/middleware-doc/germany/platforms/linux
title: Linux
---

# fiskaltrust.Middleware for Linux and macOs

Starting with version 1.3.3, it's possible to run the German Middleware on Linux, using [Mono](https://www.mono-project.com/). Just configure a CashBox and download the Linux launcher via the respective button in the CashBox overview. Like on Windows, the downloaded zip file contains scripts to install and test the Middleware.


## Requirements

In general, it's possible to run the Middleware on each Linux distribution that is supported by Mono (_Ubuntu_, _Debian_, _Raspbian_, _CentOS_ and _Fedora_, including their derivatives). Most testing at fiskaltrust is performed with Ubuntu and Debian, and we hence recommend to use these distributions.

**Please make sure to install the latest Mono version**. The default versions in the package repositories are usually extremely outdated, so please follow the official [Mono guidelines](https://www.mono-project.com/download/stable/#download-lin-ubuntu) to get the latest packages. We recommend to use at least version 6.8.0, if possible.

Other than that, no specific software needs to be installed (aside from the dependencies Mono has). When using a Swissbit TSE, it might be required to install the `libc` or `glibc` packages, as these are required by Swissbit's libraries.

## Supported packages

### Local data storage/Linux distribution support matrix

|                                                                 | Ubuntu     | Debian     | Other distributions running Mono |
|-----------------------------------------------------------------|------------|------------|----------------------------------|
| local mySQL Storage                                             | **tested** | **tested** | should work (not tested)         |
| local [SQLite-Storage](../on-premise-databases/sqlite.md)       | **tested** | **tested** | should work (not tested)         |
| local [EF-Storage](../on-premise-databases/entity-framework.md) | not tested | not tested |                                  |
| local in-memory storage                                         | not tested | not tested |                                  |

Both Entity Framework and SQLite queues can be launched on Linux, starting from version 1.3.3. 

### SCU/Linux distribution support matrix

|                                                           | Ubuntu                                                       | Debian                                                       | Other distributions running Mono                             |
| --------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [A-Trust Cloud TSE](../scu/a-trust.md)                    | Update 06.08.2021: Paused by a-trust. [Link](https://www.a-trust-tse.de/de/kassensichv/news/news/status-update-august/) | Update 06.08.2021: Paused by a-trust. [Link](https://www.a-trust-tse.de/de/kassensichv/news/news/status-update-august/) | Update 06.08.2021: Paused by a-trust. [Link](https://www.a-trust-tse.de/de/kassensichv/news/news/status-update-august/) |
| [Cryptovision Hardware-TSE](../scu/cryptovision.md)       | **tested**                                                   | **tested**                                                   | should work (not tested)                                     |
| [Deutsche Fiskal Cloud-TSE](../scu/deutsche-fiskal.md)    | Ubuntu LTS 20.04 certified, not tested                       | not tested                                                   |                                                              |
| [Diebold-Nixdorf Hardware-TSE](../scu/diebold-nixdorf.md) | not tested                                                   | not tested                                                   |                                                              |
| [Epson Hardware-TSE](../scu/epson.md)                     | not tested                                                   | not tested                                                   |                                                              |
| [fiskaly Cloud-TSE](../scu/fiskaly.md)                    | **tested**                                                   | **tested**                                                   | should work (not tested)                                     |
| [Swissbit Hardware TSE](../scu/swissbit.md)               | **tested**                                                   | **tested**                                                   | should work (not tested)                                     |
| [Swissbit Cloud TSE](../scu/swissbit-cloud.md)            | Ubuntu LTS 20.04 certified, not tested                       | not tested                                                   |                                                              |

### Specification for ARM processor

:::info

Starting with version 1.3.38 it is possible to run the German Middleware with ARM processors.Just configure a CashBox with a SQLITE queue and a DeutscheFiskal or SwissbitCloud SCU, and download the Linux launcher via the respective button in the CashBox overview. Like on Windows, the downloaded zip file contains scripts to install and test the Middleware.

:::

## Limitations

:::danger

Due to the limited hosting capabilities of Mono, the current version of the Middleware has several limitations and specifics when running on Linux. Therefore, please read this section carefully.

The upcoming major version of the Middleware will include a truly platform-independent Launcher where these limitations will be resolved.

:::


Currently, the Middleware only supports gRPC and REST when executed on Linux. This means that SOAP is right now not supported (due to open bugs in Mono's WCF implementation). 

If you haven't already decided for a communication technology, we strongly recommend gRPC, especially in Linux scenarios, as it provides a cleaner, more stable interface. Please refer to our demo project (currently available in [C#](https://github.com/fiskaltrust/middleware-demo-dotnet), [Java](https://github.com/fiskaltrust/middleware-demo-java), [Node.js](https://github.com/fiskaltrust/middleware-demo-node) and [others](https://github.com/fiskaltrust)) for sample implementations.

### REST limitations
When using REST, the HTTP endpoint slightly differs from the Windows version, as the version prefix cannot be included because of the mentioned Mono issues. Hence, a REST endpoint on Linux must be called like this: `http://localhost:1500/a4c4e466-721a-4011-a9a5-a23827a21b45/sign`:
- The `/json/v1` part needs to be omited
- The URL must be written in lower case
- When calling the _journal_ endpoint, the `type`, `from` and `to` GET parameters must be included

Please also note that the `content-type` must be set:
- to `application/json` when calling the _sign_ or _echo_ endpoints
- to `text/plain` when calling the _journal_ endpoint

In addition, if REST is used, a gRPC endpoint needs to be configured as the **primary** endpoint of the Queue and the SCU, so it can be properly used by our packages.
