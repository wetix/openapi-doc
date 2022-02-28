---
sidebar_label: "Examples"
sidebar_position: 3
---

# Examples

## Getting Cinemas

<img src="/img/cinemas.jpeg" width="200"/>

**Sample GraphQL query:**

```
query {
  cinemas(first: 3, onScreenOnly: true) {
    nodes {
      key
      operator
      name
      address
      postCode
      stateCode
      geopoint {
        latitude
        longitude
      }
    }
    pageInfo {
      startCursor
      endCursor
      hasNextPage
      hasPreviousPage
    }
  }
}
```

**Sample GraphQL response:**

```
{
  "data": {
    "cinemas": {
      "nodes": [
        {
          "key": "EgZDaW5lbWEiAzI2OCoVEg5DaW5lbWFPcGVyYXRvciIDR1ND",
          "operator": "GSC",
          "name": "GSC Paradigm Mall (Petaling Jaya)",
          "address": "Lot 3F-01, Paradigm Mall No 1 Jln SS7/26A Kelana Jaya",
          "postCode": "47301",
          "stateCode": "MY-10",
          "geopoint": {
            "latitude": 101.59528,
            "longitude": 3.10495
          }
        },
        {
          "key": "EgZDaW5lbWEiAzI2MCoVEg5DaW5lbWFPcGVyYXRvciIDR1ND",
          "operator": "GSC",
          "name": "GSC 1 Utama",
          "address": "Lot E403, 4th Floor, 1Utama Shopping Centre, No 1, Lebuh Bandar Utama, Petaling Jaya Bandar Utama Damansara",
          "postCode": "47800",
          "stateCode": "MY-10",
          "geopoint": {
            "latitude": 101.61528,
            "longitude": 3.15056
          }
        }
      ],
      "pageInfo": {
        "startCursor": "EgZDaW5lbWEiAzI2OCoVEg5DaW5lbWFPcGVyYXRvciIDR1ND",
        "endCursor": "EgZDaW5lbWEiAzI2MCoVEg5DaW5lbWFPcGVyYXRvciIDR1ND",
        "hasNextPage": false,
        "hasPreviousPage": false
      }
    }
  }
}
```

## Getting Now Showing and Coming Soon Movies

<img src="/img/movies.jpeg" width="200"/>

**Sample GraphQL query:**

```
query{
  movies(first: 1, onScreenOnly: true){ # set onScreenOnly to false for coming soon movies
    nodes {
      key
      title
      originalTitle
      mainTrailerUrl
      portraitImageUrl
      landscapeImageUrl
      showtimeCount
      genres
      actors {
        name
        avatarUrl
      }
      images
      isAdvanceSales
      isOnScreen
      isComingSoon
      releaseDate
      createdAt
      lastUpdatedAt
    }
    pageInfo {
      startCursor
      endCursor
      hasNextPage
      hasPreviousPage
    }
  }
}
```

**Sample GraphQL response:**

```
{
  "data": {
    "movies": {
      "nodes": [
        {
          "key": "EgVNb3ZpZRiT6SwqDhIGT3JpZ2luIgRUTURC",
          "title": "MONSTER RUN",
          "originalTitle": "",
          "mainTrailerUrl": "https://www.youtube.com/watch?v=M0Jc28ORRdo&feature=emb_title",
          "portraitImageUrl": "https://asset.wetix.my/images/91bcd798-7fc2-49ae-9573-bc8c5d751066.jpg",
          "landscapeImageUrl": "https://image.tmdb.org/t/p/w500/4a5QISRZ6XdyurHAvMdqMbhWfFI.jpg",
          "showtimeCount": 308,
          "genres": [
            "Action",
            "Fantasy"
          ],
          "actors": [
            {
              "name": "JESSIE LI",
              "avatarUrl": "https://image.tmdb.org/t/p/w500/r2OskCyYncaPmBVBWng4GLjVT4z.jpg"
            },
            {
              "name": "KARA HUI",
              "avatarUrl": "https://image.tmdb.org/t/p/w500/6OV9kM62Y7M7EswtkpCThs0QAxg.jpg"
            },
            {
              "name": "QIÁO SHĀN",
              "avatarUrl": "https://image.tmdb.org/t/p/w500/eYb9UguezbbQi7MVepDtWDFpQ3v.jpg"
            }
          ],
          "images": [
            "https://image.tmdb.org/t/p/w500/4a5QISRZ6XdyurHAvMdqMbhWfFI.jpg"
          ],
          "isAdvanceSales": false,
          "isOnScreen": true,
          "isComingSoon": false,
          "releaseDate": "2020-09-17",
          "createdAt": "2020-09-07T10:00:18Z",
          "lastUpdatedAt": "2021-03-08T08:03:35Z"
        }
      ],
      "pageInfo": {
        "startCursor": "EgVNb3ZpZRiT6SwqDhIGT3JpZ2luIgRUTURC",
        "endCursor": "EgVNb3ZpZRiT6SwqDhIGT3JpZ2luIgRUTURC",
        "hasNextPage": true,
        "hasPreviousPage": false
      }
    }
  }
}
```

## Getting Showtimes For A Movie

<img src="/img/showtimes.jpeg" width="200"/>

**Sample GraphQL query:**

```
query {
  movie(key: "EgVNb3ZpZRiT6SwqDhIGT3JpZ2luIgRUTURC") {
    title
    genres
    cinemas(first: 10) {
      nodes {
        name
        showtimes(first: 100, date: "2021-08-09", activeOnly: true) {
          nodes {
            key
            hall {
              type
            }
            screenAt
            date
            time
            isValid
          }
        }
      }
    }
  }
}

```

**Sample GraphQL response:**

