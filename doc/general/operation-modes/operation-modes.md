---
slug: /poscreators/middleware-doc/general/operation-modes
title: Operation modes
---

# Operation modes

Dependent on local market regulations, operation modes for following operational environments are supported by the fiskaltrust.Middleware:

![operational-environments](images/operational-environments.png)

- on-premise (for POS systems hosted in-house, on a cash-register or on a local network-server) 
- off-premise (for POS systems hosted by a third-party and usually supported by a different third-party - mostly by the POS creator; f.e. server housing in a data center)
- private Cloud operated by a 3rd party (hosted and maintained by a third-party)
- private Cloud operated by fiskaltrust (hosted and maintained by fiskaltrust)

| operation mode                                 | AT            | DE*           | FR            |
| ---------------------------------------------- | ------------- | ------------- | ------------- |
| **on- & off-premise**                          | **supported** | **supported** | **supported** |
| **private Cloud<br />operated by a 3rd party** | **supported** | **supported** | not offered   |
| **private Cloud<br />operated by fiskaltrust** | **supported** | not supported | **supported** |

*In Germany, the fiskaltrust.Middleware must always be operated as a local component of the electronic recording system. For example, if the electronic recording system runs on a local Windows based cash register, the fiskaltrust.Middleware has to be operated on the same operational environment (this could be the same machine, or a local network server). If the electronic recording system is a SaaS solution operated in the Cloud, the fiskaltrust.Middleware has to be operated in the same data center.

## Components of the fiskaltrust.Middleware

Regardless of the characteristics of the product, fiskaltrust.Middleware consists of several logical components. This chapter provides an overview on these components.

### On-premise & off-premise installed components

This solution requires [installation](../installation/operation-modes.md)  and configuration for the client. The platform support is dependent on the local market. The availability and use of the on-premise solution is dependent on local regulations and currently available for Austria and Germany.

![middleware-en](images/middleware-en.png)

tbd: tcp/serial stream not in market-de
fr only rest/wcf?

#### Launcher

The Launcher is a software (file) named `fiskaltrust.exe`, which is used only for the on-premise installed products (e.g. AT products fiskaltrust.SignatureCard or fiskaltrust.SignatureBox). For Windows, it is a .NET command-line application and a .NET Windows service. For Linux and Mac, the launcher can be executed via Mono, version 3.2.8 or higher, or used as daemon.

The main tasks of the launcher are:

  - providing basic configuration settings such as ftCashBoxId and access token
  - comparing the configuration data retrieved from fiskaltrust.Helipad with the local configuration
  - updating queue- and SCU packages accordingly to the configuration
  - execution of configured packages
  - load balancing of multiple queues

The executable file `fiskaltrust.exe` and the corresponding DLLs can be distributed via copy-paste and then configured and installed with the help of a command-line parameter. It can be downloaded (incl. configuration) from the Portal’s configuration-\>cashbox page, or found on nuget.org and configured manually.

#### IPOS Interface

The cash register communicates with the queue via the IPOS interface. The IPOS interface is identical for all supported countries (cross national) and can be accessed via REST, gRPC, WCF, TCP stream and serial stream. There are three interface methods offered: *echo* (check availability), *sign* (sign receipt data, send special receipts) and *journal* (export data).
More detailed information you can find in the [communication chapter](../communication/communication.md).

#### Queue

The queue serves to encapsulate the functionality of a receipt chain for various platforms and localisations. In accordance with the interface description, the queues can be addressed individually or via a load balanced channel of the launcher.

#### SCU

The SCU (Signature Creation Unit) serves to encapsulate the communication with a signature creation device. The respective signature creation device can be accessed via different channels: directly, locally, or via network. This service is provided in following markets:

Austria

Germany

#### SCD

The SCD (Signature Creation Device) is not part of the fiskaltrust.Middleware. Signature Creation Devices are providing additional security and functionalities based on local market regulation, delivered by third party vendors (e.g. a software based cloud solution, a hardware device, or a certificate), supported by fiskaltrust via the SCU. The choice of the SCD has impacts on the fiskaltrust.Middleware configuration, therefore available SCDs, its configuration, functionalities and limitations regarding the fiskaltrust.Middleware are documented in the appropriate appendices of the markets.

#### Helipad Helper

The Helipad Helper is used to support updates and configurations.

#### Hardware requirements

For the operation of the installed components of the fiskaltrust.Middleware following minimum hardware requirements are recommended:

