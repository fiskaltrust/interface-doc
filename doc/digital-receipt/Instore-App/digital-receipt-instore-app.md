---
slug: /poscreators/middleware-doc/digital-receipt/instore-app
title: 'InStore App'
---

# InStore App

:::info summary

After reading this, you understand the concept of the InStore App and configure an own InStore App installation.

:::

## Introduction

The fiskaltrust instore app can be used on a touch-enabled device with an integrated thermal printer. The fiskaltrust InStore App can listen to receipt issuing of multiple CashBoxes filtered by provided terminal-identification by each CashBox. Each time a related CashBox issues a receipt, the fiskaltrust InStore App pops up on the consumer facing touch screen and shows the following elements: 

* Number, moment of creation and total amount of the receipt 
* QR-Code with the https-receipt-link to hand over receipt to the consumer 
* Accept button to manually acknowledge received receipt 
* Print button with a countdown to print receipt

When the QR-Code is scanned and the https-receipt-link is used to download the https-receipt-document, then in the background there is an acknowledgement logged for receiving the receipt by the consumer and the current receipt display is closed. 

When the accept button is pressed by the consumer, then a manual acknowledgement for receiving the receipt is logged and the current receipt display is closed. 

When the print button is pressed by the consumer, or when the timeout/countdown is exceeded, then a paper receipt is printed and printing is logged for analytics. The current receipt display is closed after successful printing.

Setting up the InStore App requires no implementation into the Point of Sale software. The configuration process, encompassing POS-API Helper configuration and the steps for pairing the CashBox with the device, can be effortlessly completed within the fiskaltrust.Portal.

Since all operations within the app (Including QR-Code scanning, accepting and printing) are meticulously logged in the fiskaltrust.Portal, the InStore App attains complete compliance with Austria's "Belegausgabepflicht" and "Belegannahmepflicht", as well as Germany's "Belegausgabepflicht". Furthermore, the app ensures that the receipt will always be issued to the consumer. fiskaltrust appointed Markus Knasmüller from BMD to create an external assessment about the conformity of the digital receipt in Austria. The final assessment can be requested here: https://forms.office.com/e/0PcMDYWC2B  

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

### Configure POS-API Helper / implement POS-API

fiskaltrust offers two transportation methods to seamlessly transfer data from your local Queue to the digital receipt backend. To ensure a smooth digital receipt process, a switch to direct receipt uploads is necessary.

The first method, requiring no additional implementation effort, involves the utilization of the POS-API Helper, which can be configured within the fiskaltrust.Portal. The role of the POS-API Helper is to facilitate the seamless and direct transfer of the receipt data from the local Queue to the digital receipt endpoint. To take advantage of this capability, the POS-API Helper needs to be configured in the fiskaltrust.Portal and assigned to each CashBox utilizing the InStore App. Failure to not configure the POS-API Helper results in digital receipt visualization delays of up to five minutes. To gain insights into the configuration steps for the POS-API Helper, please refer to the section configure POS-API Helper of this document.

The second method to change the upload behavior entails the integration of the POS-API's print endpoint directly into your Point of Sale software. Particularly recommended for scaling installations, this approach enhances efficiency, because no configuration needs to be done in the fiskaltrust.Portal. Distinguishing itself from the POS-Helper, the POS-API offers a broader range of advanced features. Comprehensive instructions for implementing the POS-API can found in the section implement POS-API of this document.

Please visit following link to see configuration steps for the POS-API Helper:

https://docs.fiskaltrust.cloud/de/docs/posdealers/technical-operations/middleware/helper#pos-api-helper-example

Please visit following link to see configuration steps for the POS-API: 

https://docs.fiskaltrust.cloud/de/apis/pos-api#tag/POS-API/paths/~1v0~1print/post

### Install the InStore App

The fiskaltrust InStore App is now available in the following app stores. It necessitates a minimum of Android 7, touchscreen and a integrated printer device to run the application.

Search for "fiskaltrust InStore App" at following app stores, to download the app:

* APK (via App Center) – (https://install.appcenter.ms/orgs/fiskaltrust/apps/in-store/distribution_groups/stable)
* SUNMI App Store - Approved and available for: P2 PRO, P2, V1, V2, & V2 PRO
* Google Play Store - coming soon
* MAXSTORE (PAX) - Approved and available for: A35, A80 & A920Pro

### Pair InStore App

After installing the InStore App on your Android device, establishing a connection with your preferred CashBox is essential. Here's how:

| Step  | Description |
| ------------- | ------------- |
| 1  | Log in to your fiskaltrust.Portal account and proceed to the CashBox you want to pair with the InStore App.  |
| 2  | Extend the overview of the CashBox. Klick `unhide` to generate a new, temporary pairing pin.![portal](https://github.com/fiskaltrust/interface-doc/assets/124153755/9e7c7b22-f3ef-4276-85e7-860375c853ca) The pairing pin is valid for five minutes. After the pin expired, you need to generate a new pin, by clicking `unhide` to generate a new pin.   |
| 3  | ![pairing_pin](https://github.com/fiskaltrust/interface-doc/assets/124153755/ce1010a1-469f-4747-b368-fe3192f3cae7) <br/>Enter the four-digit pin into your InStore App, confirm the connection by clicking `Pair`. You can pair multiple InStore App installations with one CashBox. To open the paring to CashBox mask or to pair with a different CashBox, press the touchscreen one second.   |
