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
4. The following is a sample Javascript code snipppet that shows the suggested algorithm for seats grouping:

```javascript
for(let i = 0; i < twoDimensionView.length; i++){
    let row = twoDimensionView[i];
    for(let j= 0; j < row.seats.length; j++){
        let seat = row.seats[j];
        let groupedSeat = [];
        let occupy = j+seat.allocation
        if (occupy > row.seats.length){
            continue
        }
        if(seat != null){
            groupedSeat  = seat.splice(j, occupy);
        }

        ......
    }
}
```

### List of Hall Types

Due to the limitations of the cinema APIs, film formats (2D/ STANDARD, 3D, etc) and hall experiences (GETHA LUX SUITE, PLAY+, etc) are seen as a single a property in WeTix, which we refer to as **hall type**, that describes the cinema halls. As such, our API, under the `type` property of the [CinemaHall](/docs/graphql/objects#cinemahall) object, will return a single value that describes the cinema hall. Below are some of the hall types that WeTix API may return. The list of hall types below is not fixed and may change over time as we receive different combinations of film formats and hall experiences from the cinemas:

- STANDARD
- 3D
- ATMOS
- PLAY+
- ATMOS D-BOX
- PREMIERE CLASS
- MAXX
- GETHA LUX SUITE
- BIG
- ATMOS BIG
- 4DX
- ATMOS MAXX
- D-BOX
- ESCAPE STUDIO
- STANDARD TAMIL
- STANDARD TELUGU
- STANDARD HINDI
- ATMOS D-BOX MAXX
- COMFORT CABIN
- ONYX
- MX4D
- ATMOS GETHA LUX SUITE
- SCREEN X
- D-BOX MAXX
- IMAX
- ATMOS BIG PLAY+

The image below shows sample hall types displayed on WeTix on the showtimes page.
<img src="/img/hall_type.jpeg" width="300"/>

<!-- ### Eligible Tickets for Reserved Seats

1. The types of tickets that a user can purchase depends on the type of seats reserved. For example, if a user had reserved a `STANDARD` seat, he would be able to purchase `ADULT`, `STUDENT` or `SENIOR` tickets. Contrarily, if a user had reserved a `TWIN` seat, he would only be able to purchase `TWIN` ticket. 
2. To get the eligible ticket types for the reserved seats, the `selectedTickets` field of [MovieOrderSession](/docs/graphql/objects#movieordersession) can be queried upon calling the  -->