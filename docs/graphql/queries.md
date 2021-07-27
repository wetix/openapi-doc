---
sidebar_label: "Queries"
sidebar_position: 1
---

# Queries

- [cinemas](/docs/graphql/queries#cinemas)
- [movies](/docs/graphql/queries#movies)

# Connections

Connections return a paginated list of items. The pagination is cursor-based.

## [cinemas](/docs/graphql/objects#cinemaconnection)

The list of cinemas.

**Return Type:** [CinemaConnection!](/docs/graphql/objects#cinemaconnection)

**Arguments**

| Name             | Data Type                                | Description                                                                                                                                   |
| ---------------- | ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `after`          | [Key](/docs/graphql/scalars#key)         | To return the elements in the list that comes after the specified cursor.                                                                     |
| `before`         | [Key](/docs/graphql/scalars#key)         | To return the elements in the list that comes before the specified cursor. If both `after` and `before` is passed, `before` takes precedence. |
| `first`          | [Uint](/docs/graphql/scalars#uint)       | Returns the first n elements from the list.                                                                                                   |
| `last`           | [Uint](/docs/graphql/scalars#uint)       | Returns the last n elements from the list.                                                                                                    |
| `cinemaOperator` | Enum                                     | Select listings for cinemas owned by the specified cinema operator.                                                                           |
| `onScreenOnly`   | [Boolean](/docs/graphql/scalars#boolean) | Select only listings where the cinemas have showtimes.                                                                                        |

## [movies](/docs/graphql/objects#movieconnection)

The list of now showing or coming soon movies.

**Return Type:** [MovieConnection!](/docs/graphql/objects#movieconnection)

**Arguments**

| Name           | Data Type                                | Description                                                                                                                                   |
| -------------- | ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | --- |
| `after`        | [Key](/docs/graphql/scalars#key)         | To return the elements in the list that comes after the specified cursor.                                                                     |
| `before`       | [Key](/docs/graphql/scalars#key)         | To return the elements in the list that comes before the specified cursor. If both `after` and `before` is passed, `before` takes precedence. |
| `first`        | [Uint](/docs/graphql/scalars#uint)       | Returns the first n elements from the list.                                                                                                   |
| `last`         | [Uint](/docs/graphql/scalars#uint)       | Returns the last n elements from the list.                                                                                                    |
| `onScreenOnly` | [Boolean](/docs/graphql/scalars#boolean) | Select only listings where the movies have showtimes.                                                                                         |     |

## [cinema](/docs/graphql/objects#cinema)

Look up cinema by key.

**Return Type:** [Cinema!](/docs/graphql/objects#cinema)

**Arguments**

| Name  | Data Type                         | Description            |
| ----- | --------------------------------- | ---------------------- |
| `key` | [Key!](/docs/graphql/scalars#key) | The key of the cinema. |

## [movie](/docs/graphql/objects#movie)

Look up movie by key.

**Return Type:** [Movie!](/docs/graphql/objects#movie)

**Arguments**

| Name  | Data Type                         | Description           |
| ----- | --------------------------------- | --------------------- |
| `key` | [Key!](/docs/graphql/scalars#key) | The key of the movie. |
