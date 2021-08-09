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

| Value       | Description                                                         |
| ----------- | ------------------------------------------------------------------- |
| `PENDING`   | Indicates if the order is under draft, yet to initiate for payment. |
| `RESERVED`  | Indicates if the order is under draft, yet to initiate for payment. |
| `CLOSED`    | Indicates if the order is under draft, yet to initiate for payment. |
| `CANCELLED` | Indicates if the order has been cancelled.                          |

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
