---
slug: /middleware-it-registratore-telematico
title: Italian Middleware Documentation v2.0
---

# Italian Middleware for Compliance-as-a-Service (v2.0)

## Breaking Changes Notice

Version 2.0 introduces significant breaking changes to improve the middleware's functionality and compliance with Italian fiscal regulations. Please review the changes carefully before upgrading.

## Overview

The fiskaltrust Middleware provides a comprehensive solution for point-of-sale systems to achieve fiscal compliance in Italy. This middleware supports:

- Cloud native, local, and hybrid deployments
- Full fiscalization compliance
- Seamless integration with the fiskaltrust ecosystem
- Support for add-on products and subscriptions

### Supported Fiscal Solutions

The middleware supports three official methods for fiscal compliance:

1. **RT-Printer (Fiscal Printer)**
   - Certified device for receipt printing
   - Internal storage on SD card
   - Daily automated government reporting

2. **RT-Server (Fiscal Server)**
   - Certified device for multi-till environments
   - Centralized signature creation
   - Automated daily closures

3. **Government WebService**
   - Direct integration with government services
   - Real-time receipt validation
   - Limited daily transaction volume

4. **Telematic Receipt** (Coming in 2026)
   - Software-based solution
   - Requires certification
   - Pending legislation completion

## Documentation Structure

1. [Installation Guide](installation/README.md)
2. [Configuration Guide](configuration/README.md)
3. [Integration Guide](cash-register-integration/README.md)
4. [Receipt Types and Cases](receipt-case-definitions/README.md)
5. [Data Structures](data-structures/README.md)
6. [Reference Tables](reference-tables/README.md)
7. [Operation Modes](operation-modes/README.md)
8. [Communication](communication/README.md)
9. [Troubleshooting](troubleshooting/README.md)

## Version Information

- **Version**: 2.0.20240329
- **Status**: Production Ready
- **Release Date**: March 29, 2024

## Breaking Changes in v2.0

1. **New Receipt Format**
   - Updated signature structure
   - Enhanced metadata support
   - Additional fiscal information fields

2. **Modified API Endpoints**
   - Restructured request/response formats
   - New endpoint versioning scheme
   - Enhanced error handling

3. **Updated Data Structures**
   - New charge item cases
   - Extended payment types
   - Modified receipt case definitions

4. **Security Enhancements**
   - Improved signature verification
   - Enhanced audit trail
   - Updated encryption standards

## Support and Resources

- [Technical Support](https://support.fiskaltrust.cloud)
- [API Documentation](https://docs.fiskaltrust.cloud)
- [Developer Portal](https://portal.fiskaltrust.cloud)

## Legal Notice

This documentation is confidential and proprietary to fiskaltrust consulting gmbh. 