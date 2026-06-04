---
sidebar_label: "Notify Order Completion"
sidebar_position: 2
---

# Notify Order Completion

WeTix sends an HTTP `POST` request to your registered [**Notify URL**](/docs/graphql/input_objects#createmovieorderinput) under create movie order request after an order has been successfully completed. This allows your system to react to order events in real time without polling the API.

## Request

| Property     | Value              |
| ------------ | ------------------ |
| Method       | `POST`             |
| Content-Type | `application/json` |
| Timeout      | 30 seconds         |

### Headers

| Header         | Description                                                                                          |
| -------------- | ---------------------------------------------------------------------------------------------------- |
| `Content-Type` | `application/json`                                                                                   |
| `X-Timestamp`  | Unix timestamp (seconds, UTC) when the request was signed.                                           |
| `X-Nonce-Str`  | Random 32-character alphanumeric string to prevent replay attacks.                                   |
| `X-Signature`  | Hex-encoded HMAC-SHA256 signature. See [Webhook Signature Verification](./webhook_verify_signature). |

## Payload

```json
{
  "eventType": "NOTIFY_ORDER_COMPLETION",
  "data": {
    "key": "EgpNb3ZpZU9yZGVy...",
    "bookingId": "23726052030123",
    "transactionId": "1010260520082485598938",
    "currencyCode": "MYR",
    "totalAmount": 2050,
    "bookingAmount": 50,
    "payableAmount": 2050,
    "status": "COMPLETED",
    "qrCode": "1001100111101001101010100101010010011010001110",
    "createdAt": "2026-05-20T08:24:35.31643Z",
    "lastUpdatedAt": "2026-05-20T08:24:50.883153Z"
  }
}
```

### Top-level Fields

| Field       | Type   | Description                                                          |
| ----------- | ------ | -------------------------------------------------------------------- |
| `eventType` | String | Event that triggered this webhook. Always `NOTIFY_ORDER_COMPLETION`. |
| `data`      | Object | Order payload. See [Data Fields](#data-fields) below.                |

### Data Fields

| Field           | Type    | Description                                                              |
| --------------- | ------- | ------------------------------------------------------------------------ |
| `key`           | String  | Base64-encoded unique identifier for the order.                          |
| `bookingId`     | String  | Booking reference ID from the cinema operator.                           |
| `transactionId` | String  | WeTix internal payment transaction ID.                                   |
| `currencyCode`  | String  | ISO 4217 currency code (e.g. `MYR`).                                     |
| `totalAmount`   | Integer | Total order amount in cents.                                             |
| `bookingAmount` | Integer | Booking fee in cents.                                                    |
| `payableAmount` | Integer | Final payable amount in cents (including any extra charges).             |
| `status`        | String  | Order status. `COMPLETED` when successfully confirmed with the operator. |
| `qrCode`        | String  | QR code string for cinema entry, if issued by the operator.              |
| `createdAt`     | String  | RFC3339 UTC timestamp when the order was created.                        |
| `lastUpdatedAt` | String  | RFC3339 UTC timestamp of the last order update.                          |

## Signature Verification

The `X-Signature` header is computed as:

```
signature = HMAC-SHA256(clientSecret, timestamp + nonceStr + base64(body))
```

Where:

- `clientSecret` is your OAuth client secret
- `timestamp` is the value of the `X-Timestamp` header
- `nonceStr` is the value of the `X-Nonce-Str` header
- `base64(body)` is the Base64-encoded raw request body (standard encoding)

The resulting bytes are **hex-encoded** to produce the final `X-Signature` value.

See [Webhook Signature Verification](./webhook_verify_signature) for the full verification guide and code examples.

## Retry Behaviour

WeTix retries failed deliveries automatically via a background job that runs every **2 minutes**:

| Property           | Value                                   |
| ------------------ | --------------------------------------- |
| Max attempts       | 5                                       |
| Min retry interval | 30 seconds between attempts             |
| Failure condition  | Non-`2xx` response or timeout           |
| Terminal state     | Marked `FAILED` after 5 failed attempts |

:::tip
Return `200 OK` immediately and process the payload asynchronously to avoid timeouts and unnecessary retries.
:::

## Deduplication

Before delivering a webhook, WeTix checks whether a webhook with the same `referenceId` and `eventType` has already been successfully delivered. If one exists with a `SUCCESS` status, the webhook will **not** be sent again.

Your endpoint should still be **idempotent** — processing the same event more than once should produce the same result.

## Example Request

```http
POST /your-webhook-endpoint HTTP/1.1
Host: your-domain.com
Content-Type: application/json
X-Timestamp: 1747729475
X-Nonce-Str: aB3dEfGhIjKlMnOpQrStUvWxYz123456
X-Signature: 4e3a1c2b...

{"eventType":"NOTIFY_ORDER_COMPLETION","data":{"key":"EgpNb3ZpZU9yZGVy...","bookingId":"23726052030123","transactionId":"1010260520082485598938","currencyCode":"MYR","totalAmount":2050,"bookingAmount":50,"payableAmount":2050,"status":"COMPLETED","qrCode":"1001100111101001101010100101010010011010001110","createdAt":"2026-05-20T08:24:35.31643Z","lastUpdatedAt":"2026-05-20T08:24:50.883153Z"}}
```
