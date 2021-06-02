---
slug: /poscreators/middleware-doc/austria/communication
title: Communication
---

## Communication

This chapter expands more on describing the ways to communicate with the fiskaltrust.Middleware covered in the Chapter ["Communication"](../../general/communication/communication.md) of the General Part, with country-specific information applicable to the Austrian market.

### WCF Web Service

#### SOAP

The fiskaltrust.SignatureCloud products use the SOAP protocol with the `<basicHttpsBinding>` to provide functionality via Internet. The fiskaltrust.SignatureBox, and fiskaltrust.SignatureCard products also use the `<NetTcpBinding>` and the `<NetNamedPipeBinding>`.

Moreover, the fiskaltrust.SignatureBox also provides the REST and the Stream protocols.


#### *Balancer Helper*

The Balancer helper uses the standard calls from .net WCF WebInvoke for the implementation of REST. There are a few particular characteristics, stemming from the REST specification, e.g.: the dates have to be indicated in "wire format", details about these conventions can be found at:

<https://docs.microsoft.com/en-us/dotnet/framework/wcf/feature-details/stand-alone-json-serialization>.

#### REST Helper

The REST Helper uses [NancyFX](http://nancyfx.org) as REST server which is significantly more flexible with regards to serialization than a standard WCF call.

**JS/jQuery Example:**
```js
function sign() {
  var url = $("#serviceurl").val();
  url += "/json/sign";
  var reqdata = JSON.parse($("#reqdata").val());

  $.ajax({
    url:         url,
    type:        "POST",
    contentType: "application/json;encoding=utf-8",
    crossDomain: true,
    data:        reqdata,
    success:     success,
    error:       error
  });
}

function success(data, textStatus, jqXHR) {
  $("#respdata").val(JSON.stringify(data));
}
```

<span id="_Toc527986835" class="anchor">

*Code 11. JS/jQuery Example calling the REST Web Service*

</span>

### Serial-stream or TCP-stream protocol

The serial interface is still very common - especially for type-2 cash registers and non PC-based devices. In order to address these devices with fiskaltrust.Middleware, there is a particular communication protocol via stream which contains functions and uses data encoded into JSON.

In case when a cash register or an input station are not able to address SOAP or REST services, this stream-based protocol can also be addressed via a TCP stream.

As a special extension, device-specifically, the data stream can also be sent directly to the printer and analysed. A new receipt with signature can be generated on the basis of this data. During this process, the generated receipt data are also stored in the ReceiptJournal.

The Stream helper implements a serial communication using TCP or serial ports. On this helper’s configuration page the main parameter is the "connection" which provides the information to reach fiskaltrust.Middleware .

The data must have the following sequence of bytes to be sent:

  - (byte) 2
  - ASCII encoded command ("echo", "sign", "journal")
  - (byte) 9
  - ASCII encoded data
    - In case of "echo" call, the data is simply the text
    - In case of "sign" call, the data is the JSON serialisation of the ReceiptRequest class
    - In case of "journal" call, the data is a string composed by the following long typed values separated by ; (semicolon)
      - type of journal
      - timestamp from
      - timestamp to
  - (byte) 3
  - one byte CRC7 calculation of the previous bytes.

The received response will be:

  - (byte) 2
  - ASCII encoded command ("echo", "sign", "journal")
  - (byte) 9
  - ASCII encoded data
    - In case of "echo" call, the result string
    - In case of "sign" call, the ReceiptResponse
    - In case of "journal" call, the output sequence depending on the type of the journal requested
  - (byte) 3

one byte CRC7 calculation of the previous bytes except the first (byte) 2.

#### Data structure for call and response

**Request:**
```
<STX (0x02)>Command["Echo"|"Sign"]<TAB (0x09)>Data[JSON-ReceiptRequest]<ETX (0x03)><CRC7>
```

**Response:**
```
<STX (0x02)>Command["Echo"|"Sign"]<TAB (0x09)>Data[JSON-ReceiptRequest]<ETX (0x03)><CRC7>
```

<span id="_Toc527986836" class="anchor">

*Code 12. Data Structure for call and response*

</span>