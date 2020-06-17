## Returnables

### Income from returnables (DE: Pfand)

#### Transport aid (income)

Request:

```json
{
    "ftCashBoxID": "a489fec1-9f6d-4413-9a28-285a37519d67",
    "cbTerminalID": "D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-08T10:00:00.01Z",
    "cbChargeItems":[
        {
         "Quantity":200.0,
         "Description":"Toni Box",
         "Amount":3000.00,
         "VATRate":19.00,
         "ftChargeItemCase":4919338167972135009
        },
        {
         "Quantity":1.0,
         "Description":"Euro Palette",
         "Amount":20.00,
         "VATRate":7.00,
         // ftChargeItemCase 0x4445000000000022 returnable discounted-1 - 7% VAT
         // because of § 12 Abs. 1 UStG (currently 7% VAT)
         "ftChargeItemCase":4919338167972134946
        }
    ],
    "cbPayItems":[
        {
            "Quantity":1.0,
            "Description":"Cash",
            "Amount":3020.00,      
            "ftPayItemCase":4919338167972134913,
            "Moment":"2020-06-08T10:00:00.01Z"
        }
    ], 
    "ftReceiptCase":4919338172267102209
}
```

Response:

```json
{
    "ftCashBoxID": "a489fec1-9f6d-4413-9a28-285a37519d67",
    "ftQueueID": "6eb8217e-cc80-4ea2-ab52-ac81ca531ba0",
    "ftQueueItemID": "45a489f0-4663-466b-9734-5fc8d0b5a4de",
    "ftQueueRow": 68,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "ARC1234",
    "ftReceiptIdentification": "ft43#IT60",
    "ftReceiptMoment": "2020-06-16T10:58:00.1303103Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;ARC1234;Kassenbeleg-V1;Beleg^3,000.00_20.00_0.00_0.00_0.00^3,020.00:Bar;60;1326;2020-06-16T10:58:12.000Z;2020-06-16T10:58:12.000Z;ecdsa-plain-SHA384;unixTime;Y6QLrsGBeB80wgNVp1EYrMR+vKO/i3RVWZ+P3LYNNejB/Px+i3XA5DJQMgCvj7lKKj8uRaDtGDWRgPxuXc01yokYXSLazsiU8aJhHmnkdPqbUdMakIz5Qc6tmgauJJIX;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "GW1XsCTPQzEIPOvv3fii+rRtv6XnJJreUpBpXh7FgA9PPNYv4yHOSRisxNsUeGMDGU97mjv2ktMzLv7yqF6cHD1F8PS+6xsvtf+ODWGvJkZ7rScNI40BNOtT652pdW5c"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeMywwMDAuMDBfMjAuMDBfMC4wMF8wLjAwXzAuMDBeMywwMjAuMDA6QmFy"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "Y6QLrsGBeB80wgNVp1EYrMR+vKO/i3RVWZ+P3LYNNejB/Px+i3XA5DJQMgCvj7lKKj8uRaDtGDWRgPxuXc01yokYXSLazsiU8aJhHmnkdPqbUdMakIz5Qc6tmgauJJIX"
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
            "Data": "ARC1234"
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
            "Data": "Beleg^3,000.00_20.00_0.00_0.00_0.00^3,020.00:Bar"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "60"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "1326"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-16T10:58:12.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-16T10:58:12.000Z"
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
            "Data": "Y6QLrsGBeB80wgNVp1EYrMR+vKO/i3RVWZ+P3LYNNejB/Px+i3XA5DJQMgCvj7lKKj8uRaDtGDWRgPxuXc01yokYXSLazsiU8aJhHmnkdPqbUdMakIz5Qc6tmgauJJIX"
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
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 0,
            "Caption": "S A N D B O X",
            "Data": "6eb8217e-cc80-4ea2-ab52-ac81ca531ba0"
        }
    ],
    "ftState": 4919338167972134912
}
```
#### Encirclement of goods (income)

Request:

