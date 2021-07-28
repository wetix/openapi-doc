---
sidebar_label: "Queries"
sidebar_position: 1
---

# Queries

- [cinemas](/docs/graphql/queries#cinemas)
- [cinema](/docs/graphql/queries#cinema)
- [movies](/docs/graphql/queries#movies)
- [movie](/docs/graphql/queries#movie)
- [movieShowtimes](/docs/graphql/queries#movieshowtimes)
- [movieOrderSession](/docs/graphql/queries#movieordersession)
- [movieOrders](/docs/graphql/queries#movieOrders)
- [movieOrder](/docs/graphql/queries#movieOrder)
  <!-- - [seatMap](/docs/graphql/queries#seatmap) -->
  <!-- - [tickets](/docs/graphql/queries#tickets) -->
  <!-- - [concessions](/docs/graphql/queries#concessions) -->
  <!-- - [vouchers](/docs/graphql/queries#vouchers) -->
  <!-- - [payments](/docs/graphql/queries#payments) -->

<!-- # Connections

Connections return a paginated list of items. The pagination is cursor-based. -->

## [cinemas](/docs/graphql/objects#cinemaconnection)

The list of cinemas.

**Return Type:** [CinemaConnection!](/docs/graphql/objects#cinemaconnection)

**Arguments**

| Name             | Data Type                                            | Description                                                                                                                                   |
| ---------------- | ---------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `after`          | [Key](/docs/graphql/scalars#key)                     | To return the elements in the list that comes after the specified cursor.                                                                     |
| `before`         | [Key](/docs/graphql/scalars#key)                     | To return the elements in the list that comes before the specified cursor. If both `after` and `before` is passed, `before` takes precedence. |
| `first`          | [Uint](/docs/graphql/scalars#uint)                   | Returns the first n elements from the list.                                                                                                   |
| `last`           | [Uint](/docs/graphql/scalars#uint)                   | Returns the last n elements from the list.                                                                                                    |
| `cinemaOperator` | [CinemaOperator](/docs/graphql/enums#cinemaoperator) | Select listings for cinemas owned by the specified cinema operator.                                                                           |
| `onScreenOnly`   | [Boolean](/docs/graphql/scalars#boolean)             | Select only listings where the cinemas have showtimes.                                                                                        |

## [cinema](/docs/graphql/objects#cinema)

Look up cinema by key.

**Return Type:** [Cinema!](/docs/graphql/objects#cinema)

**Arguments**

| Name  | Data Type                         | Description            |
| ----- | --------------------------------- | ---------------------- |
| `key` | [Key!](/docs/graphql/scalars#key) | The key of the cinema. |

## [movies](/docs/graphql/objects#movieconnection)

The list of now showing or coming soon movies.

**Return Type:** [MovieConnection!](/docs/graphql/objects#movieconnection)

**Arguments**

| Name           | Data Type                                | Description                                                                                                                                   |
| -------------- | ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `after`        | [Key](/docs/graphql/scalars#key)         | To return the elements in the list that comes after the specified cursor.                                                                     |
| `before`       | [Key](/docs/graphql/scalars#key)         | To return the elements in the list that comes before the specified cursor. If both `after` and `before` is passed, `before` takes precedence. |
| `first`        | [Uint](/docs/graphql/scalars#uint)       | Returns the first n elements from the list.                                                                                                   |
| `last`         | [Uint](/docs/graphql/scalars#uint)       | Returns the last n elements from the list.                                                                                                    |
| `onScreenOnly` | [Boolean](/docs/graphql/scalars#boolean) | Select only listings where the movies have showtimes.                                                                                         |

## [movie](/docs/graphql/objects#movie)

Look up movie by key.

**Return Type:** [Movie!](/docs/graphql/objects#movie)

**Arguments**

| Name  | Data Type                         | Description           |
| ----- | --------------------------------- | --------------------- |
| `key` | [Key!](/docs/graphql/scalars#key) | The key of the movie. |

## [movieShowtimes](/docs/graphql/objects#movieshowtimes)

Gets the showtimes for the specified movie and date.

**Return Type:** [MovieShowtimes!](/docs/graphql/objects#movieshowtimes)

Arguments:

| Name                                             | Description                                           |
| ------------------------------------------------ | ----------------------------------------------------- |
| `movieKey` [`(Key!)`](/docs/graphql/scalars#key) | The key of the movie whose showtimes will be fetched. |
| `date` [`(Date!)`](/docs/graphql/scalars#date)   | The date of the showtimes.                            |

## [seatMap](/docs/graphql/queries#seatmap)

Retrieve seat map by showtime key.

**Return Type:** [SeatMap!](/docs/graphql/objects#seatmap)

**Arguments**

| Name          | Data Type                         | Description              |
| ------------- | --------------------------------- | ------------------------ |
| `showtimeKey` | [Key!](/docs/graphql/scalars#key) | The key of the showtime. |