```
{
  "data": {
    "movie": {
      "title": "MONSTER RUN",
      "genres": [
        "Action",
        "Fantasy"
      ],
      "cinemas": {
        "nodes": [
          {
            "name": "GSC Paradigm Mall (Petaling Jaya)",
            "showtimes": {
              "nodes": [
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ1NzMqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ5KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "4DX"
                  },
                  "screenAt": "2021-08-10T05:00:00Z",
                  "date": "2021-08-10",
                  "time": "01:00PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ3NDcqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PLAY+"
                  },
                  "screenAt": "2021-08-10T06:10:00Z",
                  "date": "2021-08-10",
                  "time": "02:10PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQzNzAqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PREMIERE CLASS"
                  },
                  "screenAt": "2021-08-10T07:00:00Z",
                  "date": "2021-08-10",
                  "time": "03:00PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ5MjEqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "ESCAPE STUDIO"
                  },
                  "screenAt": "2021-08-10T07:25:00Z",
                  "date": "2021-08-10",
                  "time": "03:25PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ4MDUqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D ONYX"
                  },
                  "screenAt": "2021-08-10T07:35:00Z",
                  "date": "2021-08-10",
                  "time": "03:35PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQyNTQqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D GOLD CLASS"
                  },
                  "screenAt": "2021-08-10T08:15:00Z",
                  "date": "2021-08-10",
                  "time": "04:15PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ2NjAqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PLAY+"
                  },
                  "screenAt": "2021-08-10T08:30:00Z",
                  "date": "2021-08-10",
                  "time": "04:30PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ4OTIqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ5KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "4DX COMFORT CABIN"
                  },
                  "screenAt": "2021-08-10T09:00:00Z",
                  "date": "2021-08-10",
                  "time": "05:00PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ4MzQqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D ONYX"
                  },
                  "screenAt": "2021-08-10T10:00:00Z",
                  "date": "2021-08-10",
                  "time": "06:00PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQzOTkqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PREMIERE CLASS"
                  },
                  "screenAt": "2021-08-10T10:35:00Z",
                  "date": "2021-08-10",
                  "time": "06:35PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ2ODkqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D PLAY+"
                  },
                  "screenAt": "2021-08-10T11:55:00Z",
                  "date": "2021-08-10",
                  "time": "07:55PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ3NzYqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PLAY+"
                  },
                  "screenAt": "2021-08-10T12:20:00Z",
                  "date": "2021-08-10",
                  "time": "08:20PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQyODMqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D GOLD CLASS"
                  },
                  "screenAt": "2021-08-10T12:55:00Z",
                  "date": "2021-08-10",
                  "time": "08:55PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ0MjgqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D PREMIERE CLASS"
                  },
                  "screenAt": "2021-08-10T14:15:00Z",
                  "date": "2021-08-10",
                  "time": "10:15PM",
                  "isValid": true
                }
              ]
            }
          }
        ]
      }
    }
  }
}
```

## Getting Movies and Showtimes Screened By a Cinema

<img src="/img/movies_and_showtimes.jpeg" width="200"/>

**Sample GraphQL query:**

```
query {
  cinema(key: "EgZDaW5lbWEiAzI2OCoVEg5DaW5lbWFPcGVyYXRvciIDR1ND") {
    name
    movies(first: 10) {
      nodes {
        key
        title
        genres
        showtimes(first: 100, date: "2021-08-10") {
          nodes {
            key
            hall {
              type
            }
            date
            time
            screenAt
          }
        }
      }
    }
  }
}
```

**Sample GraphQL response:**

```
{
  "data": {
    "cinema": {
      "name": "GSC Paradigm Mall (Petaling Jaya)",
      "movies": {
        "nodes": [
          {
            "key": "EgVNb3ZpZRjKlhIqDhIGT3JpZ2luIgRUTURC",
            "title": "AQUAMAN",
            "genres": [
              "Action",
              "Adventure"
            ],
            "showtimes": {
              "nodes": [
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQxOTYqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDE4KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "GOLD CLASS"
                  },
                  "date": "2021-08-10",
                  "time": "09:10PM",
                  "screenAt": "2021-08-10T13:10:00Z"
                }
              ]
            }
          },
          {
            "key": "EgVNb3ZpZRiQpBIqDhIGT3JpZ2luIgRUTURC",
            "title": "AVENGERS: INFINITY WAR",
            "genres": [],
            "showtimes": {
              "nodes": [
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ0ODYqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDU2KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "JIN GASTROBAR AFTER DARK"
                  },
                  "date": "2021-08-10",
                  "time": "04:20PM",
                  "screenAt": "2021-08-10T08:20:00Z"
                }
              ]
            }
          },
          {
            "key": "EgVNb3ZpZRik6hkqDhIGT3JpZ2luIgRUTURC",
            "title": "ANGEL HAS FALLEN",
            "genres": [
              "Action"
            ],
            "showtimes": {
              "nodes": [
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ0NTcqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "JIN GASTROBAR AFTER DARK"
                  },
                  "date": "2021-08-10",
                  "time": "01:35PM",
                  "screenAt": "2021-08-10T05:35:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQzMTIqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PREMIERE CLASS"
                  },
                  "date": "2021-08-10",
                  "time": "05:25PM",
                  "screenAt": "2021-08-10T09:25:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQxNjcqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "GOLD CLASS"
                  },
                  "date": "2021-08-10",
                  "time": "06:15PM",
                  "screenAt": "2021-08-10T10:15:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ5NTAqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "GETHA LUX SUITE"
                  },
                  "date": "2021-08-10",
                  "time": "06:35PM",
                  "screenAt": "2021-08-10T10:35:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ1MTUqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUxKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "4DX JIN GASTROBAR AFTER DARK"
                  },
                  "date": "2021-08-10",
                  "time": "07:15PM",
                  "screenAt": "2021-08-10T11:15:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQzNDEqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PREMIERE CLASS"
                  },
                  "date": "2021-08-10",
                  "time": "08:05PM",
                  "screenAt": "2021-08-10T12:05:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ4NjMqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "ONYX"
                  },
                  "date": "2021-08-10",
                  "time": "09:00PM",
                  "screenAt": "2021-08-10T13:00:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ5NzkqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "GETHA LUX SUITE"
                  },
                  "date": "2021-08-10",
                  "time": "09:05PM",
                  "screenAt": "2021-08-10T13:05:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ1NDQqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUxKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "4DX JIN GASTROBAR AFTER DARK"
                  },
                  "date": "2021-08-10",
                  "time": "09:45PM",
                  "screenAt": "2021-08-10T13:45:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ3MTgqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PLAY+"
                  },
                  "date": "2021-08-10",
                  "time": "10:00PM",
                  "screenAt": "2021-08-10T14:00:00Z"
                }
              ]
            }
          },
          {
            "key": "EgVNb3ZpZRiT6SwqDhIGT3JpZ2luIgRUTURC",
            "title": "MONSTER RUN",
            "genres": [
              "Action",
              "Fantasy"
            ],
            "showtimes": {
              "nodes": [
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ1NzMqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ5KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "4DX"
                  },
                  "date": "2021-08-10",
                  "time": "01:00PM",
                  "screenAt": "2021-08-10T05:00:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ3NDcqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PLAY+"
                  },
                  "date": "2021-08-10",
                  "time": "02:10PM",
                  "screenAt": "2021-08-10T06:10:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQzNzAqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PREMIERE CLASS"
                  },
                  "date": "2021-08-10",
                  "time": "03:00PM",
                  "screenAt": "2021-08-10T07:00:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ5MjEqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "ESCAPE STUDIO"
                  },
                  "date": "2021-08-10",
                  "time": "03:25PM",
                  "screenAt": "2021-08-10T07:25:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ4MDUqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D ONYX"
                  },
                  "date": "2021-08-10",
                  "time": "03:35PM",
                  "screenAt": "2021-08-10T07:35:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQyNTQqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D GOLD CLASS"
                  },
                  "date": "2021-08-10",
                  "time": "04:15PM",
                  "screenAt": "2021-08-10T08:15:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ2NjAqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PLAY+"
                  },
                  "date": "2021-08-10",
                  "time": "04:30PM",
                  "screenAt": "2021-08-10T08:30:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ4OTIqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ5KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "4DX COMFORT CABIN"
                  },
                  "date": "2021-08-10",
                  "time": "05:00PM",
                  "screenAt": "2021-08-10T09:00:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ4MzQqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D ONYX"
                  },
                  "date": "2021-08-10",
                  "time": "06:00PM",
                  "screenAt": "2021-08-10T10:00:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQzOTkqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PREMIERE CLASS"
                  },
                  "date": "2021-08-10",
                  "time": "06:35PM",
                  "screenAt": "2021-08-10T10:35:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ2ODkqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D PLAY+"
                  },
                  "date": "2021-08-10",
                  "time": "07:55PM",
                  "screenAt": "2021-08-10T11:55:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ3NzYqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PLAY+"
                  },
                  "date": "2021-08-10",
                  "time": "08:20PM",
                  "screenAt": "2021-08-10T12:20:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQyODMqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D GOLD CLASS"
                  },
                  "date": "2021-08-10",
                  "time": "08:55PM",
                  "screenAt": "2021-08-10T12:55:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzQ0MjgqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D PREMIERE CLASS"
                  },
                  "date": "2021-08-10",
                  "time": "10:15PM",
                  "screenAt": "2021-08-10T14:15:00Z"
                }
              ]
            }
          }
        ]
      }
    }
  }
}
```

