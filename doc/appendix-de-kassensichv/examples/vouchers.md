## Vouchers - Implicit Flow

Examples of single-purpose and multi-purpose requests and responses.

### Single-purpose voucher issuance

Request (single-purpose voucher issuance **within charge items**):

```json
{
    "ftCashBoxID": "cashboxid-guid",
    "cbTerminalID": "D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-08T10:00:00.01Z",
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
        "ftPayItemCase":4919338167972134913,
        "Moment":"2020-06-08T10:00:00.01Z"
        }
    ], 
    // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow) 
    "ftReceiptCase":4919338172267102209
}
```
Response:

```json
{
    "ftCashBoxID": "65a863b1-4a08-46da-9ab0-9201bedb5bb7",
    "ftQueueID": "ec35244c-a1bb-4748-bfa8-f4aaa01888ce",
    "ftQueueItemID": "bb41154c-73ca-4249-8914-ed99d5fbb266",
    "ftQueueRow": 53,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "DEMO1256",
    "ftReceiptIdentification": "ft2B#IT39",
    "ftReceiptMoment": "2020-06-08T11:34:43.1523882Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;DEMO1256;Kassenbeleg-V1;Beleg^15.00_0.00_0.00_0.00_0.00^15.00:Bar;39;875;2020-06-08T11:34:42.000Z;2020-06-08T11:34:43.000Z;ecdsa-plain-SHA384;unixTime;DdxmTYRiAIm3jQJYwb7dyRthzG0hErod7ZobdmIKpIVlVXESbSzTxZ0cVx08c4PgQ2S4oXedpUZV3vRXIU1q80IfrI2Xh4ZFMEq7515cfIcPIwsFQFEo7ZT58aDlBXlI;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "AP2zvSjWKtnFhs/PTFPw8Bldw9C2wHofpjF6cnPZSy0qv33Ib/vnNyjUDAFjZa6rMq8Pslz2lYXDnYv+/S+VhlJmqU4dUUeMRSTtVqMqG5sxAWLLpJu1JLxB3rOzNvr1"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeMTUuMDBfMC4wMF8wLjAwXzAuMDBfMC4wMF4xNS4wMDpCYXI="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "DdxmTYRiAIm3jQJYwb7dyRthzG0hErod7ZobdmIKpIVlVXESbSzTxZ0cVx08c4PgQ2S4oXedpUZV3vRXIU1q80IfrI2Xh4ZFMEq7515cfIcPIwsFQFEo7ZT58aDlBXlI"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134931,
            "Caption": "<qr-code-version>",
            "Data": "V0"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134932,
            "Caption": "<kassen-seriennummer>",
            "Data": "DEMO1256"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134933,
            "Caption": "<processType>",
            "Data": "Kassenbeleg-V1"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134934,
            "Caption": "<processData>",
            "Data": "Beleg^15.00_0.00_0.00_0.00_0.00^15.00:Bar"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "39"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "875"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-08T11:34:42.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-08T11:34:43.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134939,
            "Caption": "<sig-alg>",
            "Data": "ecdsa-plain-SHA384"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134940,
            "Caption": "<log-time-format>",
            "Data": "unixTime"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134941,
            "Caption": "<signatur>",
            "Data": "DdxmTYRiAIm3jQJYwb7dyRthzG0hErod7ZobdmIKpIVlVXESbSzTxZ0cVx08c4PgQ2S4oXedpUZV3vRXIU1q80IfrI2Xh4ZFMEq7515cfIcPIwsFQFEo7ZT58aDlBXlI"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134942,
            "Caption": "<public-key>",
            "Data": "BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134943,
            "Caption": "<vorgangsbeginn>",
            "Data": "2020-06-08T10:00:00.010Z"
        }
    ],
    "ftState": 4919338167972134912
}
```

### Single-purpose voucher redemption

1. Request (single-purpose voucher redemption **within charge items**):

```json
{
    "ftCashBoxID": "cashboxid-guid",
    "cbTerminalID": "D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-08T10:00:00.01Z",
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
    "ftReceiptCase":4919338172267102209
}
```

