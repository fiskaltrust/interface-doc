---
slug: /poscreators/middleware-doc/austria/reference-tables/ftstate
title: 'Service Status: ftState'
---

# Service Status: ftState

## Format

_CCCC_vlll_gggg_gggg_ 

#### v - version
version 2

#### gggg_gggg - global tagging/flag
| **Value**            | **Description**                                                                                     | **Middleware Version** |
|----------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `0000_0001 ` | **Security Mechanism is out Out of Operation** <br />Queue is not started or already stopped.  | 1.3.45                 |
| `0000_0002 ` | **SCU (Signature Creation Unit) temporary out of service**<br />For at least one receipt, it was not possible to receive the signature from an allocated SCU, therefore the security mechanism has been put into "signature creation device out of service" mode. Regardless of whether an allocated SCU is available again or not, the mode remains in place until a ZeroReceipt cleans up the state and takes the market specific action required.| 1.3.45                 |
| `0000_0004 ` | **SCU (Signature Creation Unit) permanently out of service**<br />The status "SSCD temporary out of service" was activated more than 48h ago. Thus a FinanzOnline notification has been generated.For conduct and termination of this mode, see "SSCD temporary out of service".| 1.3.45                 |
| `0000_0008 ` | **Deferred Queue Mode / Late Signing Mode is active**<br />When the cash register doesn’t reach the queue, it queues up the receipt requests while continuing to do business. Also, with a major failure of the cash register or a power outage, handwritten paper receipts are queued up while continuing to do business. After getting back to a full functional state, these queued-up ReceiptRequests are sent to the queue, having the original cbReceiptMoment of the business case and ReceiptCase tagged/flagged with 0001 (Deferred Queue / Late Signing) or 0008 (Handwritten). <br />A result of this is a marker within the ftState, which can be resolved via ZeroReceipt. The reason for the marker is a mismatch between processed time along the receipt chain and a manual event to clean up the state and maybe notify 3rd parties of an outage. | 1.3.45                 |
| `0000_0010 ` | **MonthlyClosing due** <br />If the latest monthly has not been performed, the service will signal this. This status does not impact the signature conduct of the service; it is merely an indicative notification.  | 1.3.45                 |
| `0000_0020 ` | **AnnualClosing due** <br />If the latest annual closing has not been performed, the service will signal this. This status does not impact the signature conduct of the service; it is merely an indicative notification.  | 1.3.45                 |
| `0000_0040 ` | **Message Pending** <br />Middleware/Queue is a headless background service, but there are situations where communication with the cashier/operator or the cash register is necessary. For example, if the last daily closing was missed or if a special condition related to the signature creation unit or service happened. This is the moment when the message pending flag is set by the middleware, which should be signalled to the cashier by the POS system. By executing a ZeroReceipt, the cashier can read the message or instruction on the printed or displayed receipt.<br />Related to local regulations, this receipt may be stored/archived with/for bookkeeping purposes; if this is the case, this is also visualized.  | 1.3.45                 |
| `0000_0080 ` | **Backup SSCD in use** <br />The receipt was signed by a signature creation unit configured for backup use.  | 1.3.45                 |
| `EEEE_EEEE ` | **Error** <br />Something went wrong while processing the last request. QueueItem exists but didn’t reach the state of a ReceiptItem and didn’t consume a ftReceiptNumber within the chain. Error reason is shown within the responded ftSignatureItems.  <br />This happens, for example, if the ReceiptCase is not recognized or is wrong.   | 1.3.45                 |
| `FFFF_FFFF ` | **Fail** <br />Something went wrong while processing the last request, and nothing persisted within the Queue. Fail reason is shown within the responded ftSignatureItems. <br />This happens, for example, when the flag ReceiptRequest is used after a communication outage, and no properly processed item is found.  | 1.3.45                 |


#### llll -local flags

cba c=reserved; b=reporting; a=scu related 

| **Value**            | **Description**                                                                                     | **Middleware Version** |
|----------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `001 ` | **[RT-Printer\|RT-Server\|Government Service] not reachable** <br />Responded in case of a zero-receipt and other hard dependencies to the service.   | 1.3.45                 |

