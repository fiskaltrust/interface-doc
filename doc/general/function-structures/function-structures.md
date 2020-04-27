## Function structures

### iPOS Interface

This interface is a communication channel for interacting with the fiskaltrust.Middleware. It provides three basic functions: "echo", "sign", and "journal". The functions "echo" and "sign" return bare-objects, the function "journal" returns a wrapped-object.

#### Echo Function

This function provides fast and easy communication checks. The transferred message is sent back directly.

**C# call iPos Echo:**
```cs
string result = proxy.Echo("Message");
```

<span id="_Toc527986830" class="anchor"></span>*Code 6. Call to iPos Echo*

#### Sign Function

This is the key function of the fiskaltrust.Middleware. Once the sign function is called, the receipt data is transferred for processing. The result of the processing is then sent back as receipt response.

**C# call iPos Sign:**
```cs
fiskaltrust.ifPOS.v0.ReceiptRequest req;
//fill the properties of this request
fiskaltrust.ifPOS.v0.ReceiptResponse resp = proxy.Sign(req);
```

<span id="_Toc527986831" class="anchor"></span>*Code 7. Call to iPos Sign*

#### Journal Function

With this function, a variety of information can be retrieved from the fiskaltrust.Middleware, ranging from the status information to a general notifications protocol.

**C# call iPos Journal:**
```cs
Stream stream = proxy.Journal(ftJournalType, 0, DateTime.UtcNow.Ticks);
```

<span id="_Toc527986832" class="anchor"></span>*Code 8. Call to iPos Journal*

A list with possible values for the request parameter ftJournalType is provided in the reference the table ["Type of Journal: ftJournalType"](../reference-tables/reference-tables.md#t-type-of-signature-ftsignaturetype-127). The journal depends on national requirements and therefore the function has to run in the appropriate mode: exporting data in chunks, or as a whole.
