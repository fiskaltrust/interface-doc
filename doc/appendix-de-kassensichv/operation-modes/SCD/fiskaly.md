---
slug: /product-description/germany/products-and-services/caas/features/basics/tse/fiskaly
title: fiskaly-TSE
---

# fiskaly-Interoperabilität (In Zertifizierung)

## SCU

Das _fiskaltrust.Middleware.SCU.DE.Fiskaly_-Package ermöglicht die Verbindung der Middleware mit einer fiskaly Cloud-TSE. Die fiskaly-TSE befindet sich derzeit in Zertifizierung.

**Preview verfügbar ab Version**: 1.3.1

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

