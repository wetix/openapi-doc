---
sidebar_label: "Changelog"
sidebar_position: 3
---

# Changelog

The GraphQL schema changelog is a list of recent and upcoming changes to our GraphQL API schema. It includes backwards-compatible changes, schema previews, and upcoming breaking changes.

Breaking changes include changes that will break existing queries or could affect the runtime behavior of clients. For a list of breaking changes and when they will occur, see our [breaking changes log](/docs/overview/breaking_changes).

### Documentation and Schema Changes for 24/05/2022
- chore: update [Getting Seat Layout](/docs/guides/example#getting-seat-layout) example to include Cinema, Movie, Showtime and Hall infos. See the changes [here](https://github.com/wetix/openapi-doc/commit/3595540b9eb422ea18de354ef033bdd93b1d0c5c).
#
- breaking-change: remove `currencyCode`, `discountAmount`, `bookingAmount`, `totalAmount`, `selectedTickets`, and `selectedConcessions` from the [`MovieOrderSession`](/docs/graphql/objects#movieordersession) object. See the changes [here](https://github.com/wetix/openapi-doc/commit/56e4ee7707115660422bd8f6d22a65710a88989d) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-24052022).


### Documentation and Schema Changes for 23/05/2022
- fix: [`createMovieOrder`](/docs/graphql/mutations#createmovieorder) signature [example](/docs/guides/example#create-movie-order). See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/6aae48e91f190e855598c54fff23ae0462725555).
#
- chore: add `censorship` and `originalTitle` to [`movies`](/docs/graphql/queries#movies) query example. See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/9515e8e6dbd029b6bbef55db349bb54371f9d1f5).
#
- chore: add `plot` to [`movies`](/docs/graphql/queries#movies) query [example](/docs/guides/example#getting-now-showing-and-coming-soon-movies). See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/6722e37d6a16b9374f800390758348c570419966).
#
- breaking-change: remove `activeOnly` from [`MovieShowtimeConnection`](/docs/graphql/objects#movieshowtimeconnection) argument. See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/32a343b6a4524605f7789538c7af1a58ed5fe0fe) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-23052022).
#
- chore: add `showtimeDates` for [`CinemaMovie`](/docs/graphql/objects#cinemamovie) and [`Movie`](/docs/graphql/objects#movie) objects. See the changes [here](https://github.com/wetix/openapi-doc/commit/fd27b8e02526f26a61bb5cf5854d1056222a1647).
#
- chore: update [Getting Showtimes For A Movie](/docs/guides/example#getting-showtimes-for-a-movie) and [Getting Movies and Showtimes Screened By a Cinema](/docs/guides/example#getting-movies-and-showtimes-screened-by-a-cinema) examples to use showtimeDates. See the changes [here](https://github.com/wetix/openapi-doc/commit/307f5f8fde4a929d51278bb2b5d0a5f39461bb22).



