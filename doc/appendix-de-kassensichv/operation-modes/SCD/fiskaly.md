---
slug: /poscreators/middleware-doc/germany/scd/fiskaly-cloud
title: fiskaly-TSE
---

# fiskaly Cloud-TSE (In certification)

## SCU

The _fiskaltrust.Middleware.SCU.DE.Fiskaly_-package connects the middleware to a fiskaly Cloud-TSE. 

### Restrictions

### State of certification and environmental protection

The fiskaly Cloud-TSE is currently in certification, and switching to the certified state will require an update of the SCU. 

"BSI-K-TR-0403 [TSE in Evaluierung]" ("TSE in evaluation") is returned for 'ftSignatureType' `0x4445000000000022` (certification identification). 

**Available from version**: 1.3.16

## Parameter

| Name | Beschreibung | Optional |
| ---- | ------------ |--------- |
| _TssId_ | Die ID der verwendeten fiskaly-TSE, wie im fiskaly-Dashboard angegeben. Wird bei der Produktion über das fiskaltrust-Portal automatisch befüllt. | nein |
| _ApiKey_ | Der API-Key, der zur Authentifizierung an den fiskaly-Services verwendet wird, wie im fiskaly-Dashboard angegeben. Wird bei der Produktion über das fiskaltrust-Portal automatisch befüllt. | nein |
| _ApiSecret_ | Das API-Secret, der zur Authentifizierung an den fiskaly-Services verwendet wird, wie im fiskaly-Dashboard angegeben. Wird bei der Produktion über das fiskaltrust-Portal automatisch befüllt. | nein |
| _FiskalyClientDebugLevel_ | Das interne Debug-Level des fiskaly-SDKs. Nur bei der Fehlersuche zu verwenden. | ja (Default: `NO_OUTPUT`, mögliche Werte: `NO_OUTPUT`, `ERRORS_ONLY`, `ERRORS_AND_WARNINGS`, `EVERYTHING`) |
| _FiskalyClientDebugFile_ | Das Log-File, in den interne Logs des fiskaly-SDKs geschrieben werden (falls aktiviert). Nur bei der Fehlersuche zu verwenden. | ja (Default: leer) |
| _FiskalyClientTimeout_ | Das [fiskaly-Client-Timeout](https://developer.fiskaly.com/en/docs/client-documentation/#configuration) in Millisekunden | ja (Default: `50000`) |
| _FiskalyClientSmaersTimeout_ | Das [fiskaly-SMAERS-Timeout](https://developer.fiskaly.com/en/docs/client-documentation/#configuration) in Millisekunden | ja (Default: `50000`) |

### Preis & Vertrieb

[fiskaltrust.Portal](https://portal.fiskaltrust.de)

