---
slug: /poscreators/middleware-doc/digital-receipt/introduction
title: 'Digital Receipt: Introduction'
---

# Introduction 

Modern POS systems are designed for intuitive operation, requiring just a few clicks. They seamlessly export data directly to accounting software, assist with inventory management, and provide sales analysis. It's a complete digitization solution. However, when it comes to the customer's receipt, it remains a traditional slip of paper.
fiskaltrust offers functionalities for providing different types of digital receipts via the fiskaltrust.Middleware.

We offer four different types of digital receipt, tailored to enable different use-cases, depending on the user need and the operational environment of the POS system.
1. Basic
2. Carefree
3. Give-away
4. Promotion/ReceiptHero

In the basic and in the carefree variant, a digital receipt can be provided via an existing integration of the fiskaltrust.Middleware without any additional implementation effort or change. For more advanced concepts such as "Give-Away" and "Promotion", additional meta data is required, which can be transferred to the Middleware via the existing function and data structure (see examples below).
The prerequisite for use as a PosOperator is an activate user contract and the correspondingly required master data. The master data (including customization data like the company's logo) must be maintained in the outlet (i.e. the location) where the respective Queue (= POS system instance) is created. The master data must contain the necessary minimum information required for receipts.

:::note

For POS systems without the fiskaltrust.Middleware, an own API is planned, but this is not available at the moment.

:::


Additional functionalities to be released at a later stage: 
-	Different receipt layouts, including customization
-	Capturing additional information on receipts, such as hospitality receipt, cancellation reason etc.
-	Feedback functionality
-	POS-API-Helper with SOAP/GRPC/REST for zero-integration
-	InStore App
-	QR-Label / Give-Away and production of QR-codes before POS-API/print call
-	Share-button
-	Apple-Wallet and Google-Wallet
