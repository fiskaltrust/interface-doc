---
slug: /poscreators/middleware-doc/austria/installation
title: Installation
---

## Installation

### fiskaltrust.SignatureCard

The fiskaltrust.SignatureCard consists of a Smart Card, which stores the certificate, and of a reader, which can be: an external device attached to the machine using a USB cable, or an internal device installed inside the machine.

### fiskaltrust.SignatureBox

The fiskaltrust.SignatureBox is a pre-configured hardware solution with a network interface and a signature creation device.

The main settings such as CashboxId and AccessToken can be set via a basic Web-GUI.

### fiskaltrust.SignatureCloud

The fiskaltrust.SignatureCloud is a pure online solution. The receipt linking as well as the signature creation are handled entirely online. The advantage of this solution is that no installation or configuration is required for the client and any platform can use this service. CashboxId and AccessToken are transferred in an http-Header. The QueueId is part of the request link. The configuration can be done only via the fiskaltrust.Portal.

### iOS-Devices, Android-Devices, Windows Universal App (XBox, Windows Phone, …)

With regard to the SSCD nutshell, there will be restrictions: the queue will run on the device but the SSCD which must be provided through the network (LAN, WAN or Internet)
