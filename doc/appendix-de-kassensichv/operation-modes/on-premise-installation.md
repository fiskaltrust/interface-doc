# fiskaltrust.Middleware - on-premise installation

The illustration belows shows the components available for the on-premise installation of the fiskaltrust.Middleware for the German market. For the operation modes available and the description of the components please refer to the [general part](../../general/operation-modes/operation-modes.md) .

![middleware-en](images/middleware-en-market-de.svg)

### Supported software platforms

- [Windows](../features/supported-platforms/windows.md)
- [Linux, macOs](../features/supported-platforms/linux.md)
- [Android](../features/supported-platforms/android.md)

## Communication services

For the German market, following communication services are available dependent on the platform:

|      | Windows       | Linux, macOS  | Android       |
| ---- | ------------- | ------------- | ------------- |
| WCF  | **supported** | not supported | not supported |
| gRPC | **supported** | **supported** | **supported** |
| REST | **supported** | **supported** | **supported** |

## TSE support

|                                                              | Windows                                | Linux, macOS                               | Android                                |
| ------------------------------------------------------------ | -------------------------------------- | ------------------------------------------ | -------------------------------------- |
| [A-Trust Cloud TSE](../features/basics/tse-as-a-service/a-trust.md) | not supported<br />available soon      | not supported                              | not supported                          |
| [Cryptovision Hardware-TSE](../features/basics/tse-as-a-service/cryptovision.md) | **supported**                          | **supported**                              | not supported                          |
| [Deutsche Fiskal Cloud-TSE](../features/basics/tse-as-a-service/deutsche-fiskal.md) | **supported**<br />*Windows 10 only*   | **supported**<br />*Ubuntu LTS 20.04 only* | not supported                          |
| [Diebold-Nixdorf Hardware-TSE](../features/basics/tse-as-a-service/diebold-nixdorf.md) | **supported**                          | **supported**                              | not supported                          |
| [Epson Hardware-TSE](../features/basics/tse-as-a-service/epson.md) | **supported**                          | **supported**                              | not supported                          |
| [fiskaly Cloud-TSE](../features/basics/tse-as-a-service/epson.md) | **supported**<br />*with restrictions* | **supported**<br />*with restrictions*     | **supported**<br />*with restrictions* |
| [Swissbit Hardware-TSE](../features/basics/tse-as-a-service/swissbit.md) | **supported**                          | **supported**                              | **supported**                          |
| [Swissbit Cloud-TSE](../features/basics/tse-as-a-service/swissbit-cloud.md) | **supported**<br />Windows 10 only     | **supported**<br />*Ubuntu LTS 20.04 only* |                                        |

## Hardware requirements

For hardware requirements, please refer to the [general part](../../general/operation-modes/operation-modes.md).

- 

### Datenspeicher

Folgende Optionen sind über die Konfiguration der Queue einstellbar:

|                                                              | Windows | Linux, macOS | Android |
| ------------------------------------------------------------ | ------- | ------------ | ------- |
| [SQLite-Storage](../features/supported-databases/sqlite.md)  | ja      | ja           | ja      |
| [EF-Storage](../features/supported-databases/entity-framework.md) | ja      | ja           |         |
| [MySQL-Storage](../features/supported-databases/mysql.md)    | ja      | ja           | ja      |

### Daten-Export

-  [TAR-File-Export](../features/upload-and-export/tar-unload-and-export.md) 
-  [DSFinV-K-Export](../features/upload-and-export/dsfinvk-export.md) 
-  [DFKA-Taxonomie-Export](../features/upload-and-export/dfka-taxonomie-export.md) 
