---
sidebar_label: "Breaking Changes"
sidebar_position: 2
---

# Breaking Changes

Breaking changes are any changes that might require action from our integrators.

### Breaking Changes for 22/09/2022
- remove `hasCheckoutLink` and `checkoutUrl` from the return fields of [`createMovieOrder`](/docs/graphql/mutations#createmovieorder).  
 **Reason:** GSC payment page has been removed and need not to be displayed to user.

### Breaking Changes for 28/07/2022
- rename `isPackage` field of [`MovieTicket`](/docs/graphql/objects#movieticket) object to `hasBundle`.  
 **Reason:** So that the field name is more descriptive.

### Breaking Changes for 17/07/2022
- Removal of `isValid` field from [`MovieShowtime`](/docs/graphql/objects#movieshowtime) object.  
  **Reason:** The system will always return showtimes that are not expired and valid. Hence, this field is unnecessary.
- Make `externalId` argument of [`CreateMovieOrderCustomerInput`](/docs/graphql/input_objects#createmovieordercustomerinput) optional.  
  **Reason:** Some integrator may not pass the the User ID from their DB as it may be sensitive. 
### Breaking Changes for 15/07/2022
- Removal of `CreatePaymentWithMovieOrder` mutation.   
  **Reason:** The purpose of this mutation is to create payment record on WeTix side. We realized the payment record can be created when the `CreateMovieOrder` mutation is called. Hence, to reduce the network call on the integrator side, we have removed this mutation.

- `languageCode` change to `languageCodes` for [`Movie`](/docs/graphql/objects#movie) and [`CinemaMovie`](/docs/graphql/objects#cinemamovie) objects.  
  **Reason:** WeTix does not present movies with multiple languages as separate movies, but it is presented as single movie with multiple languages. Hence, a movie may have multiple language codes.

### Breaking Changes for 24/05/2022
- Removal of `currencyCode`, `discountAmount`, `bookingAmount`, `totalAmount`, `selectedTickets`, and `selectedConcessions` from the [`MovieOrderSession`](/docs/graphql/objects#movieordersession) object.  
  **Reason:** Our initial intention of having these fields on `MovieOrderSession` was to persist the selected tickets and concessions before user has created an order, so that when user refereshes our integrator's movie order session page the selected tickets and concessions can still be displayed. However, currently we do not have any API that would allow our integrator to update the movie order session when the user's ticket or concessions selection changes. Hence, we will not be persisting these data on our end and our integrators may persist them on their end. However, these data will be available on the `MovieOrder` object.

### Breaking Changes for 23/05/2022
- Removal of `activeOnly` argument from [`MovieShowtimeConnection`](/docs/graphql/objects#movieshowtimeconnection) argument.  
  **Reason:** Our API will always return showtimes that are available or active only, hence this argument is unnecessary.


