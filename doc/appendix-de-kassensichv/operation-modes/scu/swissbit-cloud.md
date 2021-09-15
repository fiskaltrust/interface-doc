---
slug: /poscreators/middleware-doc/germany/scu/swissbit-cloud
title: Swissbit Cloud-TSE
---

# Swissbit Cloud-TSE

### Environmental protection

Please note that this TSE places strict requirements on environmental protection (i.e. the operating system used and its configuration). You can find more detailed information in the official documents of the manufacturer in the [download area of the fiskaltrust portal](https://portal.fiskaltrust.de/AccountProfile/Download).

### State of certification

Certification-ID of TSE according to chapter 9.2.2 of [Anwendungserlass zu § 146a AO](https://docs.fiskaltrust.cloud/doc/productdescription-de-doc/product-service-description/media/2019-06-17-einfuehrung-paragraf-146a-AO-anwendungserlass-zu-paragraf-146a-AO.pdf):

| Certification-ID                                                                                                                    | Test item                   | Applicant    | Date       |
|:------------------------------------------------------------------------------------------------------------------------------------|:----------------------------|:-------------|:-----------|
| [BSI-K-TR-0457-2021](https://www.bsi.bund.de/SharedDocs/Zertifikate_TR/Technische_Sicherheitseinrichtungen/BSI-K-TR-0457-2021.html) | D-TRUST TSE Web Version 2.0 | D-TRUST GmbH | 18.02.2021 |
| [BSI-K-TR-0369-2020](https://www.bsi.bund.de/SharedDocs/Zertifikate_TR/Technische_Sicherheitseinrichtungen/BSI-K-TR-0369-2020.html) | D-TRUST TSE Web Version 1.0 | D-TRUST GmbH | 30.09.2020 |

#### Certification identification

"BSI-K-TR-0456-2021 [USK ausgesetzt]" ("Environmental protection exposed") is returned for 'ftSignatureType' `0x4445000000000022` (certification identification). 

### Client registration

The Swissbit Cloud-SCU is limited to a single client registration (only one queue can be registered at the TSE). Possible [rollout scenarios](https://docs.fiskaltrust.cloud/docs/posdealers/rollout-doc/middleware#rollout-scenarios) are limited to those cases in which exact one queue is operated per SCU.

## Signature Creation Unit

### Support

**from version:** 1.3.11

The _fiskaltrust.Middleware.SCU.DE.SwissbitCloud_-package connects the middleware to a Swissbit Cloud-TSE via the _Fiskal Cloud Connector_ ("FCC") service provided by Swissbit. The FCC can be installed automatically when the SCU package is started for the first time, or an already installed version of the FCC can be used (see *Parameter*).

**from version:** 1.3.23

The _fiskaltrust.Middleware.SCU.DE.SwissbitCloud_-package handels updates for FCC on start and new versions of the FCC are installed automatically.

### Parameters

| Name                          | Description                                                                                                                                                                                                                                                                                                                  | **Default Value**<br />**Mandatory Field**             |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
| _FccId_                       | The ID of the Fiscal Cloud Connector as specified in the FCC portal. It is filled automatically during production via the fiskaltrust portal.                                                                                                                                                                                | mandatory                                              |
| _FccSecret_                   | The secret or password of the Fiscal Cloud Connector, as specified in the FCC portal. It is filled automatically during production via the fiskaltrust portal.                                                                                                                                                               | mandatory                                              |
| _ErsCode_                     | The PIN code that is used to authenticate the POS-System with the FCC, as specified in the FCC portal. It is filled automatically during production via the fiskaltrust portal.                                                                                                                                              | mandatory                                              |
| _ActivationToken_             | The token used by the middleware to register clients in the FCC, as specified in the FCC portal. It is filled automatically during production via the fiskaltrust portal.                                                                                                                                                    | mandatory                                              |
| _FccPort_                     | The port that the middleware uses to communicate with the FCC.                                                                                                                                                                                                                                                               | 20001<br />optional                                    |
| _FccDirectory_                | The directory in which the Fiscal Cloud Connector is stored. If specified, it is first checked whether the FCC is already installed in this directory and an existing version is used. If there is no FCC installation at the specified location or the parameter is not specified, the FCC will be installed automatically. | `%localappdata%/fiskaltrust/FCC/[FccId]`<br />optional |
| _ProxyServer_                 | If access to the Internet is established via a proxy server: The proxy server's URL or IP address.                                                                                                                                                                                                                           | empty string/no proxy<br />optional                    |
| _ProxyPort_                   | If access to the Internet is established via a proxy server: The proxy server's HTTP-port.                                                                                                                                                                                                                                   | empty string<br />optional                             |
| _ProxyUsername_               | If access to the Internet is established via an _authenticated_ proxy server: The proxy server's user name.                                                                                                                                                                                                                  | empty string/no proxy authentication<br />optional     |
| _ProxyPassword_               | If access to the Internet is enabled via an _authenticated_ proxy server: The proxy server's password.                                                                                                                                                                                                                       | empty string/no proxy authentication<br />optional     |
| _DontAddFccFirewallException_ | If this parameter is not set, the SCU automatically tries to create a firewall exception for the FCC when it is started for the first time (admin rights are required). This can be prevented by setting this parameter to `true`.                                                                                           | `false`<br />optional                                  |
| _FccDownloadUri_              | If this parameter is set, the specified web URL is used to download the FCC. If no value is set, the FCC is automatically downloaded from the fiskaltrust servers. This parameter can help if the download from fiskaltrust servers is not possible, e.g. due to a strictly configured firewall.                             | `null`<br />optional                                   |

## Troubleshooting

| Problem                                                                      | Possible cause                                                                                                                         | Solution                                                                                                                                                                                  |
|------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **The Fiskal Cloud Connector cannot establish a connection to the Internet** | The middleware is not started as administrator.                                                                                        | Start the middleware with administrator rights.                                                                                                                                           |
|                                                                              | The automatic generation of the firewall exception via the parameter described above is deactivated, or a particular firewall is used. | An exception rule in the firewall for the `java.exe` in the subdirectory` bin \ jre \ bin` of the _FccDirectory_ (see above) (access to fiskal.cloud, port 443) has to be added manually. |
