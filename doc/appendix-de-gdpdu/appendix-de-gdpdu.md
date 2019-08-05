# Appendix: DE – GdPdU

This appendix expands on the information provided in the General Part by adding details specific to the German market. This additional information is provided only where applicable. The remaining chapters, for which there is no additional information required, were omitted.

## Version History

Please refer to the general General Part

The technical specification of the data interface described in this document provides information regarding the following areas:

  13.	Access to the fiskaltrust.Service
  14.	Integration into the receipt based cash register workflow
  15.	The data structure
  16.	Function structure of the interface
  17.	Types of communication with fiskaltrust.Service 
  18.	Operating categories 

Interface specification is provided by fiskaltrust.Interface nuget package, which can be found at https://www.nuget.org/packages/fiskaltrust.interface   

For specifications or provisions of national law, please refer to the appropriate appen-dix.

Version History, page 1 <!-- TODO: page references -->6.

## Terminology

This table expands on the descriptions of all general terms and abbreviations provided in table <!-- TODO: table references --> 2 of the General Part with information specific to the German market.

| Term                | Description                                                                                                                  |
|---------------------|------------------------------------------------------------------------------------------------------------------------------|
| fiskaltrust.Journal | Facility for electronic storage of receipts on a storage device. The German GdPdU is enforced for this journal.              |
| GdPdU               | Principles on data access and inspection of digital files (GDPdU) (BMF recording 16 July 2001 - IV D 2 - S 0316 - 136/01 -). |

<span id="_Toc510009108" class="anchor"></span>*Table 39. Defintion of Terms and Abbreviations (DE - GdPdU)*

## Cash Register Integration

This chapter describes the cash register integration in accordance with the German law. The general rules for cash register integration are described in Chapter <!-- TODO: Chapter reference --> 6.3 of this document.6.3 of this document.6.3 of this document.6.3 of this document.6.3 of this document.6.3 of this document.6.3 of this document.6.3 of this document.

### Receipt creation process

This chapter describes the general process of creating receipts with fiskaltrust.Service and its workflow, in accordance with the German law.

#### The fiskaltrust.SecurityMechanism

#### Workflow for regular operation

### Receipt for special functions

This section describes receipt types used for special functions on the German market and expands on the descriptions from Chapter <!-- TODO: Chapter reference --> 6.3.2.6.3.2.6.3.2.6.3.2.6.3.2.6.3.2.6.3.2.6.3.2.

#### Definition

#### Zero Receipt

#### Start Receipt (Initial Receipt)

 #### Stop Receipt (Closing Receipt)

#### End of Failure Receipt (Collective Failure Report)

#### Monthly Receipt

#### Annual Receipt

### Receipt structure

#### Receipt Header

#### Charge Items Block

#### Pay Items Block

#### Signature Block

#### Receipt Footer

### Data Collection Log

#### Receipt Journal

#### Action Journal

## Data Structures

### Receipt Request

### Receipt Response

### Charge Items Entry

### Pay Items Entry

### Signature Entry

## Function Structures

### iPOS Interface

This interface is the basic infrastructure for the communication with fiskaltrust.Security Mechanisms. Three very basic functions are provided:

#### Echo Function

The function is described in the general section at page 3 <!-- TODO: page references -->6.

#### Sign Function

The key function of the fiskaltrust.SecurityMechanism is described in the general section at page 3 <!-- TODO: page references -->7. If the fiskaltrust.SecurityMechanism is run in DE (0x4445…) mode, then the sign function meets the GdPdU requirements.

#### Journal Function

With this function, a variety of information can be retrieved from the fiskaltrust.SecurityMechanism,

**C# call iPos Journal:**
```cs
Stream stream = proxy.Journal(0x4445000000000001, 0, DateTime.UtcNow.Ticks);
```

*Code 19. Call of iPos Journal (DE - GdPdU)*

A list with various possibilities for the request parameter ftJournalType is displayed in the reference table on page 1 <!-- TODO: page references -->08.

#### GdPdU Export

This interface allows exporting GdPdU format.

## Communication

### WCF Web Service

#### SOAP

### REST Web Service

#### Balancer Helper

#### Nancy Helper

#### JavaScript/jQuery Sample

### Stream for Serial Interface over TCP

## Operation Modes

### Components of the fiskaltrust.Service

#### Launcher

#### Background App

#### ASP.<span></span>net 5/Core Web App

#### SSCD Nutshell

#### Queue Nutshell

#### Support Nutshell

### Configuration of the fiskaltrust.Service

#### Online Portal

#### Cash Register or Cash Register System

#### Signature Creation Device (SSCD)

#### Queue

#### Journal

#### Notifications

## Installation

### fiskaltrust.SignatureCard

#### Windows, Linux, Mac

#### Launcher Call Parameter

#### Test Environment

#### Windows Service

#### Mono Service

#### iOS-Devices, Android-Devices, Windows Universal App (XBox, Windows Phone, …)

### fiskaltrust.SignatureBox

### fiskaltrust.SignatureCloud

## Receipt Case Definitions

### Voucher (Service/Product)

### Voucher (Value)

### Agency Business

### Delivery Note

### Tips

## Reference Tables

### ftState

### ftReceiptCase

#### ftReceiptCaseFlag

### Type of Service: ftChargeItemCase

### Type of Payment: ftPayItemCase

### Type of Signature: ftSignatureFormat

### Type of Signature: ftSignatureType

The ftSignatureType indicates type and origin of the signature.

| Value                | Description        | Version |
|----------------------|--------------------|---------|
| `0x4445000000000000` | unknown            | 0-      |
| `0x4445000000000001` | hash               | 0-      |
| `0x4445000000000002` | archiving required | 0-      |

<span id="_Toc527986692" class="anchor"></span>*Table 40. Type of Signature: ftSignatureType (DE - GdPdU)*

### Type of Journal: ftJournalType

The ftJournalType is used in connection with the journal function and defines the journal stream in accordance to the German law which is given back. In In the ftJournalType, the ISO-3166-1-ALPHA-2 from ASCII value is converted into hex and used as byte 8 and 7. For Germany (DE) this is 0x4445.

| Value                | Description                      | Version |
|----------------------|----------------------------------|---------|
| `0x4445000000000000` | status informationen for QueueDE | 0-      |
| `0x4445000000000001` | GdPdU-Export                     | 0-      |
| `0x4445000000000002` |                                  | 0-      |

<span id="_Ref522611189" class="anchor"></span>*Table 41. Type of Journal: ftJournalType (DE - GdPdU)*
