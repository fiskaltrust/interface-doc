---
slug: /poscreators/middleware-doc/germany/communication
title: Communication
---

## Communication
This chapter expands more on describing the ways to communicate with the fiskaltrust.Middleware covered in the [Communication](../../general/communication/communication.md) chapter of the General Part, with country-specific information applicable to the German market.

### Supported protocols
The German Middleware natively supports REST, gRPC and WCF communication without the requirement to use any helper packages. gRPC communication is described in the following section, please refer to the [general part](../../general/communication/communication.md) for more details about REST and WCF.

#### gRPC
[gRPC](https://grpc.io) is a modern open source high performance _Remote Procedure Call (RPC)_ framework that can run in any environment. It can be used in most programming language and is generally known to be fast, reliable and efficient.

gRPC uses protocol buffers (i.e. _.proto_ files), a platform-independent standard, to describe interfaces. The .proto files of the fiskaltrust.Middleware can be downloaded [here](https://github.com/fiskaltrust/interface-doc/tree/master/dist/protos/).

In case .NET is used to implement the Middleware's interface, we recommend using our open-source NuGet client package (available on [NuGet.org](https://www.nuget.org/packages/fiskaltrust.Middleware.Interface.Client.Grpc/)/[GitHub](https://www.nuget.org/packages/fiskaltrust.Middleware.Interface.Client.Grpc/)).

 Please refer to our samples to see how the Middleware can be implemented via gRPC using other programming languages or specific platforms (e.g. [Java](https://github.com/fiskaltrust/middleware-demo-java), [Node.JS](https://github.com/fiskaltrust/middleware-demo-node), or [Android](https://github.com/fiskaltrust/middleware-demo-android)).