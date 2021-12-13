---
sidebar_label: "Examples"
sidebar_position: 4
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

## Getting Seat Layout, Ticket Types and Concessions

|                  Seat Layout                   |                  Ticket Types And Concessions                   |
| :--------------------------------------------: | :-------------------------------------------------------------: |
| <img src="/img/seat_layout.jpeg" width="200"/> | <img src="/img/ticket_types_and_concessions.jpeg" width="200"/> |

#### Sample GraphQL mutation:

```
mutation CreateMovieOrderSession($input: CreateMovieOrderSessionInput!){
  createMovieOrderSession(input:$input){
    session{
      key
      seatLayout{
        totalRow
        totalColumn
        types
        twoDimensionView{
          label
          seats{
            key
            label
            type
            areaNo
            areaCode
            allocation
          }
        }
      }
      tickets{
        key
        id
        name
        type
        purchaseAmount
        bookingAmount
        seatsAllocation
      }
      concessions{
        key
        id
        name
        imageUrl
        purchaseAmount
        isSoldOut
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
        "key": "EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMXk3aHNzMndmQm1wZ211bkZLZW1yR3BxS0FQ",
        "seatLayout": {
          "totalRow": 8,
          "totalColumn": 15,
          "types": [],
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
              "label": "G",
              "seats": [
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzExMQEBTgEDRzAxAQExAgEBAQECAA",
                  "label": "G01",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzEyMQEBTgEDRzAyAQExAgEBAgECAA",
                  "label": "G02",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzE0MQEBTgEDRzAzAQExAgEBBAECAA",
                  "label": "G03",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzE1MQEBTgEDRzA0AQExAgEBBQECAA",
                  "label": "G04",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzE2MQEBTgEDRzA1AQExAgEBBgECAA",
                  "label": "G05",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzE3MQEBTgEDRzA2AQExAgEBBwECAA",
                  "label": "G06",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzE4MQEBTgEDRzA3AQExAgEBCAECAA",
                  "label": "G07",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzE5MQEBTgEDRzA4AQExAgEBCQECAA",
                  "label": "G08",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDExMDEBAU4BA0cwOQEBMQIBAQoBAgA",
                  "label": "G09",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDExMTEBAU4BA0cxMAEBMQIBAQsBAgA",
                  "label": "G10",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDExMzEBAU4BA0cxMQEBMQIBAQ0BAgA",
                  "label": "G11",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDExNDEBAU4BA0cxMgEBMQIBAQ4BAgA",
                  "label": "G12",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                }
              ]
            },
            {
              "label": "F",
              "seats": [
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzIxMgEBTgEDRjAxAQExAgIBAQECAA",
                  "label": "F01",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzIyMgEBTgEDRjAyAQExAgIBAgECAA",
                  "label": "F02",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzI0MgEBTgEDRjAzAQExAgIBBAECAA",
                  "label": "F03",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzI1MgEBTgEDRjA0AQExAgIBBQECAA",
                  "label": "F04",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzI2MgEBTgEDRjA1AQExAgIBBgECAA",
                  "label": "F05",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzI3MgEBTgEDRjA2AQExAgIBBwECAA",
                  "label": "F06",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzI4MgEBTgEDRjA3AQExAgIBCAECAA",
                  "label": "F07",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzI5MgEBTgEDRjA4AQExAgIBCQECAA",
                  "label": "F08",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDIxMDIBAU4BA0YwOQEBMQICAQoBAgA",
                  "label": "F09",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDIxMTIBAU4BA0YxMAEBMQICAQsBAgA",
                  "label": "F10",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDIxMzIBAU4BA0YxMQEBMQICAQ0BAgA",
                  "label": "F11",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDIxNDIBAU4BA0YxMgEBMQICAQ4BAgA",
                  "label": "F12",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                }
              ]
            },
            {
              "label": "E",
              "seats": [
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzMxMwEBTgEDRTAxAQExAgMBAQECAA",
                  "label": "E01",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzMyMwEBTgEDRTAyAQExAgMBAgECAA",
                  "label": "E02",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzM0MwEBTgEDRTAzAQExAgMBBAECAA",
                  "label": "E03",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzM1MwEBTgEDRTA0AQExAgMBBQECAA",
                  "label": "E04",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzM2MwEBTgEDRTA1AQExAgMBBgECAA",
                  "label": "E05",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzM3MwEBTgEDRTA2AQExAgMBBwECAA",
                  "label": "E06",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzM4MwEBTgEDRTA3AQExAgMBCAECAA",
                  "label": "E07",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzM5MwEBTgEDRTA4AQExAgMBCQECAA",
                  "label": "E08",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDMxMDMBAU4BA0UwOQEBMQIDAQoBAgA",
                  "label": "E09",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDMxMTMBAU4BA0UxMAEBMQIDAQsBAgA",
                  "label": "E10",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDMxMzMBAU4BA0UxMQEBMQIDAQ0BAgA",
                  "label": "E11",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDMxNDMBAU4BA0UxMgEBMQIDAQ4BAgA",
                  "label": "E12",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                }
              ]
            },
            {
              "label": "D",
              "seats": [
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzQxNAEBTgEDRDAxAQExAgQBAQECAA",
                  "label": "D01",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzQyNAEBTgEDRDAyAQExAgQBAgECAA",
                  "label": "D02",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzQ0NAEBTgEDRDAzAQExAgQBBAECAA",
                  "label": "D03",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzQ1NAEBTgEDRDA0AQExAgQBBQECAA",
                  "label": "D04",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzQ2NAEBTgEDRDA1AQExAgQBBgECAA",
                  "label": "D05",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzQ3NAEBTgEDRDA2AQExAgQBBwECAA",
                  "label": "D06",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzQ4NAEBSAEDRDA3AQE0AgQBCAECAA",
                  "label": "D07",
                  "type": "H",
                  "areaNo": 0,
                  "areaCode": "4",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzQ5NAEBSAEDRDA4AQE0AgQBCQECAA",
                  "label": "D08",
                  "type": "H",
                  "areaNo": 0,
                  "areaCode": "4",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDQxMDQBAUgBA0QwOQEBNAIEAQoBAgA",
                  "label": "D09",
                  "type": "H",
                  "areaNo": 0,
                  "areaCode": "4",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDQxMTQBAUgBA0QxMAEBNAIEAQsBAgA",
                  "label": "D10",
                  "type": "H",
                  "areaNo": 0,
                  "areaCode": "4",
                  "allocation": 1
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDQxMzQBAU4BA0QxMQEBMQIEAQ0BAgA",
                  "label": "D11",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDQxNDQBAU4BA0QxMgEBMQIEAQ4BAgA",
                  "label": "D12",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                }
              ]
            },
            {
              "label": "C",
              "seats": [
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzUxNQEBTgEDQzAxAQExAgUBAQECAA",
                  "label": "C01",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzUyNQEBTgEDQzAyAQExAgUBAgECAA",
                  "label": "C02",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzU0NQEBTgEDQzAzAQExAgUBBAECAA",
                  "label": "C03",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzU1NQEBTgEDQzA0AQExAgUBBQECAA",
                  "label": "C04",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzU2NQEBTgEDQzA1AQExAgUBBgECAA",
                  "label": "C05",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzU3NQEBTgEDQzA2AQExAgUBBwECAA",
                  "label": "C06",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzU4NQEBTgEDQzA3AQExAgUBCAECAA",
                  "label": "C07",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzU5NQEBTgEDQzA4AQExAgUBCQECAA",
                  "label": "C08",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDUxMDUBAU4BA0MwOQEBMQIFAQoBAgA",
                  "label": "C09",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDUxMTUBAU4BA0MxMAEBMQIFAQsBAgA",
                  "label": "C10",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDUxMzUBAU4BA0MxMQEBMQIFAQ0BAgA",
                  "label": "C11",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDUxNDUBAU4BA0MxMgEBMQIFAQ4BAgA",
                  "label": "C12",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                }
              ]
            },
            {
              "label": "B",
              "seats": [
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzYxNgEBVAEDQjAxAQEyAgYBAQEEAA",
                  "label": "B01",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzYyNgEBVAEDQjAyAQEyAgYBAgEEAA",
                  "label": "B02",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzY0NgEBVAEDQjAzAQEyAgYBBAEEAA",
                  "label": "B03",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzY1NgEBVAEDQjA0AQEyAgYBBQEEAA",
                  "label": "B04",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzY2NgEBVAEDQjA1AQEyAgYBBgEEAA",
                  "label": "B05",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzY3NgEBVAEDQjA2AQEyAgYBBwEEAA",
                  "label": "B06",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzY4NgEBVAEDQjA3AQEyAgYBCAEEAA",
                  "label": "B07",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzY5NgEBVAEDQjA4AQEyAgYBCQEEAA",
                  "label": "B08",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDYxMDYBAVQBA0IwOQEBMgIGAQoBBAA",
                  "label": "B09",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDYxMTYBAVQBA0IxMAEBMgIGAQsBBAA",
                  "label": "B10",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDYxMzYBAVQBA0IxMQEBMgIGAQ0BBAA",
                  "label": "B11",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDYxNDYBAVQBA0IxMgEBMgIGAQ4BBAA",
                  "label": "B12",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                }
              ]
            },
            {
              "label": "A",
              "seats": [
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzcxNwEBVAEDQTAxAQEyAgcBAQEEAA",
                  "label": "A01",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzcyNwEBVAEDQTAyAQEyAgcBAgEEAA",
                  "label": "A02",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzc0NwEBVAEDQTAzAQEyAgcBBAEEAA",
                  "label": "A03",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzc1NwEBVAEDQTA0AQEyAgcBBQEEAA",
                  "label": "A04",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzc2NwEBVAEDQTA1AQEyAgcBBgEEAA",
                  "label": "A05",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzc3NwEBVAEDQTA2AQEyAgcBBwEEAA",
                  "label": "A06",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzc4NwEBVAEDQTA3AQEyAgcBCAEEAA",
                  "label": "A07",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAZ_4IBAzc5NwEBVAEDQTA4AQEyAgcBCQEEAA",
                  "label": "A08",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDcxMDcBAVQBA0EwOQEBMgIHAQoBBAA",
                  "label": "A09",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDcxMTcBAVQBA0ExMAEBMgIHAQsBBAA",
                  "label": "A10",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                null,
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDcxMzcBAVQBA0ExMQEBMgIHAQ0BBAA",
                  "label": "A11",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                },
                {
                  "key": "ZP-BAwEBB2dvYlNlYXQB_4IAAQgBAklEAQwAAQRUeXBlAQwAAQVMYWJlbAEMAAEIQXJlYUNvZGUBDAABBkFyZWFObwEEAAEDUm93AQYAAQZDb2x1bW4BBgABBUNvdW50AQQAAAAa_4IBBDcxNDcBAVQBA0ExMgEBMgIHAQ4BBAA",
                  "label": "A12",
                  "type": "T",
                  "areaNo": 0,
                  "areaCode": "2",
                  "allocation": 2
                }
              ]
            }
          ]
        },
        "tickets": [
          {
            "key": "U_-DAwEBCWdvYlRpY2tldAH_hAABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAGv-EAQVBZHVsdAEFQURVTFQBATEB_gg0AQEA",
            "id": "Adult",
            "name": "ADULT",
            "type": "",
            "purchaseAmount": 21,
            "bookingAmount": 0.5,
            "seatsAllocation": 1
          },
          {
            "key": "U_-DAwEBCWdvYlRpY2tldAH_hAABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAHP-EAQZTZW5pb3IBBlNFTklPUgEBMQH-BdwBAQA",
            "id": "Senior",
            "name": "SENIOR",
            "type": "",
            "purchaseAmount": 15,
            "bookingAmount": 0.5,
            "seatsAllocation": 1
          },
          {
            "key": "U_-DAwEBCWdvYlRpY2tldAH_hAABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAHv-EAQdTdHVkZW50AQdTVFVERU5UAQExAf4F3AEBAA",
            "id": "Student",
            "name": "STUDENT",
            "type": "",
            "purchaseAmount": 15,
            "bookingAmount": 0.5,
            "seatsAllocation": 1
          },
          {
            "key": "U_-DAwEBCWdvYlRpY2tldAH_hAABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAGP-EAQRUd2luAQRUV0lOAQEyAf4SXAECAA",
            "id": "Twin",
            "name": "TWIN",
            "type": "",
            "purchaseAmount": 47,
            "bookingAmount": 1,
            "seatsAllocation": 2
          }
        ],
        "concessions": [
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_lf-GAQYwMDAwMDIBKkNhcmFtZWwgUG9wY29ybiAoNzB6KSB3aXRoIDIyb3ogQ29rZSAoaWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAwMgH-BdwA",
            "id": "000002",
            "name": "Caramel Popcorn (70z) with 22oz Coke (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000002",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_l_-GAQcwMDAwMDIxASpOdWdnZXQgTGFyZ2UgKDE1cGNzKSB3aXRoIDMyb3ogQ29rZSAoaWNlICkBWWh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0wMDAwMDIxAf4F3AA",
            "id": "0000021",
            "name": "Nugget Large (15pcs) with 32oz Coke (ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=0000021",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mP-GAQYwMDAwMDMBLUNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IENva2UgKHcvaWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAwMwH-BdwA",
            "id": "000003",
            "name": "Caramel Popcorn (70oz) with 22oz Coke (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000003",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_m_-GAQYwMDAwMDQBMENhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IENva2UgWmVybyAoSWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAwNAH-BdwA",
            "id": "000004",
            "name": "Caramel Popcorn (70oz) with 22oz Coke Zero (Ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000004",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMDUBMkNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IENva2UgWmVybyAody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDA1Af4F3AA",
            "id": "000005",
            "name": "Caramel Popcorn (70oz) with 22oz Coke Zero (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000005",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mP-GAQYwMDAwMDYBLUNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IFNwcml0ZSAoaWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAwNgH-BdwA",
            "id": "000006",
            "name": "Caramel Popcorn (70oz) with 22oz Sprite (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000006",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mv-GAQYwMDAwMDcBL0NhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IFNwcml0ZSAody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDA3Af4F3AA",
            "id": "000007",
            "name": "Caramel Popcorn (70oz) with 22oz Sprite (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000007",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMDgBMkNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IEZhbnRhIEdyYXBlIChpY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDA4Af4F3AA",
            "id": "000008",
            "name": "Caramel Popcorn (70oz) with 22oz Fanta Grape (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000008",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMDkBMkNhcmFtZWwgUG9wY29ybig3MG96KSB3aXRoIDIyb3ogRmFudGEgR3JhcGUody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDA5Af4F3AA",
            "id": "000009",
            "name": "Caramel Popcorn(70oz) with 22oz Fanta Grape(w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000009",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMTABMkNhcmFtZWwgUG9wY29ybig3MG96KSB3aXRoIDIyb3ogRi5TdHJhd2JlcnJ5IChpY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDEwAf4F3AA",
            "id": "000010",
            "name": "Caramel Popcorn(70oz) with 22oz F.Strawberry (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000010",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMTEBMkNhcmFtZWwgUG9wY29ybig3MG96KSB3aXRoIDIyb3ogRi5TdHJhd2JlcnJ5IChpY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDExAf4F3AA",
            "id": "000011",
            "name": "Caramel Popcorn(70oz) with 22oz F.Strawberry (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000011",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMTIBMkNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IE0uTS4gT3JhbmdlIChpY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDEyAf4F3AA",
            "id": "000012",
            "name": "Caramel Popcorn (70oz) with 22oz M.M. Orange (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000012",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMTMBMkNhcmFtZWwgUG9wY29ybig3MG96KSB3aXRoIDIyb3ogTS5NIE9yYW5nZSAody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDEzAf4F3AA",
            "id": "000013",
            "name": "Caramel Popcorn(70oz) with 22oz M.M Orange (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000013",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_m_-GAQYwMDAwMTQBMENhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IE0uTSBBcHBsZSAoSWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAxNAH-BdwA",
            "id": "000014",
            "name": "Caramel Popcorn (70oz) with 22oz M.M Apple (Ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000014",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMTUBMkNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IE0uTSBBcHBsZSAody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDE1Af4F3AA",
            "id": "000015",
            "name": "Caramel Popcorn (70oz) with 22oz M.M Apple (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000015",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMTYBMkNhcmFtZWwgUG9wY29ybig3MG96KSB3aXRoIDIyb3ogSWNlIExlbW9uIFRlYShpY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDE2Af4F3AA",
            "id": "000016",
            "name": "Caramel Popcorn(70oz) with 22oz Ice Lemon Tea(ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000016",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMTcBMkNhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCAyMm96IEljZSBMZW1vbiAody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDE3Af4F3AA",
            "id": "000017",
            "name": "Caramel Popcorn (70oz) with 22oz Ice Lemon (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000017",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_m_-GAQYwMDAwMTgBMENhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCBNaW5lcmFsIFdhdGVyIChDb2xkKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAxOAH-BdwA",
            "id": "000018",
            "name": "Caramel Popcorn (70oz) with Mineral Water (Cold)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000018",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mv-GAQYwMDAwMTkBL0NhcmFtZWwgUG9wY29ybiAoNzBveikgd2l0aCBNaW5lcmFsIChSb29tIFRlbXApAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDE5Af4F3AA",
            "id": "000019",
            "name": "Caramel Popcorn (70oz) with Mineral (Room Temp)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000019",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_lf-GAQYwMDAwMjIBKk51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IENva2Uody9pY2UgKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAyMgH-BdwA",
            "id": "000022",
            "name": "Nugget Large(15pcs) with 32oz Coke(w/ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000022",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mP-GAQYwMDAwMjMBLU51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IENva2UgWmVybyAoaWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAyMwH-BdwA",
            "id": "000023",
            "name": "Nugget Large(15pcs) with 32oz Coke Zero (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000023",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nP-GAQYwMDAwMjQBMU51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IENva2UgWmVybyAoIHcvaWNlICkBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0wMDAwMjQB_gXcAA",
            "id": "000024",
            "name": "Nugget Large(15pcs) with 32oz Coke Zero ( w/ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000024",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_lf-GAQYwMDAwMjUBKk51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IFNwcml0ZShpY2UgKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAyNQH-BdwA",
            "id": "000025",
            "name": "Nugget Large(15pcs) with 32oz Sprite(ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000025",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mv-GAQYwMDAwMjYBL051Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMiBveiBTcHJpdGUgKCB3L2ljZSApAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDI2Af4F3AA",
            "id": "000026",
            "name": "Nugget Large(15pcs) with 32 oz Sprite ( w/ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000026",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nP-GAQYwMDAwMjcBMU51Z2dldCBMYXJnZSAoMTVwY3MpIHdpdGggMzJveiBGYW50YSBHcmFwZSAoaWNlICkBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0wMDAwMjcB_gXcAA",
            "id": "000027",
            "name": "Nugget Large (15pcs) with 32oz Fanta Grape (ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000027",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nP-GAQYwMDAwMjgBMU51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IEZhbnRhIEdyYXBlICh3L2ljZSkBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0wMDAwMjgB_gXcAA",
            "id": "000028",
            "name": "Nugget Large(15pcs) with 32oz Fanta Grape (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000028",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_m_-GAQYwMDAwMjkBME51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IEYuU3RyYXdiZXJyeSAoaWNlKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTAwMDAyOQH-BdwA",
            "id": "000029",
            "name": "Nugget Large(15pcs) with 32oz F.Strawberry (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000029",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMzABMk51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IEYuU3RyYXdiZXJyeSh3L2ljZSApAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDMwAf4F3AA",
            "id": "000030",
            "name": "Nugget Large(15pcs) with 32oz F.Strawberry(w/ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000030",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nP-GAQYwMDAwMzEBMU51Z2dldCBMYXJnZSAoMTVwY3MpIHdpdGggMzJveiBNLk0uT3JhbmdlICggaWNlICkBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0wMDAwMzEB_gXcAA",
            "id": "000031",
            "name": "Nugget Large (15pcs) with 32oz M.M.Orange ( ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000031",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mv-GAQYwMDAwMzIBL051Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IE0uTS5PcmFuZ2Uody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDMyAf4F3AA",
            "id": "000032",
            "name": "Nugget Large(15pcs) with 32oz M.M.Orange(w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000032",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_mf-GAQYwMDAwMzMBLk51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IE0uTS4gQXBwbGUgKGljZSkBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0wMDAwMzMB_gXcAA",
            "id": "000033",
            "name": "Nugget Large(15pcs) with 32oz M.M. Apple (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000033",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nP-GAQYwMDAwMzQBMU51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IE0uTS5BcHBsZSAoIHcvaWNlICkBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0wMDAwMzQB_gXcAA",
            "id": "000034",
            "name": "Nugget Large(15pcs) with 32oz M.M.Apple ( w/ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000034",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nP-GAQYwMDAwMzUBMU51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IEljZSBMZW1vbiBUZWEoaWNlICkBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0wMDAwMzUB_gXcAA",
            "id": "000035",
            "name": "Nugget Large(15pcs) with 32oz Ice Lemon Tea(ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000035",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMzYBMk51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCAzMm96IEljZSBMZW1vbiBUZWEody9pY2UpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDM2Af4F3AA",
            "id": "000036",
            "name": "Nugget Large(15pcs) with 32oz Ice Lemon Tea(w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000036",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nP-GAQYwMDAwMzcBMU51Z2dldCBMYXJnZSAoMTVwY3MpIHdpdGggTWluZXJhbCBXYXRlciAtIChDb2xkICkBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0wMDAwMzcB_gXcAA",
            "id": "000037",
            "name": "Nugget Large (15pcs) with Mineral Water - (Cold )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000037",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_nf-GAQYwMDAwMzgBMk51Z2dldCBMYXJnZSgxNXBjcykgd2l0aCBNaW5lcmFsIFdhdGVyLShSb29tIFRlbXApAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MDAwMDM4Af4F3AA",
            "id": "000038",
            "name": "Nugget Large(15pcs) with Mineral Water-(Room Temp)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000038",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_gv-GAQYxMDAwMDcBF1Rlc3QgNyAoZ3JvdXAgdHlwZSAwMDUpAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MTAwMDA3Af4RlAA",
            "id": "100007",
            "name": "Test 7 (group type 005)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=100007",
            "purchaseAmount": 45,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB0_4YBBjIwNjAwMQEJZS1Db21ibyAxAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MjA2MDAxAf4ELgA",
            "id": "206001",
            "name": "e-Combo 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206001",
            "purchaseAmount": 10.7,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_gP-GAQYyMDYwMDIBFWUtQ29tYm8gMiBwcm9kdWN0IG1peAFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTIwNjAwMgH-BC4A",
            "id": "206002",
            "name": "e-Combo 2 product mix",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206002",
            "purchaseAmount": 10.7,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB6_4YBBjIwNjAwMwEPTGFyZ2UgZS1Db21ibyAxAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MjA2MDAzAf4FZAA",
            "id": "206003",
            "name": "Large e-Combo 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206003",
            "purchaseAmount": 13.8,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_gv-GAQYyMDYwODkBF0FkZCBPbiBSTTMgZS1DdXJyeSBQdWZmAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MjA2MDg5Af4BLAA",
            "id": "206089",
            "name": "Add On RM3 e-Curry Puff",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206089",
            "purchaseAmount": 3,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB9_4YBBjIyMjIyMwESTGFyZ2UgQ29rZSBDb21ibyAxAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MjIyMjIzAf4EsAA",
            "id": "222223",
            "name": "Large Coke Combo 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=222223",
            "purchaseAmount": 12,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_gf-GAQYyMjIyMjQBFkxhcmdlIFNwcml0emVyIENvbWJvIDEBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0yMjIyMjQB_gSwAA",
            "id": "222224",
            "name": "Large Spritzer Combo 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=222224",
            "purchaseAmount": 12,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB8_4YBBjMzMzMzNAERTnVnZ2V0IENva2UgQ29tYm8BWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0zMzMzMzQB_gZAAA",
            "id": "333334",
            "name": "Nugget Coke Combo",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=333334",
            "purchaseAmount": 16,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_gP-GAQYzMzMzMzUBFU51Z2dldCBTcHJpdHplciBDb21ibwFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTMzMzMzNQH-BdwA",
            "id": "333335",
            "name": "Nugget Spritzer Combo",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=333335",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB1_4YBBjkwMDU1NQEKTSBDT01CTyBMTAFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTkwMDU1NQH-BwgA",
            "id": "900555",
            "name": "M COMBO LL",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900555",
            "purchaseAmount": 18,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB2_4YBBjkwMDY2MgELQ29tYm8gU2V0IDEBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT05MDA2NjIB_gVGAA",
            "id": "900662",
            "name": "Combo Set 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900662",
            "purchaseAmount": 13.5,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB2_4YBBjkwMDY2NgELQ29tYm8gU2V0IDUBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT05MDA2NjYB_g5CAA",
            "id": "900666",
            "name": "Combo Set 5",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900666",
            "purchaseAmount": 36.5,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB5_4YBBjEwMDAwOAEOVGVzdCA4IChjaGlsZCkBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0xMDAwMDgB_hOIAA",
            "id": "100008",
            "name": "Test 8 (child)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=100008",
            "purchaseAmount": 50,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_h_-GAQYxMTExMTIBHEp1bWJvIHBvcGNvcm4gY29tYm8gc3ByaXR6ZXIBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0xMTExMTIB_gfQAA",
            "id": "111112",
            "name": "Jumbo popcorn combo spritzer",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=111112",
            "purchaseAmount": 20,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_g_-GAQYxMTExMTMBGEp1bWJvIHBvcGNvcm4gY29tYm8gY29rZQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTExMTExMwH-CWAA",
            "id": "111113",
            "name": "Jumbo popcorn combo coke",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=111113",
            "purchaseAmount": 24,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB7_4YBBzIwNjAwMDEBDkhvdCBEb2cgUGFyZW50AVlodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9MjA2MDAwMQH-BJwA",
            "id": "2060001",
            "name": "Hot Dog Parent",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=2060001",
            "purchaseAmount": 11.8,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_kP-GAQYyMDYwMDgBJU51Z2dldCAoTCkgZS1Db21ibyAxIENoaWxkIGZvciBUZXN0IDMBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0yMDYwMDgB_gXcAA",
            "id": "206008",
            "name": "Nugget (L) e-Combo 1 Child for Test 3",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206008",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_kP-GAQYyMDYwMTABJU51Z2dldCAoTCkgZS1Db21ibyAyIENoaWxkIGZvciBUZXN0IDMBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT0yMDYwMTAB_gXcAA",
            "id": "206010",
            "name": "Nugget (L) e-Combo 2 Child for Test 3",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206010",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB-_4YBBjU2Nzg5MQETUHJvZHVjdCBNaXggQ2hpbGQgMQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTU2Nzg5MQH-AZAA",
            "id": "567891",
            "name": "Product Mix Child 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567891",
            "purchaseAmount": 4,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB-_4YBBjU2Nzg5MgETUHJvZHVjdCBNaXggQ2hpbGQgMgFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTU2Nzg5MgH-ArwA",
            "id": "567892",
            "name": "Product Mix Child 2",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567892",
            "purchaseAmount": 7,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_hv-GAQY5MDAxMTIBG01pbmlvbnMgU3VwZXIgU2F2b3IgUG9wY29ybgFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTkwMDExMgH-CcQA",
            "id": "900112",
            "name": "Minions Super Savor Popcorn",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900112",
            "purchaseAmount": 25,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB2_4YBBjkwMDY2NAELQ29tYm8gU2V0IDMBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT05MDA2NjQB_g5CAA",
            "id": "900664",
            "name": "Combo Set 3",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900664",
            "purchaseAmount": 36.5,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB3_4YBBjkwMDY3MwEMSlVORSBDT01CTyAyAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9OTAwNjczAf4JxAA",
            "id": "900673",
            "name": "JUNE COMBO 2",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900673",
            "purchaseAmount": 25,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB3_4YBBjkwMDY3NAEMSlVORSBDT01CTyAzAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9OTAwNjc0Af4JxAA",
            "id": "900674",
            "name": "JUNE COMBO 3",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900674",
            "purchaseAmount": 25,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB3_4YBBjkwMDY3NgEMSlVORSBDT01CTyA0AVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9OTAwNjc2Af4JxAA",
            "id": "900676",
            "name": "JUNE COMBO 4",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900676",
            "purchaseAmount": 25,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_g_-GAQYxMDAwMDQBGFRlc3QgNCAoZ3JvdXAgdHlwZSBlY29uKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTEwMDAwNAH-C7gA",
            "id": "100004",
            "name": "Test 4 (group type econ)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=100004",
            "purchaseAmount": 30,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_hP-GAQoxMDAwMjA2MDAxARFTYWxlcyBDYXBwaW5nIChBKQFcaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTEwMDAyMDYwMDEB_gQuAA",
            "id": "1000206001",
            "name": "Sales Capping (A)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=1000206001",
            "purchaseAmount": 10.7,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_gv-GAQY1Njc4OTQBF1ByaW5jZXNzIFNlcmllcyAtIE11bGFuAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9NTY3ODk0Af4GQAA",
            "id": "567894",
            "name": "Princess Series - Mulan",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567894",
            "purchaseAmount": 16,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_gf-GAQY1Njc4OTUBFlByaW5jZXNzIFNlcmllcyAtIEVsc2EBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT01Njc4OTUB_gakAA",
            "id": "567895",
            "name": "Princess Series - Elsa",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567895",
            "purchaseAmount": 17,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_h_-GAQY1Njc4OTYBHFByaW5jZXNzIFNlcmllcyAtIFNub3cgV2hpdGUBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT01Njc4OTYB_gcIAA",
            "id": "567896",
            "name": "Princess Series - Snow White",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567896",
            "purchaseAmount": 18,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_hP-GAQY1Njc4OTcBGVByaW5jZXNzIFNlcmllcyAtIEFsYWRkaW4BWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT01Njc4OTcB_gdsAA",
            "id": "567897",
            "name": "Princess Series - Aladdin",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567897",
            "purchaseAmount": 19,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_gv-GAQY1Njc4OTkBF0F2ZW5nZXJzIFNlcmllcyAtIE11bGFuAVhodHRwczovL3N0YWdpbmdlcGF5bWVudC5nc2MuY29tLm15L0NvbmNlc3Npb25Xcy9TZXJ2aWNlLmFzbXgvR2V0UHJvZHVjdEltYWdlP2NvZGU9NTY3ODk5Af4GQAA",
            "id": "567899",
            "name": "Avengers Series - Mulan",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567899",
            "purchaseAmount": 16,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB8_4YBBjU2NzkwMAERREMgU2VyaWVzIC0gTXVsYW4BWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT01Njc5MDAB_gZAAA",
            "id": "567900",
            "name": "DC Series - Mulan",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567900",
            "purchaseAmount": 16,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAD_hv-GAQY5MDA1NTYBG00gQ09NQk8gU1BFQ0lBTCAoTk8gUEFSRU5UKQFYaHR0cHM6Ly9zdGFnaW5nZXBheW1lbnQuZ3NjLmNvbS5teS9Db25jZXNzaW9uV3MvU2VydmljZS5hc214L0dldFByb2R1Y3RJbWFnZT9jb2RlPTkwMDU1NgH-CJgA",
            "id": "900556",
            "name": "M COMBO SPECIAL (NO PARENT)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900556",
            "purchaseAmount": 22,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB2_4YBBjkwMDY2OQELQ29tYm8gU2V0IDgBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT05MDA2NjkB_gVGAA",
            "id": "900669",
            "name": "Combo Set 8",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900669",
            "purchaseAmount": 13.5,
            "isSoldOut": false
          },
          {
            "key": "Q_-FAwEBDWdvYkNvbmNlc3Npb24B_4YAAQQBAklEAQwAAQROYW1lAQwAAQhJbWFnZVVSTAEMAAEGQW1vdW50AQYAAAB2_4YBBjkwMDY3MAELQ29tYm8gU2V0IDkBWGh0dHBzOi8vc3RhZ2luZ2VwYXltZW50LmdzYy5jb20ubXkvQ29uY2Vzc2lvbldzL1NlcnZpY2UuYXNteC9HZXRQcm9kdWN0SW1hZ2U_Y29kZT05MDA2NzAB_gVGAA",
            "id": "900670",
            "name": "Combo Set 9",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900670",
            "purchaseAmount": 13.5,
            "isSoldOut": false
          }
        ]
      }
    }
  }
}
```

