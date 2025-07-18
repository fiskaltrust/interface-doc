---
slug: /poscreators/middleware-doc/france/function-structures
title: Function structures
---

## Function structures

### iPOS Interface

#### Echo Function

There are no special requirements or laws for the French market.
In case of the French product ChaîneCloud, there is a special condition when the echo-Function is called with an empty string as a Message, which forces to reinitialize the fiskaltrust.Queue in the fiskaltrust.Middleware.
There is an example in our Postman Collection ["Echo null"](https://middleware-samples.docs.fiskaltrust.cloud/#a6bcafe6-08e1-49a9-b10e-725d1404365e)

#### Sign Function

If fiskaltrust.SecurityMechanism is run in FR (`0x4652…`) mode, then the sign function meets the BOI-TVA-DECLA 30-10-30 requirements.

#### Journal Function

With this function, a variety of information can be retrieved from a fiskaltrust.SecurityMechanism.

**C# call iPos Journal:**
```cs
Stream stream = proxy.Journal(ftJournalType, 0, DateTime.UtcNow.Ticks);
```

<span id="_Toc527986842" class="anchor"></span>*Code 18. Call of iPos Journal (FR – BOI-TVA-DECLA 30-10-30)*

A list with various possibilities for the request parameter ftJournalType is included in the reference table ["Type of Journal: ftJournalType"](../reference-tables/reference-tables.md#t-type-of-journal-ftjournaltype-160).
