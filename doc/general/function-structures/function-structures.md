---
slug: /poscreators/middleware-doc/general/function-structures
title: Function structures
---

## Function structures

### iPOS Interface
This interface is a communication channel for interacting with the fiskaltrust.Middleware. It provides three basic functions: "echo", "sign", and "journal". The functions "echo" and "sign" return bare-objects, the function "journal" returns a wrapped-object.

#### Echo Function
This function provides fast and easy communication checks. The transferred message is sent back directly.

**Asynchronous _Echo_ call (v1 - Germany and Italy):**
```cs
var request = new ifPOS.v1.EchoRequest { Message = "Message" };
ifPOS.v1.EchoResponse response = await proxy.EchoAsync(request);
```

**Synchronous _Echo_ call (v0 - Austria and France):**
```cs
string result = proxy.Echo("Message");
```

#### Sign Function
This is the key function of the fiskaltrust.Middleware. Once the sign function is called, the receipt data is transferred for processing. The result of the processing is then sent back as receipt response.

**Asynchronous _Sign_ call (v1 - Germany and Italy):**
```cs
var request = new ifPOS.v1.ReceiptRequest();
// Fill the properties of the request
ifPOS.v1.ReceiptResponse response = await proxy.SignAsync(request);
```

**Synchronous _Sign_ call (v0 - Austria and France):**
```cs
var request = new ifPOS.v0.ReceiptRequest();
// Fill the properties of the request
ifPOS.v0.ReceiptResponse response = proxy.Sign(request);
```

#### Journal Function
With this function, a variety of information can be retrieved from the fiskaltrust.Middleware, ranging from the status information to a general notifications protocol.

**Asynchronous _Journal_ call (v1 - Germany and Italy):**
```cs
var request = new ifPOS.v1.JournalRequest();
// Fill the properties of the request
await foreach (var response in proxy.JournalAsync(request))
{
    byte[] arr = response.Chunk.ToArray();
    // Handle resulting byte chunk by e.g. writing it to a file
}
```

**Synchronous _Journal_ call (v0 - Austria and France):**
```cs
Stream stream = proxy.Journal(ftJournalType, 0, DateTime.UtcNow.Ticks);
```

A list with possible values for the request parameter ftJournalType is provided in the reference table ["Type of Journal: ftJournalType"](../reference-tables/reference-tables.md#t-type-of-signature-ftsignaturetype-127). The journal depends on national requirements and therefore the function has to run in the appropriate mode: exporting data in chunks, or as a whole.

##### Timestamps

The journal function expects the timestamps to be [.NET Ticks](https://docs.microsoft.com/en-us/dotnet/api/system.datetime.ticks?view=net-5.0#remarks).

The following conversion formulas can be used to convert between unix time and .NET Ticks:

| Conversion             | Formula                                    |
|------------------------|--------------------------------------------|
| `unix time` -> `Ticks` | `621355968000000000 + unixtime * 10000000` |
| `Ticks` -> `unix time` | `(ticks - 621355968000000000) / 10000000`  |