## Getting Seat Layout

<img src="/img/seat_layout.jpeg" width="200"/> 

#### Sample GraphQL mutation:

```
mutation CreateMovieOrderSession($input: CreateMovieOrderSessionInput!) {
  createMovieOrderSession(input: $input) {
    session {
      key
      seatLayout {
        totalRow
        totalColumn
        twoDimensionView {
          label
          seats {
            key
            label
            allocation
            x
            y
            status
          }
        }
      }
    }
  }
}
```

**Variables:**

```
{
  "input": {
    "showtimeKey":"Eg1Nb3ZpZVNob3d0aW1lIgYxNzU1ODQqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M"
  }
}
```

**Sample GraphQL response:**

```
{
  "data": {
    "createMovieOrderSession": {
      "session": {
        "key": "EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMjJEakdoTVRiZVdneXRseGNqd2NMNkw4Wldp",
        "seatLayout": {
          "totalRow": 15,
          "totalColumn": 15,
          "twoDimensionView": [
            {
              "label": "",
              "seats": [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null
              ]
            },
            {
              "label": "",
              "seats": [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null
              ]
            },
            {
              "label": "",
              "seats": [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null
              ]
            },
            {
              "label": "K",
              "seats": [
                null,
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzIzAQhCRUFOX0JBRwEBQgEDSzAxAQIxMQIDAQIBAgA",
                  "label": "K01",
                  "allocation": 1,
                  "x": 2,
                  "y": 3,
                  "status": "SOLD"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzMzAQhCRUFOX0JBRwEBQgEDSzAyAQIxMQIDAQMBAgA",
                  "label": "K02",
                  "allocation": 1,
                  "x": 3,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzQzAQhCRUFOX0JBRwEBQgEDSzAzAQIxMQIDAQQBAgA",
                  "label": "K03",
                  "allocation": 1,
                  "x": 4,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzUzAQhCRUFOX0JBRwEBQgEDSzA0AQIxMQIDAQUBAgA",
                  "label": "K04",
                  "allocation": 1,
                  "x": 5,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzYzAQhCRUFOX0JBRwEBQgEDSzA1AQIxMQIDAQYBAgA",
                  "label": "K05",
                  "allocation": 1,
                  "x": 6,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzczAQhCRUFOX0JBRwEBQgEDSzA2AQIxMQIDAQcBAgA",
                  "label": "K06",
                  "allocation": 1,
                  "x": 7,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzgzAQhCRUFOX0JBRwEBQgEDSzA3AQIxMQIDAQgBAgA",
                  "label": "K07",
                  "allocation": 1,
                  "x": 8,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzkzAQhCRUFOX0JBRwEBQgEDSzA4AQIxMQIDAQkBAgA",
                  "label": "K08",
                  "allocation": 1,
                  "x": 9,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEEMzEwMwEIQkVBTl9CQUcBAUIBA0swOQECMTECAwEKAQIA",
                  "label": "K09",
                  "allocation": 1,
                  "x": 10,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEEMzExMwEIQkVBTl9CQUcBAUIBA0sxMAECMTECAwELAQIA",
                  "label": "K10",
                  "allocation": 1,
                  "x": 11,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEEMzEyMwEIQkVBTl9CQUcBAUIBA0sxMQECMTECAwEMAQIA",
                  "label": "K11",
                  "allocation": 1,
                  "x": 12,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEEMzEzMwEIQkVBTl9CQUcBAUIBA0sxMgECMTECAwENAQIA",
                  "label": "K12",
                  "allocation": 1,
                  "x": 13,
                  "y": 3,
                  "status": "AVAILABLE"
                },
                null
              ]
            },
            {
              "label": "J",
              "seats": [
                null,
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDI0AQhCRUFOX0JBRwEBQgEDSjAxAQIxMQIEAQIBAgA",
                  "label": "J01",
                  "allocation": 1,
                  "x": 2,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDM0AQhCRUFOX0JBRwEBQgEDSjAyAQIxMQIEAQMBAgA",
                  "label": "J02",
                  "allocation": 1,
                  "x": 3,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDQ0AQhCRUFOX0JBRwEBQgEDSjAzAQIxMQIEAQQBAgA",
                  "label": "J03",
                  "allocation": 1,
                  "x": 4,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDU0AQhCRUFOX0JBRwEBQgEDSjA0AQIxMQIEAQUBAgA",
                  "label": "J04",
                  "allocation": 1,
                  "x": 5,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDY0AQhCRUFOX0JBRwEBQgEDSjA1AQIxMQIEAQYBAgA",
                  "label": "J05",
                  "allocation": 1,
                  "x": 6,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDc0AQhCRUFOX0JBRwEBQgEDSjA2AQIxMQIEAQcBAgA",
                  "label": "J06",
                  "allocation": 1,
                  "x": 7,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDg0AQhCRUFOX0JBRwEBQgEDSjA3AQIxMQIEAQgBAgA",
                  "label": "J07",
                  "allocation": 1,
                  "x": 8,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDk0AQhCRUFOX0JBRwEBQgEDSjA4AQIxMQIEAQkBAgA",
                  "label": "J08",
                  "allocation": 1,
                  "x": 9,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENDEwNAEIQkVBTl9CQUcBAUIBA0owOQECMTECBAEKAQIA",
                  "label": "J09",
                  "allocation": 1,
                  "x": 10,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENDExNAEIQkVBTl9CQUcBAUIBA0oxMAECMTECBAELAQIA",
                  "label": "J10",
                  "allocation": 1,
                  "x": 11,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENDEyNAEIQkVBTl9CQUcBAUIBA0oxMQECMTECBAEMAQIA",
                  "label": "J11",
                  "allocation": 1,
                  "x": 12,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENDEzNAEIQkVBTl9CQUcBAUIBA0oxMgECMTECBAENAQIA",
                  "label": "J12",
                  "allocation": 1,
                  "x": 13,
                  "y": 4,
                  "status": "AVAILABLE"
                },
                null
              ]
            },
            {
              "label": "H",
              "seats": [
                null,
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTI1AQhCRUFOX0JBRwEBQgEDSDAxAQIxMQIFAQIBAgA",
                  "label": "H01",
                  "allocation": 1,
                  "x": 2,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTM1AQhCRUFOX0JBRwEBQgEDSDAyAQIxMQIFAQMBAgA",
                  "label": "H02",
                  "allocation": 1,
                  "x": 3,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTQ1AQhCRUFOX0JBRwEBQgEDSDAzAQIxMQIFAQQBAgA",
                  "label": "H03",
                  "allocation": 1,
                  "x": 4,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTU1AQhCRUFOX0JBRwEBQgEDSDA0AQIxMQIFAQUBAgA",
                  "label": "H04",
                  "allocation": 1,
                  "x": 5,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTY1AQhCRUFOX0JBRwEBQgEDSDA1AQIxMQIFAQYBAgA",
                  "label": "H05",
                  "allocation": 1,
                  "x": 6,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTc1AQhCRUFOX0JBRwEBQgEDSDA2AQIxMQIFAQcBAgA",
                  "label": "H06",
                  "allocation": 1,
                  "x": 7,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTg1AQhCRUFOX0JBRwEBQgEDSDA3AQIxMQIFAQgBAgA",
                  "label": "H07",
                  "allocation": 1,
                  "x": 8,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTk1AQhCRUFOX0JBRwEBQgEDSDA4AQIxMQIFAQkBAgA",
                  "label": "H08",
                  "allocation": 1,
                  "x": 9,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENTEwNQEIQkVBTl9CQUcBAUIBA0gwOQECMTECBQEKAQIA",
                  "label": "H09",
                  "allocation": 1,
                  "x": 10,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENTExNQEIQkVBTl9CQUcBAUIBA0gxMAECMTECBQELAQIA",
                  "label": "H10",
                  "allocation": 1,
                  "x": 11,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENTEyNQEIQkVBTl9CQUcBAUIBA0gxMQECMTECBQEMAQIA",
                  "label": "H11",
                  "allocation": 1,
                  "x": 12,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENTEzNQEIQkVBTl9CQUcBAUIBA0gxMgECMTECBQENAQIA",
                  "label": "H12",
                  "allocation": 1,
                  "x": 13,
                  "y": 5,
                  "status": "AVAILABLE"
                },
                null
              ]
            },
            {
              "label": "G",
              "seats": [
                null,
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjI2AQxDVURETEVfQ09BQ0gBAUMBA0cwMQECMTACBgECAQgA",
                  "label": "G01",
                  "allocation": 4,
                  "x": 2,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjM2AQxDVURETEVfQ09BQ0gBAUMBA0cwMgECMTACBgEDAQgA",
                  "label": "G02",
                  "allocation": 4,
                  "x": 3,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjQ2AQxDVURETEVfQ09BQ0gBAUMBA0cwMwECMTACBgEEAQgA",
                  "label": "G03",
                  "allocation": 4,
                  "x": 4,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjU2AQxDVURETEVfQ09BQ0gBAUMBA0cwNAECMTACBgEFAQgA",
                  "label": "G04",
                  "allocation": 4,
                  "x": 5,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjY2AQxDVURETEVfQ09BQ0gBAUMBA0cwNQECMTACBgEGAQgA",
                  "label": "G05",
                  "allocation": 4,
                  "x": 6,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjc2AQxDVURETEVfQ09BQ0gBAUMBA0cwNgECMTACBgEHAQgA",
                  "label": "G06",
                  "allocation": 4,
                  "x": 7,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjg2AQxDVURETEVfQ09BQ0gBAUMBA0cwNwECMTACBgEIAQgA",
                  "label": "G07",
                  "allocation": 4,
                  "x": 8,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjk2AQxDVURETEVfQ09BQ0gBAUMBA0cwOAECMTACBgEJAQgA",
                  "label": "G08",
                  "allocation": 4,
                  "x": 9,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEENjEwNgEMQ1VERExFX0NPQUNIAQFDAQNHMDkBAjEwAgYBCgEIAA",
                  "label": "G09",
                  "allocation": 4,
                  "x": 10,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEENjExNgEMQ1VERExFX0NPQUNIAQFDAQNHMTABAjEwAgYBCwEIAA",
                  "label": "G10",
                  "allocation": 4,
                  "x": 11,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEENjEyNgEMQ1VERExFX0NPQUNIAQFDAQNHMTEBAjEwAgYBDAEIAA",
                  "label": "G11",
                  "allocation": 4,
                  "x": 12,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEENjEzNgEMQ1VERExFX0NPQUNIAQFDAQNHMTIBAjEwAgYBDQEIAA",
                  "label": "G12",
                  "allocation": 4,
                  "x": 13,
                  "y": 6,
                  "status": "AVAILABLE"
                },
                null
              ]
            },
            {
              "label": "F",
              "seats": [
                null,
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzI3AQxDVURETEVfQ09BQ0gBAUMBA0YwMQECMTACBwECAQgA",
                  "label": "F01",
                  "allocation": 4,
                  "x": 2,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzM3AQxDVURETEVfQ09BQ0gBAUMBA0YwMgECMTACBwEDAQgA",
                  "label": "F02",
                  "allocation": 4,
                  "x": 3,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzQ3AQxDVURETEVfQ09BQ0gBAUMBA0YwMwECMTACBwEEAQgA",
                  "label": "F03",
                  "allocation": 4,
                  "x": 4,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzU3AQxDVURETEVfQ09BQ0gBAUMBA0YwNAECMTACBwEFAQgA",
                  "label": "F04",
                  "allocation": 4,
                  "x": 5,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzY3AQxDVURETEVfQ09BQ0gBAUMBA0YwNQECMTACBwEGAQgA",
                  "label": "F05",
                  "allocation": 4,
                  "x": 6,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzc3AQxDVURETEVfQ09BQ0gBAUMBA0YwNgECMTACBwEHAQgA",
                  "label": "F06",
                  "allocation": 4,
                  "x": 7,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzg3AQxDVURETEVfQ09BQ0gBAUMBA0YwNwECMTACBwEIAQgA",
                  "label": "F07",
                  "allocation": 4,
                  "x": 8,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzk3AQxDVURETEVfQ09BQ0gBAUMBA0YwOAECMTACBwEJAQgA",
                  "label": "F08",
                  "allocation": 4,
                  "x": 9,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEENzEwNwEMQ1VERExFX0NPQUNIAQFDAQNGMDkBAjEwAgcBCgEIAA",
                  "label": "F09",
                  "allocation": 4,
                  "x": 10,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEENzExNwEMQ1VERExFX0NPQUNIAQFDAQNGMTABAjEwAgcBCwEIAA",
                  "label": "F10",
                  "allocation": 4,
                  "x": 11,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEENzEyNwEMQ1VERExFX0NPQUNIAQFDAQNGMTEBAjEwAgcBDAEIAA",
                  "label": "F11",
                  "allocation": 4,
                  "x": 12,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEENzEzNwEMQ1VERExFX0NPQUNIAQFDAQNGMTIBAjEwAgcBDQEIAA",
                  "label": "F12",
                  "allocation": 4,
                  "x": 13,
                  "y": 7,
                  "status": "AVAILABLE"
                },
                null
              ]
            },
            {
              "label": "E",
              "seats": [
                null,
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODI4AQxDVURETEVfQ09BQ0gBAUMBA0UwMQECMTACCAECAQgA",
                  "label": "E01",
                  "allocation": 4,
                  "x": 2,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODM4AQxDVURETEVfQ09BQ0gBAUMBA0UwMgECMTACCAEDAQgA",
                  "label": "E02",
                  "allocation": 4,
                  "x": 3,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODQ4AQxDVURETEVfQ09BQ0gBAUMBA0UwMwECMTACCAEEAQgA",
                  "label": "E03",
                  "allocation": 4,
                  "x": 4,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODU4AQxDVURETEVfQ09BQ0gBAUMBA0UwNAECMTACCAEFAQgA",
                  "label": "E04",
                  "allocation": 4,
                  "x": 5,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODY4AQxDVURETEVfQ09BQ0gBAUMBA0UwNQECMTACCAEGAQgA",
                  "label": "E05",
                  "allocation": 4,
                  "x": 6,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODc4AQxDVURETEVfQ09BQ0gBAUMBA0UwNgECMTACCAEHAQgA",
                  "label": "E06",
                  "allocation": 4,
                  "x": 7,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODg4AQxDVURETEVfQ09BQ0gBAUMBA0UwNwECMTACCAEIAQgA",
                  "label": "E07",
                  "allocation": 4,
                  "x": 8,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODk4AQxDVURETEVfQ09BQ0gBAUMBA0UwOAECMTACCAEJAQgA",
                  "label": "E08",
                  "allocation": 4,
                  "x": 9,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEEODEwOAEMQ1VERExFX0NPQUNIAQFDAQNFMDkBAjEwAggBCgEIAA",
                  "label": "E09",
                  "allocation": 4,
                  "x": 10,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEEODExOAEMQ1VERExFX0NPQUNIAQFDAQNFMTABAjEwAggBCwEIAA",
                  "label": "E10",
                  "allocation": 4,
                  "x": 11,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEEODEyOAEMQ1VERExFX0NPQUNIAQFDAQNFMTEBAjEwAggBDAEIAA",
                  "label": "E11",
                  "allocation": 4,
                  "x": 12,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEEODEzOAEMQ1VERExFX0NPQUNIAQFDAQNFMTIBAjEwAggBDQEIAA",
                  "label": "E12",
                  "allocation": 4,
                  "x": 13,
                  "y": 8,
                  "status": "AVAILABLE"
                },
                null
              ]
            },
            {
              "label": "D",
              "seats": [
                null,
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTI5AQhTVEFOREFSRAEBTgEDRDAxAQExAgkBAgECAA",
                  "label": "D01",
                  "allocation": 1,
                  "x": 2,
                  "y": 9,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTM5AQhTVEFOREFSRAEBTgEDRDAyAQExAgkBAwECAA",
                  "label": "D02",
                  "allocation": 1,
                  "x": 3,
                  "y": 9,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTQ5AQhTVEFOREFSRAEBTgEDRDAzAQExAgkBBAECAA",
                  "label": "D03",
                  "allocation": 1,
                  "x": 4,
                  "y": 9,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTU5AQhTVEFOREFSRAEBTgEDRDA0AQExAgkBBQECAA",
                  "label": "D04",
                  "allocation": 1,
                  "x": 5,
                  "y": 9,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTY5AQhTVEFOREFSRAEBTgEDRDA1AQExAgkBBgECAA",
                  "label": "D05",
                  "allocation": 1,
                  "x": 6,
                  "y": 9,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTc5AQhTVEFOREFSRAEBTgEDRDA2AQExAgkBBwECAA",
                  "label": "D06",
                  "allocation": 1,
                  "x": 7,
                  "y": 9,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTg5AQhTVEFOREFSRAEBTgEDRDA3AQExAgkBCAECAA",
                  "label": "D07",
                  "allocation": 1,
                  "x": 8,
                  "y": 9,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTk5AQhTVEFOREFSRAEBTgEDRDA4AQExAgkBCQECAA",
                  "label": "D08",
                  "allocation": 1,
                  "x": 9,
                  "y": 9,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEEOTEwOQEIU1RBTkRBUkQBAU4BA0QwOQEBMQIJAQoBAgA",
                  "label": "D09",
                  "allocation": 1,
                  "x": 10,
                  "y": 9,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEEOTExOQEFSE9VU0UBAUgBA0QxMAEBNAIJAQsBAgA",
                  "label": "D10",
                  "allocation": 1,
                  "x": 11,
                  "y": 9,
                  "status": "SOLD"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEEOTEyOQEFSE9VU0UBAUgBA0QxMQEBNAIJAQwBAgA",
                  "label": "D11",
                  "allocation": 1,
                  "x": 12,
                  "y": 9,
                  "status": "SOLD"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEEOTEzOQEFSE9VU0UBAUgBA0QxMgEBNAIJAQ0BAgA",
                  "label": "D12",
                  "allocation": 1,
                  "x": 13,
                  "y": 9,
                  "status": "SOLD"
                },
                null
              ]
            },
            {
              "label": "C",
              "seats": [
                null,
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTAyMTABCFNUQU5EQVJEAQFOAQNDMDEBATECCgECAQIA",
                  "label": "C01",
                  "allocation": 1,
                  "x": 2,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTAzMTABCFNUQU5EQVJEAQFOAQNDMDIBATECCgEDAQIA",
                  "label": "C02",
                  "allocation": 1,
                  "x": 3,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA0MTABCFNUQU5EQVJEAQFOAQNDMDMBATECCgEEAQIA",
                  "label": "C03",
                  "allocation": 1,
                  "x": 4,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA1MTABCFNUQU5EQVJEAQFOAQNDMDQBATECCgEFAQIA",
                  "label": "C04",
                  "allocation": 1,
                  "x": 5,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA2MTABCFNUQU5EQVJEAQFOAQNDMDUBATECCgEGAQIA",
                  "label": "C05",
                  "allocation": 1,
                  "x": 6,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA3MTABCFNUQU5EQVJEAQFOAQNDMDYBATECCgEHAQIA",
                  "label": "C06",
                  "allocation": 1,
                  "x": 7,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA4MTABCFNUQU5EQVJEAQFOAQNDMDcBATECCgEIAQIA",
                  "label": "C07",
                  "allocation": 1,
                  "x": 8,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA5MTABCFNUQU5EQVJEAQFOAQNDMDgBATECCgEJAQIA",
                  "label": "C08",
                  "allocation": 1,
                  "x": 9,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACb_ggEGMTAxMDEwAQhTVEFOREFSRAEBTgEDQzA5AQExAgoBCgECAA",
                  "label": "C09",
                  "allocation": 1,
                  "x": 10,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACb_ggEGMTAxMTEwAQhTVEFOREFSRAEBTgEDQzEwAQExAgoBCwECAA",
                  "label": "C10",
                  "allocation": 1,
                  "x": 11,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACb_ggEGMTAxMjEwAQhTVEFOREFSRAEBTgEDQzExAQExAgoBDAECAA",
                  "label": "C11",
                  "allocation": 1,
                  "x": 12,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACb_ggEGMTAxMzEwAQhTVEFOREFSRAEBTgEDQzEyAQExAgoBDQECAA",
                  "label": "C12",
                  "allocation": 1,
                  "x": 13,
                  "y": 10,
                  "status": "AVAILABLE"
                },
                null
              ]
            },
            {
              "label": "B",
              "seats": [
                null,
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTEyMTEBCFNUQU5EQVJEAQFOAQNCMDEBATECCwECAQIA",
                  "label": "B01",
                  "allocation": 1,
                  "x": 2,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTEzMTEBCFNUQU5EQVJEAQFOAQNCMDIBATECCwEDAQIA",
                  "label": "B02",
                  "allocation": 1,
                  "x": 3,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTE0MTEBCFNUQU5EQVJEAQFOAQNCMDMBATECCwEEAQIA",
                  "label": "B03",
                  "allocation": 1,
                  "x": 4,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTE1MTEBCFNUQU5EQVJEAQFOAQNCMDQBATECCwEFAQIA",
                  "label": "B04",
                  "allocation": 1,
                  "x": 5,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTE2MTEBCFNUQU5EQVJEAQFOAQNCMDUBATECCwEGAQIA",
                  "label": "B05",
                  "allocation": 1,
                  "x": 6,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTE3MTEBCFNUQU5EQVJEAQFOAQNCMDYBATECCwEHAQIA",
                  "label": "B06",
                  "allocation": 1,
                  "x": 7,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTE4MTEBCFNUQU5EQVJEAQFOAQNCMDcBATECCwEIAQIA",
                  "label": "B07",
                  "allocation": 1,
                  "x": 8,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTE5MTEBCFNUQU5EQVJEAQFOAQNCMDgBATECCwEJAQIA",
                  "label": "B08",
                  "allocation": 1,
                  "x": 9,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACb_ggEGMTExMDExAQhTVEFOREFSRAEBTgEDQjA5AQExAgsBCgECAA",
                  "label": "B09",
                  "allocation": 1,
                  "x": 10,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACb_ggEGMTExMTExAQhTVEFOREFSRAEBTgEDQjEwAQExAgsBCwECAA",
                  "label": "B10",
                  "allocation": 1,
                  "x": 11,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACb_ggEGMTExMjExAQhTVEFOREFSRAEBTgEDQjExAQExAgsBDAECAA",
                  "label": "B11",
                  "allocation": 1,
                  "x": 12,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACb_ggEGMTExMzExAQhTVEFOREFSRAEBTgEDQjEyAQExAgsBDQECAA",
                  "label": "B12",
                  "allocation": 1,
                  "x": 13,
                  "y": 11,
                  "status": "AVAILABLE"
                },
                null
              ]
            },
            {
              "label": "A",
              "seats": [
                null,
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTIyMTIBBFRXSU4BAVQBA0EwMQEBMgIMAQIBBAA",
                  "label": "A01",
                  "allocation": 2,
                  "x": 2,
                  "y": 12,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTIzMTIBBFRXSU4BAVQBA0EwMgEBMgIMAQMBBAA",
                  "label": "A02",
                  "allocation": 2,
                  "x": 3,
                  "y": 12,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI0MTIBBFRXSU4BAVQBA0EwMwEBMgIMAQQBBAA",
                  "label": "A03",
                  "allocation": 2,
                  "x": 4,
                  "y": 12,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI1MTIBBFRXSU4BAVQBA0EwNAEBMgIMAQUBBAA",
                  "label": "A04",
                  "allocation": 2,
                  "x": 5,
                  "y": 12,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI2MTIBBFRXSU4BAVQBA0EwNQEBMgIMAQYBBAA",
                  "label": "A05",
                  "allocation": 2,
                  "x": 6,
                  "y": 12,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI3MTIBBFRXSU4BAVQBA0EwNgEBMgIMAQcBBAA",
                  "label": "A06",
                  "allocation": 2,
                  "x": 7,
                  "y": 12,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI4MTIBBFRXSU4BAVQBA0EwNwEBMgIMAQgBBAA",
                  "label": "A07",
                  "allocation": 2,
                  "x": 8,
                  "y": 12,
                  "status": "AVAILABLE"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI5MTIBBFRXSU4BAVQBA0EwOAEBMgIMAQkBBAA",
                  "label": "A08",
                  "allocation": 2,
                  "x": 9,
                  "y": 12,
                  "status": "AVAILABLE"
                },
                null,
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEGMTIxMTEyAQtXSEVFTF9DSEFJUgEBVwEDQTEwAQEzAgwBCwECAA",
                  "label": "A10",
                  "allocation": 1,
                  "x": 11,
                  "y": 12,
                  "status": "SOLD"
                },
                {
                  "key": "df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEGMTIxMjEyAQtXSEVFTF9DSEFJUgEBVwEDQTExAQEzAgwBDAECAA",
                  "label": "A11",
                  "allocation": 1,
                  "x": 12,
                  "y": 12,
                  "status": "SOLD"
                },
                null,
                null
              ]
            },
            {
              "label": "",
              "seats": [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null
              ]
            },
            {
              "label": "",
              "seats": [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null
              ]
            }
          ]
        }
      }
    }
  }
}
```

