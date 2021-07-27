---
sidebar_label: "About GraphQL API"
sidebar_position: 1
---

# About GraphQL

The GraphQL data query language is:

- A specification. The spec determines the validity of the schema on the API server. The schema determines the validity of client calls.
- Strongly typed. The schema defines an API's type system and all object relationships.
- Introspective. A client can query the schema for details about the schema.
- Hierarchical. The shape of a GraphQL call mirrors the shape of the JSON data it returns. Nested fields let you query for and receive only the data you specify in a single round trip.
- An application layer. GraphQL is not a storage model or a database query language. The graph refers to graph structures defined in the schema, where nodes define objects and edges define relationships between objects. The API traverses and returns application data based on the schema definitions, independent of how the data is stored.

### Why WeTix is using GraphQL
WeTix chose GraphQL for our API because it offers significantly more flexibility for our integrators. The ability to define precisely the data you want—and only the data you want—is a powerful advantage over the RESTful API endpoints. GraphQL lets you replace multiple REST requests with a single call to fetch the data you specify.
