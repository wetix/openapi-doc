---
sidebar_label: "Limitation"
sidebar_position: 3
---

# Resource limitations

The WeTix GraphQL API has limitations in place to protect against excessive or abusive calls to WeTix's servers.

### Node limit

To pass schema validation, all GraphQL API calls must meet these standards:

- Clients must supply a **first** or **last** argument on any connection.
- Values of first and last must be within **1** to **100**.
- Individual calls cannot request more than **500,000** total nodes.
