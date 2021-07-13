---
sidebar_label: "Connections"
sidebar_position: 1
---

# Connections

Connections return a paginated list of items. The pagination is cursor-based.

## cinemas

The list of available cinemas that have movie showtimes.

**Type:** [CinemaConnection!](/docs/objects#cinemaconnection)

**Arguments**

| Name                                   | Description                                                                                                                                   |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `after` [`(Key)`](/docs/scalars#key)   | To return the elements in the list that comes after the specified cursor.                                                                     |
| `before` [`(Key)`](/docs/scalars#key)  | To return the elements in the list that comes before the specified cursor. If both `after` and `before` is passed, `before` takes precedence. |
| `limit` [`(Uint)`](/docs/scalars#uint) | The number of items to be returned in the list, the default is 100.                                                                           |

## movies

The list of now showing or coming soon movies.

**Type:** [MovieConnection!](/docs/objects#movieconnection)

**Arguments**

| Name                                                       | Description                                                                                                                                   |
| ---------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `after` [`(Key)`](/docs/scalars#key)                       | To return the elements in the list that comes after the specified cursor.                                                                     |
| `before` [`(Key)`](/docs/scalars#key)                      | To return the elements in the list that comes before the specified cursor. If both `after` and `before` is passed, `before` takes precedence. |
| `limit` [`(Uint)`](/docs/scalars#uint)                     | The number of items to be returned in the list, the default is 100.                                                                           |
| `category` [`(MovieCategory!)`](/docs/enums#moviecategory) | The category of the movie, i.e. now showing movies or coming soon movies.                                                                     |
