---
slug: /poscreators/middleware-doc/germany/operation-modes/on-premise-installation
title: On-premise installation
---

# On-premise installation

The illustration below shows the components available for the on-premise installation of the fiskaltrust.Middleware for the German market. For the operation modes available and the description of the components please refer to the [general part](../../general/operation-modes/operation-modes.md) .

![middleware-en](images/middleware-en-market-de.svg)

## Supported software platforms

- [Windows](../features/supported-platforms/windows.md)
- [Linux, macOs](../features/supported-platforms/linux.md)
- [Android](../features/supported-platforms/android.md)

## Communication services platform support matrix

For the German market, following communication services are available dependent on the platform:

|          | Windows       | Linux, macOS  | Android       |
| -------- | ------------- | ------------- | ------------- |
| **gRPC** | **supported** | **supported** | **supported** |
| **REST** | **supported** | **supported** | **supported** |
| **WCF**  | **supported** | not supported | not supported |

## SCD/TSE platform support matrix

|                                                              | Windows                                   | Linux, macOS                               | Android                                   |
| ------------------------------------------------------------ | ----------------------------------------- | ------------------------------------------ | ----------------------------------------- |
| [A-Trust Cloud TSE](../features/basics/tse-as-a-service/a-trust.md) | not supported<br />*available soon*       | not supported                              | not supported                             |
| [Cryptovision Hardware-TSE](../features/basics/tse-as-a-service/cryptovision.md) | **supported**                             | **supported**                              | not supported                             |
| [Deutsche Fiskal Cloud-TSE](../features/basics/tse-as-a-service/deutsche-fiskal.md) | **supported**                             | **supported**<br />*Ubuntu LTS 20.04 only* | not supported                             |
| [Diebold-Nixdorf Hardware-TSE](../features/basics/tse-as-a-service/diebold-nixdorf.md) | **supported**                             | **supported**                              | not supported                             |
| [Epson Hardware-TSE](../features/basics/tse-as-a-service/epson.md) | **supported**                             | **supported**                              | not supported                             |
| [fiskaly Cloud-TSE](../features/basics/tse-as-a-service/epson.md) | **supported**<br />*TSE in certification* | **supported**<br />*TSE in certification*  | **supported**<br />*TSE in certification* |
| [Swissbit Cloud-TSE](../features/basics/tse-as-a-service/swissbit-cloud.md) | **supported**                             | **supported**<br />*Ubuntu LTS 20.04 only* |                                           |
| [Swissbit Hardware-TSE](../features/basics/tse-as-a-service/swissbit.md) | **supported**                             | **supported**                              | **supported**                             |

## Hardware requirements

For hardware requirements, please refer to the [general part](../../general/operation-modes/operation-modes.md).

## Local data storage platform support matrix

Following local data storage options can be configured in the queue:

|                                                              | Windows       | Linux, macOS  | Android       |
| ------------------------------------------------------------ | ------------- | ------------- | ------------- |
| **[EF-storage](../features/supported-databases/entity-framework.md)** | **supported** | **supported** | not supported |
| **In-memory storage**                                        |               |               |               |
| **[MySQL-storage](../features/supported-databases/mysql.md)** | **supported** | **supported** | **supported** |
| **[SQLite-storage](../features/supported-databases/sqlite.md)** | **supported** | **supported** | **supported** |

## Local data export

-  TAR-File-Export 
-  [DSFinV-K export](../procedural-documentation/dsfinv-k-generation.md) 
-  DFKA-Taxonomie-Export 

## Installation

For the on- and off-premise installation of the fiskaltrust.Middleware please refer to the [installation chapter in the general part](../../general/installation/installation.md).