Response:
```json
{
    "ftCashBoxID": "65a863b1-4a08-46da-9ab0-9201bedb5bb7",
    "ftQueueID": "ec35244c-a1bb-4748-bfa8-f4aaa01888ce",
    "ftQueueItemID": "8b04dbbd-51c1-41f9-a0a2-0af7b6837754",
    "ftQueueRow": 54,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "DEMO1256",
    "ftReceiptIdentification": "ft2C#IT40",
    "ftReceiptMoment": "2020-06-08T11:40:44.2104535Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;DEMO1256;Kassenbeleg-V1;Beleg^0.00_0.00_0.00_0.00_0.00^;40;877;2020-06-08T11:40:49.000Z;2020-06-08T11:40:49.000Z;ecdsa-plain-SHA384;unixTime;Yjn55OMRLgXht/MymIlwhVSDc1H09UFMoDlWqrsIGl8JwidAF+4Wxb2tTIp1qTBjCtOyxZohaoYRVJem6LHAIfvpW6cUJVX0eRTDmTnjxYAcfu68lzmmS4SxxqhS2FuV;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "OMnoY7SBMe4tFWwPwXDGlH7lYAqRCj6xMObj/GPb6sFsSZqDwuJ25cgtmD/8axDabZaaiZy5xi72JyN5CAQkvH2pjh+9P8ZeJ6JZvT0m4lGuMMV4Wm5C/z3hSoqH2Cy7"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeMC4wMF8wLjAwXzAuMDBfMC4wMF8wLjAwXg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "Yjn55OMRLgXht/MymIlwhVSDc1H09UFMoDlWqrsIGl8JwidAF+4Wxb2tTIp1qTBjCtOyxZohaoYRVJem6LHAIfvpW6cUJVX0eRTDmTnjxYAcfu68lzmmS4SxxqhS2FuV"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134931,
            "Caption": "<qr-code-version>",
            "Data": "V0"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134932,
            "Caption": "<kassen-seriennummer>",
            "Data": "DEMO1256"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134933,
            "Caption": "<processType>",
            "Data": "Kassenbeleg-V1"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134934,
            "Caption": "<processData>",
            "Data": "Beleg^0.00_0.00_0.00_0.00_0.00^"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "40"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "877"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-08T11:40:49.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-08T11:40:49.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134939,
            "Caption": "<sig-alg>",
            "Data": "ecdsa-plain-SHA384"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134940,
            "Caption": "<log-time-format>",
            "Data": "unixTime"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134941,
            "Caption": "<signatur>",
            "Data": "Yjn55OMRLgXht/MymIlwhVSDc1H09UFMoDlWqrsIGl8JwidAF+4Wxb2tTIp1qTBjCtOyxZohaoYRVJem6LHAIfvpW6cUJVX0eRTDmTnjxYAcfu68lzmmS4SxxqhS2FuV"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134942,
            "Caption": "<public-key>",
            "Data": "BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134943,
            "Caption": "<vorgangsbeginn>",
            "Data": "2020-06-08T10:00:00.010Z"
        }
    ],
    "ftState": 4919338167972134912
}

```

Request (single-purpose voucher redemption **within pay items**):

