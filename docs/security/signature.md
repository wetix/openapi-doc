---
sidebar_label: "Signature Algorithm"
sidebar_position: 1
---

# Signature Algorithm

WeTix Open API requires requests on [createMovieOrder](/docs/graphql/mutations#createmovieorder), and [confirmMovieOrder](/docs/graphql/mutations#confirmmovieorder) mutations to be signed to ensure the authencity and integrity of the requests.

:::note
Please generate a pair of **RSA private and public keys** on your end and send only the public key to the person-in-charge of WeTix.
:::

The steps for generating a signature for a mutations are as follows:

### Step 1: Sort the Input Argument

WeTix Open API mutations that require to be signed contain the **input** and **signature** arguments. The input argument will be used for generating the signature.

:::important

- Please **sort the input argument in alphabetical order** by its keys. Any **nested objects within the input argument also need to be sorted** in alphabetical order by its keys.
- All of the fields of the input argument needs to be included even if it has no data.
  :::

**Example of unsorted input argument object**:

```
{
  "sessionKey": "EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMXpodkxWbUdBMExZbGFuUWUxMUNpbWN6Mklk",
  "referenceId": "123",
  "customer": {
    "externalId": null,
    "email": "harithmohamd67@gmail.com",
    "countryCode": "60",
    "phoneNo": "167385346"
  },
  "tickets": [
    {
      "key": "U_-HAwEBCUdvYlRpY2tldAH_iAABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAGv-IAQVBZHVsdAEFQURVTFQBATEB_g-gAQEA",
      "quantity": 1
    }
  ],
  "concessions": null,
  "bundles": null,
  "promoCode": null
}
```

**Example of sorted input argument object**:

```
{
  "bundles": null,
  "concessions": null,
  "customer": {
    "countryCode": "60",
    "email": "harithmohamd67@gmail.com",
    "externalId": null,
    "phoneNo": "167385346"
  },
  "promoCode": null,
  "referenceId": "123",
  "sessionKey": "EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMXpodkxWbUdBMExZbGFuUWUxMUNpbWN6Mklk",
  "tickets": [
    {
      "key": "U_-HAwEBCUdvYlRpY2tldAH_iAABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAGv-IAQVBZHVsdAEFQURVTFQBATEB_g-gAQEA",
      "quantity": 1
    }
  ]
}
```

:::important
Please ensure the sorted input argument object is **compact/ minified**.
:::

**Minified Input Argument:**

```
{"bundles":null,"concessions":null,"customer":{"countryCode":"60","email":"harithmohamd67@gmail.com","externalId":null,"phoneNo":"167385346"},"promoCode":null,"referenceId":"123","sessionKey":"EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMXpodkxWbUdBMExZbGFuUWUxMUNpbWN6Mklk","tickets":[{"key":"U_-HAwEBCUdvYlRpY2tldAH_iAABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAGv-IAQVBZHVsdAEFQURVTFQBATEB_g-gAQEA","quantity":1}]}
```

### Step 2: Encode the Sorted Input Argument

Please encode the sorted input argument object using **Base64 encoding**.

**Example:**

:::note
ewogICJjb25jZXNzaW9ucyI6IG51bGwsCiAgImN1c3RvbWVyIjogewogICAgImVtYWlsIjogImhhcml0aG1vaGFtZDY3QGdtYWlsLmNvbSIsCiAgICAiZXh0ZXJuYWxJZCI6ICJhYmMxMjMiLAogICAgInBob25lTm8iOiAiMDE2NzM4NTM0NiIKICB9LAogICJwcm9tb0NvZGUiOiBudWxsLAogICJyZWRpcmVjdFVybCI6ICJodHRwczovL2dvb2dsZS5jb20iLAogICJyZWZlcmVuY2VJZCI6ICIxMjMiLAogICJzZXNzaW9uS2V5IjogIkVoRk5iM1pwWlU5eVpHVnlVMlZ6YzJsdmJpSWJNWHBvZGt4V2JVZEJNRXhaYkdGdVVXVXhNVU5wYldONk1rbGsiLAogICJ0aWNrZXRzIjogWwogICAgewogICAgICAia2V5IjogIlVfLUhBd0VCQ1VkdllsUnBZMnRsZEFIX2lBQUJCUUVDU1VRQkRBQUJCRTVoYldVQkRBQUJDRUZ5WldGRGIyUmxBUXdBQVFaQmJXOTFiblFCQmdBQkQxTmxZWFJ6UVd4c2IyTmhkR2x2YmdFR0FBQUFHdi1JQVFWQlpIVnNkQUVGUVVSVlRGUUJBVEVCX2ctZ0FRRUEiLAogICAgICAicXVhbnRpdHkiOiAxCiAgICB9CiAgXQp9
:::

### Step 3: Construct a Plaintext

Please construct a plaintext with the following parameters in the order specified below:

| Name        | Data Type | Description                                                        |
| ----------- | --------- | ------------------------------------------------------------------ |
| `clientId`  | String    | The client ID obtained from the person-in-charge of WeTix.         |
| `data`      | String    | The content from **Step 2**.                                       |
| `mutation`  | String    | The mutation name.                                                 |
| `shaType`   | String    | The hash function. Currently, WeTix Open API only supports SHA256. |
| `timestamp` | String    | The UNIX timestamp.                                                |

**Example of plaintext:**

:::note
clientId=1612417576451877743&amp;data=ewogICJjb25jZXNzaW9ucyI6IG51bGwsCiAgImN1c3RvbWVyIjogewogICAgImVtYWlsIjogImhhcml0aG1vaGFtZDY3QGdtYWlsLmNvbSIsCiAgICAiZXh0ZXJuYWxJZCI6ICJhYmMxMjMiLAogICAgInBob25lTm8iOiAiMDE2NzM4NTM0NiIKICB9LAogICJwcm9tb0NvZGUiOiBudWxsLAogICJyZWRpcmVjdFVybCI6ICJodHRwczovL2dvb2dsZS5jb20iLAogICJyZWZlcmVuY2VJZCI6ICIxMjMiLAogICJzZXNzaW9uS2V5IjogIkVoRk5iM1pwWlU5eVpHVnlVMlZ6YzJsdmJpSWJNWHBvZGt4V2JVZEJNRXhaYkdGdVVXVXhNVU5wYldONk1rbGsiLAogICJ0aWNrZXRzIjogWwogICAgewogICAgICAia2V5IjogIlVfLUhBd0VCQ1VkdllsUnBZMnRsZEFIX2lBQUJCUUVDU1VRQkRBQUJCRTVoYldVQkRBQUJDRUZ5WldGRGIyUmxBUXdBQVFaQmJXOTFiblFCQmdBQkQxTmxZWFJ6UVd4c2IyTmhkR2x2YmdFR0FBQUFHdi1JQVFWQlpIVnNkQUVGUVVSVlRGUUJBVEVCX2ctZ0FRRUEiLAogICAgICAicXVhbnRpdHkiOiAxCiAgICB9CiAgXQp9&amp;mutation=createMovieOrdershaType=SHA256&amp;timestamp=1634616725
:::

### Step 4: Sign using the Client's Private Key

Please sign the plaintext using **SHA256 with the RSA private key** that you have generated on your end and please make sure the public key has been sent to WeTix.

**Example of signature:**

:::note
iiOosRbI+60jd5UeE4UbYnQ4KMSIuyX15Nf004ThwPQbotOxLTkc/KPNqF2Zx+mwlIcAO2FcyXiXc/D4hyQPkCivUJXyUD8qB36qEGuGpTqIJRpECbBlsMCocFoTe0C0xMbX6JuQtoGZXqTPbtyWqaBuDzyNkMlJ5qEmnu51zrI=
:::

:::important
Please make sure the signature is **Base64 encoded.**
:::

### Step 5: Set Signature Argument

Please include the signature and other parameters in the [signature argument](/docs/graphql/input_objects#signatureinput) of the mutation request.

**Example:**

```
{
  "input": {
    "sessionKey": "EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMXppazVYT2gybkg0aHprWnRKdzljbkRXZGto",
    "referenceId": "123",
    "customer": {
      "externalId": "abc123",
      "email": "harithmohamd67@gmail.com",
      "countryCode": "60",
      "phoneNo": "167385346"
    },
    "tickets": [
      {
        "key": "U_-HAwEBCUdvYlRpY2tldAH_iAABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAGv-IAQVBZHVsdAEFQURVTFQBATEB_gWqAQEA",
        "quantity": 1
      }
    ],
    "concessions": null,
    "promoCode": null,
    "bundles": null,
  },
  "signature": {
    "algorithm": "SHA256",
    "timestamp": 1634638112,
    "hash": "iiOosRbI+60jd5UeE4UbYnQ4KMSIuyX15Nf004ThwPQbotOxLTkc/KPNqF2Zx+mwlIcAO2FcyXiXc/D4hyQPkCivUJXyUD8qB36qEGuGpTqIJRpECbBlsMCocFoTe0C0xMbX6JuQtoGZXqTPbtyWqaBuDzyNkMlJ5qEmnu51zrI="
  }
}
```
