---
slug: /poscreators/middleware-doc/germany/scd/cryptovision
title: Cryptovision-TSE
---

# Cryptovision/Bundesdruckerei-TSE

## SCD

### State of certification

Certification-ID of TSE according to chapter 9.2.2 of [Anwendungserlass zu § 146a AO](https://docs.fiskaltrust.cloud/doc/productdescription-de-doc/product-service-description/media/2019-06-17-einfuehrung-paragraf-146a-AO-anwendungserlass-zu-paragraf-146a-AO.pdf):

| Certification-ID                                             | Test item                               | Applicant            | Date       |
| :----------------------------------------------------------- | :-------------------------------------- | :------------------- | :--------- |
| [BSI-K-TR-0374-2020](https://www.bsi.bund.de/SharedDocs/Zertifikate_TR/Technische_Sicherheitseinrichtungen/BSI-K-TR-0374-2020.html) | Bundesdruckerei D-TRUST TSE Version 1.0 | cv cryptovision GmbH | 14.04.2020 |

#### Certification identification

"BSI-K-TR-0374-2020" is returned for 'ftSignatureType' `0x4445000000000022` (certification identification). 

## SCU

The _fiskaltrust.Middleware.SCU.DE.CryptoVision_ package connects the middleware with a CryptoVision hardware-TSE via the file system emulated by the TSE.

### **Support**

from version: 1.3.1

### Parameters

| Name | Description | **Default Value**<br />**Mandatory Field** |
| ---- | ------------ |--------- |
| _devicePath_ | Path to the drive under which the TSE can be reached (e.g. ` D: `), without a final slash | empty string<br />mandatory |
| _adminPin_ | Admin PIN of the TSE. If not specified, the default PIN is used. | to be documented<br />optional |
| _timeAdminPin_ | Time Admin PIN of the TSE. If not specified, the default PIN is used. | to be documented<br />optional |
| _TseIOReadDelayMs_ | The time the TSE waits before reading the responses (in milliseconds). The default value should only be changed in the event of read errors, as this increases the processing time for all operations. | 10<br />optional |
