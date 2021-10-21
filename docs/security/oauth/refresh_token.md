---
sidebar_label: "Refresh Token"
sidebar_position: 3
---

# Refresh Token

Refresh token can be used to get an access token once the access token expires. Alternatively, if you wish not to use the refresh token, the access token can be directly requested from the [token endpoint](/docs/security/oauth/client_credentials#step-3-request-access-token).

## Step 1: Encode the Credentials

Please encode the client ID and client secret using **Base64 encoding** in the following format:

**Format:**
`client_id`:`client_secret`

**Example before Base64 encoding:**
`1612417576451877743:G13HC46eE4Wg0U3Z6vx7OwBb3oRGvaPeHJcQgJjrooEYQtylmqzhODhVEnQScJqy`

**Example after Base64 encoding:**
`MTYxMjQxNzU3NjQ1MTg3Nzc0MzpHMTNIQzQ2ZUU0V2cwVTNaNnZ4N093QmIzb1JHdmFQZUhKY1FnSmpyb29FWVF0eWxtcXpoT0RoVkVuUVNjSnF5`

## Step 2: Set Authorization Header

Please set the **Basic Authorization Header** using the encoded credentials.

**Authorization** : Basic MTYxMjQxNzU3NjQ1MTg3Nzc0MzpHMTNIQzQ2ZUU0V2cwVTNaNnZ4N093QmIzb1JHdmFQZUhKY1FnSmpyb29FWVF0eWxtcXpoT0RoVkVuUVNjSnF5

## Step 3: Request Access Token

Please request the access token from WeTix OAuth Server.

**Production URL:** `https://oauth2.wetix.my/auth/refresh`  
**Sandbox URL:** `https://sb-oauth2.wetix.my/auth/refresh`  
**Method:** POST

**Request parameters:**

| Name            | Data Type | Description                                                                                                                                             |
| --------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `grant_type`    | String    | WeTix OAuth server only supports client credentials or authorisation code grant type.                                                                   |
| `refresh_token` | String    | The refresh token obtained from the [token endpoint](/docs/security/oauth/client_credentials#step-3-request-access-token) when requesting access token. |

**Request example:**

```
curl --location --request POST 'localhost:5004/auth/refresh' \
--header 'Authorization: Basic MTYxMjQxNzU3NjQ1MTg3Nzc0MzpHMTNIQzQ2ZUU0V2cwVTNaNnZ4N093QmIzb1JHdmFQZUhKY1FnSmpyb29FWVF0eWxtcXpoT0RoVkVuUVNjSnF5' \
--header 'Content-Type: application/json' \
--data-raw '{
    "grant_type":"refresh_token",
    "refresh_token":"eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOlsiaHR0cHM6Ly9zYi1vcGVuLndldGl4Lm15IiwiaHR0cHM6Ly9zYi1vcGVuLndldGl4Lm15L2dyYXBocWwiXSwiY2xpZW50X2tleSI6IkVndFBRWFYwYUVOc2FXVnVkQmp2MW9yUTRxZWRzQlkiLCJleHAiOjE2NjYyMzU3MjAsImlhdCI6MTYzNDY5OTcyMCwiaXNzIjoiaHR0cDovL2xvY2FsLW9hdXRoLndldGl4Lm15OjUwMDQiLCJuYmYiOjE2MzQ2OTk3MjAsInRva2VuVHlwZSI6IlJFRlJFU0hfVE9LRU4ifQ.gqZxcBVa-tViYKOBdHgpkf-Ao9SZwVqMm99e9d2Gw1o"
}'
```

**Response parameters:**

| Name                       | Data Type | Description                                                                                                                       |
| -------------------------- | --------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `access_token`             | String    | The access token which will be used to access protected resources on the WeTix Open API.                                          |
| `expires_in`               | Int64     | The access token expiry in seconds. For example, the value 5184000 means the token will expire in 5184000 seconds or 60 days.     |
| `refresh_token`            | String    | The refresh token, which can be used to request for a new access token once the existing access token expires.                    |
| `refresh_token_expires_in` | Int64     | The refresh token expiry in seconds. For example, the value 31536000 means the token will expire in 31536000 seconds or 365 days. |
| `token_type`               | String    | WeTix OAuth server only supports "Bearer" token type.                                                                             |

**Response example:**

```
{
    "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOlsiaHR0cHM6Ly9zYi1vcGVuLndldGl4Lm15IiwiaHR0cHM6Ly9zYi1vcGVuLndldGl4Lm15L2dyYXBocWwiXSwiY2xpZW50X2tleSI6IkVndFBRWFYwYUVOc2FXVnVkQmp2MW9yUTRxZWRzQlkiLCJleHAiOjE2Mzk4ODM3MjAsImlhdCI6MTYzNDY5OTcyMCwiaXNzIjoiaHR0cDovL2xvY2FsLW9hdXRoLndldGl4Lm15OjUwMDQiLCJuYmYiOjE2MzQ2OTk3MjAsInRva2VuVHlwZSI6IkFDQ0VTU19UT0tFTiJ9.pPzLXGRy0eDiThTUm25Xezto4rn_EmMbIZLCdi4aWZU",
    "expires_in": 5184000,
    "refresh_token": "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOlsiaHR0cHM6Ly9zYi1vcGVuLndldGl4Lm15IiwiaHR0cHM6Ly9zYi1vcGVuLndldGl4Lm15L2dyYXBocWwiXSwiY2xpZW50X2tleSI6IkVndFBRWFYwYUVOc2FXVnVkQmp2MW9yUTRxZWRzQlkiLCJleHAiOjE2NjYyMzU3MjAsImlhdCI6MTYzNDY5OTcyMCwiaXNzIjoiaHR0cDovL2xvY2FsLW9hdXRoLndldGl4Lm15OjUwMDQiLCJuYmYiOjE2MzQ2OTk3MjAsInRva2VuVHlwZSI6IlJFRlJFU0hfVE9LRU4ifQ.gqZxcBVa-tViYKOBdHgpkf-Ao9SZwVqMm99e9d2Gw1o",
    "refresh_token_expires_in": 31536000,
    "token_type": "Bearer"
}
```