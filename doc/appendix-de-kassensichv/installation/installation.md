---
slug: /poscreators/middleware-doc/germany/installation
title: Installation
---

# Installation

This chapter expands on the installation documentation covered in [Installation in General Part](../../general/installation/installation.md), with country-specific information applicable to the German market. 

## fiskaltrust.Middleware

### Windows, Linux, Mac

The mentioned platforms use the launcher `fiskaltrust.exe` to execute the fiskaltrust.SecurityMechanism. For Linux and Mac, the launcher can be executed via Mono. We recommend to use at least version 6.8.0. For Windows the launcher can be executed via the .NET framework. Prerequisites for the Windows Platform can be found in the [Product Description](https://docs.fiskaltrust.cloud/docs/product-description/germany/products-and-services/caas/features/platforms/windows).

The following call parameters are available with the launcher `fiskaltrust.exe` for the German market (fiskaltrust.Middleware 1.3. and higher):

| Parameter          | Description                                                  |
| ------------------ | ------------------------------------------------------------ |
| `-verbosity=Debug` | Shows additional debug information. Can be used in `test.cmd` as well. |