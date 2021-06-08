---
slug: /poscreators/middleware-doc/general/communication
title: Communication
---

## Communication
This chapter describes the ways to communicate with the fiskaltrust.Middleware via different network communication protocols. Depending on the market the fiskaltrust.Middleware offers a variety of possibilities to let the POS-System interact with fiskaltrust.SecurityMechanism using fiskaltrust.Interface:


### grpc

The grpc protocol is currently only available for the german market, please see [german appendix](../../appendix-de-kassensichv/appendix-de-kassensichv.md) for further information.


### REST Web Service

Representational State Transfer architecture uses the classic http method POST to communicate with fiskaltrust.Middleware. The currently accepted data formats are XML and JSON.

The functions accept POST requests and use the endpoint set via the parameter "host" as basis. The URL is extended by `/[xml | json]/[v0 | v1]/[echo | sign | journal]` in order to call the respective functions.

XSD files are available which describes the fiskaltrust.Middleware at [dist/XSD](https://github.com/fiskaltrust/interface-doc/tree/master/dist/XSD).

For Example Requests please have a look at our [Postman Collection](https://github.com/fiskaltrust/middleware-demo-postman)

Here you can find some demo projects which are communicating via rest with the fiskaltrust.Middleware:
https://github.com/fiskaltrust/middleware-demo-dotnet/tree/master/src/fiskaltrust.Middleware.Demo.Http

https://github.com/fiskaltrust/middleware-demo-android

https://github.com/fiskaltrust/middleware-demo/tree/master/C/REST

https://github.com/fiskaltrust/middleware-demo/tree/master/CPP/simple/REST

https://github.com/fiskaltrust/middleware-demo/tree/master/Rust/advanced/rustConsoleApplicationREST

https://github.com/fiskaltrust/middleware-demo/tree/master/VB6/REST


### WCF Web Service

The Windows Communication Foundation (WCF) is used to access the fiskaltrust.Middleware via network. This technology is not only suitable for Windows platforms, as the name might imply, but can be used with all operating systems and applications through standards such as SOAP and REST. Further information on this subject can be found on:

<https://docs.microsoft.com/en-us/dotnet/framework/wcf/bindings>.

The WCF service will be hosted under the URL, which can be set in the fiskaltrust.Portal on the configuration page of fiskaltrust.Middleware.

Supported protocols are: http, https, net.tcp, net.pipe. For configuring a custom message size and a custom time out, it is possible to specify the parameter "messagesize" (in bytes) and the parameter "timeout" (in seconds) on the configuration page.

A WSDL file which describes the fiskaltrust.Middleware is available at [dist/WSDL](https://github.com/fiskaltrust/interface-doc/tree/master/dist/WSDL).

Here you can find some demo projects which are communicating via SOAP with the fiskaltrust.Middleware:
https://github.com/fiskaltrust/middleware-demo-dotnet/tree/master/src/fiskaltrust.Middleware.Demo.Soap

https://github.com/fiskaltrust/middleware-demo/tree/master/C/SOAP

https://github.com/fiskaltrust/middleware-demo/tree/master/CPP/advanced/cppConsoleApplicationSOAP

https://github.com/fiskaltrust/middleware-demo/tree/master/VB6/SOAP

| Communication service | AT            | DE            | FR            |
| --------------------- | ------------- | -------------| ------------- |
| **gRPC**              | not supported | **supported** | not supported |
| **REST**              | **supported (helper)** | **supported** | **supported (helper)** |
| **WCF**               | **supported** | **supported** | **supported** |
| **serial/TCP**| **supported (helper)** |not supported| not supported  |
