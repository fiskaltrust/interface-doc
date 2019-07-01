## Function Structures

### iPOS Interface

#### Echo Function

There are no special requirements or laws for the French market.

#### Sign Function

If fiskaltrust.SecurityMechanism is run in FR (`0x4652…`) mode, then the sign function meets the BOI-TVA-DECL 30-10-30 requirements.

#### Journal Function

With this function, a variety of information can be retrieved from a fiskaltrust.SecurityMechanism.

**C# call iPos Journal:**
```cs
Stream stream = proxy.Journal(ftJournalType, 0, DateTime.UtcNow.Ticks);
```

<span id="_Toc527986842" class="anchor"></span>*Code 18. Call of iPos Journal (FR – BOI-TVA-DECL 30-10-30)*

A list with various possibilities for the request parameter ftJournalType is included in the reference table on page 102.
