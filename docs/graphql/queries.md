---
sidebar_label: "Queries"
sidebar_position: 1
---

# Queries

Every GraphQL schema has a root type for both queries and mutations. The query type defines GraphQL operations that retrieve data from the server.

<!-- # Connections

Connections return a paginated list of items. The pagination is cursor-based. -->

## [user](/docs/graphql/queries#user)

Look up user by key.

**Arguments**

| Name  | Data Type                         | Description          |
| ----- | --------------------------------- | -------------------- |
| `key` | [Key!](/docs/graphql/scalars#key) | The key of the user. |

**Return Type:** [User!](/docs/graphql/objects#user)

## [cinemas](/docs/graphql/queries#cinemas)

The list of cinemas.

**Arguments**

| Name             | Data Type                                            | Description                                                                                                                                   |
| ---------------- | ---------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `after`          | [Key](/docs/graphql/scalars#key)                     | To return the elements in the list that comes after the specified cursor.                                                                     |
| `before`         | [Key](/docs/graphql/scalars#key)                     | To return the elements in the list that comes before the specified cursor. If both `after` and `before` is passed, `before` takes precedence. |
| `first`          | [Uint](/docs/graphql/scalars#uint)                   | Returns the first n elements from the list.                                                                                                   |
| `last`           | [Uint](/docs/graphql/scalars#uint)                   | Returns the last n elements from the list.                                                                                                    |
| `cinemaOperator` | [CinemaOperator](/docs/graphql/enums#cinemaoperator) | Select listings for cinemas owned by the specified cinema operator.                                                                           |
| `onScreenOnly`   | [Boolean](/docs/graphql/scalars#boolean)             | Select only listings where the cinemas have showtimes.                                                                                        |

**Return Type:** [CinemaConnection!](/docs/graphql/objects#cinemaconnection)

## [cinema](/docs/graphql/queries#cinema)

Look up cinema by key.

**Arguments**

| Name  | Data Type                         | Description            |
| ----- | --------------------------------- | ---------------------- |
| `key` | [Key!](/docs/graphql/scalars#key) | The key of the cinema. |

**Return Type:** [Cinema!](/docs/graphql/objects#cinema)

## [movies](/docs/graphql/queries#movies)

The list of now showing or coming soon movies.

**Arguments**

| Name           | Data Type                                | Description                                                                                                                                   |
| -------------- | ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `after`        | [Key](/docs/graphql/scalars#key)         | To return the elements in the list that comes after the specified cursor.                                                                     |
| `before`       | [Key](/docs/graphql/scalars#key)         | To return the elements in the list that comes before the specified cursor. If both `after` and `before` is passed, `before` takes precedence. |
| `first`        | [Uint](/docs/graphql/scalars#uint)       | Returns the first n elements from the list.                                                                                                   |
| `last`         | [Uint](/docs/graphql/scalars#uint)       | Returns the last n elements from the list.                                                                                                    |
| `onScreenOnly` | [Boolean](/docs/graphql/scalars#boolean) | Select only listings where the movies have showtimes.                                                                                         |

**Return Type:** [MovieConnection!](/docs/graphql/objects#movieconnection)

## [movie](/docs/graphql/queries#movie)

Look up movie by key.

**Arguments**

| Name  | Data Type                         | Description           |
| ----- | --------------------------------- | --------------------- |
| `key` | [Key!](/docs/graphql/scalars#key) | The key of the movie. |

**Return Type:** [Movie!](/docs/graphql/objects#movie)

## [movieOrderSession](/docs/graphql/queries#movieordersession)

Look up movie order session by key.

**Arguments**

| Name  | Data Type                         | Description           |
| ----- | --------------------------------- | --------------------- |
| `key` | [Key!](/docs/graphql/scalars#key) | The key of the movie. |

**Return Type:** [MovieOrderSession!](/docs/graphql/objects#movieordersession)

## [movieOrder](/docs/graphql/queries#movieorder)

Look up movie order by key.

**Arguments**

| Name  | Data Type                         | Description                 |
| ----- | --------------------------------- | --------------------------- |
| `key` | [Key!](/docs/graphql/scalars#key) | The key of the movie order. |

**Return Type:** [MovieOrder!](/docs/graphql/objects#movieorder)
