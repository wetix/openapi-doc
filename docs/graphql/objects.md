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

| Name                 | Data Type                                                             | Description                                               |
| -------------------- | --------------------------------------------------------------------- | --------------------------------------------------------- |
| `key`                | [Key!](/docs/graphql/scalars#key)                                     | An unique identifier for this object.                     |
| `name`               | [String!](/docs/graphql/scalars#string)                               | The name of the cinema.                                   |
| `operator`           | [CinemaOperator!](/docs/graphql/enums#cinemaoperator)                 | The operator name of the cinema.                          |
| `movie`              | [CinemaMovie!](/docs/graphql/objects#cinemamovie)                     | Look up a movie belong to the cinema using its key.       |
| `movies`             | [CinemaMovieConnection!](/docs/graphql/objects#cinemamovieconnection) | Return a list of available movie belong to this cinema.   |
| `address`            | [String!](/docs/graphql/scalars#string)                               | The address of the cinema.                                |
| `postCode`           | [String!](/docs/graphql/scalars#string)                               | The post code of the cinema.                              |
| `stateCode`          | [State!](/docs/graphql/scalars#state)                                 | The state code of the cinema.                             |
| `countryCode`        | [Country!](/docs/graphql/scalars#country)                             | The country code of the cinema.                           |
| `imageUrl`           | [URI!](/docs/graphql/scalars#uri)                                     | The URL of the logo of the cinema.                        |
| `geopoint`           | [GeoPoint!](/docs/graphql/objects#geopoint)                           | The latitude and longitude of the cinema.                 |
| `isShutdown`         | [Boolean!](/docs/graphql/scalars#boolean)                             | Indicates if the cinema has been shutdown.                |
| `isUnderMaintenance` | [Boolean!](/docs/graphql/scalars#boolean)                             | Identifies if the cinema is under maintenance or not.     |
| `createdAt`          | [DateTime!](/docs/graphql/scalars#datetime)                           | Identifies the date and time when the object was created. |

## [CinemaMovie](/docs/graphql/objects#cinemamovie)

The cinema movie object.

**Fields**

| Name                | Data Type                                                                   | Description                                                                                                          |
| ------------------- | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `key`               | [Key!](/docs/graphql/scalars#key)                                           | An unique identifier for this object.                                                                                |
| `title`             | [String!](/docs/graphql/scalars#string)                                     | The title of the movie.                                                                                              |
| `originalTitle`     | [String!](/docs/graphql/scalars#string)                                     | The original title of the movie.                                                                                     |
| `censorship`        | [String!](/docs/graphql/scalars#string)                                     | The censor rating of the movie. Possible value are (**U**, **TBC**, **P13**, **18SX**, **18PA**, **18SG**, **18PL**) |
| `plot`              | [String!](/docs/graphql/scalars#string)                                     | The plot of the movie.                                                                                               |
| `mainTrailerUrl`    | [URI](/docs/graphql/scalars#uri)                                            | The main movie trailer video. (**YouTube** video link)                                                               |
| `portraitImageUrl`  | [URI!](/docs/graphql/scalars#uri)                                           | The portrait poster image URL of the movie.                                                                          |
| `landscapeImageUrl` | [URI](/docs/graphql/scalars#uri)                                            | The landscape poster image URL of the movie.                                                                         |
| `showtimeCount`     | [Uint!](/docs/graphql/scalars#uint)                                         | Returns a count of how many showtimes there are on this object.                                                      |
| `showtimes`         | [MovieShowtimeConnection!](/docs/graphql/objects#movieshowtimeconnection)   | Returns a count of how many showtimes there are on this object.                                                      |
| `genres`            | [String!](/docs/graphql/scalars#string)                                     | The genres of the movie.                                                                                             |
| `actors`            | [[Actor!]!](/docs/graphql/objects#actor)                                    | The actors of the movie.                                                                                             |
| `images`            | [[URI!]!](/docs/graphql/scalars#uri)                                        | The images related to the movie.                                                                                     |
| ~~`comments`~~      | ~~[MovieCommentConnection!](/docs/graphql/objects#moviecommentconnection)~~ | The movie comments. **(Upcoming Feature)**                                                                           |
| `releaseDate`       | [Date!](/docs/graphql/scalars#date)                                         | The date when the movie was released in cinemas.                                                                     |
| `isAdvanceSales`    | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is advance sales.                                                                             |
| `isOnScreen`        | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is on screening.                                                                              |
| `isComingSoon`      | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is upcoming screening.                                                                        |
| `createdAt`         | [DateTime!](/docs/graphql/scalars#datetime)                                 | Identifies the date and time when the object was created.                                                            |
| `lastUpdatedAt`     | [DateTime!](/docs/graphql/scalars#datetime)                                 | Identifies the date and time when the object was updated.                                                            |

## [CinemaMovieConnection](/docs/graphql/objects#cinemamovieconnection)

The list of cinema movies.

**Fields**

| Name         | Data Type                                            | Description                                            |
| ------------ | ---------------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [[CinemaMovie!]!](/docs/graphql/objects#cinemamovie) | The list of cinema movies.                             |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo)          | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)              | Identifies the total count of items in the connection. |

## [CinemaConnection](/docs/graphql/objects#cinemaconnection)

The list of cinemas.

**Fields**

| Name         | Data Type                                   | Description                                            |
| ------------ | ------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [[Cinema!]!](/docs/graphql/objects#cinema)  | The list of cinemas.                                   |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo) | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)     | Identifies the total count of items in the connection. |

## [Movie](/docs/graphql/objects#movie)

The movie object.

**Fields**

| Name                | Data Type                                                                   | Description                                                                                                          |
| ------------------- | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `key`               | [Key!](/docs/graphql/scalars#key)                                           | An unique identifier for this object.                                                                                |
| `title`             | [String!](/docs/graphql/scalars#string)                                     | The title of the movie.                                                                                              |
| `originalTitle`     | [String!](/docs/graphql/scalars#string)                                     | The original title of the movie.                                                                                     |
| `censorship`        | [String!](/docs/graphql/scalars#string)                                     | The censor rating of the movie. Possible value are (**U**, **TBC**, **P13**, **18SX**, **18PA**, **18SG**, **18PL**) |
| `plot`              | [String!](/docs/graphql/scalars#string)                                     | The plot of the movie.                                                                                               |
| `mainTrailerUrl`    | [URI](/docs/graphql/scalars#uri)                                            | The main movie trailer video. (**YouTube** video link)                                                               |
| `portraitImageUrl`  | [URI!](/docs/graphql/scalars#uri)                                           | The portrait poster image URL of the movie.                                                                          |
| `landscapeImageUrl` | [URI](/docs/graphql/scalars#uri)                                            | The landscape poster image URL of the movie.                                                                         |
| `showtimeCount`     | [Uint!](/docs/graphql/scalars#uint)                                         | Returns a count of how many showtimes there are on this object.                                                      |
| `genres`            | [String!](/docs/graphql/scalars#string)                                     | The genres of the movie.                                                                                             |
| `actors`            | [[Actor!]!](/docs/graphql/objects#actor)                                    | The actors of the movie.                                                                                             |
| `images`            | [[URI!]!](/docs/graphql/scalars#uri)                                        | The images related to the movie.                                                                                     |
| ~~`comments`~~      | ~~[MovieCommentConnection!](/docs/graphql/objects#moviecommentconnection)~~ | The movie comments. **(Upcoming Feature)**                                                                           |
| `releaseDate`       | [Date!](/docs/graphql/scalars#date)                                         | The date when the movie was released in cinemas.                                                                     |
| `isAdvanceSales`    | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is advance sales.                                                                             |
| `isOnScreen`        | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is on screening.                                                                              |
| `isComingSoon`      | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is upcoming screening.                                                                        |
| `createdAt`         | [DateTime!](/docs/graphql/scalars#datetime)                                 | Identifies the date and time when the object was created.                                                            |
| `lastUpdatedAt`     | [DateTime!](/docs/graphql/scalars#datetime)                                 | Identifies the date and time when the object was updated.                                                            |

## [MovieConnection](/docs/graphql/objects#movieconnection)

The list of movies.

**Fields**

| Name         | Data Type                                   | Description                                            |
| ------------ | ------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [[Movie!]!](/docs/graphql/objects#movie)    | The list of movies.                                    |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo) | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)     | Identifies the total count of items in the connection. |

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

## [MovieShowtime](/docs/graphql/objects#showtime)

The movie showtime object.

**Fields**

| Name        | Data Type                                   | Description                                   |
| ----------- | ------------------------------------------- | --------------------------------------------- |
| `key`       | [Key!](/docs/graphql/scalars#key)           | An unique identifier for this object.         |
| `hall`      | [CinemaHall!](/docs/graphql/objects#cinema) | The hall object of this showtime.             |
| `seatsLeft` | [Uint](/docs/graphql/scalars#uint)          | The number of available seats left.           |
| `screenAt`  | [DateTime!](/docs/graphql/scalars#datetime) | The date and time when showtime is played.    |
| `date`      | [Date!](/docs/graphql/scalars#date)         | The time when the showtime is played.         |
| `time`      | [Time!](/docs/graphql/scalars#time)         | The time when the showtime is played.         |
| `isValid`   | [Boolean!](/docs/graphql/scalars#boolean)   | Indicates if the showtime is still available. |

## [MovieShowtimeConnection](/docs/graphql/objects#movieshowtimeconnection)

The list of movie showtimes.

**Fields**

| Name         | Data Type                                             | Description                                            |
| ------------ | ----------------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [MovieShowtime!](/docs/graphql/objects#movieshowtime) | The list of movie showtimes.                           |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo)           | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)               | Identifies the total count of items in the connection. |

## [CinemaHallLayout](/docs/graphql/objects#cinemahalllayout)

The cinema hall layout object.

**Fields**

| Name               | Data Type                                    | Description               |
| ------------------ | -------------------------------------------- | ------------------------- |
| `twoDimensionView` | [[SeatRow!]!](/docs/graphql/objects#seatrow) | The 2D view of the seats. |
| `types`            | [[String!]!](/docs/graphql/scalars#string)   | The number of seats left. |
| `totalRow`         | [Uint!](/docs/graphql/scalars#uint)          | Total row of seats.       |
| `totalColumn`      | [Uint!](/docs/graphql/scalars#uint)          | Total column of seats.    |

## [SeatRow](/docs/graphql/objects#seatrow)

The seat row object.

**Fields**

| Name    | Data Type                                | Description            |
| ------- | ---------------------------------------- | ---------------------- |
| `label` | [String!](/docs/graphql/scalars#string)  | The row label.         |
| `seats` | [[Seat]!](/docs/graphql/objects#seatrow) | The seats of this row. |

## [Seat](/docs/graphql/objects#seat)

The seat object.

**Fields**

| Name         | Data Type                               | Description                        |
| ------------ | --------------------------------------- | ---------------------------------- |
| `label`      | [String!](/docs/graphql/scalars#string) | The label of this seat.            |
| `type`       | [String!](/docs/graphql/scalars#string) | The type of this seat.             |
| `areaNo`     | [Int!](/docs/graphql/scalars#int)       | The area no of this seat.          |
| `areaCode`   | [String!](/docs/graphql/scalars#string) | The area code of this seat.        |
| `allocation` | [Uint!](/docs/graphql/scalars#uint)     | The seats allocation of this seat. |

## [User](/docs/graphql/objects#user)

The user object.

**Fields**

| Name          | Data Type                                                           | Description                                               |
| ------------- | ------------------------------------------------------------------- | --------------------------------------------------------- |
| `key`         | [Key!](/docs/graphql/scalars#key)                                   | An unique identifier for this object.                     |
| `email`       | [String!](/docs/graphql/scalars#string)                             | The email address of this user.                           |
| `phoneNo`     | [String!](/docs/graphql/scalars#string)                             | The phone number of this user.                            |
| `memberCards` | [[MemberCard!]!](/docs/graphql/objects#membercard)                  | The member cards of this user.                            |
| `movieOrders` | [MovieOrderConnection!](/docs/graphql/objects#movieorderconnection) | An unique identifier for this object.                     |
| `vouchers`    | [VoucherConnection!](/docs/graphql/objects#voucherconnection)       | An unique identifier for this object.                     |
| `createdAt`   | [DateTime!](/docs/graphql/scalars#datetime)                         | Identifies the date and time when the object was created. |

## [MovieOrder](/docs/graphql/objects#movieorder)

The movie order object.

**Fields**

| Name            | Data Type                                       | Description                                               |
| --------------- | ----------------------------------------------- | --------------------------------------------------------- |
| `key`           | [Key!](/docs/graphql/scalars#key)               | An unique identifier for this object.                     |
| `bookingId`     | [String!](/docs/graphql/scalars#string)         | An external unique identifier related this object.        |
| `transactionId` | [String!](/docs/graphql/scalars#string)         |                                                           |
| `currencyCode`  | [String!](/docs/graphql/scalars#string)         |                                                           |
| `payableAmount` | [Money!](/docs/graphql/scalars#money)           |                                                           |
| `expiredAt`     | [DateTime!](/docs/graphql/scalars#string)       |                                                           |
| `status`        | [OrderStatus!](/docs/graphql/enums#orderstatus) |                                                           |
| `createdAt`     | [DateTime!](/docs/graphql/scalars#datetime)     | Identifies the date and time when the object was created. |
| `lastUpdatedAt` | [DateTime!](/docs/graphql/scalars#datetime)     | Identifies the date and time when the object was updated. |

## [MovieOrderConnection](/docs/graphql/objects#movieorderconnection)

The list of movie orders.

**Fields**

| Name         | Data Type                                       | Description                                            |
| ------------ | ----------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [MovieOrder!](/docs/graphql/objects#movieorder) | The list of movie orders.                              |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo)     | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)         | Identifies the total count of items in the connection. |

## [VoucherConnection](/docs/graphql/objects#voucherconnection)

The list of vouchers.

**Fields**

| Name         | Data Type                                   | Description                                            |
| ------------ | ------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [Voucher!](/docs/graphql/objects#voucher)   | The list of vouchers.                                  |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo) | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)     | Identifies the total count of items in the connection. |

## [PageInfo](/docs/graphql/objects#pageinfo)

The page information to assist pagination.

**Fields**

| Name              | Data Type                                 | Description                                                      |
| ----------------- | ----------------------------------------- | ---------------------------------------------------------------- |
| `hasNextPage`     | [Boolean!](/docs/graphql/scalars#boolean) | A flag indicating if there are more pages to paginate forwards.  |
| `hasPreviousPage` | [Boolean!](/docs/graphql/scalars#boolean) | A flag indicating if there are more pages to paginate backwards. |
| `startCursor`     | [Key](/docs/graphql/scalars#key)          | The cursor to be used to paginate backwards.                     |
| `endCursor`       | [Key](/docs/graphql/scalars#key)          | The cursor to be used to paginate forwards.                      |
