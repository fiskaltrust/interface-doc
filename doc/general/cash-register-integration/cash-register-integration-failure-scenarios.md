---
slug: /poscreators/middleware-doc/general/cash-register-integration/failure-scenarios
title: Failure scenarios
---

### Failure Scenarios
This Chapter describes the different scenarios of failure when using the fiskaltrust.Middleware and how to handle them.

On a high level, there are three different failure scenarios that should be considered that are described in more detail in the following sections:
1. **Signature Cration Unit not reachable or failing:** When the SCU is either not reachable or returns an error (e.g. because of an outage of the wrapped signing device or service), the Middleware switches to the _failed mode_, i.e. a circuit breaker mode that doesn't execute further calls towards the SCU, which _must_ be reset by sending a _zero receipt_.
2. **Middleware not reachable or failing**: When the cash register doesn't receive any response from the Middleware (e.g. because of a network or server outage), receipts _must_ be re-sent as soon as the Middleware is reachable again, using the flag `0x0000000000010000` to switch to the _late-signing mode_. If required in the respective country, the Middleware will automatically take care of late-signig the receipts then. When the receipts have been successfully re-sent, failure-mode _must_ be left by sending a _zero receipt_.
3. **Cash register outage**: When the whole cash register/POS system is not working anymore (e.g. because of a power outage or a system failure) and the local fiscalization laws require the tracking of handwritten receipts (like e.g. in Germany) in that case, receipts _may_ be re-sent to the Middleware after the systems are back online with the _handwritten ftReceiptCaseFlag_ `0x0000000000080000`. This is optional, but recommended for consistentency in case of an audit.

#### Signature Cration Unit not reachable or failing
If the communication to the SCU fails (e.g. when the secure Signature Creation Device is not reachable), the POS System can continue to operate until the SCU is accessible again. Receipts created in a state where no communication is possible with the SCU are protected by the security mechanism of fiskaltrust. The fiskaltrust.Middleware will respond with the ftState = `0x02` "SCU communication failed". The POS-System receives the response and processes the data it contains. For following Requests no more communication attempts are done to avoid long waiting times for each Receipt request/Receipt response sequence.
<p>
We are using the "circuit breaker" design pattern for our failed mode. As we are not trying to communicate with the SCU once a call failed, the logic is preventing the failure from constantly recurring during a temporary failure. With this approach the PosOperators are not blocked in their daily business, as the middleware is avoiding long timeouts which would occur for every request to the SCU.
</p>

![no-scu-connection](./images/10-no-scu-connection.png)
  
When the SCU is reachable again, a Zero-Receipt must be sent, which forces a communication retry towards the SSCD. If the fiskaltrust.Middleware is able to connect to the SCU again, the ftState = 0x00 (ok) is returned to the POS system via the response and the fiskaltrust.Middleware is ready for normal operation again. Furthermore, the response contains a listing of the requests that were not signed by the SSCD. The requests affected by the failure of the communication with the SCU do not have to be sent to the Queue again after the problem has been resolved.

:::tip

We recommend to make the ZeroReceipt after a failure a manual operation, and not automatically send it via the POS system as soon as a failure state is returned. In most scenarios, only Operators can determine if the connection to the SSCD can be re-established, e.g. when the internet or the device is reconnected. Automatically sending zero-receipts might lead to unnecessary wait times if the connection can't be established at this point in time.

:::

![reestablished-scu-connection](./images/11-reestablished-connection.png)


#### Middleware not reachable or failing
If a cash register cannot communicate with the fiskaltrust.Middleware it is most likely due to a failure of the network connection, the Middleware host, or the Middleware itself. Such a failure means that the electronic recording system is not operational and there is no access to the appropriate journal.

![no-middleware-connection](./images/07-no-middleware-connection.png)

In this case, the following steps must be taken:

  - The cash register or input station must automatically produce a receipt and its copy.
  - The receipt must be marked with the identification "electronic recording system failed" and with the current failure counter.
  - This copy needs to be kept until the failure is resolved. The creation and storing of the receipt copy can also be done electronically by the cash register or terminal.
  - After re-establishing the communication to fiskaltrust.Middleware, the cash register or the input station must send all receipts marked with the identification "receipt copy, electronic recording system failed" to fiskaltrust.Middleware. The ReceiptCase must be flagged with the code "failed receipt" in order to indicate the failure to fiskaltrust.Middleware, which will then issue a receipt response with the the ftState "Late Signing Mode".

![late-signing-mode](./images/08-late-signing-mode.png)

After fiskaltrust.Middleware has received an "end of failure receipt" (i.e. a zero receipt), the status of failure is terminated by receiving a response with normal state code.

![end-late-signing-mode](./images/09-end-late-signing-mode.png)

#### Cash register outage
In case of a complete outage of the cash register, most fiscalization laws require to track the data on handwritten receipts or specific notebooks. For POS Systems that support tracking these receipts after the cash register comes back online, we recommend sending them to the Middleware as well to ensure a consistent receipt trace (e.g. in exports).

In this case, the following steps _may_ be taken:
- While the cash register is offline (e.g. due to a power outage, system failure, etc.) handwritten receipts should be created, and the receipts should be tracked (e.g. in a notebook) - depending on the local requirements.
- When the cash register is operational again, the receipts may be tracked in the cash-register.
- When this happens, the receipts should be sent to the Middleware as well, including the _ftReceiptCaseFlag_ `0x0000000000080000` to mark that this is a handwritten receipt.