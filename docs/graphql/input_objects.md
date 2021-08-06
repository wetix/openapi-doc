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

| Name               | Data Type                                                                       | Description                                |
| ------------------ | ------------------------------------------------------------------------------- | ------------------------------------------ |
| `sessionKey`       | [Key!](/docs/graphql/scalars#key)                                               | Unique identifier for movie order session. |
| `customer`         | [MovieOrderCustomerInput!](/docs/graphql/input_objects#movieordercustomerinput) | Unique identifier for movie order session. |
| `transactionRefId` | [String](/docs/graphql/scalars#string)                                          | Unique identifier for movie order session. |
| `tickets`          | [MovieOrderTicketsInput!](/docs/graphql/input_objects#)                         | Unique identifier for movie order session. |
| `concessions`      | [MovieOrderConcessionsInput!](/docs/graphql/input_objects#)                     | Unique identifier for movie order session. |
| `promoCode`        | [String!](/docs/graphql/scalars#key)                                            | Unique identifier for movie order session. |

## [MovieOrderCustomerInput](/docs/graphql/input_objects#movieordercustomerinput)

Create movie order input with selected tickets and concessions.

**Input Fields**

| Name         | Data Type                               | Description                                                                        |
| ------------ | --------------------------------------- | ---------------------------------------------------------------------------------- |
| `key`        | [Key!](/docs/graphql/scalars#key)       | Unique identifier for the user.                                                    |
| `externalId` | [String!](/docs/graphql/scalars#string) |                                                                                    |
| `email`      | [String](/docs/graphql/scalars#string)  | The email address of the customer, this will sending a booking confirmation email. |
| `phoneNo`    | [String!](/docs/graphql/scalars#string) | The phone no of the customer.                                                      |
