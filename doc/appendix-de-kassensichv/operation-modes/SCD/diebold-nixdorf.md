---
slug: /product-description/germany/products-and-services/caas/features/basics/tse/diebold-nixdorf
title: Diebold Nixdorf-TSE
---

# Diebold Nixdorf-Interoperabilität 

## SCU

Das _fiskaltrust.Middleware.SCU.DE.DieboldNixdorf_-Package ermöglicht die Verbindung der Middleware mit einer Diebold Nixdorf-TSE über einen seriellen COM-Port.

**RC verfügbar ab Version**: 1.3.1

**Stabil ab Version:** 1.3.6

## Parameter

| Name | Beschreibung | Optional |
| ---- | ------------ |--------- |
| _ComPort_ | Der COM-Port, über den die serielle Kommunikation mit der TSE erfolgt | nein |
| _AdminUser_ | Der Benutzername des Admin-Users. Falls nicht angebeben, wird der vom Hersteller definierte Default-Wert verwendet. | ja |
| _AdminPin_ | Admin-PIN der TSE. Falls nicht angegeben, wird der Default-PIN verwendet. | ja |
| _TimeAdminUser_ | Der Benutzername des Time-Admin-Users. Falls nicht angebeben, wird der vom Hersteller definierte Default-Wert verwendet. | ja |
| _TimeAdminPin_ | Time Admin-PIN der TSE. Falls nicht angegeben, wird der Default-PIN verwendet. | ja |


## Troubleshooting
**Beim Start der Middleware wird ein Fehler angezeigt, laut dem der Zugriff auf den angegebenen COM-Port verweigert wurde:** Bitte versichern Sie sich zuerst, ob in der SCU-Konfiguration den richtigen COM-Port hinterlegt wurde. Falls dies zutrifft, wird der Port bereits von einer anderen Anwendung verwendet. Typischerweise handelt es sich dabei um die mit der TSE gelieferte Web Service-Software von Diebold Nixdorf; diese wird von unserer SCU allerdings nicht benötigt, da alle Zugriffe direkt über das COM-Protokoll erfolgen. Die Deinstallation der Diebold Nixdorf-Software behebt dieses Problem.

## Hardware

### Diebold Nixdorf TSE, USB, 8 GB                             



**Artikel Nummer:** 4445-20400

Technische Sicherungseinrichtung (TSE-Modul), Bauform: USB-Stick, Verschlüsselung: 384 Bit, SE Leistung (Signatur): 250 ms, Lebensdauer: 20 Mio. Signaturen, Speicherplatz: 8 GB, Zertifikatslaufzeit 7 Jahre

Sonderartikel: Storno und Rückgabe unabhängig von der Lieferzeit ausgeschlossen.

### Zertifizierungs-ID

Zertifizierungs-ID der TSE gemäß Punkt 9.2.2 des [Anwendungserlasses zu § 146a AO](https://docs.fiskaltrust.cloud/doc/productdescription-de-doc/product-service-description/media/2019-06-17-einfuehrung-paragraf-146a-AO-anwendungserlass-zu-paragraf-146a-AO.pdf):

| Zertifizierungs-ID | Prüfgegenstand | Antragsteller | Datum |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| [BSI-K-TR-0393-2020](https://www.bsi.bund.de/SharedDocs/Zertifikate_TR/Technische_Sicherheitseinrichtungen/BSI-K-TR-0393-2020.html) | Diebold Nixdorf TSE-CardVersion 1.0                          | Diebold Nixdorf Systems GmbH                                 | 20.02.2020                                                   |

### Preis & Vertrieb

[fiskaltrust.Portal](https://portal.fiskaltrust.de)
