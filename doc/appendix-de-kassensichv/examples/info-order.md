# Info-order - implicit flow examples

The info-order implicit flow is used to persist orders.

`cbReceiptReference` can be used in multiple receipt-request/receipt-response (sign-calls) to connect multiple actions into a business-action. Each `cbReceiptReference` can only be used once within an explicit flow. Only one "start-transaction" can be done with one specific `cbReceiptReference` because it is mapped 1:1 to the TSE's ongoing transaction.
The implicit flow uses "start-transaction" and "finish-transaction" within the same receipt-request/receipt-response. Therefore, the `cbReceiptReference` has no impact on ongoing transactions as long as there wasn't a "start-transaction" with the same `cbReceiptReference` before.

An additional method to connect multiple actions to an ongoing business-action is to reference a previous action by `cbPreviouseReceiptReference`.

```json
{
   "ftCashBoxID":"cashboxid-guid",
   "ftPosSystemId":"possystemid-guid",
   "cbTerminalID":"terminalid",
   "cbReceiptReference":"233348",
   "cbReceiptMoment":"2019-07-19T12:52:34.9609375Z",
   "cbChargeItems":[
      {
         "Quantity":2.0,
         "Description":"0,5 Soda Zitrone",
         "Amount":5.6,
         "VATRate":19.0000,
         "ftChargeItemCase":4919338167972134913
      }
   ],
   "cbPayItems":[
      {
         "Quantity":1.0,
         "Description":"Internal",
         "Amount":5.6,
         // 0x4445 0000 0000 000A (internal / material consumption)         
         "ftPayItemCase":4919338167972134922
      }
   ],
   // 0x4445 0000 0000 0010 (info-order) + 0000 0001 0000 0000 (implicit flow)   
   "ftReceiptCase":4919338172267102224,
   "cbArea":"Tisch 56",
   "cbPreviousReceiptReference":"233347"
}
```

Response
```json
{
   "ftCashBoxID":"cashboxid-guid",
   "ftPosSystemId":"possystemid-guid",
   "cbTerminalID":"terminalid",
   "cbReceiptReference":"233348",
   "ftQueueID":"queueid-guid",
   "ftQueueItemID":"queueitemid-guid",
   "ftQueueRow":"queuerow",
   "ftReceiptMoment":"2019-10-25T13:48:04.323Z",
   "ftCashboxIdentification":"fiskaltrust1=tse-client-id",
   "ftReceiptIdentification":"ft[queue-receiptnumerator-hex]#IT[tse-transaction]"   
   "ftSignatures"[
      {
         "ftSignatureFormat":13,
         //0x4445000000000010 (start-transaction-result)         
         "ftSignatureType":4919338167972134928,
         "caption":"start-transaction-signature",
         "data":"[startTransactionResult]"
      },
      {
         "ftSignatureFormat":13,
         //0x4445000000000011 (finish-transaction-payload)         
         "ftSignatureType":4919338167972134929,
         "caption":"finish-transaction-payload",
         "data":"[finishTransactionPayload]"
      },
      {
         "ftSignatureFormat":13, 
         //0x4445000000000012 (finish-transaction-result)         
         "ftSignatureType":4919338167972134930,
         "caption":"finish-transaction-payload",
         "data":"[finishTransactionResult]"
      }
   ]
}
```
