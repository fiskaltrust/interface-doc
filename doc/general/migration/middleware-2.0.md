---
slug: /poscreators/middleware-doc/general/migration
title: Migration Guide from Middleware 1.3 to 2.0
---

### Middleware 2.0 (Germany)

In this version of the middleware, we created a new version of the launcher (launcher 2.0)

# PosCreators

# PosDealers 

Launcher 2.0 quick start guide

Configure queue with the following packages:

* Queue: v1.3.26
* SCU: v1.3.24 

Clone github repository (branch: proof of concept) https://github.com/fiskaltrust/middleware-launcher/tree/proof-of-concept

Build the project with visual studio or use one of the binaries from the build (https://fiskaltrust.visualstudio.com/fiskaltrust/_build/results?buildId=50602&view=artifacts&pathAsName=false&type=publishedArtifacts)

Start the launcher via the commandline: .\fiskaltrust.Launcher.exe run --cashbox-id "cashboxid" --access-token "accesstoken" --sandbox

# PosOperators 

The Launcher 2.0 does not need .NET Framework or Mono on linux to run. The executable comes bundled with the .NET 6 runtime.
