---
sidebar_label: "Authenticating with GraphQL"
sidebar_position: 2
---

# Authentication

## Authenticating with GraphQL

To communicate with the GraphQL server, you'll need an OAuth token with the right scopes.

<!-- Follow the steps in "Creating a personal access token" to create a token. The scopes you require depends on the type of data you're trying to request. For example, select the User scopes to request user data. If you need access to repository information, select the appropriate Repository scopes.

To match the behavior of the GraphQL Explorer, request the following scopes:

user
public_repo
repo
repo_deployment
repo:status
read:repo_hook
read:org
read:public_key
read:gpg_key -->

The API notifies you if a resource requires a specific scope.

## Communicating with GraphQL

Because GraphQL operations consist of multiline JSON, we recommends using the [Altair GraphQL Client](https://altair.sirmuel.design/) to make GraphQL calls. You can also use cURL or any other HTTP-speaking library.

Before you sending any GraphQL request, make sure you sending with `Authorization` header.

<!-- # Fields

## movie

Gets movie by its key.

**Type:** [Movie!](/docs/objects#movie)

Arguments:

| Name                                | Description           |
| ----------------------------------- | --------------------- |
| `key` [`(Key!)`](/docs/scalars#key) | The key of the movie. |

## movieShowtimes

Gets the first 5000 movie showtimes for the specified movie and date. The showtimes are ordered by its time in ascending order and are grouped by the cinemas that are playing the movie and the hall types of the cinemas. To get a paginated list of movie showtimes, please use [showtimes](docs/queries/fields#showtimes) instead.

**Type:** [MovieShowtimes!](/docs/objects#movieshowtimes)

Arguments:

| Name                                     | Description                                           |
| ---------------------------------------- | ----------------------------------------------------- |
| `movieKey` [`(Key!)`](/docs/scalars#key) | The key of the movie whose showtimes will be fetched. |
| `date` [`(Date!)`](/docs/scalars#date)   | The date of the showtimes.                            | -->
