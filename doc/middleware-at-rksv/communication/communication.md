---
slug: /poscreators/middleware-doc/austria/communication
title: Communication
---

## Communication
This chapter expands more on describing the ways to communicate with the fiskaltrust.Middleware covered in the [Communication](../../general/communication/communication.md) chapter of the General Part, with country-specific information applicable to the Austrian market.

### Supported protocols
Only WCF-based protocols are currently supported natively by the Austrian version of the Middleware. It is, however, possible to use REST communication via a [provided helper](#rest-helper). Please refer to the [general part](../../general/communication/communication.md) for more details.

Additionally, it's also possible to communicate via a serial interface by using [another helper](#serial-stream-or-tcp-stream-helper).

### Communication helpers
These helpers can be used to enable additional communication protocols or features. These additional components "wrap" the WCF endpoints of Queue packages and map their methods to the respective protocol or functionality.

#### REST helper
The REST helper publishes a RESTful HTTP endpoint and can hence be used to connect to the Middleware from most programming languages and frameworks. 

While this helper is highly configurable, the default settings can be left untouched in most regular rollout scenarios. Additionally, this helper includes an inbuilt _request balancer_ that can be enabled to shuffle requests to multiple available Queues. This might be especially interesting when a high amount of requests must be processed in a short timeframe.

By default, the REST helper uses the first non-busy Queue when balancing is disabled. We recommend setting a fixed Queue ID in the helper's configuration when operating it in this mode. If only a single Queue is present in the respective cashbox, it's not required to directly reference this Queue therefore.

#### Serial-stream or TCP-stream helper
This helper can be used to connect devices that only support serial communication (e.g. type-2 cash registers and non PC-based devices) to the fiskaltrust.Middleware. It wraps the Queues's endpoints into a serial protocol with JSON payloads.

In case when a cash register or an input station are not able to address SOAP or REST services, this stream-based protocol can also be addressed via a TCP stream.

As a special extension, device-specifically, the data stream can also be sent directly to the printer and analysed there. A new receipt with a signature can be generated on the basis of this data. During this process, the generated receipt data is also stored in the ReceiptJournal.

The Stream helper implements a serial communication using TCP or serial ports. On this helper’s configuration page the main parameter is the "connection" which provides the information to reach the fiskaltrust.Middleware.

The data must have the following sequence of bytes to be sent:
```
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
```

The response will be formatted as follows:
```
- (byte) 2
- ASCII encoded command ("echo", "sign", "journal")
- (byte) 9
- ASCII encoded data
  - In case of "echo" call, the result string
  - In case of "sign" call, the ReceiptResponse
  - In case of "journal" call, the output sequence depending on the type of the journal requested
- (byte) 3
- one byte CRC7 calculation of the previous bytes except the first (byte) 2.
```

##### Data structure for request and response

Request:
```
<STX (0x02)>Command["Echo"|"Sign"]<TAB (0x09)>Data[JSON-ReceiptRequest]<ETX (0x03)><CRC7>
```

Response:
```
<STX (0x02)>Command["Echo"|"Sign"]<TAB (0x09)>Data[JSON-ReceiptRequest]<ETX (0x03)><CRC7>
```

#### Balancer helper
The balancer helper can be used to load balance incoming calls onto multiple instances of the fiskaltrust.Middleware. The reason for using this helper is usually a high amount of calls that could overload a single Middleware instance. The configuration page requires a specific parameter for choosing the way the balancing will be managed (_least active_ or _round robin_).

The journal stream response is composed by a concatenation of streams of all Middleware instances managed by the Balancer helper, separated by a `\0` (zero) character.

As this helper uses the standard calls from _.NET WCF WebInvoke_ for the implementation of REST, there are a few particular characteristics that have to be taken care of when using it, e.g.: the dates have to be indicated in "wire format". Details about these conventions can be found in the [official documentation](https://docs.microsoft.com/en-us/dotnet/framework/wcf/feature-details/stand-alone-json-serialization).

