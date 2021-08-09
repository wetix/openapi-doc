---
sidebar_label: "Input Objects"
sidebar_position: 4
---

# Input Objects

## [createMovieOrderSessionInput](/docs/graphql/input_objects#createmovieordersessioninput)

Create movie order session input.

**Input Fields**

| Name          | Data Type                         | Description                     |
| ------------- | --------------------------------- | ------------------------------- |
| `showtimeKey` | [Key!](/docs/graphql/scalars#key) | Unique identifier for showtime. |

## [reserveSeatsInput](/docs/graphql/input_objects#reseverseatsinput)

Reserve seats in the selected showtime.

**Input Fields**

| Name         | Data Type                         | Description                                |
| ------------ | --------------------------------- | ------------------------------------------ |
| `sessionKey` | [Key!](/docs/graphql/scalars#key) | Unique identifier for movie order session. |

## [createMovieOrderInput](/docs/graphql/input_objects#createmovieorderinput)

Create movie order input with selected tickets and concessions.

**Input Fields**

| Name          | Data Type                                                                       | Description                                   |
| ------------- | ------------------------------------------------------------------------------- | --------------------------------------------- |
| `sessionKey`  | [Key!](/docs/graphql/scalars#key)                                               | Unique identifier for movie order session.    |
| `customer`    | [MovieOrderCustomerInput!](/docs/graphql/input_objects#movieordercustomerinput) | Customer information for movie order session. |
| `orderId`     | [String!](/docs/graphql/scalars#string)                                         | External unique identifier for order.         |
| `tickets`     | [MovieOrderTicketsInput!](/docs/graphql/input_objects#)                         | Selected tickets input.                       |
| `concessions` | [MovieOrderConcessionsInput!](/docs/graphql/input_objects#)                     | Selected concessions input.                   |
| `promoCode`   | [String!](/docs/graphql/scalars#key)                                            | Promo code applied by the user.               |

## [MovieOrderCustomerInput](/docs/graphql/input_objects#movieordercustomerinput)

Create movie order input with selected tickets and concessions.

**Input Fields**

| Name         | Data Type                               | Description                                                                        |
| ------------ | --------------------------------------- | ---------------------------------------------------------------------------------- |
| `key`        | [Key!](/docs/graphql/scalars#key)       | Unique identifier for the user.                                                    |
| `externalId` | [String!](/docs/graphql/scalars#string) | External unique identifier for the user.                                           |
| `email`      | [String](/docs/graphql/scalars#string)  | The email address of the customer, this will sending a booking confirmation email. |
| `phoneNo`    | [String!](/docs/graphql/scalars#string) | The phone no of the customer.                                                      |
