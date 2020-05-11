## Vouchers - Implicit Flow

Examples of single-purpose and multi-purpose requests.

### Single-purpose voucher issuance

Request:

```json
{
   "ftCashBoxID":"cashboxid-guid",
   "ftPosSystemId":"possystemid-guid",
   "cbTerminalID":"terminalid",
   "cbReceiptReference":"233348",
   "cbReceiptMoment":"2019-07-19T12:52:34.9609375Z",
   "cbChargeItems":[
      {
         "Quantity":1.0,
         "Description":"Voucher for RX234 MP3 Player",
         "Amount":15.00,
         "VATRate":19.0000,
         // 0x4445000000000061 (coupon sales normal)
         "ftChargeItemCase":4919338167972135009,
         "ftChargeItemCaseData":"{\"VoucherNr\":\"UAUA91829182HH\"}"
      }
   ],
   "cbPayItems":[
      {
         "Quantity":1.0,
         "Description":"Cash",
         "Amount":15.00,
         // 0x4445 0000 0000 0001 (cash payment in national currency)         
         "ftPayItemCase":4919338167972134913
      }
   ],
   // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow)   
   "ftReceiptCase":4919338172267102209,
   "cbArea":"Store 56"
}
```

### Single-purpose voucher redemption

Request (voucher within charge items):

```json
{
   "ftCashBoxID":"cashboxid-guid",
   "ftPosSystemId":"possystemid-guid",
   "cbTerminalID":"terminalid",
   "cbReceiptReference":"233349",
   "cbReceiptMoment":"2020-05-08T12:52:34.9609375Z",
   "cbChargeItems":[
   	 {
         "Quantity":1.0,
         "Description":"RX234 MP3 Player",
         "Amount":15.00,
         "VATRate":19.0000,
         // 0x4445000000000011 (delivery normal)
         "ftChargeItemCase":4919338167972134929
      },
      {
         "Quantity":1.0,
         "Description":"Voucher for RX234 MP3 Player",
         "Amount":-15.00,
         "VATRate":19.0000,
         // 0x4445000000000069 (coupon redeem normal)
         "ftChargeItemCase":4919338167972135017,
         "ftChargeItemCaseData":"{\"VoucherNr\":\"UAUA91829182HH\"}"
      }
   ],
   "cbPayItems":[],
   // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow)   
   "ftReceiptCase":4919338172267102209,
   "cbArea":"Store 56"
}
```

Request (voucher within pay items):

```json
{
   "ftCashBoxID":"cashboxid-guid",
   "ftPosSystemId":"possystemid-guid",
   "cbTerminalID":"terminalid",
   "cbReceiptReference":"233349",
   "cbReceiptMoment":"2020-05-08T12:52:34.9609375Z",
   "cbChargeItems":[
   	 {
         "Quantity":1.0,
         "Description":"RX234 MP3 Player",
         "Amount":15.00,
         "VATRate":19.0000,
         // 0x4445000000000011 (delivery normal)
         "ftChargeItemCase":4919338167972134929
      }
   ],
   "cbPayItems":[
      {
         "Quantity":1.0,
         "Description":"Voucher for RX234 MP3 Player",
         "Amount":15.00,
         // 0x4445 0000 0000 000A (internal / material consumption)         
         "ftPayItemCase":4919338167972134922
         "ftPayItemCaseData":"{\"VoucherNr\":\"UAUA91829182HH\"}"
      }
   ],
   // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow)   
   "ftReceiptCase":4919338172267102209,
   "cbArea":"Store 56"
}
```

### Multi-purpose voucher issuance

Request (voucher within pay items):

```json
{
   "ftCashBoxID":"cashboxid-guid",
   "ftPosSystemId":"possystemid-guid",
   "cbTerminalID":"terminalid",
   "cbReceiptReference":"233349",
   "cbReceiptMoment":"2020-05-08T12:52:34.9609375Z",
   "cbChargeItems":[ ],
   "cbPayItems":[
      {
         "Quantity":1.0,
         "Description":"Voucher for food and drinks",
         "Amount":-150.00,
         // 0x4445 0000 0000 000D (voucher, not taxable)         
         "ftPayItemCase":4919338167972134925,
         "ftPayItemCaseData":"{\"VoucherNr\":\"UAUA91829182HH\"}"
      },
      {
         "Quantity":1.0,
         "Description":"Cash",
         "Amount":150.00,
         // 0x4445 0000 0000 0001 (cash payment in national currency)         
         "ftPayItemCase":4919338167972134913
      }
   ],
   // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow)   
   "ftReceiptCase":4919338172267102209,
   "cbArea":"Jack in the Box 1256"
}
```
Request (voucher within charge items):

