---
slug: /product-description/germany/products-and-services/caas/features/basics/tse/deutsche-fiskal
title: Deutsche Fiskal-TSE
---

# Deutsche Fiskal-Interoperabilität

## SCU

Das _fiskaltrust.Middleware.SCU.DE.DeutscheFiskal_-Package ermöglicht die Verbindung der Middleware mit einer Deutsche Fiskal Cloud-TSE (_"Fiskal Cloud"_) über den von der Deutschen Fiskal zur Verfügung gestellten _Fiskal Cloud Connector_-Service. Dieser kann entweder beim ersten Start des SCU-Packages automatisch installiert werden, oder es kann eine bereits installierte Version des FCC genutzt werden (s. _Parameter_).

**Verfügbar ab Version**: 1.3.11

## Parameter

| Name | Beschreibung | Optional |
| ---- | ------------ |--------- |
| _FccId_ | Die ID des Fiskal Cloud Connector, wie im FCC-Portal angegeben. Wird bei der Produktion über das fiskaltrust-Portal automatisch befüllt. | nein |
| _FccSecret_ | Das Secret bzw. Passwort des Fiskal Cloud Connector, wie im FCC-Portal angegeben. Wird bei der Produktion über das fiskaltrust-Portal automatisch befüllt. | nein |
| _ErsCode_ | Der PIN code, der benutzt wird um das Kassensystem beim FCC zu authentifizieren, wie im FCC-Portal angegeben. Wird bei der Produktion über das fiskaltrust-Portal automatisch befüllt. | nein |
| _ActivationToken_ | Das Token, das von der Middleware benutzt wird um Clients im FCC zu registrieren, wie im FCC-Portal angegeben. Wird bei der Produktion über das fiskaltrust-Portal automatisch befüllt. | nein |
| _FccPort_ | Der Port, über den die Middleware mit dem FCC kommuniziert. | ja (Default: 20001) |
| _FccDirectory_ | Das Verzeichnis, in dem der Fiskal Cloud Connector abgelegt wird. Falls angegeben, wird zuerst geprüft ob der FCC bereits in diesem Verzeichnis installiert ist, und eine bereits vorhandene Version verwendet. Falls am angegebenen Ort keine FCC-Installation vorhanden ist oder der Parameter nicht angegeben ist, wird der FCC automatisch installiert. | ja (Default: `%localappdata%/fiskaltrust/FCC/[FccId]`) |
| _ProxyServer_ | Falls der Zugang zum Internet über einen Proxy-Server erfolgen muss: Die URL bzw. IP-Adresse des Proxy-Servers. | ja (Default: leer/kein Proxy) |
| _ProxyPort_ | Falls der Zugang zum Internet über einen Proxy-Server erfolgen muss: Der HTTP-Port des Proxy-Servers. | ja (Default: leer) |
| _ProxyUsername_ | Falls der Zugang zum Internet über einen _authentifizierten_ Proxy-Server erfolgen muss: Der Benutzername des Proxy-Servers. | ja (Default: leer/keine Proxy-Authentifizierung) |
| _ProxyPassword_ | Falls der Zugang zum Internet über einen _authentifizierten_ Proxy-Server erfolgen muss: Das Passwort des Proxy-Servers. | ja (Default: leer/keine Proxy-Authentifizierung) |
| _DontAddFccFirewallException_ | Wenn dieser Parameter nicht gesetzt ist, versucht die SCU beim ersten Start automatisch, eine Firewall-Exception für den FCC anzulegen (dazu werden Admin-Rechte benötigt). Dies kann verhindert werden, indem dieser Parameter auf `true` gesetzt wird. | ja (Default: `false`) |
| _FccDownloadUri_ | Wenn dieser Parameter gesetzt ist, wird die angegebene Web-URL zum Download des FCC verwendet. Wenn kein Wert gesetzt ist, wird der FCC automatisch von den fiskaltrust-Servern heruntergeladen. Dieser Parameter kann hilfreich sein, falls der Download von fiskaltrust z.B. aufgrund einer streng konfigurierten Firewall nicht möglich ist.  | ja (Default: `null`) |

## Troubleshooting
**Der Fiskal Cloud Connector kann keine Verbindung zum Internet herstellen:** Sollte die Middleware nicht als Administrator gestartet werden, die automatische Erzeugung der Firewall-Exception über den oben beschriebenen Parmater deaktiviert sein, oder Sie eine spezielle Firewall verwenden: fügen Sie bitte manuell eine Ausnahmeregelung in Ihrer Firewall für die `java.exe` im Unterverzeichnis `bin\jre\bin` des _FccDirectory_ (s.o.) hinzu (Zugriff auf fiskal.cloud, Port 443).

### Zertifizierungs-ID

Zertifizierungs-ID der TSE gemäß Punkt 9.2.2 des [Anwendungserlasses zu § 146a AO](https://docs.fiskaltrust.cloud/doc/productdescription-de-doc/product-service-description/media/2019-06-17-einfuehrung-paragraf-146a-AO-anwendungserlass-zu-paragraf-146a-AO.pdf):

| Zertifizierungs-ID | Prüfgegenstand | Antragsteller | Datum |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| [BSI-K-TR-0369-2020](https://www.bsi.bund.de/SharedDocs/Zertifikate_TR/Technische_Sicherheitseinrichtungen/BSI-K-TR-0369-2020.html) | D-TRUST TSE Web Version 1.0                                   | D-TRUST GmbH                                                 | 30.09.2020                                                   |