```json
{
    "ftCashBoxID": "a489fec1-9f6d-4413-9a28-285a37519d67",
    "cbTerminalID": "D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-08T10:00:00.01Z",
    "cbChargeItems":[
        {
         "Quantity":1.0,
         "Description":"Bergbauern Milch",
         "Amount":2.00,
         "VATRate":7.00,
         "ftChargeItemCase":4919338167972135009
        },
        {
         "Quantity":1.0,
         "Description":"Pfandflasche",
         "Amount":0.40,
         "VATRate":7.00,
         // ftChargeItemCase 0x4445000000000022 returnable discounted-1 - 7% VAT
         // because the milk has also 7% VAT
         "ftChargeItemCase":4919338167972134946
        }
    ],
    "cbPayItems":[
        {
            "Quantity":1.0,
            "Description":"Cash",
            "Amount":2.40,      
            "ftPayItemCase":4919338167972134913,
            "Moment":"2020-06-08T10:00:00.01Z"
        }
    ], 
    "ftReceiptCase":4919338172267102209
}
```
Response:

```json
{
    "ftCashBoxID": "a489fec1-9f6d-4413-9a28-285a37519d67",
    "ftQueueID": "6eb8217e-cc80-4ea2-ab52-ac81ca531ba0",
    "ftQueueItemID": "4cd837b4-b300-4f66-a328-33cebfd2baf7",
    "ftQueueRow": 77,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "ARC1234",
    "ftReceiptIdentification": "ft4C#IT69",
    "ftReceiptMoment": "2020-06-16T15:46:29.9087722Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;ARC1234;Kassenbeleg-V1;Beleg^2.00_0.40_0.00_0.00_0.00^2.40:Bar;69;1396;2020-06-16T15:46:43.000Z;2020-06-16T15:46:44.000Z;ecdsa-plain-SHA384;unixTime;C3zQ/BzbsvWwNFZHvJb/5DgWR6FfJ/3JR/QizLlaVplc+tU0paK7uArqctSLVr1GfA8EL2Jivv5VrvYigI9TUA+SrQapyj6jpt6Asd5lvHbv4u20zh+J0jfSTKxzVrUy;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "C/oB2cKyyjvZpMoQVKeI3biX7vZVLo/Xa4YtAuloHqWz0lLsb3pB0OZYGk7RRXUQZXiRezXl0cuiGmNdF3PaDU54VHOInuAjj6JKz31OuX8FwVQaMv/RTQwjIx5Hgt+z"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeMi4wMF8wLjQwXzAuMDBfMC4wMF8wLjAwXjIuNDA6QmFy"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "C3zQ/BzbsvWwNFZHvJb/5DgWR6FfJ/3JR/QizLlaVplc+tU0paK7uArqctSLVr1GfA8EL2Jivv5VrvYigI9TUA+SrQapyj6jpt6Asd5lvHbv4u20zh+J0jfSTKxzVrUy"
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
            "Data": "ARC1234"
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
            "Data": "Beleg^2.00_0.40_0.00_0.00_0.00^2.40:Bar"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "69"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "1396"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-16T15:46:43.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-16T15:46:44.000Z"
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
            "Data": "C3zQ/BzbsvWwNFZHvJb/5DgWR6FfJ/3JR/QizLlaVplc+tU0paK7uArqctSLVr1GfA8EL2Jivv5VrvYigI9TUA+SrQapyj6jpt6Asd5lvHbv4u20zh+J0jfSTKxzVrUy"
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
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 0,
            "Caption": "S A N D B O X",
            "Data": "6eb8217e-cc80-4ea2-ab52-ac81ca531ba0"
        }
    ],
    "ftState": 4919338167972134912
}
```
### Return with settlement of the pledged amount (DE: Pfandrückzahlung)

#### Transport aid (return)

Request:
```json
{
    "ftCashBoxID": "a489fec1-9f6d-4413-9a28-285a37519d67",
    "cbTerminalID": "D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-15T15:52:00.01Z",
    "cbChargeItems":[
        {
         "Quantity":1.0,
         "Description":"Euro Palette",
         "Amount":-20.00,
         "VATRate":7.00,
         // ftChargeItemCase 0x444500000000002A returnable reverse discounted-1 - 7%
         // because of § 12 Abs. 1 UStG (currently 7% VAT)
         "ftChargeItemCase":4919338167972134954
        }
    ],
    "cbPayItems":[
        {
            "Quantity":1.0,
            "Description":"Cash",
            "Amount":-20.00,      
            "ftPayItemCase":4919338167972134913,
            "Moment":"2020-06-15T15:52:00.01Z"
        }
    ],
    "ftReceiptCase":4919338172267102209
}
```
Response:

