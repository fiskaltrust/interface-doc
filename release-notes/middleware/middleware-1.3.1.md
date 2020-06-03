# Release notes: fiskaltrust.Middleware 1.3.1
This release includes many stability and feature improvements for the German middleware, and can be used in production scenarios.

## Features and general improvements
- Zero receipts support has been improved (including improvements for daily/monthly/yearly receipts)
- Open transactions are now closed when a daily receipt is sent, to be compliant with the requirements of DSFinV-K
- Various logging improvements, including the possibility to set the verbosity to gain detailed information during development time (via the launcher parameter `-verbosity=Debug`)
- The size of a common middleware instance with Queue, SCU and a Helper was reduced to 200MB (from previously up to 1GB)
- HTTP/REST communication now also supports the common JSON date format (e.g. `2019-10-25T13:32:45.133Z`) in addition to the Microsoft-specific date format `/Date(1224043200000)/`
- The gRPC [trailing metadata](https://grpc.io/docs/guides/concepts/#metadata) now includes exception details in case of an error
- The journal endpoint now respects the `from` and `to` parameters, as well as querying German market-specific queue data
- Full support for all [DSFinV-K 2.1](https://www.bzst.de/DE/Unternehmen/Aussenpruefungen/DigitaleSchnittstelleFinV/digitaleschnittstellefinv_node.html) relevant bon types (_Beleg, AVSonstige, AVBelegabbruch, AVRechnung, AVTransfer, AVBestellung, AVSachbezug, AVTraining, AVBelegstorno_) for the _Kassenbeleg-V1_, as well as support for _Bestellung-V1_ and _SonstigerVorgang_
- Enhanced support for complex receipt sequences, e.g. via the now fully supported _info-order_ receipt case


## Stability improvements
- The Middleware now properly handles communication errors and supports the late-signing of receipts
- Open and failed transactions are now persisted in the data layer to support recover in case of e.g. connection errors
- Various lifecycle improvements for the **Swissbit**, **Cryptovision** and **fiskaly** SCUs were implemented. This includes proper handling of self-tests, connection issues, and many other TSE-specific characteristics
- A memory leak was fixed that lead to increased memory consumption in high-load queues
- Some other bugs that were reported by our pilot installation partners were fixed 
- Internal improvements to make the handling of receipts severely more reliable were implemented

## Other updates
- The demos and samples on our [GitHub page](https://github.com/fiskaltrust) were drastically extended and enhanced. Among others, we now also provide samples for [Java](https://github.com/fiskaltrust/middleware-demo-java) and [Node.js](https://github.com/fiskaltrust/middleware-demo-node), as well as a [Postman collection](https://github.com/fiskaltrust/middleware-demo-postman) that demonstrates the usage via HTTP. Various other examples can be found in the middleware-demo repository.
- To further simplify the communication with the Middleware, we now provide client packages for our customers who use .NET (for gRPC, HTTP/REST and SOAP). The clients can be downloaded via [NuGet.org](https://www.nuget.org/packages?q=fiskaltrust.Middleware.Client), the code and the documentation are developed on [GitHub](https://github.com/fiskaltrust/middleware-interface-dotnet).
- Our developer documentation on https://docs.fiskaltrust.cloud was improved

## How to update
Existing configurations with 1.3.0 continue to work, but we **strongly recommend all customers to update both their Queues and SCUs, especially in production systems**. 

After these packages were updated, please also re-download the Launcher from the portal:
1. Click re-build in the respective cashbox
2. Download the instance by clicking the "dotnet Launcher Download" button
3. Finally, replace the files (fiskaltrust.exe, ...) with the newly downloaded ones.

We generally do not require manual updates of the Launcher, but had to make an exception in this release to resolve some important issues. Future releases will not require any manual interventions (except from updating package versions in the portal). We apologize for any inconvencience caused by this.

### Additional information:
- If you are using C#, please update the _fiskaltrust.interface_ NuGet package, or directly migrate to our client packages (as mentioned above). 
- If you are using HTTP/REST, SOAP or gRPC via Protobuf directly, no changes are required in your implementation.

Please also note that 1.3.0 and 1.3.1 Queues and SCUs are **not** compatible with each other – this means that in order to use a 1.3.1 SCU, you need to update the Queue as well, and vice versa.

## Next steps
In the upcoming weeks, we will focus on improving our portal to create a better onboarding, development and middleware rollout experience. 
