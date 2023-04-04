---
slug: /poscreators/middleware-doc/italy/data-structures
title: Data structures
---

# Data structures

This chapter expands on the descriptions of the country-specific Data Structures, covered in the Chapter ["Data Structures"](../../general/data-structures/data-structures.md) of the General Part, with information applicable to the Italian market.

## Receipt Request

### Single fields

Fields from the receipt request that need special handling for the Italian market are listed below:

| **Field name**               | **Data type**        | **Default Value Mandatory Field**                     | **Description**                                                                                                                                                                                                                                                                                                        | **Version** |
|------------------------------|----------------------|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| `cbTerminalID`               | `string (50)`        | Mandatory                                             | The unique identification of the input station/cash register/terminal within a ftCashBoxID                                                                                                                                                                                                                             | 1.3         |
| `cbUser`                     | `string (50)`        | Mandatory                                             | Name (not ID) of the user who creates the receipt.                                                                                                                                                                                                                                                                     | 1.3         |
| `cbReceiptReference`         | `string (50)`        | Mandatory | Used to connect all requests referring to the same business action.                                                                                                                                                                                                                                                    | 1.3         |
| `ftPosSystemId`              | `GUID / string (36)` | Mandatory                                             | This field identifies and documents the type and software version of the POS-System sending the request. It is used to identify the used POS-System. The POS-System itself has to be created in the fiskaltrust.Portal and its ID can be implemented as a constant value by the PosCreator. | 1.3         |
| `cbPreviousReceiptReference` | `string`             | Optional                                              | Points to `cbReceiptReference` of a previous request. Used to connect requests representing a business action. E.g. split, merge or reference a receipt to be voided.                                                                                                                                                  | 1.3         |


Examples of using `cbReceiptReference` and `cbPreviousReceiptReference` to connect requests representing a business action can be found in our Postman collection.