```json
{
    "ftCashBoxID": "a489fec1-9f6d-4413-9a28-285a37519d67",
    "ftQueueID": "6eb8217e-cc80-4ea2-ab52-ac81ca531ba0",
    "ftQueueItemID": "7e8c46dc-b9c0-4ea0-8c30-75191955dd85",
    "ftQueueRow": 79,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "ARC1234",
    "ftReceiptIdentification": "ft4E#IT71",
    "ftReceiptMoment": "2020-06-16T15:52:20.0595628Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;ARC1234;Kassenbeleg-V1;Beleg^0.00_-20.00_0.00_0.00_0.00^-20.00:Bar;71;1400;2020-06-16T15:52:38.000Z;2020-06-16T15:52:38.000Z;ecdsa-plain-SHA384;unixTime;Ia/rlbAtxC4i71ZUKnvsOgRmbxuBEB2er1B1oRxjswLtZPWqDd+0g403iphOqK9YDbs5ya9NWnpli9QK4ufIgrgc/0VHhY5Tt2ZDkg+eNuqfGgocer/4YJWZ/NFpHFiR;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "I4THJm6e98ntIK6mh+g7DyDfjlR31VrQUFUMWdyn86n7Q2ujiw6J+uT9wQ+MLm7qElYt2gkIXeTN/pb1QF8hbyiZmpWlgxYNqXsn76bn/N2rpQJhj67t9Gf24sIL4t1W"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeMC4wMF8tMjAuMDBfMC4wMF8wLjAwXzAuMDBeLTIwLjAwOkJhcg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "Ia/rlbAtxC4i71ZUKnvsOgRmbxuBEB2er1B1oRxjswLtZPWqDd+0g403iphOqK9YDbs5ya9NWnpli9QK4ufIgrgc/0VHhY5Tt2ZDkg+eNuqfGgocer/4YJWZ/NFpHFiR"
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
            "Data": "ARC1234"
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
            "Data": "Beleg^0.00_-20.00_0.00_0.00_0.00^-20.00:Bar"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "71"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "1400"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-16T15:52:38.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-16T15:52:38.000Z"
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
            "Data": "Ia/rlbAtxC4i71ZUKnvsOgRmbxuBEB2er1B1oRxjswLtZPWqDd+0g403iphOqK9YDbs5ya9NWnpli9QK4ufIgrgc/0VHhY5Tt2ZDkg+eNuqfGgocer/4YJWZ/NFpHFiR"
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
            "Data": "2020-06-15T15:52:00.010Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 0,
            "Caption": "S A N D B O X",
            "Data": "6eb8217e-cc80-4ea2-ab52-ac81ca531ba0"
        }
    ],
    "ftState": 4919338167972134912
}
```

#### Encirclement of goods (return)

Request:
```json
{
    "ftCashBoxID": "a489fec1-9f6d-4413-9a28-285a37519d67",
    "cbTerminalID": "D",
    "cbReceiptReference":"RR223",
    "cbReceiptMoment":"2020-06-16T16:02:00.01Z",
    "cbChargeItems":[
        {
         "Quantity":1.0,
         "Description":"Pfandflasche",
         "Amount":-0.40,
         "VATRate":7.00,
         // ftChargeItemCase 0x444500000000002A returnable reverse discounted-1 - 7% VAT
         // because when it was sold it had also 7% VAT
         "ftChargeItemCase":4919338167972134954
        }
    ],
    "cbPayItems":[
        {
            "Quantity":1.0,
            "Description":"Cash",
            "Amount":-0.40,      
            "ftPayItemCase":4919338167972134913,
            "Moment":"2020-06-16T16:02:00.01Z"
        }
    ], 
    "ftReceiptCase":4919338172267102209
}
```
Response:

