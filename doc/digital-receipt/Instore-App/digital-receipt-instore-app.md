---
slug: /poscreators/middleware-doc/digital-receipt/InStore-App
title: 'InStore App'
---

# InStore App

:::info summary

After reading this, you understand the concept of the InStore App and configure an own InStore App installation.

:::

## Introduction

The fiskaltrust instore app can be used on a touch-enabled device with integrated thermal printer. The fiskaltrust instore app can listen to receipt issuing of multiple CashBoxes filtered by provided terminal-identification by each CashBox. Each time a receipt is issued by a related CashBox, the fiskaltrust instore app pops up on the consumer facing touch screen and shows the following elements: 

* Number, moment of creation and total amount of the receipt 
* QR-Code with the https-receipt-link to hand over receipt to consumer 
* Accept button to manually acknowledge received receipt 
* Print button with countdown to print receipt

When the QR-Code is scanned and the https-receipt-link is used to download the https-receipt-document, then in the background there is an acknowledgement logged for receiving the receipt by the consumer and the current receipt display is closed. 

When the accept button is pressed by the consumer, then a manual acknowledgement for receiving the receipt is logged and the current receipt display is closed. 

When the print button is pressed by the consumer, or when the timeout/countdown is exceeded, then a paper receipt is printed and printing is logged for analytics. The current receipt display is closed after successful printing.

Setting up the InStore App requires no implementation into the Point of Sale software. The configuration process, encompassing POS-API Helper configuration and the steps for pairing the CashBox with the device, can be effortlessly completed within the fiskaltrust.Portal.

Since all operations within the app (Including QR-Code scanning, accepting and printing) are meticulously logged in the fiskaltrust.Portal, the InStore App attains complete compliance with Austria's "Belegausgabepflicht" and "Belegannahmepflicht", as well as Germany's "Belegausgabepflicht". Furthermore the app ensures, that the receipt will always be issued to the consumer. fiskaltrust appointed Markus Knasmüller from BMD to create an external assessment about the conformity of the digital receipt in Austria. The final assessment can be requested here: https://forms.office.com/e/0PcMDYWC2B  

:::caution
The fiskaltrust InStore App requires a permanent and stable connection to the internet.
:::

### InStore App visualization

![InStore-App](https://github.com/fiskaltrust/interface-doc/assets/124153755/6187c0d1-301c-4296-9948-1873d30088fd)


| Number  | Description |
| ------------- | ------------- |
| 1  | Receipt number (ft5C43F#357749), date and receipt amount |
| 2  | QR-Code to https digital receipt document |
| 3  | `Accept button` |
| 4  | `Print button` |

## Configuration 

The fiskaltrust InStore App requires a four step configuration process. It is descibed in the following graphic.

![InStore-App_get_started](https://github.com/fiskaltrust/interface-doc/assets/124153755/c23419df-4780-4500-9d95-297056f65275)

The fiskaltrust InStore-App requires a permanent and stable connection to the internet.

### Configure master data

Please visit following link to see configuration steps for the master data:

https://docs.fiskaltrust.cloud/de/docs/posdealers/buy-resell/products/digital-receipt#introduction

### Configure POS-API Helper

Please visit following link to see configuration steps for the POS-API Helper:

https://docs.fiskaltrust.cloud/de/docs/posdealers/technical-operations/middleware/helper#pos-api-helper-example

### Install the InStore App

The fiskaltrust InStore App is now available in the following app stores. It necessitates a minimum of Android 7, touchscreen and a integrated printer device to run the application.

Search for "fiskaltrust InStore App" at following app stores, to download the app:
* APK – upon request 
* SUNMI App Store
* Google Play Store - soon
* MAXSTORE (PAX) – soon

### Pair InStore App

After installing the InStore App on your Android device, establishing a connection with your preferred CashBox is essential. Here's how:

| Step  | Description |
| ------------- | ------------- |
| 1  | Log in to your fiskaltrust.Portal account and proceed to the CashBox you want to pair with the InStore App.  |
| 2  | Extend the overview of the CashBox. Klick `unhide` to generate a new, temporary pairing pin.![portal](https://github.com/fiskaltrust/interface-doc/assets/124153755/9e7c7b22-f3ef-4276-85e7-860375c853ca) The pairing pin is valid for five minutes. After the pin expired, you need to generate a new pin, by clicking `unhide` to generate a new pin.   |
| 3  | ![pairing_pin](https://github.com/fiskaltrust/interface-doc/assets/124153755/ce1010a1-469f-4747-b368-fe3192f3cae7) Enter the four-digit pin into your InStore App, confirm the connection by clicking `Pair`. You can pair multiple InStore App installation with one CashBox. To open the paring to CashBox mask or to pair with a different CashBox, press the touchscreen one second.   |