## Reserving Seats

#### Sample GraphQL mutation:

```
mutation ReserveSeats($input: ReserveSeatsInput!){
  reserveSeats(input: $input){
    session{
      key
      tickets{
        key
        id
        type
        name
        purchaseAmount
        bookingAmount
        seatsAllocation
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
        "tickets": [
          {
            "key": "U_-BAwEBCWdvYlRpY2tldAH_ggABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAGv-CAQVBZHVsdAEFQURVTFQBATEB_gg0AQEA",
            "id": "Adult",
            "type": "",
            "name": "ADULT",
            "purchaseAmount": 21,
            "bookingAmount": 0.5,
            "seatsAllocation": 1
          },
          {
            "key": "U_-BAwEBCWdvYlRpY2tldAH_ggABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAHP-CAQZTZW5pb3IBBlNFTklPUgEBMQH-BdwBAQA",
            "id": "Senior",
            "type": "",
            "name": "SENIOR",
            "purchaseAmount": 15,
            "bookingAmount": 0.5,
            "seatsAllocation": 1
          },
          {
            "key": "U_-BAwEBCWdvYlRpY2tldAH_ggABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAHv-CAQdTdHVkZW50AQdTVFVERU5UAQExAf4F3AEBAA",
            "id": "Student",
            "type": "",
            "name": "STUDENT",
            "purchaseAmount": 15,
            "bookingAmount": 0.5,
            "seatsAllocation": 1
          },
          {
            "key": "U_-BAwEBCWdvYlRpY2tldAH_ggABBQECSUQBDAABBE5hbWUBDAABCEFyZWFDb2RlAQwAAQZBbW91bnQBBgABD1NlYXRzQWxsb2NhdGlvbgEGAAAAGP-CAQRUd2luAQRUV0lOAQEyAf4SXAECAA",
            "id": "Twin",
            "type": "",
            "name": "TWIN",
            "purchaseAmount": 47,
            "bookingAmount": 1,
            "seatsAllocation": 2
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
