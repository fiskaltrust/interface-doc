# Communication

## REST service

The fiskaltrust.Middleware which directly implements the REST communication protocol is a product called fiskaltrust.ChaîneCloud. Communication with this service is implemented via the URL <https://signaturcloud.fiskaltrust.fr/> followed by xml/ or json/ depending on the content serialisation type, and then followed by the method name in lowercase letters (echo, sign, journal).

Depending on the serialisation type, the content-type will be "application/json;charset=utf-8" (for JSON) and "application/xml;charset=utf-8" (for XML). The method is POST, and the headers must contain the "cashboxid" and the "accesstoken" with the corresponding value related to the configured cashbox on the fiskaltrust.Portal.

The "Echo" call will contain the serialised message in the request content. The "sign" call will contain the serialised ReceiptRequest class in the request content. The "journal" call will have the following URL query for posting the values `?type={1}&from={2}&to={3}` where type is the journal type, and the other two values are limits of the timestamp values for extracting the data.

### REST helper

The REST helper implements the same REST interface as the REST service. Additionally, it includes the balancing feature of a balancer helper. The URL used to reach the REST helper can be set in the fiskaltrust.Portal on the configuration page of the REST helper.

In addition to the two values for the balancing parameter, there is another value called "deactivated" which bypasses the balancing feature (only if there is one fiskaltrust.Middleware configured inside the cashbox, if there is more than one, this option will be ignored and used the "least active"). This new option will let the REST helper behave exactly like the REST service for the journal calls.
