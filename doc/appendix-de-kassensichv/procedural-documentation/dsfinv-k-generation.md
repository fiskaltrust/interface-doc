## Procedural documentation for DSFinV-K generation


### DSFinV-K export

You can download the current version of the DSFinV-K specification [here](https://www.bzst.de/DE/Unternehmen/Aussenpruefungen/DigitaleSchnittstelleFinV/digitaleschnittstellefinv_node.html).

Based on the version 2.1 of the DSFinV-K specification, this chapter explains how the DSFinV-K export is structured, shows how the previously described input values are mapped by fisklatrust to the files and data of the DSFinV-K export and defines how additional, for the DSFInV-K required, values can be sent to the ft.Middleware. Furthermore, it describes how the marking of actions (DE: Vorgänge) can be made by connecting business actions (DE: Geschäftsvorfälle) and other procedures, occurrences and events (DE: Andere Vorgänge). 

#### Structure

The DSFinV-K export is divided into the following sections/modules: 

- Single recordings module (DE: Einzelaufzeichnungsmodul)
- Master data module (DE: Stammdatenmodul)
- Cashpoint closing module (DE: Kassenabschlussmodul)

Each module consists of several files. In the following we will take a look at the individual modules especially the content of the files and data. Details about the meaning of the files and their individual fields can be found in the official DSFinV-K specification.

#### Mandatory data

This chapter lists the data fields that are mandatory and have to be provided by the cashpoint. For details on how to provide them, please see the chapters below. They offer information for all DSFinV-K fields. 

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
| `BEDIENER_NAME` | Single recordings | User name |
| `AGENTUR_ID` | Single recordings | ID of the agency, only mandatory if agency business (DE: Agenturgeschäft) |
| `KUNDE_NAME` | Single recordings | Full name of the beneficiary customer. Mandatory if available. See also AEAO to § 146 |
| `KUNDE_ID` | Single recordings | ID of the beneficiary customer. Mandatory if available. See also AEAO to § 146|
| `KUNDE_TYP` | Single recordings | Type of the beneficiary customer (e.g. employee).  Mandatory if available. See also AEAO to § 146 |
| `KUNDE_STRASSE` | Single recordings | Street and house number of the beneficiary customer. Mandatory if available. See also AEAO to § 146 |
| `KUNDE_PLZ` | Single recordings | Zip of the beneficiary customer. Mandatory if available. See also AEAO to § 146 |
| `KUNDE_ORT` | Single recordings | City of the beneficiary customer. Mandatory if available. See also AEAO to § 146 |
| `KUNDE_LAND` | Single recordings | Country of the beneficiary customer. Mandatory if available. See also AEAO to § 146 |
| `KUNDE_USTID` | Single recordings | VAT-ID of the beneficiary customer. Mandatory if available. See also AEAO to § 146 |
| `ABRECHNUNGSKREIS` | Single recordings | Connection criterion of the assignment. |
| `ZAHLWAEH_CODE` | Single recordings | Foreign currency code. Only mandatory if foreign currency was used for the payment. |
| `ZAHLWAEH_BETRAG` | Single recordings | Amount in foreign currency. Only mandatory if foreign currency was used for the payment. |

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
| `ZI_WARENGR_ID` | Product group ID | String (40) |  To send, add the key value pair `ProductGroup` within the subitem. It should be sent as a JSON composed of the key value pairs `ProductGroupId` and `ProductGroupName` e.g. `"SubItems":"[{ ..., "ProductGroup":"{ "ProductGroupId":"981981AA", "ProductGroupName":"Fleischwaren" }", ... }, ... ]`. If only `ProductGroupName` is filled, ft will automatically fill `ZI_WARENGR_ID` by creating a hash from `ProductGroupName`. |
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
| `BON_STORNO` | Cancellation indicator | 0 or 1 | Automatically filled  by ft |
| `BON_START` | Time of the action start | ISO 8601 and RFC3339 date | Automatically filled by ft |
| `BON_ENDE` | Time of the action end | ISO 8601 and RFC3339 date | Automatically filled by ft. |
| `BEDIENER_ID` | User-ID | String (50) | Optional. To send, pls. add the key value pair `UserId` e.g. `"ftReceiptCaseData":"{ ..., "UserId":192, ... }"`. If not sent, the ft will automatically generate a User-ID (hash) deducted from `cbUser` |
| `BEDIENER_NAME` | User name | String (50) | Mandatory, please send via `cbUser` |
| `UMS_BRUTTO` | Gross total turnover | Decimal (2) | Automatically filled by ft |
| `KUNDE_NAME` | Name of beneficiary customer | String (50) | Mandatory if available. See also AEAO to § 146. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerName` e.g. `"cbCustomer":"{"CustomerName":"Max Wanne",...}"`|
| `KUNDE_ID` | ID of the beneficiary customer| String (50) | Mandatory if available. See also AEAO to § 146. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerId` e.g. `"cbCustomer":"{"customerName":"Max Mustermann", "CustomerId":"PX9819822", ...}"`|
| `KUNDE_TYP` | Type of the beneficiary customer (e.g. employee) | String (50) | Mandatory if available. See also AEAO to § 146.  Send via `cbCustomer` in JSON format by adding the key value pair `CustomerType` e.g. `"cbCustomer":"{..., "CustomerId":"PX9819822", "CustomerType":"Mitarbeiter", ...}"`|
| `KUNDE_STRASSE` | Street and house number of the beneficiary customer | String (60) | Mandatory if available. See also AEAO to § 146. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerStreet` e.g. `"cbCustomer":"{..., "CustomerStreet":"Lindwurmstr. 98", ...}"` |
| `KUNDE_PLZ` | Zip of the beneficiary customer | String (10) | Mandatory if available. See also AEAO to § 146. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerZip` e.g. `"cbCustomer":"{..., "CustomerZip":"80337", ...}"` |
| `KUNDE_ORT` | City of the beneficiary customer | String (62) | Mandatory if available. See also AEAO to § 146. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerCity` e.g. `"cbCustomer":"{..., "CustomerCity":"München", ...}"` |
| `KUNDE_LAND` | Country of the beneficiary customer | ISO 3166 ALPHA-3 country code | Mandatory if available. See also AEAO to § 146. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerCountry` e.g. `"cbCustomer":"{..., "CustomerCountry":"DEU", ...}"`  |
| `KUNDE_USTID` | VAT-ID of the beneficiary customer | String (15) | Mandatory if available. See also AEAO to § 146. Send via `cbCustomer` in JSON format by adding the key value pair `CustomerVATId` e.g. `"cbCustomer":"{..., "CustomerVATId":"DE123456789", ...}"`   |
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

If `cbPreviousReceiptReference` is filled in your receipt request, ft will automatically try to find the referenced receipt and if found, ft will add an entry to Bon_Referenzen. 

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