## Reserving Seats

<img src="/img/ticket_types_and_concessions.jpeg" width="200"/>

#### Sample GraphQL mutation:

```
mutation ReserveSeats($input: ReserveSeatsInput!) {
  reserveSeats(input: $input) {
    session {
      selectedTickets {
        key
        id
        name
        type
        # purchaseAmount
        # bookingAmount
        areaCode
        seatsAllocation
        quantity
      }
      concessions{
        key
        name
        description
        purchaseAmount
        isSoldOut
      }
      hasExpiry
      expiresIn
      status
    }
  }
}
```

**Variables:**

```
{"input":
  {
    "sessionKey":"EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMXk3aHNzMndmQm1wZ211bkZLZW1yR3BxS0FQ" ,
    "seats": ["ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzQxNAEBTgEDRDAxAQExAgQBAQECAA","ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzQyNAEBTgEDRDAyAQExAgQBAgECAA"]
  }
}
```

**Sample GraphQL response:**

```
{
  "data": {
    "reserveSeats": {
      "session": {
        "key": "EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMXk3aHNzMndmQm1wZ211bkZLZW1yR3BxS0FQ",
        "selectedTickets": [
          {
            "key": "U_-BAwEBCWdvYlRpY2tldAH_ggABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAGv-CAQVBZHVsdAEFQURVTFQBATEB_gg0AQEA",
            "id": "Adult",
            "type": "",
            "name": "ADULT",
            "purchaseAmount": 21,
            "bookingAmount": 0.5,
            "seatsAllocation": 1,
            "quantity":2
          },
          {
            "key": "U_-BAwEBCWdvYlRpY2tldAH_ggABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAHP-CAQZTZW5pb3IBBlNFTklPUgEBMQH-BdwBAQA",
            "id": "Senior",
            "type": "",
            "name": "SENIOR",
            "purchaseAmount": 15,
            "bookingAmount": 0.5,
            "seatsAllocation": 1,
            "quantity":0
          },
          {
            "key": "U_-BAwEBCWdvYlRpY2tldAH_ggABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAHv-CAQdTdHVkZW50AQdTVFVERU5UAQExAf4F3AEBAA",
            "id": "Student",
            "type": "",
            "name": "STUDENT",
            "purchaseAmount": 15,
            "bookingAmount": 0.5,
            "seatsAllocation": 1,
            "quantity":0
          },
        ],
        "concessions":[
          "concessions": [
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_lf-QAQYwMDAwMDIBKkNhcmFtZWwgUG9wY29ybiAoNzB6KSB3aXRoIDIyb3ogQ29rZSAoaWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAwMgH-BUYA",
            "name": "Caramel Popcorn (70z) with 22oz Coke (ice)",
            "description": "",
            "purchaseAmount": 13.5,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_l_-QAQcwMDAwMDIxASpOdWdnZXQgTGFyZ2UgKDE1cGNzKSB3aXRoIDMyb3ogQ29rZSAoaWNlICkBWWh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0wMDAwMDIxAf4F3AA",
            "name": "Nugget Large (15pcs) with 32oz Coke (ice )",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mP-QAQYwMDAwMDMBLUNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IENva2UgKHcvaWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAwMwH-BYwA",
            "name": "Caramel Popcorn (70oz) with 22oz Coke (w/ice)",
            "description": "",
            "purchaseAmount": 14.2,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_m_-QAQYwMDAwMDQBMENhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IENva2UgWmVybyAoSWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAwNAH-BdwA",
            "name": "Caramel Popcorn (70oz) with 22oz Coke Zero (Ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-QAQYwMDAwMDUBMkNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IENva2UgWmVybyAody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDA1Af4F3AA",
            "name": "Caramel Popcorn (70oz) with 22oz Coke Zero (w/ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mP-QAQYwMDAwMDYBLUNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IFNwcml0ZSAoaWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAwNgH-BdwA",
            "name": "Caramel Popcorn (70oz) with 22oz Sprite (ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mv-QAQYwMDAwMDcBL0NhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IFNwcml0ZSAody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDA3Af4F3AA",
            "name": "Caramel Popcorn (70oz) with 22oz Sprite (w/ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-QAQYwMDAwMDgBMkNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IEZhbnRhIEdyYXBlIChpY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDA4Af4F3AA",
            "name": "Caramel Popcorn (70oz) with 22oz Fanta Grape (ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-QAQYwMDAwMDkBMkNhcmFtZWwgUG9wY29ybig3MG96KSB3aXRoIDIyb3ogRmFudGEgR3JhcGUody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDA5Af4F3AA",
            "name": "Caramel Popcorn(70oz) with 22oz Fanta Grape(w/ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-QAQYwMDAwMTABMkNhcmFtZWwgUG9wY29ybig3MG96KSB3aXRoIDIyb3ogRi5TdHJhd2JlcnJ5IChpY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDEwAf4F3AA",
            "name": "Caramel Popcorn(70oz) with 22oz F.Strawberry (ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-QAQYwMDAwMTEBMkNhcmFtZWwgUG9wY29ybig3MG96KSB3aXRoIDIyb3ogRi5TdHJhd2JlcnJ5IChpY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDExAf4F3AA",
            "name": "Caramel Popcorn(70oz) with 22oz F.Strawberry (ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-QAQYwMDAwMTIBMkNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IE0uTS4gT3JhbmdlIChpY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDEyAf4F3AA",
            "name": "Caramel Popcorn (70oz) with 22oz M.M. Orange (ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-QAQYwMDAwMTMBMkNhcmFtZWwgUG9wY29ybig3MG96KSB3aXRoIDIyb3ogTS5NIE9yYW5nZSAody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDEzAf4F3AA",
            "name": "Caramel Popcorn(70oz) with 22oz M.M Orange (w/ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-PAwEBDWdvYkNvbmNlc3Npb24B_5AAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_m_-QAQYwMDAwMTQBMENhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IE0uTSBBcHBsZSAoSWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAxNAH-BdwA",
            "name": "Caramel Popcorn (70oz) with 22oz M.M Apple (Ice)",
            "description": "",
            "purchaseAmount": 15,
            "isSoldOut": false
          }
        ],
        "hasExpiry": false,
        "expiresIn": null,
        "status": "RESERVED"
      }
    }
  }
}
```

