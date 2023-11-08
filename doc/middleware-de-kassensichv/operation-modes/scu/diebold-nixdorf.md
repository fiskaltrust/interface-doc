---
slug: /poscreators/middleware-doc/germany/scu/diebold-nixdorf
title: Diebold Nixdorf-TSE
---

# Diebold Nixdorf Hardware-TSE 

### State of certification

Certification-ID of TSE according to chapter 9.2.2 of [Anwendungserlass zu § 146a AO](https://www.bundesfinanzministerium.de/Content/DE/Downloads/BMF_Schreiben/Weitere_Steuerthemen/Abgabenordnung/AO-Anwendungserlass/2021-11-04-aenderung-des-anwendungserlasses-zur-abgabenordnung-AEAO.pdf?__blob=publicationFile&v=2):

| Certification-ID                                             | Test item                           | Applicant                    | Date       |
| :----------------------------------------------------------- | :---------------------------------- | :--------------------------- | :--------- |
| [BSI-K-TR-0393-2020](https://www.bsi.bund.de/SharedDocs/Zertifikate_TR/Technische_Sicherheitseinrichtungen/BSI-K-TR-0393-2020.html) | Diebold Nixdorf TSE-CardVersion 1.0 | Diebold Nixdorf Systems GmbH | 20.02.2020 |

#### Certification identification

"BSI-K-TR-0393-2020" is returned for 'ftSignatureType' `0x4445000000000022` (certification identification). 

## Signature Creation Unit

### Support

**RC from version:** 1.3.1

**Stable from version:** 1.3.6

The _fiskaltrust.Middleware.SCU.DE.DieboldNixdorf_ package connects the middleware with a Diebold Nixdorf hardware-TSE via a serial COM port.

### Parameters

| Name | Description | **Default Value**<br />**Mandatory Field** |
| ---- | ------------ |--------- |
| _ComPort_ | The COM port used for serial communication with the TSE | mandatory |
| _AdminUser_ | The username of the admin user. If not specified, the default value defined by the manufacturer is used. | to be documented<br />optional |
| _AdminPin_ | Admin PIN of the TSE. If not specified, the default PIN is used. | to be documented<br />optional |
| _TimeAdminUser_ | The username of the time-admin user. If not specified, the default value defined by the manufacturer is used. | to be documented<br />optional |
| _TimeAdminPin_ | Time-admin PIN of the TSE. If not specified, the default PIN is used. | to be documented<br />optional |


## Troubleshooting
| Problem                                                      | Possible cause                                               | Solution                                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **When starting the middleware, an error is displayed stating that access to the specified COM port was denied** | Wrong COM port is used in the SCU configuration              | Update SCU configuration with the correct COM port used      |
|                                                              | COM port is already used by a software (typically by the Diebold Nixdorf Web Service included with the TSE) | The Diebold Nixdorf Web Service is not required as all access is made directly via the COM protocol. Uninstalling the Diebold Nixdorf software eliminates this problem. |

