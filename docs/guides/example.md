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

## Getting Seat Layout, Ticket Types and Concessions

|                  Seat Layout                   |                  Ticket Types And Concessions                   |
| :--------------------------------------------: | :-------------------------------------------------------------: |
| <img src="/img/seat_layout.jpeg" width="200"/> | <img src="/img/ticket_types_and_concessions.jpeg" width="200"/> |

#### Sample GraphQL mutation:

#### Mutation :

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
            label
            type
            areaNo
            areaCode
            allocation
          }
        }
      }
      tickets{
        id
        name
        type
        purchaseAmount
        bookingAmount
        seatsAllocation
      }
      concessions{
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

#### Variables :

```
{"input": {
 "showtimeKey": "Eg1Nb3ZpZVNob3d0aW1lIgYxNzUxMjAqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ5KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M"
}
}
```

#### Sample GraphQL Response:

```
{
  "data": {
    "createMovieOrderSession": {
      "session": {
        "key": "EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMXhuQWNIOEtIdmZnekJoZGlvMlZBaGd3RmZF",
        "seatLayout": {
          "totalRow": 4,
          "totalColumn": 10,
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
                null
              ]
            },
            {
              "label": "A",
              "seats": [
                null,
                null,
                null,
                {
                  "label": "A01",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "label": "A02",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "label": "A03",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "label": "A04",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                null
              ]
            },
            {
              "label": "B",
              "seats": [
                null,
                null,
                null,
                {
                  "label": "B01",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "label": "B02",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "label": "B03",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "label": "B04",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                null
              ]
            },
            {
              "label": "C",
              "seats": [
                null,
                null,
                null,
                {
                  "label": "C01",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "label": "C02",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                {
                  "label": "C03",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                {
                  "label": "C04",
                  "type": "N",
                  "areaNo": 0,
                  "areaCode": "1",
                  "allocation": 1
                },
                null,
                null
              ]
            }
          ]
        },
        "tickets": [
          {
            "id": "Adult",
            "name": "ADULT",
            "type": "",
            "purchaseAmount": 40,
            "bookingAmount": 0.5,
            "seatsAllocation": 1
          },
          {
            "id": "CABIN",
            "name": "CABIN",
            "type": "",
            "purchaseAmount": 30,
            "bookingAmount": 0.5,
            "seatsAllocation": 1
          },
          {
            "id": "Student",
            "name": "STUDENT",
            "type": "",
            "purchaseAmount": 8,
            "bookingAmount": 0.5,
            "seatsAllocation": 1
          },
          {
            "id": "SUITE",
            "name": "SUITE",
            "type": "",
            "purchaseAmount": 50,
            "bookingAmount": 0.5,
            "seatsAllocation": 1
          }
        ],
        "concessions": [
          {
            "id": "000002",
            "name": "Caramel Popcorn (70z) with 22oz Coke (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000002",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "0000021",
            "name": "Nugget Large (15pcs) with 32oz Coke (ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=0000021",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000003",
            "name": "Caramel Popcorn (70oz) with 22oz Coke (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000003",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000004",
            "name": "Caramel Popcorn (70oz) with 22oz Coke Zero (Ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000004",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000005",
            "name": "Caramel Popcorn (70oz) with 22oz Coke Zero (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000005",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000006",
            "name": "Caramel Popcorn (70oz) with 22oz Sprite (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000006",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000007",
            "name": "Caramel Popcorn (70oz) with 22oz Sprite (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000007",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000008",
            "name": "Caramel Popcorn (70oz) with 22oz Fanta Grape (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000008",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000009",
            "name": "Caramel Popcorn(70oz) with 22oz Fanta Grape(w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000009",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000010",
            "name": "Caramel Popcorn(70oz) with 22oz F.Strawberry (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000010",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000011",
            "name": "Caramel Popcorn(70oz) with 22oz F.Strawberry (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000011",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000012",
            "name": "Caramel Popcorn (70oz) with 22oz M.M. Orange (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000012",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000013",
            "name": "Caramel Popcorn(70oz) with 22oz M.M Orange (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000013",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000014",
            "name": "Caramel Popcorn (70oz) with 22oz M.M Apple (Ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000014",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000015",
            "name": "Caramel Popcorn (70oz) with 22oz M.M Apple (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000015",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000016",
            "name": "Caramel Popcorn(70oz) with 22oz Ice Lemon Tea(ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000016",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000017",
            "name": "Caramel Popcorn (70oz) with 22oz Ice Lemon (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000017",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000018",
            "name": "Caramel Popcorn (70oz) with Mineral Water (Cold)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000018",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000019",
            "name": "Caramel Popcorn (70oz) with Mineral (Room Temp)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000019",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000022",
            "name": "Nugget Large(15pcs) with 32oz Coke(w/ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000022",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000023",
            "name": "Nugget Large(15pcs) with 32oz Coke Zero (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000023",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000024",
            "name": "Nugget Large(15pcs) with 32oz Coke Zero ( w/ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000024",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000025",
            "name": "Nugget Large(15pcs) with 32oz Sprite(ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000025",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000026",
            "name": "Nugget Large(15pcs) with 32 oz Sprite ( w/ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000026",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000027",
            "name": "Nugget Large (15pcs) with 32oz Fanta Grape (ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000027",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000028",
            "name": "Nugget Large(15pcs) with 32oz Fanta Grape (w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000028",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000029",
            "name": "Nugget Large(15pcs) with 32oz F.Strawberry (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000029",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000030",
            "name": "Nugget Large(15pcs) with 32oz F.Strawberry(w/ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000030",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000031",
            "name": "Nugget Large (15pcs) with 32oz M.M.Orange ( ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000031",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000032",
            "name": "Nugget Large(15pcs) with 32oz M.M.Orange(w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000032",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000033",
            "name": "Nugget Large(15pcs) with 32oz M.M. Apple (ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000033",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000034",
            "name": "Nugget Large(15pcs) with 32oz M.M.Apple ( w/ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000034",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000035",
            "name": "Nugget Large(15pcs) with 32oz Ice Lemon Tea(ice )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000035",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000036",
            "name": "Nugget Large(15pcs) with 32oz Ice Lemon Tea(w/ice)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000036",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000037",
            "name": "Nugget Large (15pcs) with Mineral Water - (Cold )",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000037",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "000038",
            "name": "Nugget Large(15pcs) with Mineral Water-(Room Temp)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=000038",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "100007",
            "name": "Test 7 (group type 005)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=100007",
            "purchaseAmount": 45,
            "isSoldOut": false
          },
          {
            "id": "206001",
            "name": "e-Combo 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206001",
            "purchaseAmount": 10.7,
            "isSoldOut": false
          },
          {
            "id": "206002",
            "name": "e-Combo 2 product mix",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206002",
            "purchaseAmount": 10.7,
            "isSoldOut": false
          },
          {
            "id": "206003",
            "name": "Large e-Combo 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206003",
            "purchaseAmount": 13.8,
            "isSoldOut": false
          },
          {
            "id": "206089",
            "name": "Add On RM3 e-Curry Puff",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206089",
            "purchaseAmount": 3,
            "isSoldOut": false
          },
          {
            "id": "222223",
            "name": "Large Coke Combo 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=222223",
            "purchaseAmount": 12,
            "isSoldOut": false
          },
          {
            "id": "222224",
            "name": "Large Spritzer Combo 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=222224",
            "purchaseAmount": 12,
            "isSoldOut": false
          },
          {
            "id": "333334",
            "name": "Nugget Coke Combo",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=333334",
            "purchaseAmount": 16,
            "isSoldOut": false
          },
          {
            "id": "333335",
            "name": "Nugget Spritzer Combo",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=333335",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "900555",
            "name": "M COMBO LL",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900555",
            "purchaseAmount": 18,
            "isSoldOut": false
          },
          {
            "id": "900662",
            "name": "Combo Set 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900662",
            "purchaseAmount": 13.5,
            "isSoldOut": false
          },
          {
            "id": "900666",
            "name": "Combo Set 5",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900666",
            "purchaseAmount": 36.5,
            "isSoldOut": false
          },
          {
            "id": "100008",
            "name": "Test 8 (child)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=100008",
            "purchaseAmount": 50,
            "isSoldOut": false
          },
          {
            "id": "111112",
            "name": "Jumbo popcorn combo spritzer",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=111112",
            "purchaseAmount": 20,
            "isSoldOut": false
          },
          {
            "id": "111113",
            "name": "Jumbo popcorn combo coke",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=111113",
            "purchaseAmount": 24,
            "isSoldOut": false
          },
          {
            "id": "2060001",
            "name": "Hot Dog Parent",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=2060001",
            "purchaseAmount": 11.8,
            "isSoldOut": false
          },
          {
            "id": "206008",
            "name": "Nugget (L) e-Combo 1 Child for Test 3",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206008",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "206010",
            "name": "Nugget (L) e-Combo 2 Child for Test 3",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=206010",
            "purchaseAmount": 15,
            "isSoldOut": false
          },
          {
            "id": "567891",
            "name": "Product Mix Child 1",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567891",
            "purchaseAmount": 4,
            "isSoldOut": false
          },
          {
            "id": "567892",
            "name": "Product Mix Child 2",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567892",
            "purchaseAmount": 7,
            "isSoldOut": false
          },
          {
            "id": "900112",
            "name": "Minions Super Savor Popcorn",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900112",
            "purchaseAmount": 25,
            "isSoldOut": false
          },
          {
            "id": "900664",
            "name": "Combo Set 3",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900664",
            "purchaseAmount": 36.5,
            "isSoldOut": false
          },
          {
            "id": "900673",
            "name": "JUNE COMBO 2",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900673",
            "purchaseAmount": 25,
            "isSoldOut": false
          },
          {
            "id": "900674",
            "name": "JUNE COMBO 3",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900674",
            "purchaseAmount": 25,
            "isSoldOut": false
          },
          {
            "id": "900676",
            "name": "JUNE COMBO 4",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900676",
            "purchaseAmount": 25,
            "isSoldOut": false
          },
          {
            "id": "100004",
            "name": "Test 4 (group type econ)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=100004",
            "purchaseAmount": 30,
            "isSoldOut": false
          },
          {
            "id": "1000206001",
            "name": "Sales Capping (A)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=1000206001",
            "purchaseAmount": 10.7,
            "isSoldOut": false
          },
          {
            "id": "567894",
            "name": "Princess Series - Mulan",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567894",
            "purchaseAmount": 16,
            "isSoldOut": false
          },
          {
            "id": "567895",
            "name": "Princess Series - Elsa",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567895",
            "purchaseAmount": 17,
            "isSoldOut": false
          },
          {
            "id": "567896",
            "name": "Princess Series - Snow White",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567896",
            "purchaseAmount": 18,
            "isSoldOut": false
          },
          {
            "id": "567897",
            "name": "Princess Series - Aladdin",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567897",
            "purchaseAmount": 19,
            "isSoldOut": false
          },
          {
            "id": "567899",
            "name": "Avengers Series - Mulan",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567899",
            "purchaseAmount": 16,
            "isSoldOut": false
          },
          {
            "id": "567900",
            "name": "DC Series - Mulan",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=567900",
            "purchaseAmount": 16,
            "isSoldOut": false
          },
          {
            "id": "900556",
            "name": "M COMBO SPECIAL (NO PARENT)",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900556",
            "purchaseAmount": 22,
            "isSoldOut": false
          },
          {
            "id": "900669",
            "name": "Combo Set 8",
            "imageUrl": "https://stagingepayment.gsc.com.my/ConcessionWs/Service.asmx/GetProductImage?code=900669",
            "purchaseAmount": 13.5,
            "isSoldOut": false
          },
          {
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
