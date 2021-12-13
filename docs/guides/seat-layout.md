---
sidebar_label: "Seat Layout and Seats Grouping"
sidebar_position: 3
---

# Seat Layout and Seats Grouping

### Seat Layout API

1. The seat layout of a hall is represented by the `twoDimensionView` field of the [`CinemaHallLayout`](/) object.
2. `twoDimensionView` is an array whereby each element is of type [`SeatRow`](/) which represents the row of the seat layout.
3. The [`SeatRow`](/) contains the field `seats` which is an array whose elements **represents a seat or an aile**.  
4. The seat is represented using the [`Seat`](/) object, meanwhile the aile is represented using `null`.

### Seats Grouping Mechanism

5. Depending upon the type of the seat, several seats may be grouped into a single seat. For example, two adjacent seats of type `TWIN` will be grouped into a single seat. 
6. However, when reserving a grouped seat, the `key` of each of the seats in the group will need to be passed to the [`reserveSeats`](/) mutation.
7. The pseudocode of the suggested algorithm for seats grouping is as follows:

```
aaaa
```