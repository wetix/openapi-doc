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

| Name                 | Data Type                                                             | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| -------------------- | --------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `key`                | [Key!](/docs/graphql/scalars#key)                                     | An unique identifier for this object.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `name`               | [String!](/docs/graphql/scalars#string)                               | The name of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `operator`           | [CinemaOperator!](/docs/graphql/enums#cinemaoperator)                 | The operator name of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `movie`              | [CinemaMovie!](/docs/graphql/objects#cinemamovie)                     | Look up a movie screened by the cinema using its key. **Arguments:** <br/>`key` : [Key!](/docs/graphql/scalars#key) - An unique identifier for this object.                                                                                                                                                                                                                                                                                                                                                                        |
| `movies`             | [CinemaMovieConnection!](/docs/graphql/objects#cinemamovieconnection) | Returns a list of available movies screened by this cinema. **Arguments:** <br/>`after` : [Key](/docs/graphql/scalars#key) - To return the elements in the list that comes after the specified cursor. <br/>`before` : [Key](/docs/graphql/scalars#key) - To return the elements in the list that comes before the specified cursor. <br/>`first` : [Uint](/docs/graphql/scalars#uint) - Returns the first n elements from the list. <br/>`last` : [Uint](/docs/graphql/scalars#uint) - Returns the last n elements from the list. |
| `address`            | [String!](/docs/graphql/scalars#string)                               | The address of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `postCode`           | [String!](/docs/graphql/scalars#string)                               | The post code of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `stateCode`          | [State!](/docs/graphql/scalars#state)                                 | The state code of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `countryCode`        | [Country!](/docs/graphql/scalars#country)                             | The country code of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `imageUrl`           | [URI!](/docs/graphql/scalars#uri)                                     | The URL of the logo of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `hasShowtimes`       | [Boolean!](/docs/graphql/scalars#boolean)                             | Indicates whether this cinema has showtimes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `countryCode`        | [Country!](/docs/graphql/scalars#country)                             | The country code of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `isShutdown`         | [Boolean!](/docs/graphql/scalars#boolean)                             | Indicates if the cinema has been shutdown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `isUnderMaintenance` | [Boolean!](/docs/graphql/scalars#boolean)                             | Identifies if the cinema is under maintenance or not.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `createdAt`          | [DateTime!](/docs/graphql/scalars#datetime)                           | Identifies the date and time when the object was created.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

## [CinemaConnection](/docs/graphql/objects#cinemaconnection)

The list of cinemas.

**Fields**

| Name         | Data Type                                   | Description                                            |
| ------------ | ------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [[Cinema!]!](/docs/graphql/objects#cinema)  | The list of cinemas.                                   |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo) | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)     | Identifies the total count of items in the connection. |

## [CinemaMovie](/docs/graphql/objects#cinemamovie)

Represents a movie screened at a cinema.

**Fields**

| Name                | Data Type                                                                   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| ------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `key`               | [Key!](/docs/graphql/scalars#key)                                           | An unique identifier for this object.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `title`             | [String!](/docs/graphql/scalars#string)                                     | The title of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `originalTitle`     | [String!](/docs/graphql/scalars#string)                                     | The original title of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `censorship`        | [String!](/docs/graphql/scalars#string)                                     | The censor rating of the movie. Possible value are (**U**, **TBC**, **P13**, **18**)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `plot`              | [String!](/docs/graphql/scalars#string)                                     | The plot of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `mainTrailerUrl`    | [URI](/docs/graphql/scalars#uri)                                            | The main movie trailer video. (**YouTube** video link)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `portraitImageUrl`  | [URI!](/docs/graphql/scalars#uri)                                           | The portrait poster image URL of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `landscapeImageUrl` | [URI](/docs/graphql/scalars#uri)                                            | The landscape poster image URL of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `showtimeCount`     | [Uint!](/docs/graphql/scalars#uint)                                         | Returns a count of how many showtimes there are on this object.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `languageCodes`     | [[Language!]!](/docs/graphql/scalars#language)                              | The language of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `showtimeDates`     | [[String!]!](/docs/graphql/scalars#string)                                  | Returns a list of dates where this movie has showtimes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `showtimes`         | [MovieShowtimeConnection!](/docs/graphql/objects#movieshowtimeconnection)   | Returns a list of showtimes for this movie. <br/>**Arguments:** <br/>`after` : [Key](/docs/graphql/scalars#key) - To return the elements in the list that comes after the specified cursor. <br/>`before` : [Key](/docs/graphql/scalars#key) - To return the elements in the list that comes before the specified cursor. <br/>`first` : [Uint](/docs/graphql/scalars#uint) - Returns the first n elements from the list. <br/>`last` : [Uint](/docs/graphql/scalars#uint) - Returns the last n elements from the list. <br/> `date` : [Date!](/docs/graphql/scalars#date) - The date of the showtimes. |
| `genres`            | [String!](/docs/graphql/scalars#string)                                     | The genres of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `actors`            | [[Actor!]!](/docs/graphql/objects#actor)                                    | The actors of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `images`            | [[URI!]!](/docs/graphql/scalars#uri)                                        | The images related to the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| ~~`comments`~~      | ~~[MovieCommentConnection!](/docs/graphql/objects#moviecommentconnection)~~ | The movie comments. **(Upcoming Feature)**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `releaseDate`       | [Date!](/docs/graphql/scalars#date)                                         | The date when the movie was released in cinemas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `isAdvanceSales`    | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is advance sales.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `isOnScreen`        | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is on screening.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `isComingSoon`      | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is upcoming screening.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `createdAt`         | [DateTime!](/docs/graphql/scalars#datetime)                                 | Identifies the date and time when the object was created.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `lastUpdatedAt`     | [DateTime!](/docs/graphql/scalars#datetime)                                 | Identifies the date and time when the object was updated.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |

## [CinemaMovieConnection](/docs/graphql/objects#cinemamovieconnection)

The list of movies screened by a cinema.

**Fields**

| Name         | Data Type                                            | Description                                            |
| ------------ | ---------------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [[CinemaMovie!]!](/docs/graphql/objects#cinemamovie) | The list of movies screened by a cinema.               |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo)          | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)              | Identifies the total count of items in the connection. |

## [Movie](/docs/graphql/objects#movie)

The movie object.

**Fields**

| Name                | Data Type                                                                   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `key`               | [Key!](/docs/graphql/scalars#key)                                           | An unique identifier for this object.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `title`             | [String!](/docs/graphql/scalars#string)                                     | The title of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `originalTitle`     | [String!](/docs/graphql/scalars#string)                                     | The original title of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `censorship`        | [String!](/docs/graphql/scalars#string)                                     | The censor rating of the movie. Possible value are (**U**, **TBC**, **P13**, **18**)                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `plot`              | [String!](/docs/graphql/scalars#string)                                     | The plot of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `mainTrailerUrl`    | [URI](/docs/graphql/scalars#uri)                                            | The main movie trailer video. (**YouTube** video link)                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `portraitImageUrl`  | [URI!](/docs/graphql/scalars#uri)                                           | The portrait poster image URL of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `landscapeImageUrl` | [URI](/docs/graphql/scalars#uri)                                            | The landscape poster image URL of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `showtimeCount`     | [Uint!](/docs/graphql/scalars#uint)                                         | Returns a count of how many showtimes there are on this object.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `runTime`           | [Uint!](/docs/graphql/scalars#uint)                                         | The duration of the movie in minutes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `showtimeDates`     | [[String!]!](/docs/graphql/scalars#string)                                  | Returns a list of dates where this movie has showtimes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `genres`            | [String!](/docs/graphql/scalars#string)                                     | The genres of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `actors`            | [[Actor!]!](/docs/graphql/objects#actor)                                    | The actors of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `images`            | [[URI!]!](/docs/graphql/scalars#uri)                                        | The images related to the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ~~`comments`~~      | ~~[MovieCommentConnection!](/docs/graphql/objects#moviecommentconnection)~~ | The movie comments. **(Upcoming Feature)**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `cinema`            | [MovieCinema!](/docs/graphql/objects#moviecinema)                           | Look up a cinema screening this movie using its key. <br/> **Arguments** <br/> `key` : [Key](/docs/graphql/scalars#key) - The cinema key.                                                                                                                                                                                                                                                                                                                                                                                       |
| `cinemas`           | [MovieCinemaConnection!](/docs/graphql/objects#moviecinemaconnection)       | Return a list of available cinemas screening this movie. **Arguments:** <br/>`after` : [Key](/docs/graphql/scalars#key) - To return the elements in the list that comes after the specified cursor. <br/>`before` : [Key](/docs/graphql/scalars#key) - To return the elements in the list that comes before the specified cursor. <br/>`first` : [Uint](/docs/graphql/scalars#uint) - Returns the first n elements from the list. <br/>`last` : [Uint](/docs/graphql/scalars#uint) - Returns the last n elements from the list. |
| `releaseDate`       | [Date!](/docs/graphql/scalars#date)                                         | The date when the movie was released in cinemas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `languageCodes`     | [[Language!]!](/docs/graphql/scalars#language)                              | The language of the movie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `isAdvanceSales`    | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is advance sales.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `isOnScreen`        | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is on screening.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `isComingSoon`      | [Boolean!](/docs/graphql/scalars#boolean)                                   | Indicates if the movie is upcoming screening.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `createdAt`         | [DateTime!](/docs/graphql/scalars#datetime)                                 | Identifies the date and time when the object was created.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `lastUpdatedAt`     | [DateTime!](/docs/graphql/scalars#datetime)                                 | Identifies the date and time when the object was updated.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

## [MovieConnection](/docs/graphql/objects#movieconnection)

The list of movies.

**Fields**

| Name         | Data Type                                   | Description                                            |
| ------------ | ------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [[Movie!]!](/docs/graphql/objects#movie)    | The list of movies.                                    |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo) | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)     | Identifies the total count of items in the connection. |

## [MovieCinema](/docs/graphql/objects#moviecinema)

Represents a cinema screening a movie.

**Fields**

| Name                 | Data Type                                                                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| -------------------- | ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `key`                | [Key!](/docs/graphql/scalars#key)                                         | An unique identifier for this object.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `name`               | [String!](/docs/graphql/scalars#string)                                   | The name of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `operator`           | [CinemaOperator!](/docs/graphql/enums#cinemaoperator)                     | The operator name of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `address`            | [String!](/docs/graphql/scalars#string)                                   | The address of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `postCode`           | [String!](/docs/graphql/scalars#string)                                   | The post code of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `stateCode`          | [State!](/docs/graphql/scalars#state)                                     | The state code of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `countryCode`        | [Country!](/docs/graphql/scalars#country)                                 | The country code of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `showtimes`          | [MovieShowtimeConnection!](/docs/graphql/objects#movieshowtimeconnection) | Returns a list of showtimes for the movie at this cinema. **Arguments:** <br/>`after` : [Key](/docs/graphql/scalars#key) - To return the elements in the list that comes after the specified cursor. <br/>`before` : [Key](/docs/graphql/scalars#key) - To return the elements in the list that comes before the specified cursor. <br/>`first` : [Uint](/docs/graphql/scalars#uint) - Returns the first n elements from the list. <br/>`last` : [Uint](/docs/graphql/scalars#uint) - Returns the last n elements from the list. `date` : [Date!](/docs/graphql/scalars#date) - The date of the showtimes. |
| `imageUrl`           | [URI!](/docs/graphql/scalars#uri)                                         | The URL of the logo of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `geopoint`           | [GeoPoint!](/docs/graphql/objects#geopoint)                               | The latitude and longitude of the cinema.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `isShutdown`         | [Boolean!](/docs/graphql/scalars#boolean)                                 | Indicates if the cinema has been shutdown.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `isUnderMaintenance` | [Boolean!](/docs/graphql/scalars#boolean)                                 | Identifies if the cinema is under maintenance or not.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `createdAt`          | [DateTime!](/docs/graphql/scalars#datetime)                               | Identifies the date and time when the object was created.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

## [MovieCinemaConnection](/docs/graphql/objects#cinemamovieconnection)

The list of cinemas screening a movie.

**Fields**

| Name         | Data Type                                            | Description                                            |
| ------------ | ---------------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [[MovieCinema!]!](/docs/graphql/objects#moviecinema) | The list of cinemas screening a movie.                 |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo)          | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)              | Identifies the total count of items in the connection. |

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
| `sessionId`     | [ID!](/docs/graphql/scalars#id)                                         | An unique session identifier of this object.                      |
| `cinema`        | [Cinema!](/docs/graphql/objects#cinema)                                 | The cinema object belongs to this object.                         |
| `movie`         | [Movie!](/docs/graphql/objects#movie)                                   | The movie object belongs to this object.                          |
| `showtime`      | [MovieShowtime!](/docs/graphql/objects#movieshowtime)                   | The showtime object belongs to this object.                       |
| `seatLayout`    | [CinemaHallLayout!](/docs/graphql/objects#cinemahalllayout)             | The cinema hall layout object belongs to this session.            |
| `tickets`       | [[MovieTicket!]!](/docs/graphql/objects#movieticket)                    | Return the list of movie tickets.                                 |
| `concessions`   | [[MovieConcession!]!](/docs/graphql/objects#movieconcession)            | Return the list of movie concessions.                             |
| `selectedSeats` | [[Seat!]!](/docs/graphql/objects#seat)                                  | Return the list of selected seats.                                |
| `hasExpiry`     | [Boolean!](/docs/graphql/scalars#int64)                                 | Indicates this order session has expiry.                          |
| `expiresIn`     | [Int64!](/docs/graphql/scalars#int64)                                   | The difference between current and expired time in seconds.       |
| `expiredAt`     | [DateTime!](/docs/graphql/scalars#datetime)                             | Identifies the date and time when the object is going to expires. |
| `status`        | [MovieOrderSessionStatus!](/docs/graphql/enums#movieordersessionstatus) | The current status of this object.                                |
| `createdAt`     | [DateTime!](/docs/graphql/scalars#datetime)                             | Identifies the date and time when the object was created.         |
| `lastUpdatedAt` | [DateTime!](/docs/graphql/scalars#datetime)                             | Identifies the date and time when the object was updated.         |

## [MovieShowtime](/docs/graphql/objects#movieshowtime)

The movie showtime object.

**Fields**

| Name        | Data Type                                       | Description                                |
| ----------- | ----------------------------------------------- | ------------------------------------------ |
| `key`       | [Key!](/docs/graphql/scalars#key)               | An unique identifier for this object.      |
| `hall`      | [CinemaHall!](/docs/graphql/objects#cinemahall) | The hall object of this showtime.          |
| `seatsLeft` | [Uint](/docs/graphql/scalars#uint)              | The number of available seats left.        |
| `screenAt`  | [DateTime!](/docs/graphql/scalars#datetime)     | The date and time when showtime is played. |
| `date`      | [Date!](/docs/graphql/scalars#date)             | The time when the showtime is played.      |
| `time`      | [String!](/docs/graphql/scalars#string)         | The time when the showtime is played.      |

## [CinemaHall](/docs/graphql/objects#cinemahall)

The cinema hall object.

**Fields**

| Name   | Data Type                               | Description    |
| ------ | --------------------------------------- | -------------- |
| `id`   | [ID!](/docs/graphql/scalars#id)         | The hall ID.   |
| `type` | [String!](/docs/graphql/scalars#string) | The hall type. |
| `name` | [String!](/docs/graphql/scalars#string) | The hall name. |

## [MovieShowtimeConnection](/docs/graphql/objects#movieshowtimeconnection)

The list of movie showtimes.

**Fields**

| Name         | Data Type                                             | Description                                            |
| ------------ | ----------------------------------------------------- | ------------------------------------------------------ |
| `nodes`      | [MovieShowtime!](/docs/graphql/objects#movieshowtime) | The list of movie showtimes.                           |
| `pageInfo`   | [PageInfo!](/docs/graphql/objects#pageinfo)           | The page information to assist pagination.             |
| `totalCount` | [Uint64!](/docs/graphql/scalars#uint64)               | Identifies the total count of items in the connection. |

## [MovieTicket](/docs/graphql/objects#movieticket)

The movie ticket object.

**Fields**

| Name              | Data Type                               | Description                                     |
| ----------------- | --------------------------------------- | ----------------------------------------------- |
| `key`             | [String!](/docs/graphql/scalars#string) | An unique identifier for this object.           |
| `id`              | [ID!](/docs/graphql/scalars#id)         | An unique identifier for this object.           |
| `name`            | [String!](/docs/graphql/scalars#string) | The name of this ticket.                        |
| `type`            | [String!](/docs/graphql/scalars#string) | The type of this ticket.                        |
| `purchaseAmount`  | [Money!](/docs/graphql/scalars#money)   | The purchase amount of this ticket.             |
| `bookingAmount`   | [Money!](/docs/graphql/scalars#money)   | The booking amount of this ticket.              |
| `areaCode`        | [Money!](/docs/graphql/scalars#string)  | The area code of the ticket.                    |
| `seatsAllocation` | [Uint!](/docs/graphql/scalars#uint)     | The seats allocation of this ticket.            |
| `isPackage`       | [Boolean!](/docs/graphql/scalars#uint)  | Indicates the ticket whether is package ticket. |

## [SelectedMovieTicket](/docs/graphql/objects#selectedmovieticket)

The selected movie ticket object.

**Fields**

| Name              | Data Type                               | Description                                     |
| ----------------- | --------------------------------------- | ----------------------------------------------- |
| `key`             | [String!](/docs/graphql/scalars#string) | An unique identifier for this object.           |
| `id`              | [ID!](/docs/graphql/scalars#id)         | An unique identifier for this object.           |
| `name`            | [String!](/docs/graphql/scalars#string) | The name of this ticket.                        |
| `type`            | [String!](/docs/graphql/scalars#string) | The type of this ticket.                        |
| `quantity`        | [Uint!](/docs/graphql/scalars#uint)     | The quantity of the ticket.                     |
| `purchaseAmount`  | [Money!](/docs/graphql/scalars#money)   | The purchase amount of this ticket.             |
| `bookingAmount`   | [Money!](/docs/graphql/scalars#money)   | The booking amount of this ticket.              |
| `areaCode`        | [Money!](/docs/graphql/scalars#string)  | The area code of the ticket.                    |
| `seatsAllocation` | [Uint!](/docs/graphql/scalars#uint)     | The seats allocation of this ticket.            |
| `isPackage`       | [Boolean!](/docs/graphql/scalars#uint)  | Indicates the ticket whether is package ticket. |

## [MovieConcession](/docs/graphql/objects#movieconcession)

The movie concession object.

**Fields**

| Name             | Data Type                               | Description                            |
| ---------------- | --------------------------------------- | -------------------------------------- |
| `key`            | [String!](/docs/graphql/scalars#string) | An unique identifier for this object.  |
| `id`             | [ID!](/docs/graphql/scalars#id)         | An unique identifier for this object.  |
| `name`           | [String!](/docs/graphql/scalars#string) | The name of this concession.           |
| `description`    | [String!](/docs/graphql/scalars#string) | The description of this concession.    |
| `imageUrl`       | [URI!](/docs/graphql/scalars#uri)       | The image url of this concession.      |
| `purchaseAmount` | [Money!](/docs/graphql/scalars#money)   | The booking amount of this concession. |
| `isSoldOut`      | [Boolean!](/docs/graphql/scalars#uint)  | Indicates the concession is sold out.  |

## [SelectedConcession](/docs/graphql/objects#selectedconcession)

The selected movie concession object.

**Fields**

| Name       | Data Type                               | Description                           |
| ---------- | --------------------------------------- | ------------------------------------- |
| `id`       | [ID!](/docs/graphql/scalars#id)         | An unique identifier for this object. |
| `name`     | [String!](/docs/graphql/scalars#string) | The name of this concession.          |
| `imageUrl` | [URI!](/docs/graphql/scalars#uri)       | The image url of this concession.     |
| `quantity` | [Uint!](/docs/graphql/scalars#uint)     | The quantity of the concession.       |

## [CinemaHallLayout](/docs/graphql/objects#cinemahalllayout)

The cinema hall layout object.

**Fields**

| Name               | Data Type                                    | Description               |
| ------------------ | -------------------------------------------- | ------------------------- |
| `twoDimensionView` | [[SeatRow!]!](/docs/graphql/objects#seatrow) | The 2D view of the seats. |
| `totalRow`         | [Uint!](/docs/graphql/scalars#uint)          | Total row of seats.       |
| `totalColumn`      | [Uint!](/docs/graphql/scalars#uint)          | Total column of seats.    |

## [SeatRow](/docs/graphql/objects#seatrow)

The seat row object.

**Fields**

| Name    | Data Type                               | Description            |
| ------- | --------------------------------------- | ---------------------- |
| `label` | [String!](/docs/graphql/scalars#string) | The row label.         |
| `seats` | [[Seat]!](/docs/graphql/objects#seat)   | The seats of this row. |

## [Seat](/docs/graphql/objects#seat)

The seat object.

**Fields**

| Name         | Data Type                                     | Description                           |
| ------------ | --------------------------------------------- | ------------------------------------- |
| `key`        | [String!](/docs/graphql/scalars#string)       | An unique identifier for this object. |
| `type`       | [SeatType!](/docs/graphql/enums#seattype)     | The type of this seat.                |
| `label`      | [String!](/docs/graphql/scalars#string)       | The label of this seat.               |
| `x`          | [Uint!](/docs/graphql/scalars#uint)           | The x-coordinate of this seat.        |
| `y`          | [Uint!](/docs/graphql/scalars#uint)           | The y-coordinate of this seat.        |
| `areaCode`   | [String!](/docs/graphql/scalars#string)       | The area code of this seat.           |
| `allocation` | [Uint!](/docs/graphql/scalars#uint)           | The seats allocation of this seat.    |
| `status`     | [SeatStatus!](/docs/graphql/enums#seatstatus) | The status of this seat.              |

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
| `movie`         | [Movie!](/docs/graphql/objects#movie)           | The movie of the order.                                   |
| `cinema`        | [Movie!](/docs/graphql/objects#cinema)          | The cinema of the order.                                  |
| `bookingId`     | [String!](/docs/graphql/scalars#string)         | An external unique identifier related this object.        |
| `transactionId` | [String!](/docs/graphql/scalars#string)         |                                                           |
| `currencyCode`  | [String!](/docs/graphql/scalars#string)         |                                                           |
| `totalAmount`   | [Money!](/docs/graphql/scalars#money)           |                                                           |
| `bookingAmount` | [Money!](/docs/graphql/scalars#money)           |                                                           |
| `payableAmount` | [Money!](/docs/graphql/scalars#money)           |                                                           |
| `expiresIn`     | [Int64!](/docs/graphql/scalars#int64)           |                                                           |
| `expiredAt`     | [DateTime!](/docs/graphql/scalars#datetime)     |                                                           |
| `paidAt`        | [DateTime!](/docs/graphql/scalars#datetime)     |                                                           |
| `qrCode`        | [String!](/docs/graphql/scalars#string)         |                                                           |
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

## [GeoPoint](/docs/graphql/objects#geopoint)

The latitude and longitude object.

**Fields**

| Name        | Data Type                             | Description    |
| ----------- | ------------------------------------- | -------------- |
| `latitude`  | [Float!](/docs/graphql/scalars#float) | The latitude.  |
| `longitude` | [Float!](/docs/graphql/scalars#float) | The longitude. |

## [PageInfo](/docs/graphql/objects#pageinfo)

The page information to assist pagination.

**Fields**

| Name              | Data Type                                 | Description                                                      |
| ----------------- | ----------------------------------------- | ---------------------------------------------------------------- |
| `hasNextPage`     | [Boolean!](/docs/graphql/scalars#boolean) | A flag indicating if there are more pages to paginate forwards.  |
| `hasPreviousPage` | [Boolean!](/docs/graphql/scalars#boolean) | A flag indicating if there are more pages to paginate backwards. |
| `startCursor`     | [Key](/docs/graphql/scalars#key)          | The cursor to be used to paginate backwards.                     |
| `endCursor`       | [Key](/docs/graphql/scalars#key)          | The cursor to be used to paginate forwards.                      |
