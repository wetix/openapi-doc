---
sidebar_label: "Objects"
sidebar_position: 3
hide_table_of_contents: false
---

# Objects

Objects in GraphQL represent the resources you can access. An object can contain a list of fields, which are specifically typed.

## [Cinema](/docs/graphql/objects#cinema)

The cinema object.

**Fields**

| Name                 | Data Type                                             | Description                                               |
| -------------------- | ----------------------------------------------------- | --------------------------------------------------------- |
| `key`                | [Key!](/docs/graphql/scalars#key)                     | An unique identifier for this object.                     |
| `name`               | [String!](/docs/graphql/scalars#string)               | The name of the cinema.                                   |
| `operator`           | [CinemaOperator!](/docs/graphql/enums#cinemaoperator) | The operator name of the cinema.                          |
| `address`            | [String!](/docs/graphql/scalars#string)               | The address of the cinema.                                |
| `postCode`           | [String!](/docs/graphql/scalars#string)               | The post code of the cinema.                              |
| `stateCode`          | [String!](/docs/graphql/scalars#string)               | The state code of the cinema.                             |
| `imageUrl`           | [URI!](/docs/graphql/scalars#uri)                     | The URL of the logo of the cinema.                        |
| `geopoint`           | [GeoPoint!](/docs/graphql/objects#geopoint)           | The latitude and longitude of the cinema.                 |
| `isShutdown`         | [Boolean!](/docs/graphql/scalars#boolean)             | Indicates if the cinema has been shutdown.                |
| `isUnderMaintenance` | [Boolean!](/docs/graphql/scalars#boolean)             | Identifies if the cinema is under maintenance or not.     |
| `createdAt`          | [DateTime!](/docs/graphql/scalars#datetime)           | Identifies the date and time when the object was created. |

## [CinemaConnection](/docs/graphql/objects#cinemaconnection)

The list of cinemas.

**Fields**

| Name         | Data Type                                   | Description                                            |
| ------------ | ------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [Cinema!](/docs/graphql/objects#cinema)     | The list of cinemas.                                   |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo) | The page information to assist pagination.             |
| `totalCount` | [Int!](/docs/graphql/objects#movie)         | Identifies the total count of items in the connection. |

## [Movie](/docs/graphql/objects#movie)

The movie object.

**Fields**

<!-- | `category`          | [String!](/docs/graphql/scalars#string)     | The censor rating of the movie. Possible value are (U, TBC, P13, 18SX, 18PA, 18SG, 18PL) | -->

| Name                | Data Type                                   | Description                                                                              |
| ------------------- | ------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `key`               | [Key!](/docs/graphql/scalars#key)           | An unique identifier for this object.                                                    |
| `title`             | [String!](/docs/graphql/scalars#string)     | The title of the movie.                                                                  |
| `censorship`        | [String!](/docs/graphql/scalars#string)     | The censor rating of the movie. Possible value are (U, TBC, P13, 18SX, 18PA, 18SG, 18PL) |
| `plot`              | [String!](/docs/graphql/scalars#string)     | The plot of the movie.                                                                   |
| `portraitImageUrl`  | [URI!](/docs/graphql/scalars#uri)           | The portrait poster image URL of the movie.                                              |
| `landscapeImageUrl` | [URI!](/docs/graphql/scalars#uri)           | The landscape poster image URL of the movie.                                             |
| `showtimeCount`     | [Uint!](/docs/graphql/scalars#uint)         | Returns a count of how many showtimes there are on this object.                          |
| `genres`            | [String!](/docs/graphql/scalars#string)     | The genres of the movie.                                                                 |
| `actors`            | [[Actor!]!](/docs/graphql/objects#actor)    | The actors of the movie.                                                                 |
| `images`            | [[URI!]!](/docs/graphql/scalars#uri)        | The images related to the movie.                                                         |
| `releaseDate`       | [Date!](/docs/graphql/scalars#date)         | The date when the movie was released in cinemas.                                         |
| `isAdvanceSales`    | [Boolean!](/docs/graphql/scalars#boolean)   | Indicates if the movie is advance sales.                                                 |
| `isOnScreen`        | [Boolean!](/docs/graphql/scalars#boolean)   | Indicates if the movie is on screening.                                                  |
| `isComingSoon`      | [Boolean!](/docs/graphql/scalars#boolean)   | Indicates if the movie is upcoming screening.                                            |
| `createdAt`         | [DateTime!](/docs/graphql/scalars#datetime) | Identifies the date and time when the object was created.                                |
| `lastUpdatedAt`     | [DateTime!](/docs/graphql/scalars#datetime) | Identifies the date and time when the object was updated.                                |

## [MovieConnection](/docs/graphql/objects#movieconnection)

The list of movies.

**Fields**

| Name         | Data Type                                   | Description                                            |
| ------------ | ------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [Movie!](/docs/graphql/objects#movie)       | The list of movies.                                    |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo) | The page information to assist pagination.             |
| `totalCount` | [Int!](/docs/graphql/objects#movie)         | Identifies the total count of items in the connection. |

## [Actor](/docs/graphql/objects#actor)

The actor object.

**Fields**

| Name            | Data Type                               | Description                      |
| --------------- | --------------------------------------- | -------------------------------- |
| `name`          | [String!](/docs/graphql/scalars#string) | The actor name.                  |
| `characterName` | [String](/docs/graphql/scalars#string)  | The character name in the movie. |
| `avatarUrl`     | [URI!](/docs/graphql/scalars#uri)       | The avatar of the actor.         |

## [MovieOrderSession](/docs/graphql/objects#movieordersession)

The movie order session object.

**Fields**

| Name            | Data Type                                                               | Description                                                       |
| --------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `key`           | [Key!](/docs/graphql/scalars#key)                                       | An unique identifier for this object.                             |
| `cinema`        | [Cinema!](/docs/graphql/objects#cinema)                                 | The cinema object belongs to this object.                         |
| `movie`         | [Movie!](/docs/graphql/objects#movie)                                   | The movie object belongs to this object.                          |
| `status`        | [MovieOrderSessionStatus!](/docs/graphql/enums#movieordersessionstatus) | The current status of this object.                                |
| `expiredAt`     | [DateTime!](/docs/graphql/scalars#datetime)                             | Identifies the date and time when the object is going to expires. |
| `createdAt`     | [DateTime!](/docs/graphql/scalars#datetime)                             | Identifies the date and time when the object was created.         |
| `lastUpdatedAt` | [DateTime!](/docs/graphql/scalars#datetime)                             | Identifies the date and time when the object was updated.         |

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

## [MovieShowtime](/docs/graphql/objects#showtime)

The movie showtime object.

**Fields**

| Name        | Data Type                                   | Description                                   |
| ----------- | ------------------------------------------- | --------------------------------------------- |
| `key`       | [Key!](/docs/graphql/scalars#key)           | An unique identifier for this object.         |
| `seatsLeft` | [Uint](/docs/graphql/scalars#uint)          | The number of seats left.                     |
| `hallID`    | [String!](/docs/graphql/scalars#string)     | The hall unique identifier of the showtime.   |
| `hallName`  | [String!](/docs/graphql/scalars#string)     | The hall name of the showtime.                |
| `screenAt`  | [DateTime!](/docs/graphql/scalars#datetime) | The date and time when showtime is played.    |
| `date`      | [Date!](/docs/graphql/scalars#date)         | The time when the showtime is played.         |
| `time`      | [Time!](/docs/graphql/scalars#time)         | The time when the showtime is played.         |
| `isValid`   | [Boolean!](/docs/graphql/scalars#boolean)   | Indicates if the showtime is still available. |

## [MovieOrder](/docs/graphql/objects#movieorder)

The movie order object.

**Fields**

| Name            | Data Type                                       | Description                                               |
| --------------- | ----------------------------------------------- | --------------------------------------------------------- |
| `key`           | [Key!](/docs/graphql/scalars#key)               | An unique identifier for this object.                     |
| `bookingID`     | [String!](/docs/graphql/scalars#string)         | An external unique identifier related this object.        |
| `transactionID` | [String!](/docs/graphql/scalars#string)         |                                                           |
| `currencyCode`  | [String!](/docs/graphql/scalars#string)         |                                                           |
| `payableAmount` | [Money!](/docs/graphql/scalars#money)           |                                                           |
| `expiredAt`     | [DateTime!](/docs/graphql/scalars#string)       |                                                           |
| `status`        | [OrderStatus!](/docs/graphql/enums#orderstatus) |                                                           |
| `createdAt`     | [DateTime!](/docs/graphql/scalars#datetime)     | Identifies the date and time when the object was created. |
| `lastUpdatedAt` | [DateTime!](/docs/graphql/scalars#datetime)     | Identifies the date and time when the object was updated. |

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
