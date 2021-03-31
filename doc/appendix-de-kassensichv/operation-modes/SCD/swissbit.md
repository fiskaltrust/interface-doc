---
slug: /product-description/germany/products-and-services/caas/features/basics/tse/swissbit
title: Swissbit Hardware-TSE
---

# Swissbit Interoperabilität

## SCU

Das _fiskaltrust.Middleware.SCU.DE.Swissbit_-Package ermöglicht die Verbindung der Middleware mit einer Swissbit-Hardware-TSE über das von der TSE emulierte Dateisystem.

**Verfügbar ab Version**: 1.3.1

## Parameter

| Name | Beschreibung | Optional |
| ---- | ------------ |--------- |
| _devicePath_ | Pfad zum Laufwerk, unter dem die TSE erreichbar ist (z.B. `D:`), ohne abschließenden Slash | nein |
| _adminPin_ | Admin-PIN der TSE. Falls nicht angegeben, wird der Default-PIN verwendet. | ja |
| _timeAdminPin_ | Time Admin-PIN der TSE. Falls nicht angegeben, wird der Default-PIN verwendet. | ja |

## Troubleshooting
**Beim Start der Middleware unter Windows wird ein `SerializationException`-Fehler, ein `NativeLibraryException`-Fehler oder eine ähnliche Meldung angezeigt:** Zum Betrieb wird, je nach Windows-Version, das [Visual C++ Redistributable für Visual Studio 2015](https://www.microsoft.com/de-at/download/details.aspx?id=48145) benötigt. 

**Beim Start der Middleware unter Linux wird ein `DllNotFound`-Fehler, eine Exception mit dem Text `Invalid Response from TSE` oder eine ähnliche Fehlermeldung angezeigt:** Zum Betrieb wird, je nach Linux-Version, das _libc_- oder das _glibc_-Package benötigt. 

## Hardware

### Swissbit TSE, microSD-Karte, 8 GB

**Artikel Nummern:** 4445-20600, 4445-20610

Technische Sicherungseinrichtung (TSE-Modul), Bauform: microSD-Karte, Verschlüsselung: 384 Bit, SE Leistung (Signatur): 250 ms, Lebensdauer: 20 Mio. Signaturen, Speicherplatz: 8 GB, Zertifikatslaufzeit 5 Jahre

Sonderartikel: Storno und Rückgabe unabhängig von der Lieferzeit ausgeschlossen.



### Swissbit TSE, SD-Karte, 8 GB

**Artikel Nummern:** 4445-20620, 4445-20630

Technische Sicherungseinrichtung (TSE-Modul), Bauform: SD-Karte, Verschlüsselung: 384 Bit, SE Leistung (Signatur): 250 ms, Lebensdauer: 20 Mio. Signaturen, Speicherplatz: 8 GB, Zertifikatslaufzeit 5 Jahre

Sonderartikel: Storno und Rückgabe unabhängig von der Lieferzeit ausgeschlossen.



### Swissbit TSE, USB, 8 GB

**Artikel Nummern:** 4445-20640, 4445-20650

Technische Sicherungseinrichtung (TSE-Modul), Bauform: USB-Stick, Verschlüsselung: 384 Bit, SE Leistung (Signatur): 250 ms, Lebensdauer: 20 Mio. Signaturen, Speicherplatz: 8 GB, Zertifikatslaufzeit 5 Jahre

Sonderartikel: Storno und Rückgabe unabhängig von der Lieferzeit ausgeschlossen.

### Zertifizierungs-ID

Zertifizierungs-ID der TSE gemäß Punkt 9.2.2 des [Anwendungserlasses zu § 146a AO](https://docs.fiskaltrust.cloud/doc/productdescription-de-doc/product-service-description/media/2019-06-17-einfuehrung-paragraf-146a-AO-anwendungserlass-zu-paragraf-146a-AO.pdf):

| Zertifizierungs-ID | Prüfgegenstand | Antragsteller | Datum |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| [BSI-K-TR-0362-2019](https://www.bsi.bund.de/SharedDocs/Zertifikate_TR/Technische_Sicherheitseinrichtungen/BSI-K-TR-0362-2019.html) | Swissbit TSE, Version 1.0 Swissbit USB TSE Swissbit SD TSE Swissbit microSD TSE | Swissbit AG                                                  | 20.12.2019                                                   |

### Preis & Vertrieb

[fiskaltrust.Portal](https://portal.fiskaltrust.de)
