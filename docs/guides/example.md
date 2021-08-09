---
sidebar_label: "Examples"
sidebar_position: 2
---

# Examples

![Docusaurus](/img/monster_run_showtimes.png)

```graphql
{
  movie(key: "EgVNb3ZpZRjKlhIqDhIGT3JpZ2luIgRUTURC") {
    cinemas {
      nodes {
        name
        showtimes(date: "2021-08-10") {
          nodes {
            key
            hall {
              id
              name
            }
            seatLeft
          }
        }
      }
    }
  }
}
```
