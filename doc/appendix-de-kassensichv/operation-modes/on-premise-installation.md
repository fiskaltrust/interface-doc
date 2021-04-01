# fiskaltrust.Middleware

Die lokal installierte fiskaltrust.Middleware bietet die Einbindung von TSE aller Hersteller an die Registrierkasse, sowie eine vereinfachte Umsetzung der Anforderungen der Digitalen Schnittstelle der Finanzverwaltung für Kassensysteme.

![middleware-en](../../general/operation-modes/images/middleware-en.png)

Die fiskaltrust.Middleware besteht aus 

- einer Launcher App zum Installieren der Middleware lokal auf dem Kassenrechner
- einem Middleware Dienstprogramm (Service/Daemon; läuft dauerhaft auf dem Kassenrechner)

## Hardware Voraussetzungen

| Hardware                          | Mindestanforderung                                           |
| --------------------------------- | ------------------------------------------------------------ |
| Allgemeine Hardware Anforderungen | Die Middleware kann grundsätzlich auf einem [Rasperry PI 2](https://www.raspberrypi.org/products/raspberry-pi-2-model-b/) betrieben werden. |
| lokaler Speicher                  | ca. 500 MB (200 MB für die Middleware + 200 MB reserviert für update-packages); optional: Speicher für SQLite DB (ca. 8-10Kb/Beleg) |
| Hardware Anschlüsse für TSE       | USB, SD, Micro-SD oder COM Port bei lokal angeschlossener TSE |
| Internet Connektivität            | optional: (WIFI)Modem für Internet Anschluß zur Nutzung von Cloud TSE, data as a service-, backup,- oder Konfigurations-/update Services. |

## Unterstützte Plattformen & TSEs

|                                                              | Windows                                 | Linux, macOS                                  | Android |
| ------------------------------------------------------------ | --------------------------------------- | --------------------------------------------- | ------- |
| [A-Trust Cloud TSE](../features/basics/tse-as-a-service/a-trust.md) | ja                                      |                                               |         |
| [Cryptovision Hardware-TSE](../features/basics/tse-as-a-service/cryptovision.md) | ja                                      | ja                                            |         |
| [Deutsche Fiskal Cloud-TSE](../features/basics/tse-as-a-service/deutsche-fiskal.md) | derzeit nur für Windows 10 zertifiziert | derzeit nur für Ubuntu LTS 20.04 zertifiziert |         |
| [Diebold-Nixdorf Hardware-TSE](../features/basics/tse-as-a-service/diebold-nixdorf.md) | ja                                      | ja                                            |         |
| [Epson Hardware-TSE](../features/basics/tse-as-a-service/epson.md) | ja                                      | ja                                            |         |
| [fiskaly Cloud-TSE](../features/basics/tse-as-a-service/epson.md) | ja                                      | ja                                            | ja      |
| [Swissbit Hardware-TSE](../features/basics/tse-as-a-service/swissbit.md) | ja                                      | ja                                            | ja      |
| [Swissbit Cloud-TSE](../features/basics/tse-as-a-service/swissbit-cloud.md) | derzeit nur für Windows 10 zertifiziert | derzeit nur für Ubuntu LTS 20.04 zertifiziert |         |

### Systemvoraussetzungen

- [Windows](../features/supported-platforms/windows.md)
- [Linux, macOs](../features/supported-platforms/linux.md)
- [Android](../features/supported-platforms/android.md)

## Features

### Schnittstellentechnologien

freie Auswahl folgender konfigurierbarer Schnittstellentechnologien:

|      | Windows | Linux, macOS | Android |
| ---- | ------- | ------------ | ------- |
| WCF  | ja      |              |         |
| gRPC | ja      | ja           | ja      |
| REST | ja      | ja           | ja      |

### Schnittstellendokumentation

https://github.com/fiskaltrust/interface-doc/blob/master/doc/general/communication/communication.md

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

### Abstraktion

- [SCU-Abstraktion](../features/basics/scu-abstraction.md)  
- [Queue-Abstraktion](../features/basics/queue-abstraction.md) 