---
sidebar_label: "Interfaces"
sidebar_position: 6
---

# Interfaces

Interfaces serve as parent objects from which other objects can inherit.

## [Order](/docs/graphql/interfaces#order)

**Fields**

| Name            | Data Type                                       | Description                                               |
| --------------- | ----------------------------------------------- | --------------------------------------------------------- |
| `key`           | [Key!](/docs/graphql/scalars#key)               | An unique identifier for this object.                     |
| `bookingId`     | [String!](/docs/graphql/scalars#string)         | An external unique identifier related this object.        |
| `transactionId` | [String!](/docs/graphql/scalars#string)         |                                                           |
| `currencyCode`  | [String!](/docs/graphql/scalars#string)         |                                                           |
| `payableAmount` | [Money!](/docs/graphql/scalars#money)           |                                                           |
| `expiredAt`     | [DateTime!](/docs/graphql/scalars#string)       |                                                           |
| `status`        | [OrderStatus!](/docs/graphql/enums#orderstatus) |                                                           |
| `createdAt`     | [DateTime!](/docs/graphql/scalars#datetime)     | Identifies the date and time when the object was created. |
| `lastUpdatedAt` | [DateTime!](/docs/graphql/scalars#datetime)     | Identifies the date and time when the object was updated. |
