---
sidebar_label: "Breaking Changes"
sidebar_position: 2
---

# Breaking Changes

Breaking changes are any changes that might require action from our integrators.

### Breaking Changes for 24/05/2022
- Removal of `currencyCode`, `discountAmount`, `bookingAmount`, `totalAmount`, `selectedTickets`, and `selectedConcessions` from the [`MovieOrderSession`](/docs/graphql/objects#movieordersession) object.  
  **Reason:** Our initial intention of having these fields on `MovieOrderSession` was to persist the selected tickets and concessions before user has created an order, so that when user refereshes our integrator's movie order session page the selected tickets and concessions can still be displayed. However, currently we do not have any API that would allow our integrator to update the movie order session when the user's ticket or concessions selection changes. Hence, we will not be persisting these data on our end and our integrators may persist them on their end. However, these data will be available on the `MovieOrder` object.

### Breaking Changes for 23/05/2022
- Removal of `activeOnly` argument from [`MovieShowtimeConnection`](/docs/graphql/objects#movieshowtimeconnection) argument.  
  **Reason:** Our API will always return showtimes that are available or active only, hence this argument is unnecessary.


