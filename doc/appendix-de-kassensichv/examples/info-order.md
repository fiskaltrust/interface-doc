
info-order


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
"ftPayItemCase": 4707387510509010945
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


}


Request
{
"ftCashBoxID":"c094f242-91d5-4343-9c54-bce85f70d0d6",
"ftPosSystemId":"b3dc6573-96d9-e611-80f7-5065f38adae1",
"cbTerminalID":"1",
"cbReceiptReference":"10",
"cbReceiptMoment":"2019-10-25T13:48:04.323Z",
"cbChargeItems":
[{
"Quantity":1.0,
"Description":"Bier 0,5 lt",
"Amount":22.80000000000000000000000000,
"VATRate":19.0000,
"ftChargeItemCase":4919338167972134913,
"ftChargeItemCaseData":"",
"VATAmount":3.640336134453781512605042017,
"CostCenter":"1",
"ProductGroup":"Bier",
"ProductNumber":"101",
"ProductBarcode":"",
"Unit":"Liter",
"UnitQuantity":6.0000
},{
"Quantity":1.0,
"Description":"Schnitzel",
"Amount":55.20000000000000000000000000,
"VATRate":7.0000,
"ftChargeItemCase":4919338167972134914,
"ftChargeItemCaseData":"",
"VATAmount":3.61121495327102803738317757,
"CostCenter":"1",
"ProductGroup":"Speisen",
"ProductNumber":"102",
"ProductBarcode":"",
"Unit":"Stk",
"UnitQuantity":6.0000
}],
"cbPayItems":[],
// 0x4445 0000 0000 0010 (info-order) + 0000 0001 0000 0000 (implicit flow)
"ftReceiptCase":4919338172267102224,
"cbReceiptAmount":78.00,
"cbUser":"Chef"
}


