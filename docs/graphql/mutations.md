---
sidebar_label: "Mutations"
sidebar_position: 2
---

# Mutations

Every GraphQL schema has a root type for both queries and mutations. The mutation type defines GraphQL operations that change data on the server. It is analogous to performing HTTP verbs such as **POST**, **PATCH**, and **DELETE**.

<!-- ## [addMovieComment](/docs/graphql/mutations#addmoviecomment)

Add movie comment.

**Input Type:** [AddMovieCommentInput!](/docs/graphql/input_objects#addmoviecommentinput)

**Return Fields**

| Name       | Data Type                                                   | Description             |
| ---------- | ----------------------------------------------------------- | ----------------------- |
| `comments` | [MovieCommentConnection!](/docs/graphql/objects#movieorder) | The movie order object. | -->

## [createMovieOrderSession](/docs/graphql/mutations#createmovieordersession)

Create a movie order session.

**Input Type:** [CreateMovieOrderSessionInput!](/docs/graphql/input_objects#createmovieordersessioninput)

**Return Fields**

| Name      | Data Type                                                     | Description                     |
| --------- | ------------------------------------------------------------- | ------------------------------- |
| `session` | [MovieOrderSession!](/docs/graphql/objects#movieordersession) | The movie order session object. |

## [reserveSeats](/docs/graphql/mutations#reserveseats)

Reserve and lock the selected seats.

**Input Type:** [ReserveSeatsInput!](/docs/graphql/input_objects#reserveseatsinput)

**Return Fields**

| Name      | Data Type                                                     | Description                     |
| --------- | ------------------------------------------------------------- | ------------------------------- |
| `session` | [MovieOrderSession!](/docs/graphql/objects#movieordersession) | The movie order session object. |

## [releaseSeats](/docs/graphql/mutations#releaseseats)

Releases all the reserved seats.

**Input Type:** [ReleaseSeatsInput!](/docs/graphql/input_objects#releaseseatsinput)

**Return Fields**

| Name      | Data Type                                                     | Description                     |
| --------- | ------------------------------------------------------------- | ------------------------------- |
| `session` | [MovieOrderSession!](/docs/graphql/objects#movieordersession) | The movie order session object. |

## [createMovieOrder](/docs/graphql/mutations#createmovieorder)

Create a movie order session.

**Input Type:** [CreateMovieOrderInput!](/docs/graphql/input_objects#createmovieorderinput)

**Return Fields**

| Name      | Data Type                                                     | Description                     |
| --------- | ------------------------------------------------------------- | ------------------------------- |
| `session` | [MovieOrderSession!](/docs/graphql/objects#movieordersession) | The movie order session object. |

## [createPaymentWithMovieOrder](/docs/graphql/mutations#createpaymentwithmovieorder)

Create a new payment with the existing movie order.

**Input Type:** [CreatePaymentWithMovieOrderInput!](/docs/graphql/input_objects#createpaymentwithmovieorderinput)

**Return Fields**

| Name    | Data Type                                       | Description             |
| ------- | ----------------------------------------------- | ----------------------- |
| `order` | [MovieOrder!](/docs/graphql/objects#movieorder) | The movie order object. |

## [confirmMovieOrder](/docs/graphql/mutations#confirmmovieorder)

Create a new payment with the existing movie order.

**Input Type:** [ConfirmMovieOrderInput!](/docs/graphql/input_objects#confirmmovieorderinput)

**Return Fields**

| Name    | Data Type                                       | Description             |
| ------- | ----------------------------------------------- | ----------------------- |
| `order` | [MovieOrder!](/docs/graphql/objects#movieorder) | The movie order object. |
