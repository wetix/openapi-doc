---
sidebar_label: "Input Objects"
sidebar_position: 4
---

# Input Objects

## [CreateMovieOrderSessionInput](/docs/graphql/input_objects#createmovieordersessioninput)

Create movie order session input.

**Input Fields**

| Name          | Data Type                         | Description                     |
| ------------- | --------------------------------- | ------------------------------- |
| `showtimeKey` | [Key!](/docs/graphql/scalars#key) | Unique identifier for showtime. |

## [ReserveSeatsInput](/docs/graphql/input_objects#reserveseatsinput)

Reserve seats in the selected showtime.

**Input Fields**

| Name         | Data Type                                  | Description                                |
| ------------ | ------------------------------------------ | ------------------------------------------ |
| `sessionKey` | [Key!](/docs/graphql/scalars#key)          | Unique identifier for movie order session. |
| `seats`      | [[String!]!](/docs/graphql/scalars#string) | An array of selected seats' keys.          |

## [ReleaseSeatsInput](/docs/graphql/input_objects#releaseseatsinput)

Reserve seats in the selected showtime.

**Input Fields**

| Name         | Data Type                         | Description                                |
| ------------ | --------------------------------- | ------------------------------------------ |
| `sessionKey` | [Key!](/docs/graphql/scalars#key) | Unique identifier for movie order session. |

## [CreateMovieOrderInput](/docs/graphql/input_objects#createmovieorderinput)

Create movie order input with selected tickets and concessions.

**Input Fields**

| Name          | Data Type                                                                                         | Description                                                                    |
| ------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| `sessionKey`  | [Key!](/docs/graphql/scalars#key)                                                                 | Unique identifier for movie order session.                                     |
| `referenceId` | [String!](/docs/graphql/scalars#string)                                                           | External unique identifier for order.                                          |
| `customer`    | [CreateMovieOrderCustomerInput!](/docs/graphql/input_objects#createmovieordercustomerinput)       | Customer information for movie order session.                                  |
| `tickets`     | [[CreateMovieOrderTicketInput!]!](/docs/graphql/input_objects#createmovieorderticketinput)        | Selected tickets input.                                                        |
| `concessions` | [[CreateMovieOrderConcessionInput]!](/docs/graphql/input_objects#createmovieorderconcessioninput) | Selected concessions input.                                                    |
| `promoCode`   | [String!](/docs/graphql/scalars#key)                                                              | Promo code applied by the user.                                                |
| `redirectUrl` | [URI!](/docs/graphql/scalars#uri)                                                                 | Specifically required for GSC, we will redirect back once the order confirmed. |

## [CreateMovieOrderCustomerInput](/docs/graphql/input_objects#movieordercustomerinput)

The customer info.

**Input Fields**

| Name         | Data Type                               | Description                                                                        |
| ------------ | --------------------------------------- | ---------------------------------------------------------------------------------- |
| `externalId` | [String!](/docs/graphql/scalars#string) | External unique identifier for the user.                                           |
| `email`      | [String!](/docs/graphql/scalars#string) | The email address of the customer, this will sending a booking confirmation email. |
| `phoneNo`    | [String!](/docs/graphql/scalars#string) | The phone no of the customer.                                                      |

## [CreateMovieOrderTicketInput](/docs/graphql/input_objects#createmovieorderticketinput)

The selected tickets.

**Input Fields**

| Name       | Data Type                               | Description                           |
| ---------- | --------------------------------------- | ------------------------------------- |
| `key`      | [String!](/docs/graphql/scalars#string) | The unique identifier for the ticket. |
| `quantity` | [Uint!](/docs/graphql/scalars#uint)     | The quantity of the ticket.           |

## [CreateMovieOrderConcessionInput](/docs/graphql/input_objects#createmovieorderconcessioninput)

The selected concessions.

**Input Fields**

| Name       | Data Type                               | Description                               |
| ---------- | --------------------------------------- | ----------------------------------------- |
| `key`      | [String!](/docs/graphql/scalars#string) | The unique identifier for the concession. |
| `quantity` | [Uint!](/docs/graphql/scalars#uint)     | The quantity of the concession.           |

## [ConfirmMovieOrderInput](/docs/graphql/input_objects#confirmmovieorderinput)

Confirm movie order input.

**Input Fields**

| Name       | Data Type                         | Description                                |
| ---------- | --------------------------------- | ------------------------------------------ |
| `orderKey` | [Key!](/docs/graphql/scalars#key) | The unique identifier for the movie order. |

## [SignatureInput](/docs/graphql/input_objects#signatureinput)

The signature input for signed mutations.

**Input Fields**

| Name        | Data Type                                                     | Description                                                                   |
| ----------- | ------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `algorithm` | [SignatureAlgorithm!](/docs/graphql/enums#signaturealgorithm) | The hash function.                                                            |
| `timestamp` | [Int64!](/docs/graphql/scalars#int64)                         | The UNIX time.                                                                |
| `hash`      | [String!](/docs/graphql/scalars#string)                       | The signature generated following the steps [here](/docs/security/signature). |
