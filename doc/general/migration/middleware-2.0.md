---
slug: /poscreators/middleware-doc/general/migration
title: Migration Guide from Middleware 1.3 to 2.0
---

### Middleware 2.0 (Germany)

In this version of the middleware, we created a new version of the launcher (launcher 2.0)

# PosCreators

# PosDealers 

To be able to use the launcher 2.0, there is a prerequisite.
The prerequisite is to have  installed locally the .net 6 framework https://dotnet.microsoft.com/en-us/download/dotnet/6.0

Launcher 2.0 quick start guide

 Configure queue with the following packages:
	Queue: sqlite 1.3.26
	SCU: fiskaly.certified 1.3.24 

 Clone github repository (branch: proof of concept) https://github.com/fiskaltrust/middleware-launcher/tree/proof-of-concept

Build the project with visual studio or use one of the binaries from the build (https://fiskaltrust.visualstudio.com/fiskaltrust/_build/results?buildId=50602&view=artifacts&pathAsName=false&type=publishedArtifacts)

Start the launcher via the commandline: .\fiskaltrust.Launcher.exe run --cashbox-id "cashboxid" --access-token "accesstoken" --sandbox

# PosOperators 