## Releasing Seats

#### Sample GraphQL mutation:

```
mutation ReleaseSeats($input: ReleaseSeatsInput!){
  releaseSeats(input: $input){
    session{
      key
      hasExpiry
      expiresIn
      status
    }
  }
}
```

**Variables:**

```
{
  "input": {
    "sessionKey":"EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMXk3aHNzMndmQm1wZ211bkZLZW1yR3BxS0FQ"
  }
}
```

**Sample GraphQL response:**

```
{
  "data": {
    "releaseSeats": {
      "session": {
        "key": "EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMXk3aHNzMndmQm1wZ211bkZLZW1yR3BxS0FQ",
        "hasExpiry": false,
        "expiresIn": null,
        "status": "PENDING"
      }
    }
  }
}
```

## Create Movie Order

<img src="/img/gsc_checkout.jpeg" width="200"/>

#### Sample GraphQL mutation:

```
mutation CreateMovieOrder(
  $input: CreateMovieOrderInput!
  $signature: SignatureInput!
) {
  createMovieOrder(input: $input, signature: $signature) {
    order {
      key
    }
    hasCheckoutLink
    checkoutUrl
  }
}
```

**Variables:**

```
{
  "input": {
    "sessionKey": "EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMjJEcmtwMTNNT2FZVU5mV1lFS3NHT3JsYk1h",
    "referenceId": "123",
    "customer": {
      "externalId": "abc123",
      "email": "harithmohamd67@gmail.com",
      "phoneNo": "0167385346"
    },
    "tickets": [
      {
        "key": "U_-JAwEBCWdvYlRpY2tldAH_igABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAK_-KAQ1CZWFuQmFnLUFkdWx0AQ1CRUFOQkFHLUFEVUxUAQIxMQH-BtYBAQA",
        "quantity": 1
      }
    ],
    "concessions": [],
    "promoCode": null,
    "redirectUrl": "https://google.com"
  },
  "signature": "OToc8MV22QUjjt4ZiPc8rliwRvkjNC1leuuvbxYwMYAIZ+e6FsPeXrHfd5RW72Je0++S42ZLpYni74wWOC7uTUthbcq7YsbitXMznZ4wxUwhdVv+piCFPJ8VQr/zkt/fTCLUKpCR9/fuGyGtTlJ8aYdgJXuIcAyUCuMifyS4kmw="
}
```

