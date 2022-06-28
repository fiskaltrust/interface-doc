---
slug: /poscreators/signing/austria/api
title: RKSV.Sign API
---

# RKSV.Sign API

At it's core, the _RKSV.Sign_ API uses the [IATSSCD](https://github.com/fiskaltrust/middleware-interface-dotnet/blob/master/src/fiskaltrust.ifPOS/v0/at/IATSSCD.cs) interface that is also internally used by the Middleware to communicate with Austrian signing devices and services.

The API is hosted with REST and WCF/SOAP endpoints, users can decide which one to use.

## REST API

### Endpoints
The REST API is hosted at the following endpoints:
- **Sandbox**: http://rksv-sandbox.fiskaltrust.at/
- **Production**: http://rksv.fiskaltrust.at/

:::info

Both of these endpoints offer a fully featured API documentation via Swagger, which also allows automatic client generation. The Swagger documentation is available at the following endpoints: 

- **Sandbox**: https://rksv-sandbox.fiskaltrust.at/swagger/index.html
- **Production**: https://rksv.fiskaltrust.at/swagger/index.html

For C# users, we've also prepared a sample implementation of the API in the [RKSV.Sign demo repository](https://github.com/fiskaltrust/signing-demo-rksv) on GitHub.

:::

### Authentication
Like all our services, users of the RKSV.Sign API need to authenticate via _CashboxID_ and _Access Token_, which can be obtained via the Portal. These values need to be included into each requests in the HTTP headers:
- `cashboxid`: Unique ID of the cashbox, in GUID format
- `accesstoken`: Secret token that is used to authenticate the request

Additionally to obtaining these values from the Portal, they're also returned once when creating the cashbox via our API.

### Methods
The following methods are available:

#### Echo
`POST /api/v0/iatsscd/echo`\
The echo method can be used to test if the endpoint is available and the authentication parameters are correct. This method returns the exact same data that was sent in the request.

#### Sample request
```json
{
  "message": "string"
}
```

#### Sample response
```json
{
  "message": "string"
}
```

#### Sign
`POST /api/v0/iatsscd/sign`\
The sign method can be used to sign a receipt. The RKSV-compliant receipt data is passed as a Base64-encoded JSON object in the request body. The signature is returned Base64-encoded as a JSON object in the response body.

#### Sample request
```json
{
  "dataBase64": "string"
}
```

#### Sample response
```json
{
  "signedDataBase64": "string"
}
```

#### Certificate
`GET /api/v0/iatsscd/certificate`\
The certificate method is used to obtain the certificate of the RKSV.Sign service. The certificate is returned as a Base64-encoded JSON object in the response body.

#### Sample response
```json
{
  "certificateBase64": "string"
}
```

#### ZDA
`GET /api/v0/iatsscd/zda`\
The ZDA method is used to obtain the short sign of the certificate service operator of the RKSV.Sign service. The ZDA is returned as a JSON object in the response body.

#### Sample response
```json
{
  "zda": "string"
}
```

## WCF API
The WCF API uses the same methods as described above. For easier usage, we've prepared [a WSDL file](https://github.com/fiskaltrust/signing-demo-rksv/tree/main/wsdl) that can be used to generate a client for the API. Similar to our REST examples, we've created a C#/.NET sample in our [RKSV demo repository](https://github.com/fiskaltrust/signing-demo-rksv) on GitHub.

### Endpoints
The WCF API is hosted at the following endpoints:
- **Sandbox**: http://signing-sandbox.fiskaltrust.at/rksv
- **Production**: http://signing.fiskaltrust.at/rksv
