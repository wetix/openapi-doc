---
sidebar_label: "Changelog"
sidebar_position: 3
---

# Changelog

The GraphQL schema changelog is a list of recent and upcoming changes to our GraphQL API schema. It includes backwards-compatible changes, schema previews, and upcoming breaking changes.

Breaking changes include changes that will break existing queries or could affect the runtime behavior of clients. For a list of breaking changes and when they will occur, see our [breaking changes log](/docs/overview/breaking_changes).

### Documentation and Schema Changes for 23/05/2022
- Fix: [`createMovieOrder`](/docs/graphql/mutations#createmovieorder) signature [example](/docs/guides/example#create-movie-order). See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/6aae48e91f190e855598c54fff23ae0462725555).
- Chore: add `censorship` and `originalTitle` to [`movies`](/docs/graphql/queries#movies) query example. See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/9515e8e6dbd029b6bbef55db349bb54371f9d1f5).
- Chore: add `plot` to [`movies`](/docs/graphql/queries#movies) query [example](/docs/guides/example#getting-now-showing-and-coming-soon-movies). See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/6722e37d6a16b9374f800390758348c570419966).
- Breaking-Change: remove `activeOnly` from [`MovieShowtimeConnection`](/docs/graphql/objects#movieshowtimeconnection) argument. See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/32a343b6a4524605f7789538c7af1a58ed5fe0fe) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-23052022).