| Hardware                      | Minimum requirements                                         |
| ----------------------------- | ------------------------------------------------------------ |
| general hardware requirements | The fiskaltrust.Middleware can be generally operated on a [Rasperry PI 2](https://www.raspberrypi.org/products/raspberry-pi-2-model-b/). |
| local storage                 | Around 500 MB (200 MB for the Middleware components + 200 MB reserved for update-packages); optional: storage for SQLite db (around 8-10Kb/receipt) |
| Hardware connectivity         | For the German market: USB, SD, Micro-SD or COM port for a local hardware-based security device (Technische Sicherheitseinrichtung, TSE).<br />For the Austrian market: USB port |
| Internet connectivity         | Optional, but strongly recommended: (WIFI)modem for Internet connectivity to use software-security-, data as a service-, backup,- or configuration-/update services. |

#### Supported software platforms

For supported platforms, please refer to the appendices of the applicable markets:

- Supported platforms in Austria
- Supported platforms in Germany

### Private cloud (operated by a third party) installed components

No installation or configuration is required for the client and any platform can use this service. The availability and use of SaaS installed components is dependent on local regulations and currently available for Austria and Germany. In Germany, because of different market regulation, the fiskaltrust.Middleware components must be hosted and operated by the POS creator in the same datatcenter where the receipt generation process of a distributed point of sale system occurs.

The components for the SaaS solution are the same as for the local solution; except the launcher, which is not needed. In Germany, the fiskaltrust.Middleware components can be delivered by a predefined Kubernetes Namespace which can be deployed by a Helm-Chart. fiskaltrust provides a "Backend POD" Docker image and Helm-Charts to be deployed at the POS creators environment.

### Private cloud (operated by fiskaltrust) installed components

No installation or configuration is required for the client and any platform can use this service. This service is currently available in Austria and France.

### Configuration of the fiskaltrust.Middleware

#### Online Portal

All configuration settings, as well as the relevant extensions, are managed via the online fiskaltrust.Portal. For further information, refer to the appropriate appendix.

#### Queue

A Queue is a part of communication line between the POS-System and the fiskaltrust.Middleware. All regular receipts created by the POS-System are sent to the fiskaltrust.Middleware to get secured and stored in the Queue, and the response of the fiskaltrust.SecurityMechanism is sent back. All special receipts (for example the periodical closings) are sent as "requests to execute a special function" to the fiskaltrust.Middleware and get answered by it. At least one Queue must be created for each POS-System.

#### Journal

A journal is an export of internal structured data of the receipts from the Queue(s). There are three types of journals: a protocol journal saving all requests, a journal which records all events happening in the queue (starts, stops, failures), and localized journals depeding on the national laws. For more details please refer to the appropriate appendix. The format of a common journal export is JSON.

#### Notifications

The information for notifications is extracted from the processing protocol and stored internally in the action journal. Helipad retrieves this information and processes it in accordance with country specific law. Special events have a localized reporting requirement. In online mode, notifications can be uploaded, automated and transported further at fiskaltrust.SecurityMechanism. If in offline mode, notifications are transported via zero receipts within the signature block.

#### Configuration Scenarios

The POS System connects to the fiskaltrust.Middleware to process the receipt chaining calculation. A Cash register means an individual fiskaltrust.SecurityMechanism - in the fiskaltrust.Portal it is called "CashBox" and represents the real CashRegister and its configuration with the SecurityMechanism. The cash register is identified via the ftCashBoxId. This is unique worldwide and also the first part of the authentication on the fiskaltrust.Helipad. The second part is an authentication token.

#### Single Queue scenario

The most common scenario uses a connection to a single fiskaltrust.Queue, which takes care of performing all the requested operations in accordance to the national law and requlations.

![](./images/01-individual-queue.png)

<span id="_Toc527986809" class="anchor"></span>*Illustration* *8. Use of an individual queue.*

#### Scenario with several queues for performance improvement

The POS System can require special operating conditions, e.g. a when a big flow of receipts is requested, the fiskaltrust.Middleware will ensure a high level of reliability by using multiple parallel Queues.

In this scenario, the fiskaltrust.Middleware hosts several Queues to optimize the performance of the service by distributing the workload evenly between the Queues. Each individual queue is reachable by the fiskaltrust.IPOS. This direct connection can be necessary in case of receipts with special functions and also in in case of special chunked Journals (Journals for specific range). The queues can be operated in a load balancing mode or in a backup mode via the balancer interface.

![](./images/02-service-performance-optimization.png)

<span id="_Toc527986810" class="anchor"></span>*Illustration 9. fiskaltrust.Middleware in a configuration for performance optimization*
