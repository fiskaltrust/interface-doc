---
slug: /poscreators/middleware-doc/germany/scu/fiskaly-cloud
title: fiskaly-TSE
---

# SCU for fiskaly Cloud-TSE

### State of certification
Certification-ID of TSE according to chapter 9.2.2 of [Anwendungserlass zu § 146a AO](https://www.bundesfinanzministerium.de/Content/DE/Downloads/BMF_Schreiben/Weitere_Steuerthemen/Abgabenordnung/AO-Anwendungserlass/2021-11-04-aenderung-des-anwendungserlasses-zur-abgabenordnung-AEAO.pdf?__blob=publicationFile&v=2):

| Certification-ID                                                                                                                    | Test item                   | Applicant    | Date       |
|:------------------------------------------------------------------------------------------------------------------------------------|:----------------------------|:-------------|:-----------|
| [BSI-K-TR-0490-2021](https://www.bsi.bund.de/SharedDocs/Zertifikate_TR/Technische_Sicherheitseinrichtungen/BSI-K-TR-0490-2021.html) | fiskaly sign Cloud-TSE | fiskaly GmbH | 10.12.2021 |

#### Certification Identification

"BSI-K-TR-0490-2021" is returned for 'ftSignatureType' `0x4445000000000022` (certification identification). 

**Available from version**: 1.3.23

## Signature Creation Unit

### Support

**from version:** 1.3.23

The _fiskaltrust.Middleware.SCU.DE.FiskalyCertified_-package connects the middleware to a fiskaly Cloud-TSE (v2). Please note that the previously used _fiskaltrust.Middleware.SCU.DE.Fiskaly_ package only supports the non-certified fiskaly TSE v1, and - together with these TSEs - cannot be created or used anymore.

### Parameters

| Name                         | Description                                                                                                                                                                          | **Default Value**<br />**Mandatory Field**                                                                  |
|------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| _ApiKey_                     | The API key used to authenticate to the fiskaly services as specified in the fiskaly dashboard. It is filled automatically during production via the fiskaltrust portal.             | mandatory                                                                                                   |
| _ApiSecret_                  | The API secret that is used to authenticate to the fiskaly services, as specified in the fiskaly dashboard. It is filled automatically during production via the fiskaltrust portal. | mandatory                                                                                            
| _Guid TssId_               |   The unique ID of the TSS, as taken from the fiskaly dashboard or API                  | mandatory                                   |
| _AdminPin_               |     The Admin Pin of the TSE (not to be confused with the PUK)                   | mandatory                                   |
| _EnableTarFileExport_               |  Indicates if the SCU performs a TAR export when requested. TAR exports return an empty result in case this is set to `false`.                   | `true`<br />optional                                   |
| _CertificationId_               |  Certification identification of the TSE used, can be overwritten if required                  | `BSI-K-TR-0490-2021`<br />optional                                   |
| _FiskalyClientTimeout_               |   The HTTP timeout when calling the fiskaly API in milliseconds.                  | `120000`<br />optional                                   |
| _ProxyServer_               |           If access to the Internet is established via a proxy server: The proxy server's URL or IP address.                  | empty string/no proxy<br />optional >optional                                   |
| _ProxyPort_               |           If access to the Internet is established via a proxy server: The proxy server's HTTP-port.                  | empty string<br />optional>optional                                   |
| _ProxyUsername_               |       If access to the Internet is established via an _authenticated_ proxy server: The proxy server's user name.                   |empty string/no proxy authentication<br />optional                                   |
| _ProxyPassword_               |            If access to the Internet is enabled via an _authenticated_ proxy server: The proxy server's password.                   | empty string/no proxy authentication<br />optional                                   |
