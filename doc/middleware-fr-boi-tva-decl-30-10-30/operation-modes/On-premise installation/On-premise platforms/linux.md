---
slug: /poscreators/middleware-doc/france/platforms/linux
title: Linux
---

# fiskaltrust.Middleware for Linux and macOs

It's possible to run the French Middleware on Linux, using [Mono](https://www.mono-project.com/). Just configure a CashBox and download the Linux launcher via the respective button in the CashBox overview. Like on Windows, the downloaded zip file contains scripts to install and test the Middleware.


## Requirements

In general, it's possible to run the Middleware on each Linux distribution that is supported by Mono (_Ubuntu_, _Debian_, _Raspbian_, _CentOS_ and _Fedora_, including their derivatives). Most testing at fiskaltrust is performed with Ubuntu and Debian, and we hence recommend to use these distributions.

**Please make sure to install the latest Mono version**. The default versions in the package repositories are usually extremely outdated, so please follow the official [Mono guidelines](https://www.mono-project.com/download/stable/#download-lin-ubuntu) to get the latest packages. We recommend to use at least version 6.8.0, if possible.

### Specification for ARM processor

:::info

It is possible to run the French Middleware with ARM processors. Just configure a CashBox, and download the Linux launcher, which contains the necessary builds for ARM processors, via the respective button in the CashBox overview. Like on Windows, the downloaded zip file contains scripts to install and test the Middleware.

:::

## Limitations

:::danger

Due to the limited hosting capabilities of Mono, the current version of the Middleware has several limitations and specifics when running on Linux. Therefore, please read this section carefully.

The upcoming major version of the Middleware will include a truly platform-independent Launcher where these limitations will be resolved.

:::
