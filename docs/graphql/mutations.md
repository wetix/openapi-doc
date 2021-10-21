---
sidebar_label: "Mutations"
sidebar_position: 2
---

# Mutations

Every GraphQL schema has a root type for both queries and mutations. The mutation type defines GraphQL operations that change data on the server. It is analogous to performing HTTP verbs such as **POST**, **PATCH**, and **DELETE**.


## [createMovieOrderSession](/docs/graphql/mutations#createmovieordersession)

Create a movie order session.

**Arguments**

| Name    | Data Type                                                                                 | Description                |
| ------- | ----------------------------------------------------------------------------------------- | -------------------------- |
| `input` | [CreateMovieOrderSessionInput!](/docs/graphql/input_objects#createmovieordersessioninput) | The input argument object. |

**Return Fields**

| Name      | Data Type                                                     | Description                     |
| --------- | ------------------------------------------------------------- | ------------------------------- |
| `session` | [MovieOrderSession!](/docs/graphql/objects#movieordersession) | The movie order session object. |

## [reserveSeats](/docs/graphql/mutations#reserveseats)

Reserve and lock the selected seats.

**Arguments**

| Name    | Data Type                                                           | Description                |
| ------- | ------------------------------------------------------------------- | -------------------------- |
| `input` | [ReserveSeatsInput!](/docs/graphql/input_objects#reserveseatsinput) | The input argument object. |

**Return Fields**

| Name      | Data Type                                                     | Description                     |
| --------- | ------------------------------------------------------------- | ------------------------------- |
| `session` | [MovieOrderSession!](/docs/graphql/objects#movieordersession) | The movie order session object. |

## [releaseSeats](/docs/graphql/mutations#releaseseats)

**Arguments**

| Name    | Data Type                                                           | Description                |
| ------- | ------------------------------------------------------------------- | -------------------------- |
| `input` | [ReleaseSeatsInput!](/docs/graphql/input_objects#releaseseatsinput) | The input argument object. |

**Return Fields**

| Name      | Data Type                                                     | Description                     |
| --------- | ------------------------------------------------------------- | ------------------------------- |
| `session` | [MovieOrderSession!](/docs/graphql/objects#movieordersession) | The movie order session object. |

## [createMovieOrder](/docs/graphql/mutations#createmovieorder)

Create a movie order.

**Arguments**

| Name        | Data Type                                                                   | Description                    |
| ----------- | --------------------------------------------------------------------------- | ------------------------------ |
| `input`     | [CreateMovieOrderInput!](/docs/graphql/input_objects#createmovieorderinput) | The input argument object.     |
| `signature` | [SignatureInput!](/docs/graphql/input_objects#signatureinput)               | The signature argument object. |

**Return Fields**

| Name              | Data Type                                       | Description                                                                                 |
| ----------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `order`           | [MovieOrder!](/docs/graphql/objects#movieorder) | The movie order session object.                                                             |
| `hasCheckoutLink` | [Boolean!](/docs/graphql/scalars/boolean)       | Indicates whether a redirection to the cinema checkout page is required (specific for GSc). |
| `checkoutUrl`     | [URI!](/docs/graphql/objects#movieorder)        | The cinema checkout URL (specific for GSC).                                                 |

## [createPaymentWithMovieOrder](/docs/graphql/mutations#createpaymentwithmovieorder)

Create a new payment with the existing movie order.

**Arguments**

| Name        | Data Type                                                                                         | Description                    |
| ----------- | ------------------------------------------------------------------------------------------------- | ------------------------------ |
| `input`     | [CreatePaymentWithMovieOrderInput!](/docs/graphql/input_objects#createpaymentwithmovieorderinput) | The input argument object.     |
| `signature` | [SignatureInput!](/docs/graphql/input_objects#signatureinput)                                     | The signature argument object. |

**Return Fields**

| Name    | Data Type                                       | Description             |
| ------- | ----------------------------------------------- | ----------------------- |
| `order` | [MovieOrder!](/docs/graphql/objects#movieorder) | The movie order object. |

## [confirmMovieOrder](/docs/graphql/mutations#confirmmovieorder)

Confirm movie order.

**Arguments**

| Name        | Data Type                                                                     | Description                    |
| ----------- | ----------------------------------------------------------------------------- | ------------------------------ |
| `input`     | [ConfirmMovieOrderInput!](/docs/graphql/input_objects#confirmmovieorderinput) | The input argument object.     |
| `signature` | [SignatureInput!](/docs/graphql/input_objects#signatureinput)                 | The signature argument object. |

**Return Fields**

| Name    | Data Type                                       | Description             |
| ------- | ----------------------------------------------- | ----------------------- |
| `order` | [MovieOrder!](/docs/graphql/objects#movieorder) | The movie order object. |
