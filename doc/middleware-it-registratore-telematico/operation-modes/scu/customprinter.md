---
slug: /poscreators/middleware-doc/italy/scu/customprinter
title: Custom-Printer
---

# Custom Printer

## Signature Creation Unit

### Support

**Alpha from version:** 1.3.45

**Stable from version:** TBD

The _fiskaltrust.Middleware.SCU.IT.CustomRTPrinter_ package connects the middleware with a Custom-Printer.

### Parameters

| Name | Description | Optional |
| ---- | ------------ |--------- |
| DeviceUrl| The URL or IP address of the RT Printer or Server | mandatory |
| ClientTimeoutMs | The HTTP client timeout used when communicating with the RT Printer or Server. | `15000`<br />optional |

Please pay attention to the case-sensitive use of the parameters.
