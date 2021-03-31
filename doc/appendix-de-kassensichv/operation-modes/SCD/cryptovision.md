---
slug: /product-description/germany/products-and-services/caas/features/basics/tse/cryptovision
title: Cryptovision-TSE
---

# Cryptovision/Bundesdruckerei-Interoperabilität

## SCU

Das _fiskaltrust.Middleware.SCU.DE.CryptoVision_-Package ermöglicht die Verbindung der Middleware mit einer CryptoVision-TSE über das von der TSE emulierte Dateisystem.

**Verfügbar ab Version**: 1.3.1

### Parameter

| Name | Beschreibung | Optional |
| ---- | ------------ |--------- |
| _devicePath_ | Pfad zum Laufwerk, unter dem die TSE erreichbar ist (z.B. `D:`), ohne abschließenden Slash | nein |
| _adminPin_ | Admin-PIN der TSE. Falls nicht angegeben, wird der Default-PIN verwendet. | ja |
| _timeAdminPin_ | Time Admin-PIN der TSE. Falls nicht angegeben, wird der Default-PIN verwendet. | ja |
| _TseIOReadDelayMs_ | Die Zeit, die vor dem Lesen der Antworten von der TSE abgewartet wird (in Millisekunden). Der Default-Wert sollte ausschließlich bei Lesefehlern verändert werden, da dadurch die Verarbeitungszeit aller Operationen erhöht wird. | ja (Default: 10) |



## Hardware

### Bundesdruckerei TSE, microSD, 8GB

**Artikel Nummer:** 4445-20300

Technische Sicherungseinrichtung (TSE-Modul), Bauform: microSD-Karte, Sicherungseinheit: NXP SE050, SE Leistung (Signatur): 150 ms, Lebensdauer: 20 Mio. Signaturen, Speicherplatz: 8 GB, Zertifikatslaufzeit 5 Jahre

Sonderartikel: Storno und Rückgabe unabhängig von der Lieferzeit ausgeschlossen.

### Zertifizierungs-ID

Zertifizierungs-ID der TSE gemäß Punkt 9.2.2 des [Anwendungserlasses zu § 146a AO](https://docs.fiskaltrust.cloud/doc/productdescription-de-doc/product-service-description/media/2019-06-17-einfuehrung-paragraf-146a-AO-anwendungserlass-zu-paragraf-146a-AO.pdf):

| Zertifizierungs-ID | Prüfgegenstand | Antragsteller | Datum |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| [BSI-K-TR-0374-2020](https://www.bsi.bund.de/SharedDocs/Zertifikate_TR/Technische_Sicherheitseinrichtungen/BSI-K-TR-0374-2020.html) | Bundesdruckerei D-TRUST TSEVersion 1.0                       | cv cryptovision GmbH                                         | 14.04.2020                                                   |

### Preis & Vertrieb

[fiskaltrust.Portal](https://portal.fiskaltrust.de)
