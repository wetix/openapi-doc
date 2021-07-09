---
sidebar_label: "Objects"
sidebar_position: 3
hide_table_of_contents: false
---

# Objects

## CinemaConnection

The list of available cinemas that have movie showtimes.

**Fields**

| Name                                               | Description                                |
| -------------------------------------------------- | ------------------------------------------ |
| `nodes` [`([Cinema!])`](/docs/objects#cinema)      | The list of cinemas.                       |
| `pageInfo` [`(PageInfo!)`](/docs/objects#pageinfo) | The page information to assist pagination. |

## Cinema

The cinema object.

**Fields**

| Name                                               | Description                                      |
| -------------------------------------------------- | ------------------------------------------------ |
| `key` [`(Key!)`](/docs/scalars#key)                | An unique identifier for this object.            |
| `name` [`(String!)`](/docs/scalars#string)         | The name of the cinema.                          |
| `operator` [`(String!)`](/docs/scalars#string)     | The cinema operator, i.e, GSC, TGV, MMC or DADI. |
| `address` [`(String!)`](/docs/scalars#string)      | The address of the cinema.                       |
| `postCode` [`(String!)`](/docs/scalars#string)     | The post code of the cinema.                     |
| `stateCode` [`(String!)`](/docs/scalars#string)    | The state code of the cinema.                    |
| `imageUrl` [`(String!)`](/docs/scalars#string)     | The URL of the logo of the cinema.               |
| `geopoint` [`(GeoPoint!)`](/docs/scalars#geopoint) | The latitude and longitude of the cinema.        |

## PageInfo

The page information to assist pagination.

**Fields**

| Name                                                    | Description                                                      |
| ------------------------------------------------------- | ---------------------------------------------------------------- |
| `hasNextPage` [`(Boolean!)`](/docs/scalars#boolean)     | A flag indicating if there are more pages to paginate forwards.  |
| `hasPreviousPage` [`(Boolean!)`](/docs/scalars#boolean) | A flag indicating if there are more pages to paginate backwards. |
| `startCursor` [`(Key)`](/docs/scalars#key)              | The cursor to be used to paginate backwards.                     |
| `endCursor` [`(Key)`](/docs/scalars#key)                | The cursor to be used to paginate forwards.                      |
