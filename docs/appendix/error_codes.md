---
sidebar_label: "Error Codes"
sidebar_position: 4
---

# Error Codes

In case of an error our API will return the error in the following format:

```
{
  "errors": [
    {
      "message": "movie not found",
      "path": [
        "movie"
      ],
      "extensions": {
        "code": "MOVIE_NOT_FOUND"
      }
    }
  ],
  "data": null
}
```

The error code can be found on `errors[0].extensions.code`. Below are the some of the error codes our API may return:

| Error Code                | Description                         | Thrown In                                                                                                                                                                                                                                             |
| ------------------------- | ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SHOWTIME_NOT_FOUND        | The showtime cannot be found.       | [createMovieOrderSession](/docs/graphql/mutations#createmovieordersession)                                                                                                                                                                            |
| EXPIRED_SHOWTIME          | The showtime has expired.           | [createMovieOrderSession](/docs/graphql/mutations#createmovieordersession), [reserveSeats](/docs/graphql/mutations#reserveseats)                                                                                                                      |
| INTERNAL_ERROR            | Internal server error.              | [createMovieOrderSession](/docs/graphql/mutations#createmovieordersession),  [reserveSeats](/docs/graphql/mutations#reserveseats), [releaseSeats](/docs/graphql/mutations#releaseseats), [createMovieOrder](/docs/graphql/mutations#createmovieorder) |
| CINEMA_UNDER_MAINTENANCE  | The cinema is under maintenance.    | [createMovieOrderSession](/docs/graphql/mutations#createmovieordersession)                                                                                                                                                                            |
| CINEMA_NOT_FOUND          | The cinema cannot be found.         | [createMovieOrder](/docs/graphql/mutations#createmovieorder)                                                                                                                                                                                          |
| INVALID_SEAT_TO_RESERVE   | The specified seat keys is invalid. | [reserveSeats](/docs/graphql/mutations#reserveseats)                                                                                                                                                                                                  |
| ORDER_SESSION_NOT_FOUND   | The order session cannot be found.  | [createMovieOrder](/docs/graphql/mutations#createMovieOrder)                                                                                                                                                                                          |
| ORDER_SESSION_EXPIRED     | The order session has expired.      | [createMovieOrder](/docs/graphql/mutations#createMovieOrder)                                                                                                                                                                                          |
| ORDER_NOT_FOUND           | The order cannot be found.          | [confirmMovieOrder](/docs/graphql/mutations#confirmMovieOrder)                                                                                                                                                                                        |
| PAYMENT_NOT_FOUND         | The payment cannot be found.        | [confirmMovieOrder](/docs/graphql/mutations#confirmMovieOrder)                                                                                                                                                                                        |
| UNABLE_TO_CONFIRM_BOOKING | The booking cannot be confirmed.    | [confirmMovieOrder](/docs/graphql/mutations#confirmMovieOrder)                                                                                                                                                                                        |

