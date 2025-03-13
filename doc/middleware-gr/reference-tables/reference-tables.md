---
slug: /poscreators/middleware-doc/greece/reference-tables
title: Reference tables
---

# Reference tables
This chapter expands on the reference tables covered in [Reference Tables in General Part](../../general/reference-tables/reference-tables.md#reference-tables), with country-specific information applicable to the Greek market. The respective tables can be found in the following sub-sections.

As the Middleware abstracts processes and data over multiple markets/countries, there is a specific mapping for Greek market. This mapping is based upon the overall tagging system which gives the additional benefit of giving all receipts, chargeitems and payitems also a semantical value. The following section describes the overall format.

## Format

Every case that is sent to the middleware, or every Item that is being returned from the middleware is based upon this tagging system. For the tagging system we are using hex based numbers since they make things like, flagging and having a consistend numbering scheme easier.

The overall format is built up of 4 sections:

_4752_2000_0010_0001 

_CCCC_vIII_gggg_xxxx 

| **Value**            | **Description**                                                                                     |
|----------------------|-----------------------------------------------------------------------------------------------------|
|CCCC|(e.g 4752): ASCII of two letter ISO country code (https://en.wikipedia.org/wiki/ISO_3166-1) (e.g. GR = 4752) |
|vIII|(e.g. 2000): This section is for versioning the tagging system (currently v2) and for future use  |
|gggg|(e.g. 0010): These items are used for flags. Flags can change the basic behavior of a given type, but will live the overall semantical meaning of a type the same. (e.g. voiding of a receipt)|
|xxxx|(e.g. 0001): The last category is usually case specific but always consists of 4 numbers |