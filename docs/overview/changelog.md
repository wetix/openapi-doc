---
sidebar_label: "Changelog"
sidebar_position: 3
---

# Changelog

The GraphQL schema changelog is a list of recent and upcoming changes to our GraphQL API schema. It includes backwards-compatible changes, schema previews, and upcoming breaking changes.

Breaking changes include changes that will break existing queries or could affect the runtime behavior of clients. For a list of breaking changes and when they will occur, see our [breaking changes log](/docs/overview/breaking_changes).

### Documentation and Schema Changes for 02/11/2022

- breaking-change: remove `redirectUrl` from the [`CreateMovieOrderInput`](/docs/graphql/input_objects#createmovieorderinput) object. See the changes [here](https://github.com/wetix/openapi-doc/commit/b6be1b70113591028c4020937df0511655705b0a) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-02112022).

### Documentation and Schema Changes for 22/09/2022

- breaking-change: remove `hasCheckoutLink` and `checkoutUrl` from the return fields of [`createMovieOrder`](/docs/graphql/mutations#createmovieorder). See the changes [here](https://github.com/wetix/openapi-doc/commit/34ce0c2393db1e1bbb3f28960fae43de2b7fdae4) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-22092022).

### Documentation and Schema Changes for 01/08/2022

- chore: update [`Signature Algorithm`](/docs/security/signature) docs. See the changes [here](https://github.com/wetix/openapi-doc/commit/b1727ac80b42ef4b2acf2b55d06e062d088751a2).

### Documentation and Schema Changes for 29/07/2022

- chore: add `bundles` field to [CreateMovieOrderInput](/docs/graphql/input_objects#createmovieorderinput). See the changes [here](https://github.com/wetix/openapi-doc/commit/64cb4012bcb21dc2bca4094f3009febf0bfff43f).

### Documentation and Schema Changes for 28/07/2022

- chore: add [Reserving Seats for Aurum Hall](/docs/appendix/example#reserving-seats-for-aurum-hall) example. See the changes [here](https://github.com/wetix/openapi-doc/commit/a23c27e0cc7563f6b6f802280160259323fe5792).
- breaking-change: rename `isPackage` field of [`MovieTicket`](/docs/graphql/objects#movieticket) object to `hasBundle`. See the changes [here](https://github.com/wetix/openapi-doc/commit/c73d3d8160eeb1177fa4c55d76bd07d5a5ee758b) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-28072022).

### Documentation and Schema Changes for 27/07/2022

- chore: add `countryCode` to [`CreateMovieOrderCustomerInput`](/docs/graphql/input_objects#createmovieordercustomerinput) object. See the changes [here](https://github.com/wetix/openapi-doc/commit/1daa697aea810f8d34bd234c54b672d0f7095b44).

### Documentation and Schema Changes for 17/07/2022

- chore: add `languageCodes` to [`CinemaMovie`](/docs/graphql/objects#cinemamovie) object. See the changes [here](https://github.com/wetix/openapi-doc/commit/5b84deba83bd1e9675da5bbb3d93c65a1bbbefdf).
- chore: add enumeration values to [`Language`](/docs/graphql/scalars#language) type. See the changes [here](https://github.com/wetix/openapi-doc/commit/d3ac68ec90453a749fe85da07f8daccc926c5256).
- breaking-change: remove `isValid` field from [`MovieShowtime`](/docs/graphql/objects#movieshowtime) object. See the changes [here](https://github.com/wetix/openapi-doc/commit/116f9e7ee618e383cb5063199be1071a50c54558) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-17072022).
- breaking-change: Make `externalId` argument of [`CreateMovieOrderCustomerInput`](/docs/graphql/input_objects#createmovieordercustomerinput) optional. See the changes [here](https://github.com/wetix/openapi-doc/commit/7c2fbb7dc435d615e11042eeb197c93edb0eab30) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-17072022).

### Documentation and Schema Changes for 15/07/2022

- breaking-change: remove `CreatePaymentWithMovieOrder` mutation. See the changes [here](https://github.com/wetix/openapi-doc/commit/260818c46b99980ce9e0ca481e2aa7ef36aad47b) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-15072022).
- breaking-change: change `languageCode` to `languageCodes` for [`Movie`](/docs/graphql/objects#movie) object. See the changes [here](https://github.com/wetix/openapi-doc/commit/214abeb601702f1af7f18086618689e838b99955) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-15072022).
- chore: add `ORDER_NOT_FOUND` and `PAYMENT_NOT_FOUND` [error codes](/docs/appendix/error_codes). See the changes [here](https://github.com/wetix/openapi-doc/commit/22d74bc3e1d111b92131cf068ee78eb984d07c5e).

### Documentation and Schema Changes for 14/07/2022

- chore: add [error codes](/docs/appendix/error_codes). See the changes [here](https://github.com/wetix/openapi-doc/commit/e59083a95f8f7fd1204f6d22ad2d2060aa9d5c1c).

### Documentation and Schema Changes for 12/07/2022

- chore: add [state diagrams](/docs/appendix/flow#state-diagrams) for `MovieOrderSession` and `MovieOrder` objects. See the changes [here](https://github.com/wetix/openapi-doc/commit/1275292de081871a476c5d0ae146704c15e21fd0).
- chore: add `hasShowtimes` field for the [`Cinema`](/docs/graphql/objects#cinema) object. See the changes [here](https://github.com/wetix/openapi-doc/commit/e146770373ff4361217bd1fed734d247374e835a).
- chore: add `runTime` field for the [`Movie`](/docs/graphql/objects#movie) object. See the changes [here](https://github.com/wetix/openapi-doc/commit/b8bef2854483a0a7cd1413e9b3d9311957c4b51a).

### Documentation and Schema Changes for 29/06/2022

- chore: update [Getting Seat Layout](/docs/appendix/example#creating-movieordersession-to-get-seat-layout) example. See the changes [here](https://github.com/wetix/openapi-doc/commit/b554693c35040745b15fb2ba97d9963584986bb2).

### Documentation and Schema Changes for 16/06/2022

- chore: update [Getting Seat Layout](/docs/appendix/example#creating-movieordersession-to-get-seat-layout) example. See the changes [here](https://github.com/wetix/openapi-doc/commit/0e97fe50645268147ed1b2f9b933096ef3428abb).

### Documentation and Schema Changes for 26/05/2022

- chore: Update [Create Movie Order](/docs/appendix/example#create-movie-order), [Create Payment With Movie Order](/docs/appendix/example#create-payment-with-movie-order) and [Confirm Movie Order](/docs/appendix/example#confirm-movie-order) examples. See the changes [here](https://github.com/wetix/openapi-doc/commit/a4f3e98ccdfb455f6c0725a1a70665dc6961a3e0).

### Documentation and Schema Changes for 25/05/2022

- chore: add [List of Hall Types](/docs/appendix/others#list-of-hall-types) to appendix. See the changes [here](https://github.com/wetix/openapi-doc/pull/70/commits/356599ae375c2ad94c013ac9b09db28dd23d7396).
- chore: update possible values of `cencorship` field for [CinemaMovie](/docs/graphql/objects#cinemamovie) and [Movie](/docs/graphql/objects#movie) objects. See the changes [here](https://github.com/wetix/openapi-doc/pull/70/commits/d0026a1f08be3205a993f253a584d87709b287f9).

### Documentation and Schema Changes for 24/05/2022

- chore: update [Getting Seat Layout](/docs/appendix/example#getting-seat-layout) example to include Cinema, Movie, Showtime and Hall infos. See the changes [here](https://github.com/wetix/openapi-doc/commit/3595540b9eb422ea18de354ef033bdd93b1d0c5c).

#

- breaking-change: remove `currencyCode`, `discountAmount`, `bookingAmount`, `totalAmount`, `selectedTickets`, and `selectedConcessions` from the [`MovieOrderSession`](/docs/graphql/objects#movieordersession) object. See the changes [here](https://github.com/wetix/openapi-doc/commit/56e4ee7707115660422bd8f6d22a65710a88989d) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-24052022).

### Documentation and Schema Changes for 23/05/2022

- fix: [`createMovieOrder`](/docs/graphql/mutations#createmovieorder) signature [example](/docs/appendix/example#create-movie-order). See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/6aae48e91f190e855598c54fff23ae0462725555).

#

- chore: add `censorship` and `originalTitle` to [`movies`](/docs/graphql/queries#movies) query example. See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/9515e8e6dbd029b6bbef55db349bb54371f9d1f5).

#

- chore: add `plot` to [`movies`](/docs/graphql/queries#movies) query [example](/docs/appendix/example#getting-now-showing-and-coming-soon-movies). See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/6722e37d6a16b9374f800390758348c570419966).

#

- breaking-change: remove `activeOnly` from [`MovieShowtimeConnection`](/docs/graphql/objects#movieshowtimeconnection) argument. See the changes [here](https://github.com/wetix/openapi-doc/pull/67/commits/32a343b6a4524605f7789538c7af1a58ed5fe0fe) and the description of the breaking change [here](/docs/overview/breaking_changes#breaking-changes-for-23052022).

#

- chore: add `showtimeDates` for [`CinemaMovie`](/docs/graphql/objects#cinemamovie) and [`Movie`](/docs/graphql/objects#movie) objects. See the changes [here](https://github.com/wetix/openapi-doc/commit/fd27b8e02526f26a61bb5cf5854d1056222a1647).
- chore: update [Getting Showtimes For A Movie](/docs/appendix/example#getting-showtimes-for-a-movie) and [Getting Movies and Showtimes Screene By a Cinema](/docs/appendix/example#getting-movies-and-showtimes-screened-by-a-cinema) examples to use showtimeDates. See the changes [here](https://github.com/wetix/openapi-doc/commit/307f5f8fde4a929d51278bb2b5d0a5f39461bb22).
- chore: update [Getting Seat Layout](/docs/appendix/example#getting-seat-layout) example to include seat type. See the changes [here](https://github.com/wetix/openapi-doc/pull/68/commits/c81d5a74fad16c311c641ea5bd6cebb972cb3031).
