---
sidebar_label: "Using the API"
sidebar_position: 1
---

# Using the API

## Authentication

To authenticate with WeTix Open API server, you'll need an access token issued by the WeTix OAuth server. Please refer [here](/docs/security/oauth/client_credentials) on obtaining the access token.

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


Before sending any GraphQL requests, make sure to include the obtained access token in the `Authorization` header as follows:

`Authorization: Bearer <token>`

## Communication

Because GraphQL operations consist of multiline JSON, we recommend using the [Altair GraphQL Client](https://altair.sirmuel.design/) to make GraphQL calls. You can also use cURL or any other HTTP-speaking library.

<img src="/img/altair.png"/>
