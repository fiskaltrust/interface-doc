---
slug: /poscreators/middleware-doc/italy/reference-tables/ftstate
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
| `0000_0001 ` | **Security Mechanism is out Out of Operation** <br /> Queue is not started or already stopped.  | 1.3.45                 |
| `0000_0002 ` | **SCU (Signature Creation Unit) temporary out of service**<br />SCU (Signature Creation Unit) temporary out of service.<br />For at least one receipt, it was not possible to receive the signature from an allocated SCU, therefore the security mechanism has been put into "signature creation device out of service" mode. Regardless of whether an allocated SCU is available again or not, the mode remains in place until a ZeroReceipt cleans up the state and takes the market specific action required.| 1.3.45                 |
| `0000_0008 ` | **Deferred Queue Mode / Late Signing Mode is active**<br />When the Cashregister doesn’t reach the queue, it piles up the ReceiptRequests while continuing doing business. Also, while a major failure of the cashregister or a power outage, handwritten paperreceipts are pilled up while continuing doing business. After getting back to a full functional state, this piled up ReceiptRequests are sent to the queue, having the original cbReceiptMoment of the business case and ReceiptCase tagged/flagged with 0001 (Deffered Queue / Late Signing) or 0008 (Handwritten).<br />A result of this is a marker within the ftState, which can be resolved via ZeroReceipt. Reason of the marker is a mismatch between processed time along the receipt chain and also a manual event to clean up the state and maybe also notify 3rd parties of outage.| 1.3.45                 |
| `0000_0040 ` | **Message Pending** <br />Middleware/Queue is a headless background service, but there are situations, where a communication with the cashier / operator or the cashregister is necessary. For example, if the last daily closing was missed or if a special condition related to the signature creation unit or service happened. <br /> This is the moment, where the Message Pending flag is set by the middleware, which should be signalized by the possystem to the cashier. By executing a ZeroReceipt, the cashier can then read the message or instruction at the printed receipt or the displayed receipt. <br />Related to local regulations, this receipt may be stored/archived with/for bookkeeping purpose, if this is the case, this is also visualized.  | 1.3.45                 |
| `0000_0100 ` | **DailyClosing due** <br />When the first cbReceiptMoment used since last DailyClosing and the current/latest cbReceiptMoment in the ReceiptRequest have a date-gap of more than two days (for example, first since last daily closing is 24/08 and current is 26/08) then this state indicates, a Daily Closing should be done. <br/>DailyClosing is an essential part of the security mechanism and also executes additional market specific cleanup tasks. Therefore each queue should do a DailyClsoing to clears persist change of business date and also change of business period.  | 1.3.45                 |
| `EEEE_EEEE ` | **Error** <br />Something went wrong wile processing the last request. QueueItem exists but didn’t reach the state of a ReceiptItem and didn’t consume a ftReceiptNumber within the chain. Error reason is shown within the responded ftSignatureItems. <br />This happens for example, if the ReceiptCase is not recognized or wrong.   | 1.3.45                 |
| `FFFF_FFFF ` | **Fail** <br /> Something went wrong while processing the last request and nothing was persisted within the Queue. Fail reason is shown within the responded ftSignatureItems. <br /> This happens for example, when the flag ReceiptRequest is used, after communication outage, and there is no proper processed item found.   | 1.3.45                 |


#### llll -local flags
TBD

