---
slug: /poscreators/middleware-doc/germany/platforms/android
title: Android
---

# Android

## Requirements

Android 7 and higer.

## Supported packages

The launcher of the fiskaltrust.Middleware for Android can be used with following cashbox configuration:

 - SQLite Package
 - Fiskaly Cloud TSE oder Swissbit Hardware TSE

## Unterschiede zu ft.Middleware für Desktop

Aufgrund der Sicherheitseinschränkungen von Android können die benötigten Packages nicht beim Start des Dienstes geladen bzw. aktualisiert werden. Daher steht die Middleware für Android mit folgenden vorkonfigurierten Packages zum Download zur Verfügung:

- SQLite queue
- Fiskaly SCU
- Swissbit SCU (z.B. via SD-Karten)

Diese Google-Sicherheitsbeschränkung impliziert auch, dass unser regulärer Paket-Update-Mechanismus unter Android nicht unterstützt wird. Um die neuesten Middleware-Updates zu erhalten, muss daher die APK entweder über Google Play oder MDM upgedated werden.

Um die bei mobilen Apps kritische Paketgröße zu reduzieren, werden jeweils eine separate HTTP- und eine gRPC-App bereitgestellt.

Der Middleware-Hintergrunddienst muss via Android-Intent gestartet werden und stellt dann wie gewohnt REST bzw gRPC-Endpunkte über unser Standard-Interface zur Verfügung.

## Distribution

### fiskaltrust.Portal

Die Android Launcher APK-files werden jeweils für die HTTP-Variante als auch für die gRPC Variante im fiskaltrust.Portal zum Download angeboten, wenn die oben beschriebenen Voraussetzungen erfüllt sind.

### Google Play Store

Der Android Launcher wird jeweils für die HTTP-Variante als auch für die gRPC Variante im Google Play Store als App zum Download angeboten, wenn die oben beschriebenen Voraussetzungen erfüllt sind.

|                         | fiskaltrust.Middleware für Android (HTTP)                    | fiskaltrust.Middleware für Android (gRPC)                    |
| ----------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **QR Code zum Scannen** | ![http](../images/android-http.png)                          | ![grpc](../images/android-grpc.png)                          |
| **URL**                 | https://play.google.com/store/apps/details?id=eu.fiskaltrust.androidlauncher.http | https://play.google.com/store/apps/details?id=eu.fiskaltrust.androidlauncher.grpc |



### Troubleshooting

#### Status

Der Status der fiskaltrust.Middleware wird im Android-Benachrichtigungsbereich angezeigt. Alternativ stehen HTTP-Endpunkte zur Verfügung, um den Status und detaillierte Diagnose-Logs abzurufen (s. *Weiterführende Informationen*).

#### Initialisierung der Swissbit TSE

Einen Spezialfall stellt die Swissbit-TSE dar, die hardwarebedingt zur Initialisierung beim erstmaligen Start der Middleware aus- und wieder eingesteckt werden muss (eine Information dazu ist dann sowohl im Benachrichtungsbereich als auch über den Status-Endpunkt verfügbar).

## Weiterführende Informationen zur Middleware für Android

https://github.com/fiskaltrust/middleware-demo-android