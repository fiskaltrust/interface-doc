
info-order
implicit flow

this is unsed to persist orders

same `cbReceiptReference` in multiple receiptrequest/receiptresponse (sign-calls) can be used to connect multiple actions into a business-action. each `cbReceiptReference` can only be used once within a explicit flow. this also meanse only one time start-transaction can be done with one specific `cbReceiptReference`, because it is mapped 1:1 to the ongoing transaction of the (tse).
the implicit flow uses start-transaction and finish-transaction within the same receiptrequest/receiptresponse. therefore in this case the `cbReceiptReference` has no impact on already ongoing transactions as long as there wasn't a start-transaction with same `cbReceiptReference` before.

and additional method to connect multiple actions to a ongoing business-action is to reference a previouse action by `cbPreviouseReceiptReference`.


Request

{
"ftCashBoxID": "cashboxid-guid",
"ftPosSystemId": "possystemid-guid",
"cbTerminalID": "terminalid",
"cbReceiptReference": "233348",
"cbReceiptMoment": "2019-07-19T12:52:34.9609375Z",
"cbChargeItems": [
{
"Quantity": 2.0,
"Description": "0,5 Soda Zitrone",
"Amount": 5.6,
"VATRate":19.0000,
"ftChargeItemCase":4919338167972134913
}
],
"cbPayItems": [
{
"Quantity": 1.0,
"Description": "Internal",
"Amount": 5.6,
// 0x4445 0000 0000 000A (internal / material consumption)
"ftPayItemCase": 4919338167972134922
}
],
// 0x4445 0000 0000 0010 (info-order) + 0000 0001 0000 0000 (implicit flow)
"ftReceiptCase":4919338172267102224,
"cbArea": "Tisch 56",
"cbPreviousReceiptReference": "233347"
}


Response
{
"ftCashBoxID": "cashboxid-guid",
"ftPosSystemId": "possystemid-guid",
"cbTerminalID": "terminalid",
"cbReceiptReference": "233348",

"ftQueueID":"queueid-guid",
"ftQueueItemID":"queueitemid-guid",
"ftQueueRow":"queuerow",
"ftReceiptMoment":"2019-10-25T13:48:04.323Z",

"ftCashboxIdentification":"fiskaltrust1=tse-client-id",
"ftReceiptIdentification":"ft[queueraw-hex]#IT[tse-transaction]"

ftSignatures[
        {
            "ftSignatureFormat":13,
            //0x4445000000000010 (start-transaction-result)
            "ftSignatureType": 4919338167972134928,
            "caption": "start-transaction-signature",
            "data": "[startTransactionResult]"
        },
        {
            "ftSignatureFormat":13,
            //0x4445000000000011 (finish-transaction-payload)
            "ftSignatureType": 4919338167972134929,
            "caption": "finish-transaction-payload",
            "data": "[finishTransactionPayload]"
        },
        {
            "ftSignatureFormat": 13,
            //0x4445000000000012 (finish-transaction-result)
            "ftSignatureType": 4919338167972134930,
            "caption": "finish-transaction-payload",
            "data": "[finishTransactionResult]"
        }
]

}
