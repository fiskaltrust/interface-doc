---
slug: /poscreators/middleware-doc/general/migration
title: Migration Guide from Middleware 1.3 to 2.0
---

# Launcher 2.0 quick start guide

Configure queue with the following packages:

* Queue: v1.3.26
* SCU: v1.3.24 

Clone github repository (branch: `proof-of-concept`) https://github.com/fiskaltrust/middleware-launcher/tree/proof-of-concept

Build the project with visual studio or use one of the binaries from the build (https://fiskaltrust.visualstudio.com/fiskaltrust/_build/results?buildId=50602&view=artifacts&pathAsName=false&type=publishedArtifacts)

Start the Launcher via the commandline:
```sh
fiskaltrust.Launcher.exe run --cashbox-id <cashboxid> --access-token <accesstoken> --sandbox
```

To stop the Launcher press <kbd>Ctrl</kbd> + <kbd>C</kbd>.

> ***Note:***  
> See help for other start parameters:
> ```sh
> fiskaltrust.Launcher.exe run --help
> ```
> See help for other available commands:
> ```sh
> fiskaltrust.Launcher.exe --help
> ```

# PosCreators

## Hosting
### WCF/SOAP

WCF/SOAP hosting is not currently available in the 2.0 Launcher. You can track progess for SOAP hosting in [this issue](https://github.com/fiskaltrust/middleware-launcher/issues/6).

### REST

The REST endpoints have been changed to `v2/echo`, `v2/sign` and `v2/journal` and accept JSON content.

The `v2/journal` endpoint now only accepts GET requests.

# PosDealers

## Service

The 2.0 Launcher can be installed as a service on Windows and linux (when systemd is available) using the `install` command:
```sh
fiskaltrust.Launcher.exe install --cashbox-id <cashboxid> --access-token <accesstoken> --launcher-configuration-file <launcher-configuration-file>
```

## Launcher configuration

The 2.0 Launcher configuration is now read from a json file (`launcher.configuration.json` in the working diorectory per default).

This file can be set via the `--launcher-configuration-file` cli argument.

The file can contain the following config keys:
```json
{
  // string
  "ftCashBoxId": <ftCashBoxId>,
  // string
  "accessToken": <accessToken>,
   // int (default: 5050)
  "launcherPort": <launcherPort>,
   // string (default-windows: "C:/ProgramData/fiskaltrust", default-linux: "/var/lib/fiskaltrust", default-macos: "/Library/Application Support/fiskaltrust")
  "serviceFolder": <serviceFolder>,
   // bool (default: false)
  "sandbox": <sandbox>,
   // bool (default: false)
  "useOffline": <useOffline>,
   // string (default: "<serviceFolder>/logs")
  "logFolder": <logFolder>,
   // string (default: "Information")
  "logLevel": <logLevel>,
   // string (default: "https://packages-2-0[-sandbox].fiskaltrust.cloud")
  "packagesUrl": <packagesUrl>,
   // string (default: "https://helipad[-sandbox].fiskaltrust.cloud")
  "helipadUrl": <helipadUrl>,
   // string (default: "https://configuration[-sandbox].fiskaltrust.cloud")
  "configurationUrl": <configurationUrl>,
   // int (default: 15)
  "downloadTimeoutSec": <downloadTimeoutSec>,
   // int (default: 1)
  "downloadRetry": <downloadRetry>,
   // bool (default: false)
  "sslValidation": <sslValidation>,
   // string (default: null)
  "proxy": <proxy>,
   // int (default: 10)
  "processHostPingPeriodSec": <processHostPingPeriodSec>,
   // string (default: "configuration-<ftCashBoxId>.json")
  "cashboxConfigurationFile": <cashboxConfigurationFile>,
}
```

All of these config keys can be overridden using the corresponding cli arguments.

# PosOperators

The 2.0 Launcher does not need .NET Framework or Mono on linux to run. The executable comes bundled with the .NET 6 runtime.