**Sample GraphQL response:**

```
{
  "data": {
    "createMovieOrder": {
      "order": {
        "key": "EgpNb3ZpZU9yZGVyGNWDrMbn1ZDgFioXEgtPQXV0aENsaWVudBjv1orQ4qedsBY"
      },
      "hasCheckoutLink": true,
      "checkoutUrl": "https://sb-api.wetix.my/gsc/checkout/EgpNb3ZpZU9yZGVyGNWDrMbn1ZDgFioXEgtPQXV0aENsaWVudBjv1orQ4qedsBY"
    }
  }
}
```

## Create Payment With Movie Order

#### Sample GraphQL mutation:

```
mutation CreatePaymentWithMovieOrder(
  $input: CreatePaymentWithMovieOrderInput!
  $signature: SignatureInput!
) {
  createPaymentWithMovieOrder(input: $input, signature: $signature) {
    order {
      key
    }
  }
}

```

**Variables:**

```
{
  "input": {
    "orderKey": "EgpNb3ZpZU9yZGVyGPzenquY3pDgFioXEgtPQXV0aENsaWVudBjv1orQ4qedsBY",
    "transactionRefId": "12345"
  },
  "signature": "OToc8MV22QUjjt4ZiPc8rliwRvkjNC1leuuvbxYwMYAIZ+e6FsPeXrHfd5RW72Je0++S42ZLpYni74wWOC7uTUthbcq7YsbitXMznZ4wxUwhdVv+piCFPJ8VQr/zkt/fTCLUKpCR9/fuGyGtTlJ8aYdgJXuIcAyUCuMifyS4kmw="
}
```

