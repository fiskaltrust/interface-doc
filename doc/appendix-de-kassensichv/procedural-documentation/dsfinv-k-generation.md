## Procedural documentation for DSFinV-K generation


### DSFinV-K export

You can download the current version of the DSFinV-K specification [here](https://www.bzst.de/DE/Unternehmen/Aussenpruefungen/DigitaleSchnittstelleFinV/digitaleschnittstellefinv_node.html).

Based on the the current version of the DSFinV-K specification, this chapter explains how the DSFinV-K export is structured, shows how the previously described input values are mapped by fisklatrust to the files and data of the DSFinV-K export and defines how additional, for the DSFInV-K required, values can be sent to the ft.Middleware. Furthermore, it describes how the marking of actions (DE: Vorgänge) can be made by connecting business actions (DE: Geschäftsvorfälle) and other procedures, occurrences and events (DE: Andere Vorgänge). 

#### Structure

The DSFinV-K export is divided into the following sections/modules: 

- Single recordings module (DE: Einzelaufzeichnungsmodul)
- Master data module (DE: Stammdatenmodul)
- Cashpoint closing module (DE: Kassenabschlussmodul)

Each module consists of several files. In the following we will go into the individual modules and have look to the files and data contained in them. Details about the meaning of the files and their individual fields can be found in the official DSFinV-K specification.

#### Mandatory data

This chapter lists the data fields that are mandatory and must be provided by the cashpoint. For details on how to provide them, please see the chapters below. They offer information for all DSFinV-K fields. 

| **Fieldname**            | **Module**          | **Description**          |
|----------------------|--------------------------|---------------------|
| `BON_ID` | Single recordings | Action-ID (DE: Vorgangs-ID)|
| `POS_TERMINAL_ID` | Single recordings | ID of the slave (terminal) where the position (line) comes from. |
| `ART_NR` | Single recordings | Article number. |
| `INHAUS` | Single recordings | Inhouse consumption |
| `GTIN` | Single recordings | Global Trade Item Number. |
| `WARENGR` | Single recordings | Product group name. |
| `MENGE` | Single recordings | Quantity. |
| `FAKTOR` | Single recordings | Factor, e.g. container size. |
| `EINHEIT` | Single recordings| Unit of measurement, e.g. kg. |
| `STK_BR` | Single recordings | Price per unit incl. VAT. |
| `BON_NAME` | Single recordings  | The `BON_NAME` is used to further subdivide the items contained in the transaction category (`BON_TYP`). The `BON_NAME` must be filled if `BON_TYP` is `AVSonstige`.|
| `TERMINAL_ID` | Single recordings | ID of the terminal that was used to record this receipt. |
| `BON_STORNO` | Single recordings | Mandatory for the subsequent cancellation of an receipt. |
| `BON_START` | Single recordings | Mandatory if the action (DE: Vorgang) starts within another system. Otherwise the receipt request of an action must be connected in a way that ft can find the start of the action.|
| `BEDIENER_NAME` | Single recordings | User name |
| `AGENTUR_ID` | Single recordings | ID of the agency, only mandatory if agency business (DE: Agenturgeschäft) |
| `KUNDE_NAME` | Single recordings | Full name of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `KUNDE_ID` | Single recordings | ID of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO.|
| `KUNDE_TYP` | Single recordings | Type of the beneficiary customer (e.g. employee). Not mandatory if exempted in relation to § 148 AO.|
| `KUNDE_STRASSE` | Single recordings | Street and house number of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `KUNDE_PLZ` | Single recordings | Zip of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `KUNDE_ORT` | Single recordings | City of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `KUNDE_LAND` | Single recordings | Country of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `KUNDE_USTID` | Single recordings | VAT-ID of the beneficiary customer. Not mandatory if exempted in relation to § 148 AO. |
| `ABRECHNUNGSKREIS` | Single recordings | Connection criterion of the assignment. |
| `ZAHLWAEH_CODE` | Single recordings | Foreign currency code. Only mandatory if foreign currency was used for the payment. |
| `ZAHLWAEH_BETRAG` | Single recordings | Amount in foreign currency. Only mandatory if foreign currency was used for the payment. |
| `Z_BUCHUNGSTAG` | Master data | Booking date different from closing date (`Z_ERSTELLUNG`). Only mandatory if the booking date is different to the date of the daily closing receipt. | 
| Master data for the company, location, terminals, agencies as described in the chapter "Master data module" | Master data | Master data for this cashpoint closing and referenced by the single recordings|


The following chapters give you an overview of all DSFinV-K fields, provide you information on how they are filled by ft and how you can send additional data to fill mandatory (listed above) and optional fields that can not be filled by ft.

#### Single recordings module (DE: Einzelaufzeichnungsmodul)

The single recordings provide the basis for data storage. These are divided into two main areas:

- Bonpos (lines.csv)
- Bonkopf (transactions.csv)

In addition to these two files there are further detail files which are listed in the following. 

##### File: Bonpos (lines.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String (40) | Automatically created and filled by ft (`ftReceiptIdentification`) |
| `POS_ZEILE` | Line/Position number  | String (50) | Automatically created and filled by ft |
| `GUTSCHEIN_NR` | Voucher no.| String (50) | Optional, can be sent via `ftPayItemCaseData` or `ftChargeItemCaseData` in JSON format. To send, add the key value pair `VoucherNr` e.g. `"ftPayItemCaseData":"{ ..., "VoucherNr":"UAUA91829182HH", ... }"`|
| `ARTIKELTEXT` | Product/Article text| String (255) | Optional, to send, pls. fill `cbChargeItem.Description` |
| `POS_TERMINAL_ID` | Terminal-ID of this line (position)| String (50) | Can be sent via `ftChargeItemCaseData` in JSON format. To send, add the key value pair `TerminalId` e.g. `"ftChargeItemCaseData":"{ ..., "TerminalId":"09839839", ... }"` `cbTerminalID`. If not sent, then `cbTerminalId` will be used by ft to fill the field. |
| `GV_TYP` | Type of business action  | String (30) | Automatically filled by ft. Deducted from `ftChargeItemCase`. |
| `GV_NAME` | Addition to the business action type | String (40) | Automatically filled by ft. Depending on `ftChargeItemId` or `ftPayItemId` |
| `INHAUS` | Inhouse consumption | 0 or 1 | Mandatory, can be set via flag of the charge item. |
| `P_STORNO` | Position cancellation identification | String | Not supported |
| `AGENTUR_ID` | ID of the Agency | Integer | Mandatory if agency business (DE: Agenturgeschäft). Please sent via `ftChargeItemCaseData` in JSON format. To send, add the key value pair `AgencyId` e.g. `"ftChargeItemCaseData":"{ ..., "AgencyId":192, ... }"` |
| `ART_NR` | Article number | String (50) | Mandatory, to send pls. fill `ftChargeItem.ProductNumber` |
| `GTIN` | Global Trade Item Number | String (50) | Mandatory if an article, to send pls. fill `ftChargeItem.ProductBarcode` |
| `WARENGR_ID` | Product group ID | String (40) | Optional. To send, pls. add the key value pair `ProductGroupId` e.g. `"ftChargeItemCaseData":"{ ..., "ProductGroupId":192, ... }"`. If not sent, the ft will automatically generate a product number (hash) deducted from `ftChargeItem.ProductGroup` |
| `WARENGR` | Name of the product group | String (50) | Mandatory, pls. send via `ftChargeItem.ProductGroup` |
| `MENGE` | Quantity | Decimal (3) | Mandatory, pls. send via `ftChargeItem.Quantity` |
| `FAKTOR` | factor, e.g. container size | Decimal (3) | Mandatory, pls. send via `ftChargeItem.UnitQuantity`|
| `EINHEIT` | Unit of measurement, e.g. kg, litres or pieces | String | Mandatory, pls. send via `ftChargeItem.Unit` |
| `STK_BR` | Price per unit incl. VAT | Decimal (5) | Mandatory, pls. send via `ftChargeItem.UnitPrice` |

##### File: Bonpos_USt (lines_vat.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String (40) | Automatically created and filled by ft (`ftReceiptIdentification`) |
| `POS_ZEILE` | Line/Position number  | String (50) | Automatically filled by ft |
| `UST_SCHLUESSEL` | ID of the VAT rate | Integer | Automatically filled by ft depending on the `ftChargeItemCase` |
| `POS_BRUTTO` | Gross sales | Decimal (5) | Automatically filled by ft from `ftChargeItemCase.Amount` |
| `POS_NETTO` | Net sales | Decimal (5) | Automatically calculated and filled by ft depending on `ftChargeItemCase` and `ftChargeItemCase.Amount`|
| `POS_UST` | VAT | Decimal (5) | Automatically calculated and filled by ft depending on `ftChargeItemCase`|


##### File: Bonpos_Preisfindung (itemamounts.csv)

Not supported.

According to the DSFinV-K specification, in the data field STK_BR in the Bonpos file, either the reduced amount is displayed immediately (and the origin of the amount in the file Bonpos_Preisfindung) or the reduction in charges is displayed as a separate item line with negative amounts (with correct tax assignment; see file Bonpos_USt). The GV_TYP "Rabatt" is available for the separate line. For the reduction in charges, the current version of the ft.Middleware expects a separate negative `ftChargeItem` with the corresponding `ftChargeItemCase` (e.g. `0x4445000000000031`) which mapps to the GV_TYP "Rabatt". ft does currently not support the file Bonpos_Preisfindung.


##### File: Bonpos_Zusatzinfo (subitems.csv)

This table allows to detail the composition of sold combinations of goods (DE: Warenzusammenstellungen). They serve exclusively for explanation.

This does not affect the basis of assessment for VAT. In the case of goods combinations with different tax rates, however, information is stored here which serves to control the distribution of the VAT assessment basis (example: Inhouse breakfast menu consisting of a coffee, a drink and buffet meal). In addition, orders deviating from the standard order can be taken into account to record the actual consumption of goods (example: gyros plate with chips instead of rice).

You can send those subitems to the ft.Middleware via `ftChargeItemCaseData` in JSON format. To send, add the key value pair `SubItems` as an array of subitems: 

```json
"ftChargeItemCaseData" : "{ 
    ...,
    "SubItems" : [
        { ... },
        { ... }, 
        ...
    ],
    ... 
}"
```

Each subitem as described in the table below: 

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String (40) | Automatically created and filled by ft (`ftReceiptIdentification`) |
| `POS_ZEILE` | Line/Position number  | String (50) | Automatically filled by ft |
| `ZI_ART_NR` | Article number  | String (50) | To send, add the key value pair `ProductNumber` within the subitem. e.g. `"SubItems":"[{ "ProductNumber":"10292", ... }, ... ]` |
| `ZI_GTIN` | GTIN | String | To send, add the key value pair `GTIN` within the subitem. e.g. `"SubItems":"[{ "ProductNumber":"10292", "GTIN":"4231234266622", ... }, ... ]` |
| `ZI_NAME` | Article name | String (60) | To send, add the key value pair `Description` within the subitem. e.g. `"SubItems":"[{ "ProductNumber":"10292", "Description":"4231234266622", ... }, ... ]` |
| `ZI_WARENGR_ID` | Product group ID | String (40) |  To send, add the key value pair `ProductGroup` within the subitem. It should be sent as a JSON composed of the key value pairs `ProductGroupId` and `ProductGroupName` e.g. `"SubItems":"[{ ..., "ProductGroup":"{ "ProductGroupId":"981981AA", "ProductGroupName":"Fleischwaren" }", ... }, ... ]` (tbd: does this match to our concept of automatically filling the WARENGR_ID by hasing the name?) |
| `ZI_WARENGR` | Name of the product group | String (50) | Similar to `ZI_WARENGR_ID`, use `SubItem.ProductGroup.ProductGroupName` |
| `ZI_MENGE` | Quantity | Decimal (3) | To send, add the key value pair `Quantity` within the subitem. e.g. `"SubItems":"[{..., "Quantity":2.543, ... }, ... ]` |
| `ZI_FAKTOR` | factor, e.g. container sizes | Decimal (3) | To send, add the key value pair `UnitQuantity` within the subitem. e.g. `"SubItems":"[{ ..., "UnitQuantity":1.0, ... }, ... ]` |
| `ZI_EINHEIT` | Unit of measurement, e.g. kg, litres or pieces | String (50) | To send, add the key value pair `Unit` within the subitem. e.g. `"SubItems":"[{ ..., "Unit":"kg", ... }, ... ]` |
| `ZI_UST_SCHLUESSEL` | ID of VAT rate for the base price | Integer | To send, add the key value pair `ftSubChargeItemCase` within the subitem. e.g. `"SubItems":"[{..., "ftSubChargeItemCase":"4919338167972134929", ... }, ... ]`. Possible values for `ftSubChargeItemCase` are the same as for `ftChargeItemCase` - as described in the reference table above. |
| `ZI_BASISPREIS_BRUTTO` | Gross basis price | Decimal (5) | To send, add the key value pair `Amount` within the subitem. e.g. `"SubItems":"[{..., "Amount":22.50, ... }, ... ]` |
| `ZI_BASISPREIS_NETTO` | Net basis price | Decimal (5) | Automatically calculated by ft from  `ftSubChargeItemCase` and (subitem) `Amount`|
| `ZI_BASISPREIS_UST` | Basis VAT | Decimal (5) | Automatically filled by ft depending on `ftSubChargeItemCase` |


##### File: Bonkopf (transactions.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String (40) | Automatically created and filled by ft (`ftReceiptIdentification`) |
| `BON_NR` | Receipt number | Long | Automatically filled by ft (`ftReceiptNumerator`) |
| `BON_TYP` | Receipt type / action type| String (30) | Deducted from `ftReceiptCase` |
| `BON_NAME` | Additional description related to the `BON_TYP` | String (60) | Mandatory if `BON_TYPE` is "AVSonstige", otherwise optional, can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `ReceiptName ` e.g. `"ftReceiptCaseData":"{ ..., "ReceiptName":"Sonstige Sonderwurst", ... }"` |
| `TERMINAL_ID` | Mandatory, ID of the terminal that was used to record this receipt | String (50) | `cbTerminalID` |
| `BON_STORNO` | Cancellation indicator | String | Mandatory if your receipt is a reverse receipt that voids another, previous receipt. In this case mark your receipt with the `ftReceiptCaseFlag` `0x0000000000040000` and reference the receipt to be voided via `cbPreviousReceiptReference`. Ft will then set the `BON_STORNO` flag in the DSFinV-K export and will also add a corresponding reference in the file "**Bon_Referenzen (references.csv)**" (see below). |
| `BON_START` | Time of the action start | ISO 8601 and RFC3339 date | The action start can be within this cashpoint or outside of this cashpoint. If outside (e.g. by another system or another cashpoint) than it has to be provided in via `ftReceiptCaseData` in JSON format by adding the key value pair `ActionStartMoment`. E.g. `"ftReceiptCaseData":"{ ..., "ActionStartMoment":"2020-09-27T17:00:01", ... }"`. If not provided, ft tries to find the action start by following the `cbPreviousReceiptReference` path into the past until no more previous receipt references exist. ft will than fill this field with the value from `ftReceiptMoment` of the oldest receipt found in that chain. |
| `BON_ENDE` | Time of the action end | String | `ftReceiptMoment` |
| `BEDIENER_ID` | User-ID | String (50) | Optional. To send, pls. add the key value pair `ProductGroupId` e.g. `"ftReceiptCaseData":"{ ..., "UserId":192, ... }"`. If not sent, the ft will automatically generate a User-ID (hash) deducted from `cbUser` |
| `BEDIENER_NAME` | User name | String (50) | Mandatory, please send via `cbUser` |
| `UMS_BRUTTO` | Gross total turnover | Decimal (2) | Automatically filled by ft |
| `KUNDE_NAME` | Name of beneficiary customer | String (50) | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerName` e.g. `"cbCustomer":"{"CustomerName":"Max Wanne",...}"`|
| `KUNDE_ID` | ID of the beneficiary customer| String (50) | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerId` e.g. `"cbCustomer":"{"customerName":"Max Mustermann", "CustomerId":"PX9819822", ...}"`|
| `KUNDE_TYP` | Type of the beneficiary customer (e.g. employee) | String (50) | Mandatory if not exempted in relation to § 148 AO.  Send via `cbCustomer` in JSON format by adding the key value pair `CustomerType` e.g. `"cbCustomer":"{..., "CustomerId":"PX9819822", "CustomerType":"Mitarbeiter", ...}"`|
| `KUNDE_STRASSE` | Street and house number of the beneficiary customer | String (60) | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerStreet` e.g. `"cbCustomer":"{..., "CustomerStreet":"Lindwurmstr. 98", ...}"` |
| `KUNDE_PLZ` | Zip of the beneficiary customer | String (10) | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerZip` e.g. `"cbCustomer":"{..., "CustomerZip":"80337", ...}"` |
| `KUNDE_ORT` | City of the beneficiary customer | String (62) | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerCity` e.g. `"cbCustomer":"{..., "CustomerCity":"München", ...}"` |
| `KUNDE_LAND` | Country of the beneficiary customer | ISO 3166 ALPHA-3 country code | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerCountry` e.g. `"cbCustomer":"{..., "CustomerCountry":"DEU", ...}"`  |
| `KUNDE_USTID` | VAT-ID of the beneficiary customer | String (15) | Mandatory if not exempted in relation to § 148 AO. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerVATId` e.g. `"cbCustomer":"{..., "CustomerVATId":"DE123456789", ...}"`   |
| `BON_NOTIZ` | Additional information on the receipt header | String (255) | Optional, can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `ReceiptNote ` e.g. `"ftReceiptCaseData":"{ ..., "ReceiptNote":"123, ich bin dabei!", ... }"` |

##### File: Bonkopf_USt  (transactions_vat.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String (40) | Automatically created and filled by ft (`ftReceiptIdentification`) |
| `POS_ZEILE` | Line/Position number  | String (50) | Automatically filled by ft |
| `UST_SCHLUESSEL` | ID of the VAT rate | Integer | Automatically filled by ft |
| `BON_BRUTTO` | Gross sales | Decimal (5) | Automatically filled by ft |
| `BON_NETTO` | Net sales | Decimal (5) | Automatically filled by ft |
| `BON_UST` | VAT | Decimal (5) | Automatically filled by ft |

##### File: Bonkopf_AbrKreis (allocation_groups.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String (40) | Automatically created and filled by ft (`ftReceiptIdentification`) |
| `ABRECHNUNGSKREIS` | Connection criterion of the assignment | String (50) | Mandatory, filled by ft. by using `cbReceiptReference` and `cPreviousReceiptReference` to determine the value. |

##### File: Bonkopf_Zahlarten (datapayment.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String (40) | Automatically created and filled by ft (`ftReceiptIdentification`) |
| `ZAHLART_TYP` | Type of payment method | String (25) | Automatically filled by ft. Deducted from `ftPayItemCase` |
| `ZAHLART_NAME` | Name of the payment method | String (60)| Optional, can be sent via `ftPayItemCaseData` in JSON format. To send, add the key value pair `ItemCaseName` e.g. `"ftPayItemCaseData":"{ ..., "ItemCaseName":"Sodexo", ... }"` |
| `ZAHLWAEH_CODE` | ISO 4217 currency code | String (3) | Only mandatory if foreign currency was used for the payment, can be sent via `ftPayItemCaseData` in JSON format. To send, add the key value pair `CurrencyCode` e.g. `"ftPayItemCaseData":"{ ..., "CurrencyCode":"USD", ... }"`. Only ISO 4217 currency codes are allowed. |
| `ZAHLWAEH_BETRAG` | Amount in foreign currency | Decimal (2) | Only mandatory if foreign currency was used for the payment, can be sent via `ftPayItemCaseData` in JSON format. To send, add the key value pair `ForeignCurrencyAmount` e.g. `"ftPayItemCaseData":"{ ..., "ForeignCurrencyAmount":23.00, ... }"`. |
| `BASISWAEH_BETRAG` | Amount in basis currency (usually EUR) | Decimal (2) | Only mandatory if foreign currency was used for the payment, can be sent via `ftPayItemData` in JSON format. To send, add the key value pair `BaseCurrencyAmount` e.g. `"ftPayItemCaseData":"{ ..., "BaseCurrencyAmount":20.99, ... }"`|

##### File: Bon_Referenzen (references.csv)

If `cbPreviousReceiptReference` is filled in your receipt request, ft will automatically try to find the referenced receipt and if found, ft will add an entry to Bon_Referenzen. This also applies if you want to void a previous receipt. See description of `BON_STORNO` above.

For a recommendation on how to connect the single requests via `cbReceiptReference` and `cbPreviousReceiptReference` see our Business Cases Examples document [here](https://fiskaltrust.de/wp-content/uploads/sites/5/2020/02/fiskaltrust-Business-Cases-in-JSON_englisch.pdf). 

If you want (optional) to add other, additional references (from other systems or other cashpoints), you can add them by providing their data as shown below:

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String (40) | Automatically created and filled by ft (`ftReceiptIdentification`) |
| `POS_ZEILE` | Line number of the referencing operation | String (50) | Automatically filled by ft  |
| `REF_TYP` | Type of reference | "ExterneRechnung" or "ExternerLieferschein" or "Transaktion" or "ExterneSonstige" | can be sent via `ftReceiptCaseData` in JSON format. To send, add the key value pair `RefType ` e.g. `"ftReceiptCaseData":"{ ..., "RefType":"Transaktion", ... }"`. The value "Transaktion" mapps to an internal reference within this DSFinV-K export, all other values map to external references.|
| `REF_NAME` | Description for type | String (40) | If the external reference you want to add is of type (`RefType`) "ExterneSonstige", you must provide data for the field `REF_NAME`. Please send it via `ftReceiptCaseData` in JSON format.by adding the key value pair `RefName ` e.g. `"ftReceiptCaseData":"{ ..., "RefName":"Sonstige Sonderwurst", ... }"`.|
| `REF_DATUM` | Date of the cashpoint closing | String (30) | If the reference you want to add refers to another cashpoint and therefore is of type (`RefType`) "Transaktion", you must provide data for the field `REF_DATUM`. Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefMoment` e.g. `"ftReceiptCaseData":"{ ..., "RefMoment":"2020-01-03T17:00:01", ... }"`.|
| `REF_Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | If the reference you want to add refers to another cashpoint and therefore is of type (`RefType`) "Transaktion", you must provide data for the field `REF_Z_KASSE_ID`. Please send it via `ftReceiptCaseData` in JSON format by adding the key value pair `RefCashBoxIdentification ` e.g. `"ftReceiptCaseData":"{ ..., "RefCashBoxIdentification":"AHHAH1919919", ... }"`.|
| `REF_Z_NR` | No. of the cashpoint closing | Integer | If the reference you want to add refers to another cashpoint and therefore is of type (`RefType`) "Transaktion", you must provide data for the field `REF_Z_NR`. Please sent it via `ftReceiptCaseData` in JSON formatby adding the key value pair `RefClosingNr` e.g. `"ftReceiptCaseData":"{ ..., "RefClosingNr":1091029, ... }"`. (tbd: if ft generates the closing nr., than how do I receive it as a caller?) |
| `REF_BON_ID` | Action-ID | String (40) | If the reference you want to add refers to another cashpoint and therefore is of type (`RefType`) "Transaktion", you must provide data for the field `REF_BON_ID`. Please sent it via `ftReceiptCaseData` in JSON formatby adding the key value pair `RefReceiptId` e.g. `"ftReceiptCaseData":"{ ..., "RefReceiptId":"UAUUA1112#20200211-112430", ... }"`.|

##### File: TSE_Transaktionen (transactions_tse.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `BON_ID` | Action-ID | String (40) | Automatically created and filled by ft (`ftReceiptIdentification`) |
| `TSE_ID` | ID of the TSE used for the transaction | Integer | Automatically filled by ft |
| `TSE_TANR` | Transaction number of the transaction | Integer | Automatically filled by ft|
| `TSE_TA_START` | Log time of the StartTransaction operation | String (30) | Automatically filled by ft |
| `TSE_TA_ENDE` | Log time of the FinishTransaction operation | String (30) | Automatically filled by ft |
| `TSE_TA_VORGANGSART` | processType der FinishTransaktions operation | String (30) | Automatically filled by ft |
| `TSE_TA_SIGZ` | Signature counter of the FinishTransaction operation | Long | Automatically filled by ft |
| `TSE_TA_SIG` | Signature of the FinishTransaction operation | String (512) | Automatically filled by ft |
| `TSE_TA_FEHLER` | Where appropriate, indications of TSE errors | String (200) | Automatically filled by ft|
| `TSE_VORGANGSDATEN` | Data of the operation (optional) | String | Automatically filled by ft |

#### Master data module (DE: Stammdatenmodul)

To avoid redundancies, the master data is only saved once for each cashpoint closing. If changes are made to the master data listed below, a closing must be created automatically beforehand.

The **master data** for the day that is closed by the daily closing receipt (or monthly, yaearly because they include the daily closing) **must be included into the closing receipt** (daily/monthly/yearly). To include the data please send the content of `ftReceiptCaseData` in JSON format and add the key value pair `dailyClosingMasterData`. The value should also be JSON and formatted as follows:
```json
"dailyClosingMasterData" : "{ 

    "CompanyName" : "...",
    "CompanyStreet" : "...",
    "CompanyZip" : "...",
    "CompanyCity" : "...",
    "CompanyCountry" : "...",
    "CompanyTaxNr" : "...",
    "CompanyVATId" : "...",
    
    "LocationName" : "...",
    "LocationStreet" : "...",
    "LocationZip" : "...",
    "LocationCity" : "...",
    "LocationCountry" : "...",
    "LocationVATId" : "...",
    
    "CashRegisterBrand" : "...",
    "CashRegisterModel" : "...",
    "CashRegisterSWBrand" : "...",
    "CashRegisterSWBVersion" : "...",
    "CashRegisterBaseCurrency" : "...",
    
    "Terminals" : [ {
      "Id" : "...",
      "Brand" : "...",
      "Model" : "...",
      "SerialNr" : "...",
      "SWBrand" :  "...",
      "SWVersion" : "..."
    }, {...}, ...],
    
    "Agencies" : [ {
      "Id" : ...,
      "Name" : "...",
      "Street" : "...",
      "Zip" : "...",
      "City" :  "...",
      "Country" : "...",
      "TaxNr" : "...",
      "VATId" : "..."
    }, {...}, ...],
}"
```

The DSFinV-K master data module is divided into the following files:

##### File: Stamm_Abschluss (cashpointclosing.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `Z_BUCHUNGSTAG` | Booking date different from closing date (`Z_ERSTELLUNG`) | ISO 8601 und RFC3339 date | Can be send via `ftReceiptCaseData` in JSON format by adding the key value pair `BookingDate`. It is mandatory, if the booking date is different from the daily closing receipt date (`Z_ERSTELLUNG`). E.g. `"ftReceiptCaseData":"{ ..., "BookingDate":"2020-01-27", ... }"` |
| `TAXONOMIE_VERSION` | Version of the DFKA taxonomy cashpoint-data according to the title: [DFKA Taxonomie](https://dfka.net/taxonomie/) | String (10) | Automatically filled by ft |
| `Z_START_ID` | First BON_ID in closing | String (40) | Automatically filled by ft |
| `Z_ENDE_ID` | Last BON_ID in the closing | String (40) | Automatically filled by ft |
| `NAME` | Name of the company | String (60) | Mandatory, `dailyClosingMasterData.CompanyName` |
| `STRASSE` | Street | String (60) | Mandatory,`dailyClosingMasterData.CompanyStreet` |
| `PLZ` | Zip | String (10) | Mandatory, `dailyClosingMasterData.CompanyZip` |
| `ORT` | City | String (62) | Mandatory, `dailyClosingMasterData.CompanyCity` |
| `LAND` | Country | ISO 3166 ALPHA-3 country code | Mandatory, `dailyClosingMasterData.CompanyCountry` |
| `STNR` | Tax number of the company | String (20) | Mandatory, `dailyClosingMasterData.CompanyTaxNr` |
| `USTID` | VAT ID | String (15) | Mandatory, `dailyClosingMasterData.CompanyVATId` |
| `Z_SE_ZAHLUNGEN` | Total of all payments | Decimal (2) | Automatically filled by ft  |
| `Z_SE_BARZAHLUNGEN` | Total of all cash payments | Decimal (2) | Automatically filled by ft |

(`dailyClosingMasterData`is described above in the chapter "Master data module")

##### File: Stamm_Orte (location.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `LOC_NAME` | Name of the site | String (60) | Mandatory, `dailyClosingMasterData.LocationName` |
| `LOC_STRASSE` | Street | String (60) | Mandatory, `dailyClosingMasterData.LocationStreet` |
| `LOC_PLZ` | Zip | String (10) | Mandatory, `dailyClosingMasterData.LocationZip` |
| `LOC_ORT` | City | String (62) | Mandatory, `dailyClosingMasterData.LocationCity` |
| `LOC_LAND` | Country | ISO 3166 ALPHA-3 county code | Mandatory, `dailyClosingMasterData.LocationCountry` |
| `LOC_USTID` | VAT ID | String (15) | Mandatory, `dailyClosingMasterData.LocationVATId` |

(`dailyClosingMasterData`is described above in the chapter "Master data module")

##### File: Stamm_Kassen (cashregister.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `KASSE_BRAND` | Brand of the cash register | String (50) | Mandatory, `dailyClosingMasterData.CashRegisterBrand` |
| `KASSE_MODELL` | Model designation | String (50) | Mandatory, `dailyClosingMasterData.CashRegisterModel` |
| `KASSE_SERIENNR` | Serial number of the cash register | String (70) | `ftCashBoxID` ?(tbd) | 
| `KASSE_SW_BRAND` | Brand name of the software | String (50) | Mandatory, `dailyClosingMasterData.CashRegisterSWBrand` |
| `KASSE_SW_VERSION` | Version of the software | String (50) | Mandatory, `dailyClosingMasterData.CashRegisterSWVersion`  |
| `KASSE_BASISWAEH_CODE` | Basis currency of the cash register | ISO 4217 currency code | Mandatory, `dailyClosingMasterData.CashRegisterBaseCurrency`  |
| `KEINE_UST_ZUORDNUNG` | VAT not determinable | 0 or 1 | Automatically filled by ft |

(`dailyClosingMasterData`is described above in the chapter "Master data module")

##### File: Stamm_Terminals (slaves.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `TERMINAL_ID` | ID of the terminal | String (50) |Mandatory, `dailyClosingMasterData.Terminals.Id` |
| `TERMINAL_BRAND` | Brand of the terminal | String (50) | Mandatory, `dailyClosingMasterData.Terminals.Brand`|
| `TERMINAL_MODELL` | Model designation | String (50) | Mandatory, `dailyClosingMasterData.Terminals.Model` |
| `TERMINAL_SERIENNR` | Serial number of the terminal | String (70) | Mandatory, `dailyClosingMasterData.Terminals.SerialNr` |
| `TERMINAL_SW_BRAND` | Brand name of the software | String (50) | Mandatory, `dailyClosingMasterData.Terminals.SWBrand` |
| `TERMINAL_SW_VERSION` | Version of the software | String (50) | Mandatory, `dailyClosingMasterData.Terminals.SWVersion` |

(`dailyClosingMasterData`is described above in the chapter "Master data module")

##### File: Stamm_Agenturen (pa.csv)


| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `AGENTUR_ID` | ID of the agency | Integer | Mandatory, `dailyClosingMasterData.Agencies.Id` | 
| `AGENTUR_NAME` | Name of the client | String (60) | Mandatory, `dailyClosingMasterData.Agencies.Name` |
| `AGENTUR_STRASSE` | Street | String (60) | Mandatory, `dailyClosingMasterData.Agencies.Street`|
| `AGENTUR_PLZ` | Zip | String (10) |  Mandatory, `dailyClosingMasterData.Agencies.Zip` |
| `AGENTUR_ORT` | City | String (62) | Mandatory, `dailyClosingMasterData.Agencies.City` |
| `AGENTUR_LAND` | ISO 3166 ALPHA-3 country code | String | Mandatory, `dailyClosingMasterData.Agencies.Country` |
| `AGENTUR_STNR` | Tax number | String (20) | Mandatory, `dailyClosingMasterData.Agencies.TaxNr` |
| `AGENTUR_USTID` | VAT ID| String (15) | Mandatory, `dailyClosingMasterData.Agencies.VATId` |

(`dailyClosingMasterData`is described above in the chapter "Master data module")

##### File: Stamm_USt (vat.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `UST_SCHLUESSEL` | ID of the VAT rate| Integer | Automatically filled by ft  |
| `UST_SATZ` | Percentage | Decimal (2) | Automatically filled by ft  |
| `UST_BESCHR` | Description| String | Automatically filled by ft  |

##### File: Stamm_TSE (tse.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `TSE_ID` | TSE ID | Integer | Automatically filled by ft |
| `TSE_SERIAL` |  Serial number of the TSE (Corresponds according to TR- 03153 section 7.5. to the hash value of the key contained in the certificate; octet string in hexadecimal representation) | String (68) | Automatically filled by ft |
| `TSE_SIG_ALGO` | The signature algorithm used by the TSE | String (21) | Automatically filled by ft |
| `TSE_ZEITFORMAT` | The format used by the TSE for the log-time | String (31) | Automatically filled by ft |
| `TSE_PD_ENCODING` | Text encoding of the process data (UTF-8 or ASCII) | String (5) | Automatically filled by ft |
| `TSE_PUBLIC_KEY` |  Public key - eventually extracted from the TSE certificate - in base64 encoding | String (512) | Automatically filled by ft |
| `TSE_ZERTIFIKAT_I` |  First 1,000 characters of the TSE certificate (in base64 encoding) | String (1000) | Automatically filled by ft |
| `TSE_ZERTIFIKAT_II` | Possibly another 1,000 characters of the certificate (in base64 encoding) | String (1000) | Automatically filled by ft |

#### Cashpoint closing module (DE: Kassenabschlussmodul)

The three structure levels (modules) allow transactions to be separated and grouped, so that they can be automatically posted or transferred to the bookkeeping. The cash register closing therefore has an accounting function, meaning that the data of the respective closing has to be exported digitally within this module. 

The mandatory audit proof storage can be fulfilled with the fiskaltrust [add-on-products](https://fiskaltrust.de/produkte) (e.g. POS Archiv or AKO - Audicon Kassenarchiv Online).

The export takes place into following three files:

##### File: Z_Zahlart Z_GV_TYP (businesscases.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `GV_TYP` | business action type | String (30) | Automatically filled by ft |
| `GV_NAME` | name of the business action type | String (40) | Automatically filled by ft |
| `AGENTUR_ID` | Agency ID | Integer | Automatically filled by ft |
| `UST_SCHLUESSEL` | ID of the VAT rate | Integer | Automatically filled by ft |
| `Z_UMS_BRUTTO` | Gross sales | Decimal (5) | Automatically filled by ft |
| `Z_UMS_NETTO` | Net sales | Decimal (5) | Automatically filled by ft|
| `Z_UST` | VAT | Decimal (5) | Automatically filled by ft |

##### File: Z_Zahlart (payment.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `ZAHLART_TYP` | Type of payment method | String (25) | Automatically filled by ft |
| `ZAHLART_NAME` | Name of the payment method | String (60) | Automatically filled by ft |
| `Z_ZAHLART_BETRAG` | business action type | Decimal (2) | Automatically filled by ft |

##### File: Z_Waehrungen (cash_per_currency.csv)

| **Fieldname**            | **Description**          | **Format**          | **ft.input** |
|----------------------|--------------------------|---------------------|---------------------|
| `Z_KASSE_ID` | ID of the (closing) cashpoint | String (50) | Automatically created and filled by ft (`ftCashBoxIdentification`) |
| `Z_ERSTELLUNG` | Date of the cashpoint closing | ISO 8601 und RFC3339 date | Automatically filled by ft from `cbReceiptMoment` of the daily closing receipt |
| `Z_NR` | Nr. of the cashpoint closing | Integer | Automatically created and filled by ft |
| `ZAHLART_WAEH` | Currency | ISO 4217 currency code | Automatically filled by ft |
| `ZAHLART_BETRAG_WAEH` | Amount | Decimal (2) | Automatically filled by ft |
