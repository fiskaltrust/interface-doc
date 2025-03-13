---
slug: /poscreators/middleware-doc/italy/platforms/android
title: Android
---

# Android

## Requirements

Android 7.0 and higher.

## Supported packages

The launcher of the fiskaltrust.Middleware for Android can be used with following CashBox configuration:

 - SQLite Package

## Differences to fiskaltrust.Middleware for desktop

Due to the security restrictions of Android, the required packages cannot be loaded or updated when the service is started. The middleware for Android is therefore available for download with the following pre-configured packages:

- SQLite queue
- Epson SCU
- Custom SCU

This Google security restriction also implies that our regular package update mechanism is not supported on Android. To receive the latest middleware updates, the APK must therefore be updated either via Google Play or MDM.

To reduce the packet size, which is critical for mobile apps, a separate HTTP and a gRPC app are provided.

The middleware background service must be started via Android intent and then, as usual, make REST or gRPC endpoints available via our standard interface.

## Distribution

### fiskaltrust.Portal

The Android Launcher APK files are offered for download in the fiskaltrust.Portal for the HTTP variant and the gRPC variant if the requirements described above are met.

### Google Play Store

The Android Launcher is available for download as an app for both the HTTP variant and the gRPC variant in the Google Play Store if the requirements described above are met.

|              | fiskaltrust.Middleware for Android (HTTP)                                         | fiskaltrust.Middleware for Android (gRPC)                                         |
|--------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| **QR Code ** | ![http](../images/android-http.png)                                               | ![grpc](../images/android-grpc.png)                                               |
| **URL**      | https://play.google.com/store/apps/details?id=eu.fiskaltrust.androidlauncher.http | https://play.google.com/store/apps/details?id=eu.fiskaltrust.androidlauncher.grpc |



### Troubleshooting

#### Status

The status of the fiskaltrust.Middleware is displayed in the Android notification area. Alternatively, HTTP endpoints are available to call up the status and detailed diagnostic logs (see *Additional information*).

## Additional information

https://github.com/fiskaltrust/middleware-demo-android