```json
{
    "ftCashBoxID":"65a863b1-4a08-46da-9ab0-9201bedb5bb7",
    "cbTerminalID":"D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-08T10:00:00.01Z",
    "cbChargeItems":[
        {
            "Quantity":1.0,
            "Description":"RX234 MP3 Player",
            "Amount":15.00,
            "VATRate":19.00,
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
            "ftPayItemCase":4919338167972134922,
            "ftPayItemCaseData":"{\"VoucherNr\":\"UAUA91829182HH\"}"
        }
    ],
    // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow) 
    "ftReceiptCase":4919338172267102209
}
```
Response:
```json
{
    "ftCashBoxID": "65a863b1-4a08-46da-9ab0-9201bedb5bb7",
    "ftQueueID": "ec35244c-a1bb-4748-bfa8-f4aaa01888ce",
    "ftQueueItemID": "40a18092-a87f-4b68-8935-872432c86bbc",
    "ftQueueRow": 60,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "DEMO1256",
    "ftReceiptIdentification": "ft32#IT46",
    "ftReceiptMoment": "2020-06-08T12:55:21.1396774Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;DEMO1256;Kassenbeleg-V1;Beleg^15.00_0.00_0.00_0.00_0.00^;46;900;2020-06-08T12:55:40.000Z;2020-06-08T12:55:41.000Z;ecdsa-plain-SHA384;unixTime;YZViGkV+iNdykmu5Ww/IFC6kTYUCkIrI4YXHI+BTSbHS8c8nUsdhpeE7IRuoTnXSb+vDUgCZYU+Hr4rQ0ITcmb1d/Rza4d8C0c84htG7E5letOSEXNPJYTl0kdykaJEh;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "P7dXJW+UN8TgJpH1/ILdN5wblTIA2f+48Q5tN9Z8Jmucpkgk8brGKxL/OvsH8+r6XjZ7loInVPAAl7z6xABaa5+wubl5wesqeSGzv7SWpjzxKoAWrq+tHf32vyQjoGhf"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeMTUuMDBfMC4wMF8wLjAwXzAuMDBfMC4wMF4="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "YZViGkV+iNdykmu5Ww/IFC6kTYUCkIrI4YXHI+BTSbHS8c8nUsdhpeE7IRuoTnXSb+vDUgCZYU+Hr4rQ0ITcmb1d/Rza4d8C0c84htG7E5letOSEXNPJYTl0kdykaJEh"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134931,
            "Caption": "<qr-code-version>",
            "Data": "V0"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134932,
            "Caption": "<kassen-seriennummer>",
            "Data": "DEMO1256"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134933,
            "Caption": "<processType>",
            "Data": "Kassenbeleg-V1"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134934,
            "Caption": "<processData>",
            "Data": "Beleg^15.00_0.00_0.00_0.00_0.00^"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "46"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "900"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-08T12:55:40.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-08T12:55:41.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134939,
            "Caption": "<sig-alg>",
            "Data": "ecdsa-plain-SHA384"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134940,
            "Caption": "<log-time-format>",
            "Data": "unixTime"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134941,
            "Caption": "<signatur>",
            "Data": "YZViGkV+iNdykmu5Ww/IFC6kTYUCkIrI4YXHI+BTSbHS8c8nUsdhpeE7IRuoTnXSb+vDUgCZYU+Hr4rQ0ITcmb1d/Rza4d8C0c84htG7E5letOSEXNPJYTl0kdykaJEh"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134942,
            "Caption": "<public-key>",
            "Data": "BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134943,
            "Caption": "<vorgangsbeginn>",
            "Data": "2020-06-08T10:00:00.010Z"
        }
    ],
    "ftState": 4919338167972134912
}
```

### Multi-purpose voucher issuance

Request (multi-purpose voucher issuance **within pay items**):

```json
{
    "ftCashBoxID": "cashboxid-guid",
    "cbTerminalID": "D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-08T10:00:00.01Z",
    "cbChargeItems":[],
    "cbPayItems":[
        {
            "Quantity":1.0,
            "Description":"Voucher for food and drinks",
            "Amount":-150.00,
            // 0x4445 0000 0000 000D (voucher, not taxable) 
            "ftPayItemCase":4919338167972134925,
            "ftPayItemCaseData":"{\"VoucherNr\":\"UAUA91829182HH\"}",
            "Moment":"2020-06-08T10:00:00.01Z"
        },
        {
            "Quantity":1.0,
            "Description":"Cash",
            "Amount":150.00, 
            // 0x4445 0000 0000 0001 (cash payment in national currency) 
            "ftPayItemCase":4919338167972134913,
            "Moment":"2020-06-08T10:00:00.01Z"
        }
    ], 
     // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow) 
    "ftReceiptCase":4919338172267102209
}
```
Response:

