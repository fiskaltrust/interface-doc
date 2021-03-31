---
slug: /product-description/germany/products-and-services/caas/features/databases/mysql
title: MySQL
---

# MySQL Storage

Die Verwendung des MySQL Storage-Providers ermöglicht den Betrieb der Middleware mit einem externen MySQL-Datenbanksystem. Die Middleware speichert dabei sämtliche beim Betrieb der Queue verarbeiteten Daten sowieso alle Konfigurationsdaten direkt in der Datenbank ab. 

Dieser Storage-Provider eignet sich besonders zum Aufbau ausfallsicherer Systeme, oder zur Einbindung der Middleware in bestehende Systemarchitekturen.

**Verfügbar ab Version**: 1.3.8

## Parameter

| Name | Beschreibung | Optional |
| ---- | ------------ |--------- |
| _connectionstring_ | MySQL-Connection-String zum Datenbanksystem | nein | 