```json
{
   "ftCashBoxID":"cashboxid-guid",
   "ftPosSystemId":"possystemid-guid",
   "cbTerminalID":"terminalid",
   "cbReceiptReference":"233349",
   "cbReceiptMoment":"2020-05-08T12:52:34.9609375Z",
   "cbChargeItems":[
      {
         "Quantity":1.0,
         "Description":"Voucher for food and drinks",
         "Amount":150.00,
         // 0x4445000000000060 (voucher sale not taxable)
         "ftChargeItemCase":4919338167972135008,
         "ftChargeItemCaseData":"{\"VoucherNr\":\"UAUA91829182HH\"}"
      }
   ],
   "cbPayItems":[
      {
         "Quantity":1.0,
         "Description":"Cash",
         "Amount":150.00,
         // 0x4445 0000 0000 0001 (cash payment in national currency)         
         "ftPayItemCase":4919338167972134913
      }
   ],
   // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow)   
   "ftReceiptCase":4919338172267102209,
   "cbArea":"Jack in the Box 1256"
}
```


### Multi-purpose voucher redemption

Request (voucher within pay items):

```json
{
   "ftCashBoxID":"cashboxid-guid",
   "ftPosSystemId":"possystemid-guid",
   "cbTerminalID":"terminalid",
   "cbReceiptReference":"233349",
   "cbReceiptMoment":"2020-05-08T12:52:34.9609375Z",
   "cbChargeItems":[
      {
         "Quantity":2.0,
         "Description":"0,5 Soda Zitrone",
         "Amount":7.00,
         "VATRate":19.0000,
         "ftChargeItemCase":4919338167972134913
      }
   ],
   "cbPayItems":[
   	  {
         "Quantity":1.0,
         "Description":"Voucher for food and drinks",
         "Amount":150.00,
         // 0x4445 0000 0000 000D (voucher, not taxable)         
         "ftPayItemCase":4919338167972134925,
         "ftChargeItemCaseData":"{\"VoucherNr\":\"UAUA91829182HH\"}"
      },
      {
         "Quantity":1.0,
         "Description":"Cash",
         "Amount":-143.00,
         // 0x4445 0000 0000 0001 (cash payment in national currency)         
         "ftPayItemCase":4919338167972134913
      }
   ],
   // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow)   
   "ftReceiptCase":4919338172267102209,
   "cbArea":"Jack in the Box 1256"
}
```

Request (voucher within charge items):

```json
{
   "ftCashBoxID":"cashboxid-guid",
   "ftPosSystemId":"possystemid-guid",
   "cbTerminalID":"terminalid",
   "cbReceiptReference":"233349",
   "cbReceiptMoment":"2020-05-08T12:52:34.9609375Z",
   "cbChargeItems":[
      {
         "Quantity":2.0,
         "Description":"0,5 Soda Zitrone",
         "Amount":7.00,
         "VATRate":19.0000,
         "ftChargeItemCase":4919338167972134913
      },
      {
         "Quantity":1.0,
         "Description":"Voucher for food and drinks",
         "Amount":-150.00,
         // 0x4445000000000068 (voucher redeem not taxable)
         "ftChargeItemCase":4919338167972135016,
         "ftChargeItemCaseData":"{\"VoucherNr\":\"UAUA91829182HH\"}"
      }
   ],
   "cbPayItems":[
      {
         "Quantity":1.0,
         "Description":"Cash",
         "Amount":-143.00,
         // 0x4445 0000 0000 0001 (cash payment in national currency)         
         "ftPayItemCase":4919338167972134913
      }
   ],
   // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow)   
   "ftReceiptCase":4919338172267102209,
   "cbArea":"Jack in the Box 1256"
}
```

