---
sidebar_label: "Enums"
sidebar_position: 5
---

# Enums

Enums represent possible sets of values for a field.

## [CinemaOperator](/docs/graphql/enums#cinemaoperator)

The cinema operator name.

| Value     | Description                      |
| --------- | -------------------------------- |
| `GSC`     | Golden Screen Cinemas            |
| `TGV`     | TGV Cinemas                      |
| ~~`MBO`~~ | ~~MBO Cinemas~~ **(deprecated)** |
| `MMC`     | mmCineplexes                     |
| `DADI`    | Dadi Cinema                      |

## [MovieOrderSessionStatus](/docs/graphql/enums#movieordersessionstatus)

The movie order session status.

| Value       | Description                                                                                                                                                                            |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PENDING`   | Indicates the session is under seats selection phase.                                                                                                                                  |
| `RESERVED`  | Indicates the session is under seats reserving phase. If you're selected showtime not under **GSC**, the `expiresIn` and `expiredAt` will have value. (normally around **15 minutes**) |
| `CLOSED`    | Indicates the session has been closed, waiting for payment.                                                                                                                            |
| `CANCELLED` | Indicates the session has been cancelled.                                                                                                                                              |

## [OrderStatus](/docs/graphql/enums#orderstatus)

The order status.

| Value       | Description                                                         |
| ----------- | ------------------------------------------------------------------- |
| `DRAFT`     | Indicates if the order is under draft, yet to initiate for payment. |
| `CANCELLED` | Indicates if the order has been cancelled by user.                  |
| `PENDING`   | Indicates if the order is pending for payment.                      |
| `PAID`      | Indicates if the order is paid for payment, but tickets not issued. |
| `REFUNDED`  | Indicates if the order is refunded.                                 |
| `FAILED`    | Indicates if the order is failed to pay.                            |
| `COMPLETED` | Indicates if the order's payment is success and tickets issued.     |
| `REVERSAL`  | Indicates if the order is refunded due to system error.             |

## [SignatureAlgorithm](/docs/graphql/enums#signaturealgorithm)

The cryptographic hash functions.

| Value    | Description                                        |
| -------- | -------------------------------------------------- |
| `SHA1`   | Indicates the cryptographic hash function SHA-1.   |
| `SHA256` | Indicates the cryptographic hash function SHA-256. |
| `SHA512` | Indicates the cryptographic hash function SHA-512. |

## [SeatType](/docs/graphql/enums#seattype)

The types of seats.

| Value         | Description |
| ------------- | ----------- |
| `STANDARD`    |             |
| `WHEEL_CHAIR` |             |
| `HOUSE`       |             |
| `TWIN`        |             |
| `BEAN_BAG`    |             |
| `TWIN_SOFA`   |             |
| `SUITE`       |             |
| `RECLINER`    |             |
| `CABIN`       |             |

## [SeatStatus](/docs/graphql/enums#seatstatus)

The statuses of seats.

| Value       | Description |
| ----------- | ----------- |
| `AVAILABLE` |             |
| `SOLD`      |             |
| `BROKEN`    |             |
| `RESERVED`  |             |
