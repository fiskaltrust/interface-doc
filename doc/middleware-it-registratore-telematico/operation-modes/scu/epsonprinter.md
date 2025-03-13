---
slug: /poscreators/middleware-doc/italy/scu/epsonprinter
title: Epson-Printer
---

# Epson Printer

## Signature Creation Unit

### Support

**Stable from version:** 1.3.45

The _fiskaltrust.Middleware.SCU.IT.EpsonRTPrinter_ package connects the middleware with a Epson-Printer.

### Parameters

| Name | Description | Optional |
| ---- | ------------ |--------- |
| DeviceUrl| The URL or IP address of the RT Printer or Server | mandatory |
| ClientTimeoutMs | The HTTP client timeout used when communicating with the RT Printer or Server. | `15000`<br />optional |
| ServerTimeoutMs | The server/printer timeout for executing commands.                             |optional               |

Please pay attention to the case-sensitive use of the parameters.

