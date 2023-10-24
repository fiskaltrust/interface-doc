---
slug: /poscreators/middleware-doc/germany/scu/fiskaly-cloud
title: fiskaly-TSE
---

# SCU for fiskaly Cloud-TSE

### State of certification

The fiskaly Cloud-TSE is currently in certification, and switching to the certified state will require an update of the SCU. 

#### Certification Identification

"BSI-K-TR-0403 [TSE in Evaluierung]" ("TSE in evaluation") is returned for 'ftSignatureType' `0x4445000000000022` (certification identification). 

**Available from version**: 1.3.16

## Signature Creation Unit

### Support

**from version:** 1.3.16

The _fiskaltrust.Middleware.SCU.DE.fiskaly_-package connects the middleware to a fiskaly Cloud-TSE. 

### Parameters

| Name                         | Description                                                                                                                                                                          | **Default Value**<br />**Mandatory Field**                                                                  |
|------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| _ApiKey_                     | The API key used to authenticate to the fiskaly services as specified in the fiskaly dashboard. It is filled automatically during production via the fiskaltrust portal.             | mandatory                                                                                                   |
| _ApiSecret_                  | The API secret that is used to authenticate to the fiskaly services, as specified in the fiskaly dashboard. It is filled automatically during production via the fiskaltrust portal. | mandatory                                                                                            
| _fiskalyClientTimeout_       | The [fiskaly-client-timeout](https://developer.fiskaly.com/en/docs/guides/how-to-deal-with-timeouts#set-timeouts-correctly) in miliseconds                                                               | `50000`<br />optional                                                                                            
| _Guid TssId_               |   in progress                  | `null`<br />optional                                   |
| _AdminPin_               |     The Admin Pin of the TSE (not to be confused with the PUK)                   | `null`<br />optional                                   |
| _EnableTarFileExport_               |           in progress                   | `null`<br />optional                                   |
| _CertificationId_               |  Certification identification of the TSE used                  | `null`<br />optional                                   |
| _DisplayCertificationIdAddition_               |           in progress                   | `null`<br />optional                                   |
| _CertificationIdAddition_               |           in progress                   | `null`<br />optional                                   |
| _ApiEndpoint_               |           in progress                   | `null`<br />optional                                   |
| _ProxyServer_               |           If access to the Internet is established via a proxy server: The proxy server's URL or IP address.                  | empty string/no proxy<br />optional >optional                                   |
| _ProxyPort_               |           If access to the Internet is established via a proxy server: The proxy server's HTTP-port.                  | empty string<br />optional>optional                                   |
| _ProxyUsername_               |       If access to the Internet is established via an _authenticated_ proxy server: The proxy server's user name.                   |empty string/no proxy authentication<br />optional                                   |
| _ProxyPassword_               |            If access to the Internet is enabled via an _authenticated_ proxy server: The proxy server's password.                   | empty string/no proxy authentication<br />optional                                   |
