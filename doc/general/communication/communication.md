---
slug: /poscreators/middleware-doc/general/communication
title: Communication
---

## Communication
The fiskaltrust.Middleware supports different communication protocols, effectively giving our customers the possibility to use it on all platforms. Hence, different protocols are recommended for different platforms. For non-windows environments, we recommend the usage of gRPC. Please have a look into our other demo repositories for alternatives, e.g. HTTP/REST or SOAP.


### gRPC

The gRPC protocol is currently only available for the german market, please see [german appendix](../../appendix-de-kassensichv/appendix-de-kassensichv.md) for further information.


### REST Web Service

Representational State Transfer architecture uses the classic http method POST to communicate with fiskaltrust.Middleware. The currently accepted data formats are XML and JSON.

The functions accept POST requests and use the endpoint set via the parameter "host" as basis. The URL is extended by `/[xml|json]/[v0|v1]/[echo|sign|journal]` in order to call the respective functions.

XSD files are available which describes the fiskaltrust.Middleware at [dist/XSD](https://github.com/fiskaltrust/interface-doc/tree/master/dist/XSD).

For Example Requests please have a look at our [Postman Collection](https://github.com/fiskaltrust/middleware-demo-postman)


### WCF Web Service

The Windows Communication Foundation (WCF) is used to access the fiskaltrust.Middleware via network or locally. This technology is not only suitable for Windows platforms, as the name might imply, but can be used with all operating systems and applications through standards such as SOAP. Further information on this subject can be found on:

<https://docs.microsoft.com/en-us/dotnet/framework/wcf/bindings>.

The WCF service will be hosted under the URL, which can be set in the fiskaltrust. Portal on the configuration page of fiskaltrust.Middleware.

Supported protocols are: http, https, net.tcp, net.pipe. For configuring a custom message size and a custom time out, it is possible to specify the parameter "messagesize" (in bytes) and the parameter "timeout" (in seconds) on the configuration page.

A WSDL file which describes the fiskaltrust.Middleware is available at [dist/WSDL](https://github.com/fiskaltrust/interface-doc/tree/master/dist/WSDL).

### User specific protocols
With the helper topology, it is possible to solve every scenario. Please contact our support if you require assistance for a special case scenario.

### Summary

| Communication service | AT            | DE            | FR            |
| --------------------- | ------------- | -------------| ------------- |
| **gRPC**              | not supported | **supported** | not supported |
| **REST**              | **supported (helper)** | **supported** | **supported (helper)** |
| **WCF**               | **supported** | **supported** | **supported** |
| **serial/TCP**| **supported (helper)** |not supported| not supported  |

### Related resources
Our latest samples are available for the following programming languages and tools:
<p align="center">
  <a href="https://github.com/fiskaltrust/middleware-demo-dotnet"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/C-Sharp.png/100px-C-Sharp.png" alt="csharp"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://github.com/fiskaltrust/middleware-demo-java"><img src="https://upload.wikimedia.org/wikiversity/de/thumb/b/b8/Java_cup.svg/100px-Java_cup.svg.png" alt="java"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://github.com/fiskaltrust/middleware-demo-node"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Node.js_logo.svg/100px-Node.js_logo.svg.png" alt="node"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://github.com/fiskaltrust/middleware-demo-android"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Android_robot.svg/100px-Android_robot.svg.png" alt="android"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://github.com/fiskaltrust/middleware-demo-postman"><img src="https://avatars3.githubusercontent.com/u/10251060?s=100&v=4" alt="node"></a>
</p>

Additionally, other samples (including legacy ones) can be found in our [demo repository](https://github.com/fiskaltrust/demo).