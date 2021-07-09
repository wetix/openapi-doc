---
sidebar_label: "Connections"
sidebar_position: 1
---

# Connections

Connections return a list of items using cursor-based pagination.

## cinemas

The list of available cinemas that have movie showtimes.

**Type:** [CinemaConnection!](/docs/objects#cinemaconnectionn)

**Arguments**

| Name                                   | Description                                                                                                                                   |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `after` [`(Key)`](/docs/scalars#key)   | To return the elements in the list that comes after the specified cursor.                                                                     |
| `before` [`(Key)`](/docs/scalars#key)  | To return the elements in the list that comes before the specified cursor. If both `after` and `before` is passed, `before` takes precedence. |
| `limit` [`(Uint)`](/docs/scalars#uint) | The number of items to be returned in the list, the default is 100.                                                                           |

## scheduleMovies

The list of scheduled movies.

## comingSoonMovies

The list of coming soon movies.
