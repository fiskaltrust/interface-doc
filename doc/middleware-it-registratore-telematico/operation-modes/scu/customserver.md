---
slug: /poscreators/middleware-doc/italy/scu/customserver
title: Custom-Server
---

# Custom Server

## Signature Creation Unit

### Support

**Stable from version:** 1.3.45

The _fiskaltrust.Middleware.SCU.IT.CustomRTServer_ package connects the middleware with a Custom-Server.

### Parameters

| Name | Description | Optional |
| ---- | ------------ |--------- |
| ServerUrl | The URL or IP address of the RT Server | mandatory |
| AccountMasterData | JSON serialization of the class AccountMasterData | optional |
| Username | RT Server administrator user name | mandatory |
| Password | RT Server administrator user password | mandatory |
| SendReceiptsSync | true: sends the receipts to the server - false: enqueues the receipts in the cache and sends them to the RT Server in the background | `true`<br />mandatory |
| IgnoreRTServerErrors | true: ignores the errors, the status and the logs must be checked, false: the exceptions will be thrown | mandatory |
| RTServerHttpTimeoutInMs | Timeout in milliseconds used in the communication with the RT Server | `5000`<br />mandatory |
| DisabelSSLValidation | Disables the certificate verification in secured protocols | mandatory |
| ServiceFolder | Local folder for services | optional |
| CacheDirectory | Local folder for caching | optional |

#### AccountMasterData

| Name | Description | Optional |
| ---- | ------------ |--------- |
| AccountId | Account GUID | mandatory |
| AccountName | Account name | optional |
| Street | Account address street | optional |
| Zip | Account address Zip | optional |
| City | Account address city | optional |
| Country | Account address country | optional |
| TaxId | Account Tax identification number | optional |
| VatId | Account Vat identification number | optional |


Please pay attention to the case-sensitive use of the parameters.

