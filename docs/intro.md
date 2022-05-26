---
sidebar_label: "Introduction"
sidebar_position: 1
---

# Introduction

WeTix is a homegrown entertainment ticketing platform, we began our journey since 2018.

## Open APIs

WeTix Open APIs allow developers to utilize WeTix's core functionalities such as get cinemas, movies, showtimes, seat layout and create order. WeTix Open API uses [GraphQL](https://graphql.org/) as its data query and manipulation language.

There are two services for our API (OAuth and Open API), both for sandbox and production environment. OAuth server is for the authentication, Open API server is for the core functions.

**Sandbox Environment :**

Open API Server: [https://sb-open.wetix.my/graphql](https://sb-open.wetix.my/graphql)  
OAuth Server: [https://sb-oauth.wetix.my](https://sb-oauth.wetix.my)

<!-- ### Production Environment

Open API Server -> [https://graph.wetix.my](https://graph.wetix.my)
OAuth Server -> [https://oauth.wetix.my](https://oauth.wetix.my) -->

## How to Use This Documentation
1. Obtain an access token to access WeTix's protected resources. Please see this [guide](/docs/security/oauth/client_credentials) on obtaining an access token.
2. To GET data such as movies, cinemas, etc can be accessed through [queries](/docs/graphql/queries).
3. To POST data to WeTix such as reserve seats and create movie order can be done through [mutations](/docs/graphql/mutations).
4. For security reasons, to call certain mutations, a signature is required to be generated and included in the mutation. Please see this [guide](/docs/security/signature) on generating signatures.
5. Please refer to the [flow diagram](/docs/guides/flow) to understand the integration flow between WeTix and our integrators. 
6. Please refer to the [examples](/docs/guides/example) on consuming our API.
7. Please refer to the [appendix](/docs/guides/appendix) which contains additional informations regarding our API.
8. Please refer to the [changelog](/docs/overview/changelog) and [breaking changes](/docs/overview/breaking_changes) which contains changes to our API which the integrators may need to update on their end.
9. If there any issues with our API or documentation, or if you would like to request for change, please feel free to raise them [here](https://github.com/wetix/openapi-doc/issues).
