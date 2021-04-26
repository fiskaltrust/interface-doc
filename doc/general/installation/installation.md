---
slug: /poscreators/middleware-doc/general/installation
title: Installation
---

# Installation

For operating the fiskaltrust.Middleware on-premise or off-premise, the components of the fiskaltrust.Middleware need to be configured, downloaded, installed and started:

## Configuration of Middleware components 

## (Cashbox configuration)

The components of the fiskaltrust.Middleware need to be configured in the fiskaltrust.Portal for the environment where the Middleware should be operated. The availability of components and its configuration options are dependent on the local market regulation.

For example, it must be configured the endpoints where the POS system can reach the service, in which database the processed data from the service is to be stored, which Signature Creation Device (SCD) is to be used for the signatures and how the SCD can be reached for the service.

Here you can find more information on the configuration options of the components:

- market-AT
- [market-DE](https://docs.fiskaltrust.cloud/docs/posdealers/rollout-doc/middleware#the-cashbox-as-a-configuration-container)
- market-FR

At the end of this configuration process, a so-called "Launcher" including the configuration needs to be downloaded.

## Download of the Launcher

After configuring the cashbox in the portal, a so-called "Launcher" and its configuration needs to be downloaded. Following Launcher options are available for download in the markets:

| Icon                                             | Launcher                                | Description                                                  | AT        | DE         | FR        |
| ------------------------------------------------ | --------------------------------------- | ------------------------------------------------------------ | --------- | ---------- | --------- |
| ![launcher-net](images/launcher-net.png)         | .NET Launcher<br />(*default launcher*) | **For starting the Middleware on Windows with Internet connection.**<br />The launcher loads the configuration file and its needed packages during the start from the fiskaltrust packages-server. | supported | supported  | supported |
| ![launcher-offline](images/launcher-offline.png) | .NET Offline Launcher                   | **For starting the Middleware on Windows without Internet connection.** <br />A static configuration and its needed packages for operation is included. | supported | supported  | supported |
| ![launcher-mono](images/launcher-mono.png)       | Mono Launcher                           | **For starting the Middleware on Linux/macOS with Internet connection.**<br />The launcher loads the configuration file and its needed packages during the start from the fiskaltrust packages-server. | supported | supported  | supported |
| ![launcher-android](images/launcher-android.png) | Android Launcher                        | **For starting the Middleware on Android with Internet connection.**<br />A static configuration and its needed packages for operation is included.<br />The configuration options are limited to keep the package sizes small. |           | supported* |           |

*availability dependent on the cashbox configuration

The received zip-compressed folders need to be unzipped and can be moved or renamed if necessary.

More information on configuration and launcher download you can find in the market specific appendices:

- market-AT
- [market-DE](https://docs.fiskaltrust.cloud/docs/posdealers/rollout-doc/middleware#start-and-test-the-service)
- market-FR

## Starting the launcher

### Windows, Linux, macOS

The folder with the downloaded launcher contains the launcher `fiskaltrust.exe` to start the fiskaltrust.Middleware, the service represented by the `.dll` files, the cashbox configuration file named `fiskaltrust.exe.config`, and three pre-configured command files. 

The command files can be used for parameterized starting or stopping of the service. They execute the `fiskaltrust.exe` with specification of appropriate parameters. In Windows, it is necessary to run the `cmd.exe` as administrator:

| File                    | Description                                                  |
| ----------------------- | ------------------------------------------------------------ |
| `install-service.cmd`   | Executes `fiskaltrust.exe` using the parameter `-i` for installing the fiskaltrust.Middleware as a service under Windows, recommended for permanent on-premise operation. |
| `uninstall-service.cmd` | Executes `fiskaltrust.exe` using the parameter `-u` for un-installing the fiskaltrust.Middleware as a service under Windows. |
| `test.cmd`              | Executes `fiskaltrust.exe` using the parameter `-test` for starting the fiskaltrust.Middleware as a command line program under Windows, recommended for test and development purpose. |

The following call parameters are available with the launcher `fiskaltrust.exe`:

| **Parameter**                  | **Description**                                              | AT        | DE        | FR        |
| ------------------------------ | ------------------------------------------------------------ | --------- | --------- | --------- |
| `-cashboxid`                   | Sets the CashBoxId into the static configuration (`fiskaltrust.exe.config`). The value is a GUID in format `00000000-0000-0000-0000-000000000000`. | supported | supported | supported |
| `-accesstoken`                 | Sets the AccessToken in the static configuration (`fiskaltrust.exe.config`) for online communication | supported | supported | supported |
| `-useoffline`                  | Sets the offline mode in the static configuration (`fiskaltrust.exe.config`). The value is a boolean: true \| false | supported | supported | supported |
| `-test`                        | Executing as command line program. Basic information is provided in the console. Should be indicated as last parameter, if it is set in connection with others. | supported | supported | supported |
| `-i`                           | Install Windows service                                      | supported | supported | supported |
| `-u`                           | Uninstall Windows service                                    | supported | supported | supported |
| `-servicename=[myservicename]` | Sets the service name in connection with -i and -u           |           |           |           |
| `-displayname=[mydisplayname]` | Sets the service display name within the system control in connection with -i |           |           |           |
| `-description=[mydescription]` | Sets the service description within the system control in connection with -i |           |           |           |
| `-servicefolder`               | Sets folder containing the service files in the static configuration (`fiskaltrust.exe.config`) |           |           |           |
| `-sslvalidation`               | Sets the certificate validation when connecting through SSL in the static configuration (`fiskaltrust.exe.config`). The value is a boolean: true \| false |           |           |           |
| `-sandbox`                     | Sets the environment to be used in the static configuration (`fiskaltrust.exe.config`). The value is a boolean: true (sandbox) \| false (production) |           |           |           |
| `-packagesurl`                 | Sets the url of the package server used to download the packages in the static configuration (`fiskaltrust.exe.config`) |           |           |           |
| `-logfile`                     | Sets the file used to log the output messages in the static configuration (`fiskaltrust.exe.config`) |           |           |           |
| `-connectiontimeout`           | Sets the timeout (in seconds) for the HTTP/HTTPS call to download the configuration in the static configuration (`fiskaltrust.exe.config`) |           |           |           |
| `-connectionretry`             | Sets the number of trials to download the configuration in the static configuration (`fiskaltrust.exe.config`) |           |           |           |
| `-proxy`                       | Sets the proxy server to be used to connect to internet in the static configuration (`fiskaltrust.exe.config`) |           |           |           |

<span id="_Toc527986661" class="anchor"></span>*Table 8. fiskaltrust.exe launch parameters*

#### Applying the configuration

(Only) during the start of the (online-) launcher, the configuration is checked and the configuration-file (usually Configuration-`00000000-0000-0000-0000-000000000000`.json) including the needed packages are downloaded to the fiskaltrust service-folder (usually `C:\ProgramData\fiskaltrust\service`). If a newer configuration is available online, the new configuration file including the new packages according to the configuration are downloaded and installed. Therefore, when updating the configuration of the fiskaltrust.Middleware via fiskaltrust.Portal, the fiskaltrust  Service needs to be manually re-started so that the launcher checks for the new configuration.

#### Outbound traffic

| Type  | Protocol | Port | Source                             |
| ----- | -------- | ---- | ---------------------------------- |
| https | TCP      | 443  | packages-sandbox.fiskaltrust.cloud |
| https | TCP      | 443  | packages.fiskaltrust.cloud         |

#### Development/Test Environment

In Windows, it is necessary to run the `cmd.exe` as administrator. The launcher `fiskaltrust.exe` can be then executed as a command line program through the call parameter `–test`.

In Linux, the following command should be used:

```sudo mono fiskaltrust.exe -test```.

A static configuration can be enforced via the configuration.json file in the `fiskaltrust.exe` folder in connection with `-useoffline=true`.

In Windows, all data is saved per default in `C:\ProgramData\fiskaltrust\service`. In Linux, the data is saved under `/usr/share/fiskaltrust/service`. The deletion of this folder results in a loss of data, and a loss in functionality of the fiskaltrust.SecurityMechanism. In case of an active online connection, the fiskaltrust.SecurityMechanism can restore its functionality without this folder, however the data which was lost cannot be restored.

![](./images/01-console-testmode.png)

<span id="_Toc527986811" class="anchor"></span>*Illustration 10. Screen Shot console in test mode*

#### Windows Service Installation

The Windows service can be installed and uninstalled via the call parameters -i and –u.

![](./images/02-windows-services.png)

<span id="_Toc527986812" class="anchor"></span>*Illustration 11. Screen Shot Windows services fiskaltrust service*

Once successfully completed, the service will appear in the list of running services.

#### Mono Service Installation

For Linux, the fiskaltrust.SecurityMechanism can be installed as Daemon.

Mono is the prerequisite, and can be installed following the manual of the [mono-project](http://www.mono-project.com/download/#download-lin) (install complete).

Once the installation is completed, a file named `fiskaltrust` with the following content has to be saved in the index `/etc/init.d`:

```sh
#! /bin/sh
### BEGIN INIT INFO
# Provides:     fiskaltrust
# Required-Start:  $local_fs $network
# Required-Stop:   $local_fs $network
# Default-Start:   2 3 4 5
# Default-Stop:   0 1 6
# Short-Description: fiskaltrust.Sicherheitseinrichtung 
### END INIT INFO
# /etc/init.d/fiskaltrust
#
#
#rechte: sudo chmod +x /etc/init.d/fiskaltrust
#rechte: sudo chmod +x /etc/fiskaltrust/fiskaltrust.exe
#installieren: sudo update-rc.d fiskaltrust defaults
#deinstalllieren: sudo update-rc.d -f dispenser1 remove
#
#
#
#

# Some things that run always
# Load the VERBOSE setting and other rcS variables
. /lib/init/vars.sh

# Define LSB log_* functions.
# Depend on lsb-base (>= 3.2-14) to ensure that this file is present
# and status_of_proc is working.
. /lib/lsb/init-functions

# Carry out specific functions when asked to by the system
case "$1" in
 start)
  log_daemon_msg "Starting fiskaltrust.Sicherheitseinrichtung " "fiskaltrust"
  mono-service -l:/tmp/fiskaltrust.Sicherheitseinrichtung .lock -d:/etc/fiskaltrust/ /etc/fiskaltrust/fiskaltrust.exe
  log_end_msg $?
  ;;
 stop)
  log_daemon_msg "Stopping fiskaltrust.Sicherheitseinrichtung " "fiskaltrust"
  kill `cat /tmp/fiskaltrust.Sicherheitseinrichtung .lock`
  log_end_msg $?
  ;;
 *)
  echo "Usage: /etc/init.d/fiskaltrust {start|stop}"
  exit 1
  ;;
esac

exit 0
```

<span id="_Toc527986837" class="anchor"></span>*Code 13. Initializing the mono service*

Next, the folders have to be created and assigned the required permissions. In order to do that, the following commands have to be executed via the SSH-console:

> `sudo mkdir /etc/fiskaltrust`

> `sudo chmod 777 /etc/fiskaltrust`

Once the folders are set, the `fiskaltrust.exe` and the associated DLLs must be copied into the index "/etc/fiskaltrust", and the rights to execute the file have to be set as follows:

> `sudo chmod +x /etc/init.d/fiskaltrust`

> `sudo chmod +x /etc/fiskaltrust/fiskaltrust.exe`

Finally, the daemon can be installed with the following command:

> `sudo update-rc.d fiskaltrust defaults`

Once completed, the service should appear in the running daemon list.

### Android

A background app for each respective platform is in planning.

The scope of operation will be limited to one queue and the update ability will be realised via the platform store. The support nutshell will not be available.

The main features of the data and function structure however, will be the same, and the communication will be adapted to the platform specific standard.
