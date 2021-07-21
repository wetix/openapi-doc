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

## MovieConnection

The list of movies.

**Fields**

| Name                                               | Description                                |
| -------------------------------------------------- | ------------------------------------------ |
| `nodes` [`([Movie!])`](/docs/objects#movie)        | The list of movies.                        |
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

## Movie

The movie object.

**Fields**

| Name                                                            | Description                                          |
| --------------------------------------------------------------- | ---------------------------------------------------- |
| `key` [`(Key!)`](/docs/scalars#key)                             | An unique identifier for this object.                |
| `title` [`(String!)`](/docs/scalars#string)                     | The title of the movie.                              |
| `censorship` [`(Censorship!)`](/docs/enums#censorship)          | The censor rating of the movie.                      |
| `category` [`(MovieCategory!)`](/docs/enums#moviecategory)      | The category of the movie.                           |
| `screeningType` [`(ScreeningType!)`](/docs/enums#screeningtype) | The screening type of the movie.                     |
| `plot` [`(String!)`](/docs/scalars#string)                      | The plot of the movie.                               |
| `portraitImageUrl` [`(String!)`](/docs/scalars#string)          | The poster image URL of the movie.                   |
| `genres` [`([String!]!)`](/docs/scalars#string)                 | The genres of the movie.                             |
| `releasedAt` [`(Date!)`](/docs/scalars#date)                    | The date when the movie was released in cinemas.     |
| `createdAt` [`(DateTime!)`](/docs/scalars#datetime)             | The date time the movie was created in WeTix system. |

## PageInfo

The page information to assist pagination.

**Fields**

| Name                                                    | Description                                                      |
| ------------------------------------------------------- | ---------------------------------------------------------------- |
| `hasNextPage` [`(Boolean!)`](/docs/scalars#boolean)     | A flag indicating if there are more pages to paginate forwards.  |
| `hasPreviousPage` [`(Boolean!)`](/docs/scalars#boolean) | A flag indicating if there are more pages to paginate backwards. |
| `startCursor` [`(Key)`](/docs/scalars#key)              | The cursor to be used to paginate backwards.                     |
| `endCursor` [`(Key)`](/docs/scalars#key)                | The cursor to be used to paginate forwards.                      |

## MovieShowtimes

The showtimes of a movie grouped by the cinemas that are playing the movie and the hall types of the cinemas.

**Fields**

| Name                                                            | Description                                                           |
| --------------------------------------------------------------- | --------------------------------------------------------------------- |
| `screeningCinemas` [`([Cinema!])`](/docs/objects#cinema)        | The list of cinemas that are screening the movie.                     |
| `screeningDates` [`([Date!])`](/docs/scalars#date)              | The the list of dates that the showtimes for the movie are available. |
| `cinemaGroups` [`([CinemaGroup!]!)`](/docs/objects#cinemagroup) | The showtimes grouped by the cinemas that are playing the movie.      |

## CinemaGroup

The showtimes of a movie that are playing in a cinema, grouped by the hall types of the cinema.

**Fields**

| Name                                                                  | Description                                            |
| --------------------------------------------------------------------- | ------------------------------------------------------ |
| `cinema` [`(Cinema!)`](/docs/objects#cinema)                          | The cinema that is screening the movie.                |
| `hallTypeGroups` [`([HallTypeGroup!]!)`](/docs/objects#halltypegroup) | The showtimes grouped by the hall types of the cinema. |

## HallTypeGroup

The showtimes of a movie that are playing in a cinema hall.

**Fields**

| Name                                                   | Description                  |
| ------------------------------------------------------ | ---------------------------- |
| `hallType` [`(String!)`](/docs/scalars#string)         | The hall type of the cinema. |
| `showtimes` [`([Showtime!]!)`](/docs/objects#showtime) | The list of showtimes.       |

## Showtime

The showtime object.

**Fields**

| Name                                       | Description                           |
| ------------------------------------------ | ------------------------------------- |
| `key` [`(Key!)`](/docs/scalars#key)        | An unique identifier for this object. |
| `seatsLeft` [`(Uint)`](/docs/scalars#uint) | The number of seats left.             |
| `time` [`(Time!)`](/docs/scalars#time)     | The time when the showtime is played. |
