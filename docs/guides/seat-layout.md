---
sidebar_label: "Seat Layout and Seats Grouping"
sidebar_position: 3
---

# Seat Layout and Seats Grouping

### Seat Layout API

1. The seat layout of a hall is represented by the `twoDimensionView` field of the [`CinemaHallLayout`](/) object.
2. `twoDimensionView` is an array whereby each element is of type [`SeatRow`](/) which represents the row of the seat layout.
3. The [`SeatRow`](/docs/graphql/objects#seatrow) contains the field `seats` which is an array whose elements **represents a seat or an aile**.  
4. The seat is represented using the [`Seat`](/docs/graphql/objects#seat) object, meanwhile the aile is represented using `null`.

### Seats Grouping Mechanism

1. Depending upon the `allocation` value of the [seat](/docs/graphql/objects#seat), several seats may be grouped into a single seat. For example, two adjacent seats with `allocation` values of 2 will be grouped into a single seat. 
2. However, when reserving a grouped seat, the `key` of each of the seats in the group will need to be passed to the [`reserveSeats`](/) mutation.
3. The pseudocode of the suggested algorithm for seats grouping is as follows:

```
for(i:=0; len(i); i++){
    row:= twoDimensionView[i]
    for(j:=0; len(row.seats); j++){
        seat := row.seats[j]
        if(seat != null){
            groupedSeat := [seat, .... , row.seats[j+seat.allocation-1]]
        }
    }
}
```