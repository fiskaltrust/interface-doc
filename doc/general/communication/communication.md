---
slug: /poscreators/middleware-doc/general/communication
title: Communication
---

## Communication
This chapter describes the ways to communicate with the fiskaltrust.Middleware via different network communication protocols. Depending on the market the fiskaltrust.Middleware offers a variety of possibilities to let the POS-System interact with fiskaltrust.SecurityMechanism using fiskaltrust.Interface:
| Communication service | AT            | DE            | FR            |
| --------------------- | ------------- | -------------| ------------- |
| **gRPC**              | not supported | **supported** | not supported |
| **REST**              | **supported (helper)** | **supported** | **supported (helper)** |
| **WCF**               | **supported** | **supported** | **supported** |
| **serial/TCP**| **supported (helper)** |not supported| not supported  |

### Helpers

Fiskaltrust provides helpers for Middleware version 1.2 and lower to expand the communication interface for REST and serial/TCP protocols. This helpers can be activated and configured with the fiskaltrust.Portal. For further information have a look into the market specific appendix.

### WCF Web Service

The Windows Communication Foundation (WCF) is used to access the fiskaltrust.Middleware via network. This technology is not only suitable for Windows platforms, as the name might imply, but can be used with all operating systems and applications through standards such as SOAP and REST. Further information on this subject can be found on:

<https://docs.microsoft.com/en-us/dotnet/framework/wcf/bindings>.

The WCF service will be hosted under the URL, which can be set in the fiskaltrust.Portal on the configuration page of fiskaltrust.Middleware.

![](./images/01-configuration-page.png)

<span id="_Toc527986808" class="anchor">

*Illustration 7. Configuration page of a fiskaltrust.Middleware*

</span>

Supported protocols are: http, https, net.tcp, net.pipe. For configuring a custom message size and a custom time out, it is possible to specify the parameter "messagesize" (in bytes) and the parameter "timeout" (in seconds) on the configuration page.

Usually, a proxy class should be created and used to execute the function calls.

**C# call for proxy class:**
```cs
//local SOAP service
BasicHttpBinding binding = new BasicHttpBinding(BasicHttpSecurityMode.None);
//configure endpoint 
EndpointAddress endpoint = new EndpointAddress(wcf_http_url);
//create proxy 
ChannelFactory<fiskaltrust.ifPOS.v0.IPOS> factory = 
    new ChannelFactory<fiskaltrust.ifPOS.v0.IPOS>(binding, endpoint);

var proxy = factory.CreateChannel();
```

<span id="_Toc527986833" class="anchor">

*Code 9. Call of proxy class*

</span>

#### SOAP

Simple Object Access Protocol (SOAP) is a network protocol which can exchange data across systems and can execute RPC calls.

With [`<basicHttpBinding>`](https://msdn.microsoft.com/en-us/library/system.servicemodel.basichttpbinding\(v=vs.110\).aspx), [`<netNamedPipeBinding>`](https://msdn.microsoft.com/en-us/library/system.servicemodel.netnamedpipebinding\(v=vs.110\).aspx) and [`<netTcpBinding>`](https://msdn.microsoft.com/en-us/library/system.servicemodel.nettcpbinding\(v=vs.110\).aspx), fiskaltrust.Middleware makes its functionality available on the local network.

A WSDL file which describes the fiskaltrust.Middleware is available at [dist/WSDL](https://github.com/fiskaltrust/interface-doc/tree/master/dist/WSDL).

**C# call for signing with SOAP:**
```cs
//create proxy and establish authentification
throw new NotImplementedException();
//call for signing receipt
ifPOS.v0.ReceiptRequest req;
fiskaltrust.ifPOS.v0.ReceiptResponse resp = proxy.Sign(req);
```

<span id="_Toc527986834" class="anchor">

*Code 10. Example call for signing with SOAP*

</span>


### REST Web Service

Representational State Transfer architecture uses the classic http methods GET, PUT, POST and DELETE to communicate with fiskaltrust.SecurityMechanisms. The currently accepted data formats are XML and JSON. There are various implementations for REST which are all provided via Helper.

The functions accept POST requests and use the endpoint set via the parameter "host" as basis. The URL is extended by `/[xml | json]/[echo | sign | journal]` in order to call the respective functions.

XSD files are available which describes the fiskaltrust.Middleware at [dist/XSD](https://github.com/fiskaltrust/interface-doc/tree/master/dist/XSD).