**Sample GraphQL response:**

```
{
  "data": {
    "createPaymentWithMovieOrder": {
      "order": {
        "key": "EgpNb3ZpZU9yZGVyGNWDrMbn1ZDgFioXEgtPQXV0aENsaWVudBjv1orQ4qedsBY"
      }
    }
  }
}
```

## Confirm Movie Order

<img src="/img/qr_code.jpeg" width="200"/>

#### Sample GraphQL mutation:

```
mutation ConfirmMovieOrder(
  $input: ConfirmMovieOrderInput!
  $signature: SignatureInput!
) {
  confirmMovieOrder(input: $input, signature: $signature) {
    order {
      qrCode
    }
  }
}
```

**Variables:**

```
{
  "input": {
    "orderKey": "EgpNb3ZpZU9yZGVyGPzenquY3pDgFioXEgtPQXV0aENsaWVudBjv1orQ4qedsBY",
  },
  "signature": "OToc8MV22QUjjt4ZiPc8rliwRvkjNC1leuuvbxYwMYAIZ+e6FsPeXrHfd5RW72Je0++S42ZLpYni74wWOC7uTUthbcq7YsbitXMznZ4wxUwhdVv+piCFPJ8VQr/zkt/fTCLUKpCR9/fuGyGtTlJ8aYdgJXuIcAyUCuMifyS4kmw="
}
```

**Sample GraphQL response:**

```
{
  "data": {
    "confirmMovieOrder": {
      "order": {
        "qrCode": "1011111110100100011100011100101111100001110001"
      }
    }
  }
}
```
