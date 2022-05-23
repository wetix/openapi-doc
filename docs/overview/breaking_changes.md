---
sidebar_label: "Breaking Changes"
sidebar_position: 2
---

# Breaking Changes

Breaking changes are any changes that might require action from our integrators.

### Breaking Changes for 23/05/2022
- Removal of `activeOnly` argument from [`MovieShowtimeConnection`](/docs/graphql/objects#movieshowtimeconnection) argument.  
  **Reason:** Our API will always return showtimes that are available or active only, hence this argument is unnecessary.

