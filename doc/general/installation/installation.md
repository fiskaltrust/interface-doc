---
slug: /poscreators/middleware-doc/general/installation
title: Installation
---

## Installation

### fiskaltrust.Middleware

#### Windows, Linux, Mac

The mentioned platforms use the launcher `fiskaltrust.exe` to execute the fiskaltrust.SecurityMechanism. For Linux and Mac, the launcher can be executed via Mono, version 3.2.8 or higher. For Windows the launcher can be executed via the .NET framework, version 4.0 or higher, or via Mono, version 3.2.8 or higher.

The following call parameters are available with the launcher `fiskaltrust.exe`:

| **Parameter**                  | **Description**                                                                                                                                                 |
|--------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-cashboxid`                   | Sets the CashBoxId into the static configuration (`fiskaltrust.exe.config`). The value is a GUID in format `00000000-0000-0000-0000-000000000000`.              |
| `-accesstoken`                 | Sets the AccessToken in the static configuration (`fiskaltrust.exe.config`) for online communication                                                            |
| `-useoffline`                  | Sets the offline mode in the static configuration (`fiskaltrust.exe.config`). The value is a boolean: true \| false                                             |
| `-test`                        | Executing as command line program. Basic information is provided in the console. Should be indicated as last parameter, if it is set in connection with others. |
| `-i`                           | Install Windows service                                                                                                                                         |
| `-u`                           | Uninstall Windows service                                                                                                                                       |
| `-servicename=[myservicename]` | Sets the service name in connection with -i and -u                                                                                                              |
| `-displayname=[mydisplayname]` | Sets the service display name within the system control in connection with -i                                                                                   |
| `-description=[mydescription]` | Sets the service description within the system control in connection with -i                                                                                    |
| `-servicefolder`               | Sets folder containing the service files in the static configuration (`fiskaltrust.exe.config`)                                                                 |
| `-sslvalidation`               | Sets the certificate validation when connecting through SSL in the static configuration (`fiskaltrust.exe.config`). The value is a boolean: true \| false       |
| `-sandbox`                     | Sets the environment to be used in the static configuration (`fiskaltrust.exe.config`). The value is a boolean: true (sandbox) \| false (production)            |
| `-packagesurl`                 | Sets the url of the package server used to download the packages in the static configuration (`fiskaltrust.exe.config`)                                         |
| `-logfile`                     | Sets the file used to log the output messages in the static configuration (`fiskaltrust.exe.config`)                                                            |
| `-verbosity`                 | Sets the level of debug-information in the logfile. The value is a string: `Debug`. Use in the static configuration (`fiskaltrust.exe.config`) the key `loglevel` with the value `Debug`. Possible values/debug levels are: Trace \| Debug \| Information \| Warning \| Error \| Critical |
| `-connectiontimeout`           | Sets the timeout (in seconds) for the HTTP/HTTPS call to download the configuration in the static configuration (`fiskaltrust.exe.config`)                      |
| `-connectionretry`             | Sets the number of trials to download the configuration in the static configuration (`fiskaltrust.exe.config`)                                                  |
| `-proxy`                       | Sets the proxy server to be used to connect to internet in the static configuration (`fiskaltrust.exe.config`)                                                  |

<span id="_Toc527986661" class="anchor"></span>*Table 8. fiskaltrust.exe launch parameters*

#### Test Environment

In Windows, it is necessary to run the `cmd.exe` as administrator. The launcher `fiskaltrust.exe` can be then executed as a command line program through the call parameter `–test`.

In Linux, the following command should be used:

```sudo mono fiskaltrust.exe -test```.

A static configuration can be enforced via the configuration.json file in the `fiskaltrust.exe` folder in connection with `-useoffline=true`.

In Windows, all data is saved per default in `C:\ProgramData\fiskaltrust\service`. In Linux, the data is saved under `/usr/share/fiskaltrust/service`. The deletion of this folder results in a loss of data, and a loss in functionality of the fiskaltrust.SecurityMechanism. In case of an active online connection, the fiskaltrust.SecurityMechanism can restore its functionality without this folder, however the data which was lost cannot be restored.

![](./images/01-console-testmode.png)

<span id="_Toc527986811" class="anchor"></span>*Illustration 10. Screen Shot console in test mode*

#### Windows Service

The Windows service can be installed and uninstalled via the call parameters -i and –u.

![](./images/02-windows-services.png)

<span id="_Toc527986812" class="anchor"></span>*Illustration 11. Screen Shot Windows services fiskaltrust service*

Once successfully completed, the service will appear in the list of running services.

#### Mono Service

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

#### iOS-Devices, Android-Devices, Windows Universal App (XBox, Windows Phone, …)

A background app for each respective platform is in planning.

The scope of operation will be limited to one queue and the update ability will be realised via the platform store. The support nutshell will not be available.

The main features of the data and function structure however, will be the same, and the communication will be adapted to the platform specific standard.
