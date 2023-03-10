---
slug: /poscreators/middleware-doc/general/cash-register-integration
title: Voided receipt regular workflow
---

## Voided receipt workflow

As a reminder and for legal reason any data sent to the fiskaltrust.Middleware cannot be deleted afterwards. Based on this, all changes must done by sending a new receipt. 
To complete a voided or cancel receipt, the same ticket with negative values should be sent to the fiskaltrust.Middleware.
The main things that should be changed on the voided or cancelled receipt:
- The field ftReceiptCase stays the same as the original but the flag for voided ticket must be set. (The value 4 on position 12).

  For example "ftReceiptCase": "0x00000000000"<strong>4</strong>0000"

- Also the field cbPreviousReceiptReference should be added, the value entered should be set to the ReceiptReference of the Receipt which should be voided.

- The amount <strong>or </strong> quantity has to be negative. Set only one of the two as negative.