```json
{
    "ftCashBoxID": "65a863b1-4a08-46da-9ab0-9201bedb5bb7",
    "ftQueueID": "ec35244c-a1bb-4748-bfa8-f4aaa01888ce",
    "ftQueueItemID": "82f89e91-d334-48ec-8f62-e526b0d65e8d",
    "ftQueueRow": 55,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "DEMO1256",
    "ftReceiptIdentification": "ft2D#IT41",
    "ftReceiptMoment": "2020-06-08T11:47:57.2549995Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;DEMO1256;Kassenbeleg-V1;Beleg^0.00_0.00_0.00_0.00_0.00^150.00:Bar_-150.00:Unbar;41;879;2020-06-08T11:48:08.000Z;2020-06-08T11:48:08.000Z;ecdsa-plain-SHA384;unixTime;QtdOvOi1prM0+SUVm/Y9LvKr05ZvQ19W59JCFdbtnKnC+rKaw0ksfdArVRGPQrj9H+Vw0axskhXSRcMryBISE5SkGAeLMFik06jl/cKalArBXSKhu96uyLmEC/ao747Z;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "WH821UyRp/9nJ1V8iVebQ2qgk0DbiWACGEZm4JsjEymvRA9rs2TfcbW7Y/M7MiLkhtcP32knMFPHuXQA3aHMsyZLYi5Sn1VlxmeZJKCZ1xj+lnhVNTlXZDmXsskW/+OS"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeMC4wMF8wLjAwXzAuMDBfMC4wMF8wLjAwXjE1MC4wMDpCYXJfLTE1MC4wMDpVbmJhcg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "QtdOvOi1prM0+SUVm/Y9LvKr05ZvQ19W59JCFdbtnKnC+rKaw0ksfdArVRGPQrj9H+Vw0axskhXSRcMryBISE5SkGAeLMFik06jl/cKalArBXSKhu96uyLmEC/ao747Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134931,
            "Caption": "<qr-code-version>",
            "Data": "V0"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134932,
            "Caption": "<kassen-seriennummer>",
            "Data": "DEMO1256"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134933,
            "Caption": "<processType>",
            "Data": "Kassenbeleg-V1"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134934,
            "Caption": "<processData>",
            "Data": "Beleg^0.00_0.00_0.00_0.00_0.00^150.00:Bar_-150.00:Unbar"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "41"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "879"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-08T11:48:08.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-08T11:48:08.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134939,
            "Caption": "<sig-alg>",
            "Data": "ecdsa-plain-SHA384"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134940,
            "Caption": "<log-time-format>",
            "Data": "unixTime"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134941,
            "Caption": "<signatur>",
            "Data": "QtdOvOi1prM0+SUVm/Y9LvKr05ZvQ19W59JCFdbtnKnC+rKaw0ksfdArVRGPQrj9H+Vw0axskhXSRcMryBISE5SkGAeLMFik06jl/cKalArBXSKhu96uyLmEC/ao747Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134942,
            "Caption": "<public-key>",
            "Data": "BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134943,
            "Caption": "<vorgangsbeginn>",
            "Data": "2020-06-08T10:00:00.010Z"
        }
    ],
    "ftState": 4919338167972134912
}

```

Request (multi-purpose voucher issuance **within charge items**):

```json
{
    "ftCashBoxID":"cashboxid-guid",
    "cbTerminalID":"D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-08T10:00:00.01Z",
    "cbChargeItems":[
        {
            "Quantity":1.0,
            "Description":"Voucher for food and drinks",
            "Amount":150.00,
            "VATRate":0.0,
            // 0x4445000000000060 (voucher sale not taxable)
            "ftChargeItemCase":4919338167972135008,
            "ftChargeItemCaseData":"{\"VoucherNr\":\"UAUA91829182HH\"}",
            "Moment":"2020-06-08T10:00:00.01Z"
        }
    ],
    "cbPayItems":[
        {
            "Quantity":1.0,
            "Description":"Cash",
            "Amount":150.00,
            // 0x4445 0000 0000 0001 (cash payment in national currency)   
            "ftPayItemCase":4919338167972134913,
            "Moment":"2020-06-08T10:00:00.01Z"
        }
    ],
    // 0x4445 0000 0000 0001 (pos-receipt) + 0000 0001 0000 0000 (implicit flow) 
    "ftReceiptCase":4919338172267102209
}
```
Rsponse:

