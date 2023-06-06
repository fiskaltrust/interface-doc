---
slug: /poscreators/middleware-doc/digital-receipt/austria
title: 'Digital Receipt: Austria'
---

# Compliance AT

Vorschriften an den digitalen Beleg in Österreich:

Ein elektronischer Beleg iSd § 132a Abs. 1 BAO ist ein Beleg, der in einem elektronischen Format ausgestellt und empfangen bzw. unmittelbar für den die Barzahlung Leistenden verfügbar ist. Er kann z.B. mittels E-Mail, als E-Mail-Anhang oder Web-Download, in einem elektronischen Format (z.B. als PDF- oder Textdatei), aber auch in einem strukturierten Dateiformat (z.B. HTML) ausgestellt werden. Der Belege muss unmittelbar im Zusammenhang mit der Barzahlung durch die Registrierkasse erstellt und signiert werden, sowie in der Folge tatsächlich in den Verfügungsbereich des Belegempfängers gelangen. Technisch bedingte Verzögerungen wie z.B. bei der E-Mail-Zustellung oder dem Upload zu einem Server sind unbeachtlich, wenn die elektronischen Belege sofort im DEP sowie zeitnah in einem revisionssicheren Speicher (vgl. Abschnitt 3.2.1.4. Sicherung des DEP) gespeichert und für eine Überprüfung durch ein Organ der Finanzverwaltung verfügbar sind. Ob dies elektronisch (per Email, Ablesen mittels Smartphone, usw.) oder in Papierform erfolgt, bleibt dem Belegaussteller überlassen. Die Übermittlung ist eine Bringschuld des Unternehmers, eine bloße Einräumung der Möglichkeit des Ansehens und Abfotografierens des auf einem Bildschirm angezeigten Beleginhaltes erfüllt nicht die Belegerteilungspflicht. Eine spezielle Form der elektronischen Übertragung ist nicht vorgeschrieben. Ob die Übertragung in den Verfügungsbereich des Belegempfängers durch Aktivität des Leistungserbringers oder den die Bezahlung Leistenden erfolgt, ist für die Erfüllung der Belegerteilungspflicht unerheblich. Diese Art der Belegerteilung ist im elektronischen Aufzeichnungssystem zu dokumentieren.

fiskaltrust hat ein Gutachten in Auftrag gegeben, welches das Ziel verfolge, zu untersuchen, ob verschiedene Möglichkeiten der digitalen Belegerstellung aus technischer Sicht der RKSV entsprechen. In diesem Gutachten wurden diese Ansätze sowohl prinzipiell an Hand des Konzeptes als auch an Hand von konkreten Implementierungen untersucht.

Das Gutachten können Sie unter folgender E-Mail Adresse anfragen: hello@fiskaltrust.eu
In the event of a failure or disruption of the internet connection, you are required by Austrian law to print the receipt and make it available to the customer. If you receive the ftState 0x4154000000000001 or 0x4154000000000004 as a ReceiptResponse, no digital receipt should be be visualized as a QR-Code or scanned as Give-Away - the receipt must be printed out.

The country-specific code is made of the country's code value following the ISO-3166-1-ALPHA-2 standard, converted from ASCII into hex. For Austria (AT) this is 0x4154, which results in 0x4154000000000001 as the value for the "out of service" status.

||||
|---|---|---|
|Value|Description|Middleware value|
|0x4154000000000001|"out of service" No RKSV signatures are generated or sent back. No RKSV-DEP is written, as nothing is being signed. The E131-DEP records requests and responses.|1.0|
|0x4154000000000004|"SSCD permanently out of service" The status "SSCD temporary out of service" was activated more than 48h ago. Thus a FinanzOnline notification has been generated. For conduct and termination of this mode, see "SSCD temporary out of service".|1.0|

The following example shows how to extract the value of a flag into the ftState property.
```cs
if ((ReceiptResponse.ftState & 0x4154000000000001) != 0) 
{ 
    //your code in case of out of service condition 
}
if ((ReceiptResponse.ftState & 0x4154000000000004) != 0)
 { 
    //your code in case of SSCD permanently out of service condition
 }
```