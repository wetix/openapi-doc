---
sidebar_label: "Mutations"
sidebar_position: 2
---

# Mutations

Every GraphQL schema has a root type for both queries and mutations. The mutation type defines GraphQL operations that change data on the server. It is analogous to performing HTTP verbs such as **POST**, **PATCH**, and **DELETE**.

## [createMovieOrderSession](/docs/graphql/objects#createmovieordersession)

Create a movie order session.

**Input Type:** [CreateMovieOrderSessionInput!](/docs/graphql/input_objects#createmovieordersessioninput)

**Return Fields**

| Name                | Data Type                                                     | Description                     |
| ------------------- | ------------------------------------------------------------- | ------------------------------- |
| `movieOrderSession` | [MovieOrderSession!](/docs/graphql/objects#movieordersession) | The movie order session object. |

## [reserveSeats](/docs/graphql/objects#reserveseats)

Reserve and lock the selected seats.

**Input Type:** [ReserveSeatsInput!](/docs/graphql/input_objects#reserveseatsinput)

**Return Fields**

| Name                | Data Type                                                     | Description                     |
| ------------------- | ------------------------------------------------------------- | ------------------------------- |
| `movieOrderSession` | [MovieOrderSession!](/docs/graphql/objects#movieordersession) | The movie order session object. |

## [releaseSeats](/docs/graphql/objects#releaseseats)

Release the locked seats.

**Input Type:** [ReleaseSeatsInput!](/docs/graphql/input_objects#releaseseatsinput)

**Return Fields**

| Name                | Data Type                                                     | Description                     |
| ------------------- | ------------------------------------------------------------- | ------------------------------- |
| `movieOrderSession` | [MovieOrderSession!](/docs/graphql/objects#movieordersession) | The movie order session object. |