```json
{
    "ftCashBoxID": "65a863b1-4a08-46da-9ab0-9201bedb5bb7",
    "ftQueueID": "ec35244c-a1bb-4748-bfa8-f4aaa01888ce",
    "ftQueueItemID": "952db53a-f569-4baa-be86-007ca591b575",
    "ftQueueRow": 56,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "DEMO1256",
    "ftReceiptIdentification": "ft2E#IT42",
    "ftReceiptMoment": "2020-06-08T11:59:40.8667577Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;DEMO1256;Kassenbeleg-V1;Beleg^0.00_0.00_0.00_0.00_150.00^150.00:Bar;42;881;2020-06-08T12:00:02.000Z;2020-06-08T12:00:02.000Z;ecdsa-plain-SHA384;unixTime;Y93Z6PoBibHtla/QQzL9IULpDzXc76Zpl6LpgHudpf/Fznhx/U7WpR6dnxWK+16QMbJ44pqNhnkwoulYx3ExTqWRQXJLlQshpwhWzwNwC6pRB017m9lugmsVrudkyecG;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "i3mBec2m2qa/7gXrbMBORfSELRuHvrN63q46uD7PltaWKwXdb/yd+isgBCyv5mq4gWgkGvZNj2bVz48zCvE9TCXiuZsFQYvr4F/++z6YdFQj1dT0iZ+xs28C2rVdzCNz"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeMC4wMF8wLjAwXzAuMDBfMC4wMF8xNTAuMDBeMTUwLjAwOkJhcg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "Y93Z6PoBibHtla/QQzL9IULpDzXc76Zpl6LpgHudpf/Fznhx/U7WpR6dnxWK+16QMbJ44pqNhnkwoulYx3ExTqWRQXJLlQshpwhWzwNwC6pRB017m9lugmsVrudkyecG"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134931,
            "Caption": "<qr-code-version>",
            "Data": "V0"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134932,
            "Caption": "<kassen-seriennummer>",
            "Data": "DEMO1256"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134933,
            "Caption": "<processType>",
            "Data": "Kassenbeleg-V1"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134934,
            "Caption": "<processData>",
            "Data": "Beleg^0.00_0.00_0.00_0.00_150.00^150.00:Bar"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "42"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "881"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-08T12:00:02.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-08T12:00:02.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134939,
            "Caption": "<sig-alg>",
            "Data": "ecdsa-plain-SHA384"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134940,
            "Caption": "<log-time-format>",
            "Data": "unixTime"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134941,
            "Caption": "<signatur>",
            "Data": "Y93Z6PoBibHtla/QQzL9IULpDzXc76Zpl6LpgHudpf/Fznhx/U7WpR6dnxWK+16QMbJ44pqNhnkwoulYx3ExTqWRQXJLlQshpwhWzwNwC6pRB017m9lugmsVrudkyecG"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134942,
            "Caption": "<public-key>",
            "Data": "BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134943,
            "Caption": "<vorgangsbeginn>",
            "Data": "2020-06-08T10:00:00.010Z"
        }
    ],
    "ftState": 4919338167972134912
}
```

### Multi-purpose voucher redemption

Request (multi-purpose voucher redemption **within pay items**):

```json
{
    "ftCashBoxID":"cashboxid-guid",
    "cbTerminalID":"D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-08T10:00:00.01Z",
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
    "ftReceiptCase":4919338172267102209
}
```

Response:

```json
{
    "ftCashBoxID": "65a863b1-4a08-46da-9ab0-9201bedb5bb7",
    "ftQueueID": "ec35244c-a1bb-4748-bfa8-f4aaa01888ce",
    "ftQueueItemID": "d287de01-f945-47f3-8e21-3385974b1afa",
    "ftQueueRow": 57,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "DEMO1256",
    "ftReceiptIdentification": "ft2F#IT43",
    "ftReceiptMoment": "2020-06-08T12:13:09.1833015Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;DEMO1256;Kassenbeleg-V1;Beleg^7.00_0.00_0.00_0.00_0.00^-143.00:Bar_150.00:Unbar;43;888;2020-06-08T12:13:17.000Z;2020-06-08T12:13:17.000Z;ecdsa-plain-SHA384;unixTime;QhCdENV8bvbuxbvfNjwAQ9oWrHwj9eyMRxJqRs5SvZEMJ0aaii1WWYmm6JxFsTdJX70qVpP5hnSvNzWAEdjcHNz3yTCYSsngV+gtzrDk7FPsFgcx/EAl4DTXTvRrNEG6;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "J1NNi+DqSdRAGPuaeYIf9u4OVsbDqfP2HI3vYAfntg+pHdZB53gsB+NvUZHD3SQtOI4gRtZwvm6XPV3qUZk91cJ8pk79TmxmHYYioyaGnEvvqWhZwvB6vo3TXReEuBtn"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeNy4wMF8wLjAwXzAuMDBfMC4wMF8wLjAwXi0xNDMuMDA6QmFyXzE1MC4wMDpVbmJhcg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "QhCdENV8bvbuxbvfNjwAQ9oWrHwj9eyMRxJqRs5SvZEMJ0aaii1WWYmm6JxFsTdJX70qVpP5hnSvNzWAEdjcHNz3yTCYSsngV+gtzrDk7FPsFgcx/EAl4DTXTvRrNEG6"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134931,
            "Caption": "<qr-code-version>",
            "Data": "V0"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134932,
            "Caption": "<kassen-seriennummer>",
            "Data": "DEMO1256"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134933,
            "Caption": "<processType>",
            "Data": "Kassenbeleg-V1"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134934,
            "Caption": "<processData>",
            "Data": "Beleg^7.00_0.00_0.00_0.00_0.00^-143.00:Bar_150.00:Unbar"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "43"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "888"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-08T12:13:17.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-08T12:13:17.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134939,
            "Caption": "<sig-alg>",
            "Data": "ecdsa-plain-SHA384"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134940,
            "Caption": "<log-time-format>",
            "Data": "unixTime"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134941,
            "Caption": "<signatur>",
            "Data": "QhCdENV8bvbuxbvfNjwAQ9oWrHwj9eyMRxJqRs5SvZEMJ0aaii1WWYmm6JxFsTdJX70qVpP5hnSvNzWAEdjcHNz3yTCYSsngV+gtzrDk7FPsFgcx/EAl4DTXTvRrNEG6"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134942,
            "Caption": "<public-key>",
            "Data": "BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134943,
            "Caption": "<vorgangsbeginn>",
            "Data": "2020-06-08T10:00:00.010Z"
        }
    ],
    "ftState": 4919338167972134912
}
```

