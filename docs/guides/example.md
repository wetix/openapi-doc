---
sidebar_label: "Examples"
sidebar_position: 2
---

# Examples

## Getting Cinemas

<img src="/img/cinemas.jpeg" width="200"/>

#### Sample GraphQL query:

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
      geopoint{
        latitude
        longitude
      }
    }
    pageInfo{
      startCursor
      endCursor
      hasNextPage
      hasPreviousPage
    }
  }
}
```

#### Sample response:

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

#### Sample GraphQL query:

```
query{
  movies(first:1, onScreenOnly:true){ # set onScreenOnly to false for coming soon movies
    nodes{
      key
      title
      originalTitle
      mainTrailerUrl
      portraitImageUrl
      landscapeImageUrl
      showtimeCount
      genres
      actors{
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
    pageInfo{
      startCursor
      endCursor
      hasNextPage
      hasPreviousPage
    }
  }
}
```

#### Sample response:

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

#### Sample GraphQL query:

```
query {
  movie(key: "EgVNb3ZpZRiT6SwqDhIGT3JpZ2luIgRUTURC") {
    title
    genres
    cinemas(first: 10) {
      nodes {
        name
        showtimes(first: 100, date: "2021-08-10", activeOnly: true) {
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

#### Sample GraphQL Response:

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

#### Sample GraphQL query:

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

#### Sample GraphQL Response:

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
