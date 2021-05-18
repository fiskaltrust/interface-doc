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

### Support

**from version:** 1.3.16

The _fiskaltrust.Middleware.SCU.DE.Fiskaly_-package connects the middleware to a fiskaly Cloud-TSE. 

### Parameters

| Name | Description | **Default Value**<br />**Mandatory Field** |
| ---- | ------------ |--------- |
| _TssId_ | The ID of the fiskaly TSE used, as indicated in the fiskaly dashboard. It is filled automatically during production via the fiskaltrust portal. | mandatory |
| _ApiKey_ | The API key used to authenticate to the fiskaly services as specified in the fiskaly dashboard. It is filled automatically during production via the fiskaltrust portal. | mandatory |
| _ApiSecret_ | The API secret that is used to authenticate to the fiskaly services, as specified in the fiskaly dashboard. It is filled automatically during production via the fiskaltrust portal. | mandatory |
| _FiskalyClientDebugLevel_ | The internal debug level of the fiskaly SDK. To be used only for troubleshooting. | `NO_OUTPUT`, possible values: `NO_OUTPUT`, `ERRORS_ONLY`, `ERRORS_AND_WARNINGS`, `EVERYTHING`<br />optional |
| _FiskalyClientDebugFile_ | The log file in which the internal logs of the fiskaly SDK are written (if activated). To be used only for troubleshooting. | empty string<br />optional |
| _FiskalyClientTimeout_ | The [fiskaly-client-timeout](https://developer.fiskaly.com/en/docs/client-documentation/#configuration) in miliseconds | `50000`<br />optional                                        |
| _FiskalyClientSmaersTimeout_ | The [fiskaly-SMAERS-timeout](https://developer.fiskaly.com/en/docs/client-documentation/#configuration) in miliseconds | `50000`<br />optional |
