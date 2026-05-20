---
sidebar_label: "Webhook Signature Verification"
sidebar_position: 1
---

# Webhook Signature Verification

When WeTix delivers a webhook to your endpoint, it signs every request so you can verify that it genuinely came from WeTix and that the payload has not been tampered with.

## How It Works

For each outbound webhook request WeTix:

1. Takes the current **Unix timestamp** (seconds).
2. Generates a random **nonce string** (32 characters).
3. **Base64-encodes** the JSON request body (empty string `""` when the body is `{}` or `null`).
4. Concatenates the three values — **no separators**: `timestamp + nonceStr + base64Body`.
5. Computes **HMAC-SHA256** over that string using your **Client Secret** as the key.
6. Hex-encodes the digest and sends it as the `X-Signature` header.

## Request Headers

| Header        | Description                                                |
| ------------- | ---------------------------------------------------------- |
| `X-Timestamp` | Unix timestamp (seconds, UTC) when the request was signed. |
| `X-Nonce-Str` | Random 32-character string to prevent replay attacks.      |
| `X-Signature` | Hex-encoded HMAC-SHA256 signature of the payload.          |

## Verification Steps

### Step 1 — Extract the headers

Read `X-Timestamp`, `X-Nonce-Str`, and `X-Signature` from the incoming request.

### Step 2 — Base64-encode the request body

Base64-encode the raw JSON body. If the body is empty, `{}`, or `null`, use an empty string `""`.

```
base64Body = base64(rawBody)
```

### Step 3 — Reconstruct the plaintext

Concatenate the three values **in this exact order, with no separators**:

```
plaintext = timestamp + nonceStr + base64Body
```

### Step 4 — Compute HMAC-SHA256

Compute HMAC-SHA256 over the plaintext using your **Client Secret** as the key, then hex-encode the digest.

```
expectedSignature = hex( HMAC-SHA256(key=clientSecret, data=plaintext) )
```

### Step 5 — Compare signatures

Compare `expectedSignature` with the `X-Signature` header value using a **constant-time comparison** to prevent timing attacks. Reject the request if they do not match.

---

## Code Examples

<details>
<summary>Go</summary>

```go
import (
    "crypto/hmac"
    "crypto/sha256"
    "encoding/base64"
    "encoding/hex"
    "net/http"
)

func verifyWebhookSignature(r *http.Request, clientSecret string) bool {
    timestamp  := r.Header.Get("X-Timestamp")
    nonceStr   := r.Header.Get("X-Nonce-Str")
    receivedSig := r.Header.Get("X-Signature")

    body, _ := io.ReadAll(r.Body)

    base64Body := ""
    switch string(body) {
    case "", "{}", "null":
        // leave empty
    default:
        base64Body = base64.StdEncoding.EncodeToString(body)
    }

    plaintext := timestamp + nonceStr + base64Body

    h := hmac.New(sha256.New, []byte(clientSecret))
    h.Write([]byte(plaintext))
    expectedSig := hex.EncodeToString(h.Sum(nil))

    return hmac.Equal([]byte(expectedSig), []byte(receivedSig))
}
```

</details>

<details>
<summary>Node.js</summary>

```js
const crypto = require("crypto");

function verifyWebhookSignature(req, clientSecret) {
  const timestamp = req.headers["x-timestamp"];
  const nonceStr = req.headers["x-nonce-str"];
  const receivedSig = req.headers["x-signature"];

  const rawBody = req.body; // Buffer or string
  const bodyStr = rawBody ? rawBody.toString() : "";

  let base64Body = "";
  if (bodyStr !== "" && bodyStr !== "{}" && bodyStr !== "null") {
    base64Body = Buffer.from(bodyStr).toString("base64");
  }

  const plaintext = timestamp + nonceStr + base64Body;

  const expectedSig = crypto
    .createHmac("sha256", clientSecret)
    .update(plaintext)
    .digest("hex");

  return crypto.timingSafeEqual(
    Buffer.from(expectedSig),
    Buffer.from(receivedSig),
  );
}
```

</details>

<details>
<summary>Python</summary>

```python
import base64
import hashlib
import hmac

def verify_webhook_signature(headers: dict, raw_body: bytes, client_secret: str) -> bool:
    timestamp  = headers.get("X-Timestamp", "")
    nonce_str  = headers.get("X-Nonce-Str", "")
    received_sig = headers.get("X-Signature", "")

    body_str = raw_body.decode("utf-8") if raw_body else ""
    base64_body = ""
    if body_str not in ("", "{}", "null"):
        base64_body = base64.b64encode(raw_body).decode("utf-8")

    plaintext = (timestamp + nonce_str + base64_body).encode("utf-8")

    expected_sig = hmac.new(
        client_secret.encode("utf-8"),
        plaintext,
        hashlib.sha256,
    ).hexdigest()

    return hmac.compare_digest(expected_sig, received_sig)
```

</details>

---

:::warning
Always use a **constant-time comparison** (e.g. `hmac.Equal` in Go, `crypto.timingSafeEqual` in Node.js, `hmac.compare_digest` in Python) when comparing signatures. A naive string equality check is vulnerable to timing attacks.
:::

:::tip
For additional security, also validate that the `X-Timestamp` is within an acceptable window (e.g. ±5 minutes) to reject replayed requests.
:::
