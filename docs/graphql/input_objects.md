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

| Name               | Data Type                                             | Description                                |
| ------------------ | ----------------------------------------------------- | ------------------------------------------ |
| `sessionKey`       | [Key!](/docs/graphql/scalars#key)                     | Unique identifier for movie order session. |
| `customer`         | [MovieOrderCustomerInput!](/docs/graphql/objects#key) | Unique identifier for movie order session. |
| `transactionRefId` | [String](/docs/graphql/scalars#string)                | Unique identifier for movie order session. |
| `tickets`          | [SelectedTicket!](/docs/graphql/objects#)             | Unique identifier for movie order session. |
| `concessions`      | [MovieOrderConcessionsInput!](/docs/graphql/objects#) | Unique identifier for movie order session. |
| `sessionKey`       | [Key!](/docs/graphql/scalars#key)                     | Unique identifier for movie order session. |
| `sessionKey`       | [Key!](/docs/graphql/scalars#key)                     | Unique identifier for movie order session. |
