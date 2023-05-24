---
slug: /poscreators/middleware-doc/middleware-it-registratore-telematico/cash-register-integration/failure-scenarios
title: Failure scenarios
---

### Failure Scenarios
This chapter expands more on describing the different failure scenarios with the fiskaltrust.Middleware covered in the [Cash register integration](../../general/cash-register-integration/cash-register-integration-failure-scenarios.md) chapter of the General Part, with country-specific information applicable to the Italian market.

#### Failure of the Signature Creation Unit
When the SCU is reachable again, a Zero-Receipt must be sent, which forces a communication retry towards the SSCD. If the fiskaltrust.Middleware is able to connect to the SCU again, the ftState = 0x00 (ok) is returned to the POS system via the response and the fiskaltrust.Middleware is ready for normal operation again. Furthermore, the response contains a listing of the requests that were resend to the SSCD. If a resent receipt causes an validation error, the error is logged in the logfile. On an connection error the resending is stopped an will be continued on the last receipt not sent. The requests affected by the failure of the communication with the SCU do not have to be sent to the Queue again after the problem has been resolved.



