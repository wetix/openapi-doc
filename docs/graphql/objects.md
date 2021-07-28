---
sidebar_label: "Objects"
sidebar_position: 3
hide_table_of_contents: false
---

# Objects

## [CinemaConnection](/docs/graphql/objects#cinemaconnection)

The list of cinemas.

**Fields**

| Name         | Data Type                                   | Description                                            |
| ------------ | ------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [Cinema!](/docs/graphql/objects#cinema)     | The list of cinemas.                                   |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo) | The page information to assist pagination.             |
| `totalCount` | [Int!](/docs/graphql/objects#movie)         | Identifies the total count of items in the connection. |

## [MovieConnection](/docs/graphql/objects#movieconnection)

The list of movies.

**Fields**

| Name         | Data Type                                   | Description                                            |
| ------------ | ------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [Movie!](/docs/graphql/objects#movie)       | The list of movies.                                    |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo) | The page information to assist pagination.             |
| `totalCount` | [Int!](/docs/graphql/objects#movie)         | Identifies the total count of items in the connection. |

## [Cinema](/docs/graphql/objects#cinema)

The cinema object.

**Fields**

| Name        | Data Type                                   | Description                                      |
| ----------- | ------------------------------------------- | ------------------------------------------------ |
| `key`       | [Key!](/docs/graphql/scalars#key)           | An unique identifier for this object.            |
| `name`      | [String!](/docs/graphql/scalars#string)     | The name of the cinema.                          |
| `operator`  | [String!](/docs/graphql/scalars#string)     | The cinema operator, i.e, GSC, TGV, MMC or DADI. |
| `address`   | [String!](/docs/graphql/scalars#string)     | The address of the cinema.                       |
| `postCode`  | [String!](/docs/graphql/scalars#string)     | The post code of the cinema.                     |
| `stateCode` | [String!](/docs/graphql/scalars#string)     | The state code of the cinema.                    |
| `imageUrl`  | [String!](/docs/graphql/scalars#string)     | The URL of the logo of the cinema.               |
| `geopoint`  | [GeoPoint!](/docs/graphql/scalars#geopoint) | The latitude and longitude of the cinema.        |

## [Movie](/docs/graphql/objects#movie)

The movie object.

**Fields**

| Name               | Data Type                                           | Description                                          |
| ------------------ | --------------------------------------------------- | ---------------------------------------------------- |
| `key`              | [Key!](/docs/graphql/scalars#key)                   | An unique identifier for this object.                |
| `title`            | [String!](/docs/graphql/scalars#string)             | The title of the movie.                              |
| `censorship`       | [Censorship!](/docs/graphql/enums#censorship)       | The censor rating of the movie.                      |
| `category`         | [MovieCategory!](/docs/graphql/enums#moviecategory) | The category of the movie.                           |
| `screeningType`    | [ScreeningType!](/docs/graphql/enums#screeningtype) | The screening type of the movie.                     |
| `plot`             | [String!](/docs/graphql/scalars#string)             | The plot of the movie.                               |
| `portraitImageUrl` | [String!](/docs/graphql/scalars#string)             | The poster image URL of the movie.                   |
| `genres`           | [String!](/docs/graphql/scalars#string)             | The genres of the movie.                             |
| `releasedAt`       | [Date!](/docs/graphql/scalars#date)                 | The date when the movie was released in cinemas.     |
| `createdAt`        | [DateTime!](/docs/graphql/scalars#datetime)         | The date time the movie was created in WeTix system. |

## [MovieOrderConnection](/docs/graphql/objects#movieorderconnection)

The list of movie orders.

**Fields**

| Name         | Data Type                                       | Description                                            |
| ------------ | ----------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [MovieOrder!](/docs/graphql/objects#movieorder) | The list of movie orders.                              |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo)     | The page information to assist pagination.             |
| `totalCount` | [Int!](/docs/graphql/objects#movie)             | Identifies the total count of items in the connection. |

## [MovieShowtimes](/docs/graphql/objects#movieshowtimes)

The showtimes of a movie grouped by the cinemas that are playing the movie and the hall types of the cinemas.

**Fields**

| Name                                                                    | Description                                                           |
| ----------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `screeningCinemas` [`([Cinema!])`](/docs/graphql/objects#cinema)        | The list of cinemas that are screening the movie.                     |
| `screeningDates` [`([Date!])`](/docs/graphql/scalars#date)              | The the list of dates that the showtimes for the movie are available. |
| `cinemaGroups` [`([CinemaGroup!]!)`](/docs/graphql/objects#cinemagroup) | The showtimes grouped by the cinemas that are playing the movie.      |

## [CinemaGroup](/docs/graphql/objects#cinemagroup)

The showtimes of a movie that are playing in a cinema, grouped by the hall types of the cinema.

**Fields**

| Name                                                                          | Description                                            |
| ----------------------------------------------------------------------------- | ------------------------------------------------------ |
| `cinema` [`(Cinema!)`](/docs/graphql/objects#cinema)                          | The cinema that is screening the movie.                |
| `hallTypeGroups` [`([HallTypeGroup!]!)`](/docs/graphql/objects#halltypegroup) | The showtimes grouped by the hall types of the cinema. |

## [HallTypeGroup](/docs/graphql/objects#halltypegroup)

The showtimes of a movie that are playing in a cinema hall.

**Fields**

| Name                                                           | Description                  |
| -------------------------------------------------------------- | ---------------------------- |
| `hallType` [`(String!)`](/docs/graphql/scalars#string)         | The hall type of the cinema. |
| `showtimes` [`([Showtime!]!)`](/docs/graphql/objects#showtime) | The list of showtimes.       |

## [Showtime](/docs/graphql/objects#showtime)

The showtime object.

**Fields**

| Name        | Data Type                           | Description                           |
| ----------- | ----------------------------------- | ------------------------------------- |
| `key`       | [Key!](/docs/graphql/scalars#key)   | An unique identifier for this object. |
| `seatsLeft` | [Uint](/docs/graphql/scalars#uint)  | The number of seats left.             |
| `time`      | [Time!](/docs/graphql/scalars#time) | The time when the showtime is played. |

## [SeatMap](/docs/graphql/objects#seatmap)

The seat map object.

**Fields**

| Name        | Data Type                           | Description                           |
| ----------- | ----------------------------------- | ------------------------------------- |
| `key`       | [Key!](/docs/graphql/scalars#key)   | An unique identifier for this object. |
| `seatsLeft` | [Uint](/docs/graphql/scalars#uint)  | The number of seats left.             |
| `time`      | [Time!](/docs/graphql/scalars#time) | The time when the showtime is played. |

## [PageInfo](/docs/graphql/objects#pageinfo)

The page information to assist pagination.

**Fields**

| Name              | Data Type                                 | Description                                                      |
| ----------------- | ----------------------------------------- | ---------------------------------------------------------------- |
| `hasNextPage`     | [Boolean!](/docs/graphql/scalars#boolean) | A flag indicating if there are more pages to paginate forwards.  |
| `hasPreviousPage` | [Boolean!](/docs/graphql/scalars#boolean) | A flag indicating if there are more pages to paginate backwards. |
| `startCursor`     | [Key](/docs/graphql/scalars#key)          | The cursor to be used to paginate backwards.                     |
| `endCursor`       | [Key](/docs/graphql/scalars#key)          | The cursor to be used to paginate forwards.                      |