```json
{
    "ftCashBoxID": "a489fec1-9f6d-4413-9a28-285a37519d67",
    "ftQueueID": "6eb8217e-cc80-4ea2-ab52-ac81ca531ba0",
    "ftQueueItemID": "0e443eff-c389-4974-b1c2-da9d3a77bc76",
    "ftQueueRow": 82,
    "cbTerminalID": "D",
    "cbReceiptReference": "RR223",
    "ftCashBoxIdentification": "ARC1234",
    "ftReceiptIdentification": "ft51#IT74",
    "ftReceiptMoment": "2020-06-16T16:02:45.730922Z",
    "ftSignatures": [
        {
            "ftSignatureFormat": 3,
            "ftSignatureType": 4919338167972134913,
            "Caption": "www.fiskaltrust.de",
            "Data": "V0;ARC1234;Kassenbeleg-V1;Beleg^0.00_-0.40_0.00_0.00_0.00^-0.40:Bar;74;1411;2020-06-16T16:02:51.000Z;2020-06-16T16:02:51.000Z;ecdsa-plain-SHA384;unixTime;HYGYlo4LtxhsVAbioo451eoMbcjfHTVkkY/DTSaqu7RrOiQHk9dJEpuS+bwWq7eqUbZFy62sK0eoLDeMRjSTZ62gzdaA+w+YjGM3IW4or2Srya9feQjJ7ATHGZteXx3k;BFhnDaPRoUxAYUktkUqoaV2l+TVpLdT7wPTRFDkZcHXFS7WZhGsvKh/lT3jEYJLNLD/sjQVg/JrobVU5kue/k2d9sK7dnWPdMgYlr4E4Ff8ziKclzs1u7BuOYJ4jRI65rg=="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134928,
            "Caption": "start-transaction-signature",
            "Data": "ec0e/t+Z4MbpI3VDYmx/tcx1h3+9FowVZ+A/XW0dQlIQLozAL2/K8h+es3j2HFCDBCR00xkvBG8qbd28YroXZCksGwBEpVzuOO4WV1cXL/luaheUn2bPalHbgD+HpZMQ"
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134929,
            "Caption": "finish-transaction-payload",
            "Data": "QmVsZWdeMC4wMF8tMC40MF8wLjAwXzAuMDBfMC4wMF4tMC40MDpCYXI="
        },
        {
            "ftSignatureFormat": 13,
            "ftSignatureType": 4919338167972134930,
            "Caption": "finish-transaction-signature",
            "Data": "HYGYlo4LtxhsVAbioo451eoMbcjfHTVkkY/DTSaqu7RrOiQHk9dJEpuS+bwWq7eqUbZFy62sK0eoLDeMRjSTZ62gzdaA+w+YjGM3IW4or2Srya9feQjJ7ATHGZteXx3k"
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
            "Data": "ARC1234"
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
            "Data": "Beleg^0.00_-0.40_0.00_0.00_0.00^-0.40:Bar"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134935,
            "Caption": "<transaktions-nummer>",
            "Data": "74"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134936,
            "Caption": "<signatur-zaehler>",
            "Data": "1411"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134937,
            "Caption": "<start-zeit>",
            "Data": "2020-06-16T16:02:51.000Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 4919338167972134938,
            "Caption": "<log-time>",
            "Data": "2020-06-16T16:02:51.000Z"
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
            "Data": "HYGYlo4LtxhsVAbioo451eoMbcjfHTVkkY/DTSaqu7RrOiQHk9dJEpuS+bwWq7eqUbZFy62sK0eoLDeMRjSTZ62gzdaA+w+YjGM3IW4or2Srya9feQjJ7ATHGZteXx3k"
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
            "Data": "2020-06-16T16:02:00.010Z"
        },
        {
            "ftSignatureFormat": 1,
            "ftSignatureType": 0,
            "Caption": "S A N D B O X",
            "Data": "6eb8217e-cc80-4ea2-ab52-ac81ca531ba0"
        }
    ],
    "ftState": 4919338167972134912
}
```