Request (multi-purpose voucher redemption **within charge items**):

```json
{
    "ftCashBoxID":"cashboxid-guid",
    "cbTerminalID":"D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-08T10:00:00.01Z",
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
            "VATRate":0.0,
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
    "ftReceiptCase":4919338172267102209
}
```
Response:

```json
{
    "ftCashBoxID": "65a863b1-4a08-46da-9ab0-9201bedb5bb7",
    "ftQueueID": "ec35244c-a1bb-4748-bfa8-f4aaa01888ce",
    "ftQueueItemID": "14bc8bcc-bd0f-4adc-bb34-c4c8e35d58e0",
    "ftQueueRow": 58,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "DEMO1256",
    "ftReceiptIdentification": "ft30#IT44",
    "ftReceiptMoment": "2020-06-08T12:19:54.3153262Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;DEMO1256;Kassenbeleg-V1;Beleg^7.00_0.00_0.00_0.00_-150.00^-143.00:Bar;44;890;2020-06-08T12:20:08.000Z;2020-06-08T12:20:08.000Z;ecdsa-plain-SHA384;unixTime;Nbak5xnATCmR67/vlJ3pxYV0Po+UMJD3SIf3kntp6ZJC4DfqyuYig1epGUKllMOGhHAmY4k1VeysRq0G1jc1ORHI9GUeONaCtb1wVUaEIPZ5Vx1Leb1tN6YWyudCBM8/;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "bPlHWbSXS2MIK4gBQ+WIzr0DTO2uv682Pbz15vG7GYQ+CLsWdTlLgtcUz9J3RNaEX7mvnlDTAxLXiWPkRXdH5M9YGxdIdEYHQxJE9FMgEtnJ3gvduWoNPuERd8FjbLQf"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeNy4wMF8wLjAwXzAuMDBfMC4wMF8tMTUwLjAwXi0xNDMuMDA6QmFy"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "Nbak5xnATCmR67/vlJ3pxYV0Po+UMJD3SIf3kntp6ZJC4DfqyuYig1epGUKllMOGhHAmY4k1VeysRq0G1jc1ORHI9GUeONaCtb1wVUaEIPZ5Vx1Leb1tN6YWyudCBM8/"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134931,
            "Caption": "<qr-code-version>",
            "Data": "V0"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134932,
            "Caption": "<kassen-seriennummer>",
            "Data": "DEMO1256"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134933,
            "Caption": "<processType>",
            "Data": "Kassenbeleg-V1"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134934,
            "Caption": "<processData>",
            "Data": "Beleg^7.00_0.00_0.00_0.00_-150.00^-143.00:Bar"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "44"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "890"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-08T12:20:08.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-08T12:20:08.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134939,
            "Caption": "<sig-alg>",
            "Data": "ecdsa-plain-SHA384"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134940,
            "Caption": "<log-time-format>",
            "Data": "unixTime"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134941,
            "Caption": "<signatur>",
            "Data": "Nbak5xnATCmR67/vlJ3pxYV0Po+UMJD3SIf3kntp6ZJC4DfqyuYig1epGUKllMOGhHAmY4k1VeysRq0G1jc1ORHI9GUeONaCtb1wVUaEIPZ5Vx1Leb1tN6YWyudCBM8/"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134942,
            "Caption": "<public-key>",
            "Data": "BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134943,
            "Caption": "<vorgangsbeginn>",
            "Data": "2020-06-08T10:00:00.010Z"
        }
    ],
    "ftState": 4919338167972134912
}

```
