---
sidebar_label: "Appendix"
sidebar_position: 4
---

# Appendix

### Seat Layout API

1. The seat layout of a hall is represented by the `twoDimensionView` field of the [`CinemaHallLayout`](/docs/graphql/objects#cinemahalllayout) object.
2. `twoDimensionView` is an array whereby each element is of type [`SeatRow`](/docs/graphql/objects#seatrow) which represents the row of the seat layout.
3. The [`SeatRow`](/docs/graphql/objects#seatrow) contains the field `seats` which is an array whose elements **represents a seat or an aile**.  
4. The seat is represented using the [`Seat`](/docs/graphql/objects#seat) object, meanwhile the aile is represented using `null`.

### Seats Grouping Mechanism

1. Depending upon the `allocation` value of the [seat](/docs/graphql/objects#seat), several seats may be grouped into a single seat. For example, two adjacent seats with `allocation` values of 2 will be grouped into a single seat. 
2. However, when reserving a grouped seat, the `key` of each of the seats in the group will need to be passed to the [`reserveSeats`](/docs/graphql/mutations#reserveseats) mutation.
3. The **grouped seats will be considered as one single seat**, hence **only one ticket will be required to purchase the grouped seat**.
4. The pseudocode of the suggested algorithm for seats grouping is as follows:

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

// TODO:
<!-- ### Eligible Tickets for Reserved Seats

1. The types of tickets that a user can purchase depends on the type of seats reserved. For example, if a user had reserved a `STANDARD` seat, he would be able to purchase `ADULT`, `STUDENT` or `SENIOR` tickets. Contrarily, if a user had reserved a `TWIN` seat, he would only be able to purchase `TWIN` ticket. 
2. To get the eligible ticket types for the reserved seats, the `selectedTickets` field of [MovieOrderSession](/docs/graphql/objects#movieordersession) can be queried upon calling the  -->