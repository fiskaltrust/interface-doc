---
slug: /poscreators/middleware-doc/germany/scd/swissbit
title: Swissbit hardware-TSE
---

# Swissbit Hardware-TSE

## SCD

### State of certification

Certification-ID of TSE according to chapter 9.2.2 of [Anwendungserlass zu § 146a AO](https://docs.fiskaltrust.cloud/doc/productdescription-de-doc/product-service-description/media/2019-06-17-einfuehrung-paragraf-146a-AO-anwendungserlass-zu-paragraf-146a-AO.pdf):

| Certification-ID                                             | Test item                                                    | Applicant   | Date       |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :---------- | :--------- |
| [BSI-K-TR-0362-2019](https://www.bsi.bund.de/SharedDocs/Zertifikate_TR/Technische_Sicherheitseinrichtungen/BSI-K-TR-0362-2019.html) | Swissbit TSE, Version 1.0 <br />Swissbit USB TSE, <br />Swissbit SD TSE, <br />Swissbit microSD TSE | Swissbit AG | 20.12.2019 |

#### Certification identification

"BSI-K-TR-0362-2019" is returned for 'ftSignatureType' `0x4445000000000022` (certification identification). 

## SCU

### **Support**

**from version:** 1.3.1

The _fiskaltrust.Middleware.SCU.DE.Swissbit_ package connects the middleware with a Swissbit hardware-TSE via the file system emulated by the TSE.

### Parameters

| Name           | Description                                                  | **Default Value**<br />**Mandatory Field** |
| -------------- | ------------------------------------------------------------ | ------------------------------------------ |
| _devicePath_   | Path to the drive under which the TSE can be reached (e.g. ` D: `), without a final slash | empty string<br />mandatory                |
| _adminPin_     | Admin PIN of the TSE. If not specified, the default PIN is used. | to be documented<br />optional             |
| _timeAdminPin_ | Time Admin PIN of the TSE. If not specified, the default PIN is used. | to be documented<br />optional             |

## Troubleshooting

| Problem                                                      | Possible cause                                               | Solution                                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **When starting the middleware on Windows a `SerializationException` error, a` NativeLibraryException` error or a similar message is displayed** | Runtime components required to run C ++ applications developed with Visual Studio 2015 are missing. | Install [the Visual C++ Redistributable Packages](https://www.microsoft.com/de-at/download/details.aspx?id=48145). |
| **When starting the middleware under Linux, a `DllNotFound` error, an exception with the text` Invalid Response from TSE` or a similar error message is displayed** | The _libc_- or the _glibc_-package is missing.               | Install the _libc_- or the _glibc_-packages.                 |