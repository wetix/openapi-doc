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
      censorship
      plot
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
          "originalTitle": "怪物先生",
          "censorship": "18",
          "plot": "Some strange things have always existed, you think it is a coincidence, or make up a reason to make it reasonable, in fact, because you do not want to admit. At the end of the season, she was regarded as an outlier because she could see monsters, until one day she saw monsters again in the supermarket where she worked and magically met Monster Hunter-Brother Meng. She discovered that there really were monsters in the world, and the two young men were involved in a new storm.",
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
    showtimeDates
    cinemas(first: 10) {
      nodes {
        name
        showtimes(first: 100, date: "2022-05-23") {
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
      "showtimeDates": [
        "2022-05-23",
        "2022-05-24",
        "2022-05-25",
        "2022-05-26",
        "2022-05-27",
        "2022-05-28",
        "2022-05-29",
        "2022-05-30",
        "2022-05-31"
      ],
      "cinemas": {
        "nodes": [
          {
            "name": "GSC Paradigm Mall (Petaling Jaya)",
            "showtimes": {
              "nodes": [
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODQyMTMqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D JIN GASTROBAR AFTER DARK"
                  },
                  "screenAt": "2022-05-23T13:45:00Z",
                  "date": "2022-05-23",
                  "time": "09:45PM",
                  "isValid": true
                }
              ]
            }
          },
          {
            "name": "GSC 1 Utama",
            "showtimes": {
              "nodes": [
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODE1NDgqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D"
                  },
                  "screenAt": "2022-05-23T08:15:00Z",
                  "date": "2022-05-23",
                  "time": "04:15PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODE1NDMqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "STANDARD"
                  },
                  "screenAt": "2022-05-23T08:30:00Z",
                  "date": "2022-05-23",
                  "time": "04:30PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODE1NTUqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ5KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "4DX"
                  },
                  "screenAt": "2022-05-23T09:00:00Z",
                  "date": "2022-05-23",
                  "time": "05:00PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODE1NDUqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D"
                  },
                  "screenAt": "2022-05-23T10:00:00Z",
                  "date": "2022-05-23",
                  "time": "06:00PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODE1MzUqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "STANDARD"
                  },
                  "screenAt": "2022-05-23T10:35:00Z",
                  "date": "2022-05-23",
                  "time": "06:35PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODE1NDIqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D"
                  },
                  "screenAt": "2022-05-23T11:55:00Z",
                  "date": "2022-05-23",
                  "time": "07:55PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODE1MzkqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDQ1KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "STANDARD"
                  },
                  "screenAt": "2022-05-23T12:20:00Z",
                  "date": "2022-05-23",
                  "time": "08:20PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODE1NDcqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D"
                  },
                  "screenAt": "2022-05-23T12:55:00Z",
                  "date": "2022-05-23",
                  "time": "08:55PM",
                  "isValid": true
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODE1MzQqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D"
                  },
                  "screenAt": "2022-05-23T14:15:00Z",
                  "date": "2022-05-23",
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
        showtimeDates
        showtimes(first: 100, date: "2022-05-23") {
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
            "key": "EgVNb3ZpZRiT6SwqDhIGT3JpZ2luIgRUTURC",
            "title": "MONSTER RUN",
            "genres": [
              "Action",
              "Fantasy"
            ],
            "showtimeDates": [
              "2022-05-23",
              "2022-05-24",
              "2022-05-25",
              "2022-05-26",
              "2022-05-27",
              "2022-05-28",
              "2022-05-29"
            ],
            "showtimes": {
              "nodes": [
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODQyMTMqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUyKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "3D JIN GASTROBAR AFTER DARK"
                  },
                  "date": "2022-05-23",
                  "time": "09:45PM",
                  "screenAt": "2022-05-23T13:45:00Z"
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
            "showtimeDates": [
              "2022-05-23",
              "2022-05-24",
              "2022-05-25",
              "2022-05-26",
              "2022-05-27",
              "2022-05-28",
              "2022-05-29"
            ],
            "showtimes": {
              "nodes": [
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODQyNTcqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PREMIERE CLASS"
                  },
                  "date": "2022-05-23",
                  "time": "05:15PM",
                  "screenAt": "2022-05-23T09:15:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODQxMDMqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "GETHA LUX SUITE"
                  },
                  "date": "2022-05-23",
                  "time": "06:20PM",
                  "screenAt": "2022-05-23T10:20:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODQxODAqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUxKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "4DX"
                  },
                  "date": "2022-05-23",
                  "time": "06:45PM",
                  "screenAt": "2022-05-23T10:45:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODQyNDYqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PREMIERE CLASS"
                  },
                  "date": "2022-05-23",
                  "time": "07:50PM",
                  "screenAt": "2022-05-23T11:50:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODQwOTIqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "GETHA LUX SUITE"
                  },
                  "date": "2022-05-23",
                  "time": "08:50PM",
                  "screenAt": "2022-05-23T12:50:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODQxNjkqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUxKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "4DX"
                  },
                  "date": "2022-05-23",
                  "time": "09:15PM",
                  "screenAt": "2022-05-23T13:15:00Z"
                },
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODQxMjUqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDUwKhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "PLAY+"
                  },
                  "date": "2022-05-23",
                  "time": "09:45PM",
                  "screenAt": "2022-05-23T13:45:00Z"
                }
              ]
            }
          },
          {
            "key": "EgVNb3ZpZRiQpBIqDhIGT3JpZ2luIgRUTURC",
            "title": "AVENGERS: INFINITY WAR",
            "genres": [
              "Action",
              "Superhero"
            ],
            "showtimeDates": [
              "2022-05-23",
              "2022-05-24",
              "2022-05-25",
              "2022-05-26",
              "2022-05-27",
              "2022-05-28",
              "2022-05-29"
            ],
            "showtimes": {
              "nodes": [
                {
                  "key": "Eg1Nb3ZpZVNob3d0aW1lIgYxODQxOTEqNBIPTW92aWVDb2xsZWN0aW9uIgoxMDAwMDAwMDU2KhUSDkNpbmVtYU9wZXJhdG9yIgNHU0M",
                  "hall": {
                    "type": "STANDARD"
                  },
                  "date": "2022-05-23",
                  "time": "03:50PM",
                  "screenAt": "2022-05-23T07:50:00Z"
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
            type
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
   "data":{
      "createMovieOrderSession":{
         "session":{
            "key":"EhFNb3ZpZU9yZGVyU2Vzc2lvbiIbMjlZWXZRZkdLS1ZDczFpSFU1Sm9EQUVhZm4w",
            "seatLayout":{
               "totalRow":15,
               "totalColumn":13,
               "twoDimensionView":[
                  {
                     "label":"",
                     "seats":[
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
                     "label":"",
                     "seats":[
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
                     "label":"",
                     "seats":[
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
                     "label":"K",
                     "seats":[
                        null,
                        null,
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzIzAQhCRUFOX0JBRwEBQgEDSzAxAQIxMQIDAQIBAgA",
                           "type":"BEAN_BAG",
                           "label":"K01",
                           "allocation":1,
                           "x":2,
                           "y":3,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzMzAQhCRUFOX0JBRwEBQgEDSzAyAQIxMQIDAQMBAgA",
                           "type":"BEAN_BAG",
                           "label":"K02",
                           "allocation":1,
                           "x":3,
                           "y":3,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzQzAQhCRUFOX0JBRwEBQgEDSzAzAQIxMQIDAQQBAgA",
                           "type":"BEAN_BAG",
                           "label":"K03",
                           "allocation":1,
                           "x":4,
                           "y":3,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzUzAQhCRUFOX0JBRwEBQgEDSzA0AQIxMQIDAQUBAgA",
                           "type":"BEAN_BAG",
                           "label":"K04",
                           "allocation":1,
                           "x":5,
                           "y":3,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzYzAQhCRUFOX0JBRwEBQgEDSzA1AQIxMQIDAQYBAgA",
                           "type":"BEAN_BAG",
                           "label":"K05",
                           "allocation":1,
                           "x":6,
                           "y":3,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzczAQhCRUFOX0JBRwEBQgEDSzA2AQIxMQIDAQcBAgA",
                           "type":"BEAN_BAG",
                           "label":"K06",
                           "allocation":1,
                           "x":7,
                           "y":3,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzgzAQhCRUFOX0JBRwEBQgEDSzA3AQIxMQIDAQgBAgA",
                           "type":"BEAN_BAG",
                           "label":"K07",
                           "allocation":1,
                           "x":8,
                           "y":3,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDMzkzAQhCRUFOX0JBRwEBQgEDSzA4AQIxMQIDAQkBAgA",
                           "type":"BEAN_BAG",
                           "label":"K08",
                           "allocation":1,
                           "x":9,
                           "y":3,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEEMzEwMwEIQkVBTl9CQUcBAUIBA0swOQECMTECAwEKAQIA",
                           "type":"BEAN_BAG",
                           "label":"K09",
                           "allocation":1,
                           "x":10,
                           "y":3,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEEMzExMwEIQkVBTl9CQUcBAUIBA0sxMAECMTECAwELAQIA",
                           "type":"BEAN_BAG",
                           "label":"K10",
                           "allocation":1,
                           "x":11,
                           "y":3,
                           "status":"AVAILABLE"
                        },
                        null
                     ]
                  },
                  {
                     "label":"J",
                     "seats":[
                        null,
                        null,
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDI0AQhCRUFOX0JBRwEBQgEDSjAxAQIxMQIEAQIBAgA",
                           "type":"BEAN_BAG",
                           "label":"J01",
                           "allocation":1,
                           "x":2,
                           "y":4,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDM0AQhCRUFOX0JBRwEBQgEDSjAyAQIxMQIEAQMBAgA",
                           "type":"BEAN_BAG",
                           "label":"J02",
                           "allocation":1,
                           "x":3,
                           "y":4,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDQ0AQhCRUFOX0JBRwEBQgEDSjAzAQIxMQIEAQQBAgA",
                           "type":"BEAN_BAG",
                           "label":"J03",
                           "allocation":1,
                           "x":4,
                           "y":4,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDU0AQhCRUFOX0JBRwEBQgEDSjA0AQIxMQIEAQUBAgA",
                           "type":"BEAN_BAG",
                           "label":"J04",
                           "allocation":1,
                           "x":5,
                           "y":4,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDY0AQhCRUFOX0JBRwEBQgEDSjA1AQIxMQIEAQYBAgA",
                           "type":"BEAN_BAG",
                           "label":"J05",
                           "allocation":1,
                           "x":6,
                           "y":4,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDc0AQhCRUFOX0JBRwEBQgEDSjA2AQIxMQIEAQcBAgA",
                           "type":"BEAN_BAG",
                           "label":"J06",
                           "allocation":1,
                           "x":7,
                           "y":4,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDg0AQhCRUFOX0JBRwEBQgEDSjA3AQIxMQIEAQgBAgA",
                           "type":"BEAN_BAG",
                           "label":"J07",
                           "allocation":1,
                           "x":8,
                           "y":4,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNDk0AQhCRUFOX0JBRwEBQgEDSjA4AQIxMQIEAQkBAgA",
                           "type":"BEAN_BAG",
                           "label":"J08",
                           "allocation":1,
                           "x":9,
                           "y":4,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENDEwNAEIQkVBTl9CQUcBAUIBA0owOQECMTECBAEKAQIA",
                           "type":"BEAN_BAG",
                           "label":"J09",
                           "allocation":1,
                           "x":10,
                           "y":4,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENDExNAEIQkVBTl9CQUcBAUIBA0oxMAECMTECBAELAQIA",
                           "type":"BEAN_BAG",
                           "label":"J10",
                           "allocation":1,
                           "x":11,
                           "y":4,
                           "status":"AVAILABLE"
                        },
                        null
                     ]
                  },
                  {
                     "label":"H",
                     "seats":[
                        null,
                        null,
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTI1AQhCRUFOX0JBRwEBQgEDSDAxAQIxMQIFAQIBAgA",
                           "type":"BEAN_BAG",
                           "label":"H01",
                           "allocation":1,
                           "x":2,
                           "y":5,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTM1AQhCRUFOX0JBRwEBQgEDSDAyAQIxMQIFAQMBAgA",
                           "type":"BEAN_BAG",
                           "label":"H02",
                           "allocation":1,
                           "x":3,
                           "y":5,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTQ1AQhCRUFOX0JBRwEBQgEDSDAzAQIxMQIFAQQBAgA",
                           "type":"BEAN_BAG",
                           "label":"H03",
                           "allocation":1,
                           "x":4,
                           "y":5,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTU1AQhCRUFOX0JBRwEBQgEDSDA0AQIxMQIFAQUBAgA",
                           "type":"BEAN_BAG",
                           "label":"H04",
                           "allocation":1,
                           "x":5,
                           "y":5,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTY1AQhCRUFOX0JBRwEBQgEDSDA1AQIxMQIFAQYBAgA",
                           "type":"BEAN_BAG",
                           "label":"H05",
                           "allocation":1,
                           "x":6,
                           "y":5,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTc1AQhCRUFOX0JBRwEBQgEDSDA2AQIxMQIFAQcBAgA",
                           "type":"BEAN_BAG",
                           "label":"H06",
                           "allocation":1,
                           "x":7,
                           "y":5,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTg1AQhCRUFOX0JBRwEBQgEDSDA3AQIxMQIFAQgBAgA",
                           "type":"BEAN_BAG",
                           "label":"H07",
                           "allocation":1,
                           "x":8,
                           "y":5,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACT_ggEDNTk1AQhCRUFOX0JBRwEBQgEDSDA4AQIxMQIFAQkBAgA",
                           "type":"BEAN_BAG",
                           "label":"H08",
                           "allocation":1,
                           "x":9,
                           "y":5,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENTEwNQEIQkVBTl9CQUcBAUIBA0gwOQECMTECBQEKAQIA",
                           "type":"BEAN_BAG",
                           "label":"H09",
                           "allocation":1,
                           "x":10,
                           "y":5,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEENTExNQEIQkVBTl9CQUcBAUIBA0gxMAECMTECBQELAQIA",
                           "type":"BEAN_BAG",
                           "label":"H10",
                           "allocation":1,
                           "x":11,
                           "y":5,
                           "status":"AVAILABLE"
                        },
                        null
                     ]
                  },
                  {
                     "label":"G",
                     "seats":[
                        null,
                        null,
                        null,
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjM2AQxDVURETEVfQ09BQ0gBAUMBA0cwMQECMTACBgEDAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"G01",
                           "allocation":4,
                           "x":3,
                           "y":6,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjQ2AQxDVURETEVfQ09BQ0gBAUMBA0cwMgECMTACBgEEAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"G02",
                           "allocation":4,
                           "x":4,
                           "y":6,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjU2AQxDVURETEVfQ09BQ0gBAUMBA0cwMwECMTACBgEFAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"G03",
                           "allocation":4,
                           "x":5,
                           "y":6,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjY2AQxDVURETEVfQ09BQ0gBAUMBA0cwNAECMTACBgEGAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"G04",
                           "allocation":4,
                           "x":6,
                           "y":6,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjc2AQxDVURETEVfQ09BQ0gBAUMBA0cwNQECMTACBgEHAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"G05",
                           "allocation":4,
                           "x":7,
                           "y":6,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjg2AQxDVURETEVfQ09BQ0gBAUMBA0cwNgECMTACBgEIAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"G06",
                           "allocation":4,
                           "x":8,
                           "y":6,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNjk2AQxDVURETEVfQ09BQ0gBAUMBA0cwNwECMTACBgEJAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"G07",
                           "allocation":4,
                           "x":9,
                           "y":6,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEENjEwNgEMQ1VERExFX0NPQUNIAQFDAQNHMDgBAjEwAgYBCgEIAA",
                           "type":"CUDDLE_COACH",
                           "label":"G08",
                           "allocation":4,
                           "x":10,
                           "y":6,
                           "status":"AVAILABLE"
                        },
                        null,
                        null
                     ]
                  },
                  {
                     "label":"F",
                     "seats":[
                        null,
                        null,
                        null,
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzM3AQxDVURETEVfQ09BQ0gBAUMBA0YwMQECMTACBwEDAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"F01",
                           "allocation":4,
                           "x":3,
                           "y":7,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzQ3AQxDVURETEVfQ09BQ0gBAUMBA0YwMgECMTACBwEEAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"F02",
                           "allocation":4,
                           "x":4,
                           "y":7,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzU3AQxDVURETEVfQ09BQ0gBAUMBA0YwMwECMTACBwEFAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"F03",
                           "allocation":4,
                           "x":5,
                           "y":7,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzY3AQxDVURETEVfQ09BQ0gBAUMBA0YwNAECMTACBwEGAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"F04",
                           "allocation":4,
                           "x":6,
                           "y":7,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzc3AQxDVURETEVfQ09BQ0gBAUMBA0YwNQECMTACBwEHAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"F05",
                           "allocation":4,
                           "x":7,
                           "y":7,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzg3AQxDVURETEVfQ09BQ0gBAUMBA0YwNgECMTACBwEIAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"F06",
                           "allocation":4,
                           "x":8,
                           "y":7,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDNzk3AQxDVURETEVfQ09BQ0gBAUMBA0YwNwECMTACBwEJAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"F07",
                           "allocation":4,
                           "x":9,
                           "y":7,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEENzEwNwEMQ1VERExFX0NPQUNIAQFDAQNGMDgBAjEwAgcBCgEIAA",
                           "type":"CUDDLE_COACH",
                           "label":"F08",
                           "allocation":4,
                           "x":10,
                           "y":7,
                           "status":"AVAILABLE"
                        },
                        null,
                        null
                     ]
                  },
                  {
                     "label":"E",
                     "seats":[
                        null,
                        null,
                        null,
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODM4AQxDVURETEVfQ09BQ0gBAUMBA0UwMQECMTACCAEDAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"E01",
                           "allocation":4,
                           "x":3,
                           "y":8,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODQ4AQxDVURETEVfQ09BQ0gBAUMBA0UwMgECMTACCAEEAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"E02",
                           "allocation":4,
                           "x":4,
                           "y":8,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODU4AQxDVURETEVfQ09BQ0gBAUMBA0UwMwECMTACCAEFAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"E03",
                           "allocation":4,
                           "x":5,
                           "y":8,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODY4AQxDVURETEVfQ09BQ0gBAUMBA0UwNAECMTACCAEGAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"E04",
                           "allocation":4,
                           "x":6,
                           "y":8,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODc4AQxDVURETEVfQ09BQ0gBAUMBA0UwNQECMTACCAEHAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"E05",
                           "allocation":4,
                           "x":7,
                           "y":8,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODg4AQxDVURETEVfQ09BQ0gBAUMBA0UwNgECMTACCAEIAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"E06",
                           "allocation":4,
                           "x":8,
                           "y":8,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACj_ggEDODk4AQxDVURETEVfQ09BQ0gBAUMBA0UwNwECMTACCAEJAQgA",
                           "type":"CUDDLE_COACH",
                           "label":"E07",
                           "allocation":4,
                           "x":9,
                           "y":8,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEEODEwOAEMQ1VERExFX0NPQUNIAQFDAQNFMDgBAjEwAggBCgEIAA",
                           "type":"CUDDLE_COACH",
                           "label":"E08",
                           "allocation":4,
                           "x":10,
                           "y":8,
                           "status":"AVAILABLE"
                        },
                        null,
                        null
                     ]
                  },
                  {
                     "label":"D",
                     "seats":[
                        null,
                        null,
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTI5AQhTVEFOREFSRAEBTgEDRDAxAQExAgkBAgECAA",
                           "type":"STANDARD",
                           "label":"D01",
                           "allocation":1,
                           "x":2,
                           "y":9,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTM5AQhTVEFOREFSRAEBTgEDRDAyAQExAgkBAwECAA",
                           "type":"STANDARD",
                           "label":"D02",
                           "allocation":1,
                           "x":3,
                           "y":9,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTQ5AQhTVEFOREFSRAEBTgEDRDAzAQExAgkBBAECAA",
                           "type":"STANDARD",
                           "label":"D03",
                           "allocation":1,
                           "x":4,
                           "y":9,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTU5AQhTVEFOREFSRAEBTgEDRDA0AQExAgkBBQECAA",
                           "type":"STANDARD",
                           "label":"D04",
                           "allocation":1,
                           "x":5,
                           "y":9,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTY5AQhTVEFOREFSRAEBTgEDRDA1AQExAgkBBgECAA",
                           "type":"STANDARD",
                           "label":"D05",
                           "allocation":1,
                           "x":6,
                           "y":9,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTc5AQhTVEFOREFSRAEBTgEDRDA2AQExAgkBBwECAA",
                           "type":"STANDARD",
                           "label":"D06",
                           "allocation":1,
                           "x":7,
                           "y":9,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTg5AQhTVEFOREFSRAEBTgEDRDA3AQExAgkBCAECAA",
                           "type":"STANDARD",
                           "label":"D07",
                           "allocation":1,
                           "x":8,
                           "y":9,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACP_ggEDOTk5AQhTVEFOREFSRAEBTgEDRDA4AQExAgkBCQECAA",
                           "type":"STANDARD",
                           "label":"D08",
                           "allocation":1,
                           "x":9,
                           "y":9,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEEOTEwOQEFSE9VU0UBAUgBA0QwOQEBNAIJAQoBAgA",
                           "type":"HOUSE",
                           "label":"D09",
                           "allocation":1,
                           "x":10,
                           "y":9,
                           "status":"SOLD"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEEOTExOQEFSE9VU0UBAUgBA0QxMAEBNAIJAQsBAgA",
                           "type":"HOUSE",
                           "label":"D10",
                           "allocation":1,
                           "x":11,
                           "y":9,
                           "status":"SOLD"
                        },
                        null
                     ]
                  },
                  {
                     "label":"C",
                     "seats":[
                        null,
                        null,
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTAyMTABCFNUQU5EQVJEAQFOAQNDMDEBATECCgECAQIA",
                           "type":"STANDARD",
                           "label":"C01",
                           "allocation":1,
                           "x":2,
                           "y":10,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTAzMTABCFNUQU5EQVJEAQFOAQNDMDIBATECCgEDAQIA",
                           "type":"STANDARD",
                           "label":"C02",
                           "allocation":1,
                           "x":3,
                           "y":10,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA0MTABCFNUQU5EQVJEAQFOAQNDMDMBATECCgEEAQIA",
                           "type":"STANDARD",
                           "label":"C03",
                           "allocation":1,
                           "x":4,
                           "y":10,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA1MTABCFNUQU5EQVJEAQFOAQNDMDQBATECCgEFAQIA",
                           "type":"STANDARD",
                           "label":"C04",
                           "allocation":1,
                           "x":5,
                           "y":10,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA2MTABCFNUQU5EQVJEAQFOAQNDMDUBATECCgEGAQIA",
                           "type":"STANDARD",
                           "label":"C05",
                           "allocation":1,
                           "x":6,
                           "y":10,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA3MTABCFNUQU5EQVJEAQFOAQNDMDYBATECCgEHAQIA",
                           "type":"STANDARD",
                           "label":"C06",
                           "allocation":1,
                           "x":7,
                           "y":10,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA4MTABCFNUQU5EQVJEAQFOAQNDMDcBATECCgEIAQIA",
                           "type":"STANDARD",
                           "label":"C07",
                           "allocation":1,
                           "x":8,
                           "y":10,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACX_ggEFMTA5MTABCFNUQU5EQVJEAQFOAQNDMDgBATECCgEJAQIA",
                           "type":"STANDARD",
                           "label":"C08",
                           "allocation":1,
                           "x":9,
                           "y":10,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACb_ggEGMTAxMDEwAQhTVEFOREFSRAEBTgEDQzA5AQExAgoBCgECAA",
                           "type":"STANDARD",
                           "label":"C09",
                           "allocation":1,
                           "x":10,
                           "y":10,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACb_ggEGMTAxMTEwAQhTVEFOREFSRAEBTgEDQzEwAQExAgoBCwECAA",
                           "type":"STANDARD",
                           "label":"C10",
                           "allocation":1,
                           "x":11,
                           "y":10,
                           "status":"AVAILABLE"
                        },
                        null
                     ]
                  },
                  {
                     "label":"B",
                     "seats":[
                        null,
                        null,
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTEyMTEBBFRXSU4BAVQBA0IwMQEBMgILAQIBBAA",
                           "type":"TWIN",
                           "label":"B01",
                           "allocation":2,
                           "x":2,
                           "y":11,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTEzMTEBBFRXSU4BAVQBA0IwMgEBMgILAQMBBAA",
                           "type":"TWIN",
                           "label":"B02",
                           "allocation":2,
                           "x":3,
                           "y":11,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTE0MTEBBFRXSU4BAVQBA0IwMwEBMgILAQQBBAA",
                           "type":"TWIN",
                           "label":"B03",
                           "allocation":2,
                           "x":4,
                           "y":11,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTE1MTEBBFRXSU4BAVQBA0IwNAEBMgILAQUBBAA",
                           "type":"TWIN",
                           "label":"B04",
                           "allocation":2,
                           "x":5,
                           "y":11,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTE2MTEBBFRXSU4BAVQBA0IwNQEBMgILAQYBBAA",
                           "type":"TWIN",
                           "label":"B05",
                           "allocation":2,
                           "x":6,
                           "y":11,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTE3MTEBBFRXSU4BAVQBA0IwNgEBMgILAQcBBAA",
                           "type":"TWIN",
                           "label":"B06",
                           "allocation":2,
                           "x":7,
                           "y":11,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTE4MTEBBFRXSU4BAVQBA0IwNwEBMgILAQgBBAA",
                           "type":"TWIN",
                           "label":"B07",
                           "allocation":2,
                           "x":8,
                           "y":11,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTE5MTEBBFRXSU4BAVQBA0IwOAEBMgILAQkBBAA",
                           "type":"TWIN",
                           "label":"B08",
                           "allocation":2,
                           "x":9,
                           "y":11,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACL_ggEGMTExMDExAQRUV0lOAQFUAQNCMDkBATICCwEKAQQA",
                           "type":"TWIN",
                           "label":"B09",
                           "allocation":2,
                           "x":10,
                           "y":11,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACL_ggEGMTExMTExAQRUV0lOAQFUAQNCMTABATICCwELAQQA",
                           "type":"TWIN",
                           "label":"B10",
                           "allocation":2,
                           "x":11,
                           "y":11,
                           "status":"AVAILABLE"
                        },
                        null
                     ]
                  },
                  {
                     "label":"A",
                     "seats":[
                        null,
                        null,
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTIyMTIBBFRXSU4BAVQBA0EwMQEBMgIMAQIBBAA",
                           "type":"TWIN",
                           "label":"A01",
                           "allocation":2,
                           "x":2,
                           "y":12,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTIzMTIBBFRXSU4BAVQBA0EwMgEBMgIMAQMBBAA",
                           "type":"TWIN",
                           "label":"A02",
                           "allocation":2,
                           "x":3,
                           "y":12,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI0MTIBBFRXSU4BAVQBA0EwMwEBMgIMAQQBBAA",
                           "type":"TWIN",
                           "label":"A03",
                           "allocation":2,
                           "x":4,
                           "y":12,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI1MTIBBFRXSU4BAVQBA0EwNAEBMgIMAQUBBAA",
                           "type":"TWIN",
                           "label":"A04",
                           "allocation":2,
                           "x":5,
                           "y":12,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI2MTIBBFRXSU4BAVQBA0EwNQEBMgIMAQYBBAA",
                           "type":"TWIN",
                           "label":"A05",
                           "allocation":2,
                           "x":6,
                           "y":12,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI3MTIBBFRXSU4BAVQBA0EwNgEBMgIMAQcBBAA",
                           "type":"TWIN",
                           "label":"A06",
                           "allocation":2,
                           "x":7,
                           "y":12,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI4MTIBBFRXSU4BAVQBA0EwNwEBMgIMAQgBBAA",
                           "type":"TWIN",
                           "label":"A07",
                           "allocation":2,
                           "x":8,
                           "y":12,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACH_ggEFMTI5MTIBBFRXSU4BAVQBA0EwOAEBMgIMAQkBBAA",
                           "type":"TWIN",
                           "label":"A08",
                           "allocation":2,
                           "x":9,
                           "y":12,
                           "status":"AVAILABLE"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEGMTIxMDEyAQtXSEVFTF9DSEFJUgEBVwEDQTA5AQEzAgwBCgECAA",
                           "type":"WHEEL_CHAIR",
                           "label":"A09",
                           "allocation":1,
                           "x":10,
                           "y":12,
                           "status":"SOLD"
                        },
                        {
                           "key":"df-BAwEBB2dvYlNlYXQB_4IAAQkBAklEAQwAAQRUeXBlAQwAAQxPcmlnaW5hbFR5cGUBDAABBUxhYmVsAQwAAQhBcmVhQ29kZQEMAAEGQXJlYU5vAQQAAQNSb3cBBgABBkNvbHVtbgEGAAEFQ291bnQBBAAAACn_ggEGMTIxMTEyAQtXSEVFTF9DSEFJUgEBVwEDQTEwAQEzAgwBCwECAA",
                           "type":"WHEEL_CHAIR",
                           "label":"A10",
                           "allocation":1,
                           "x":11,
                           "y":12,
                           "status":"SOLD"
                        },
                        null
                     ]
                  },
                  {
                     "label":"",
                     "seats":[
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
                     "label":"",
                     "seats":[
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
  "signature": {
    "algorithm": "SHA256",
    "timestamp": 1651677084,
    "hash": "kepj367kXj5v+Vtjk+9omjW7T09QcJx3b+xrH0Z+PMITPKbPH9/Ek5H0E6TjC8QJ0zadS1AkEmEAiNf5SvHWw9vSr0IMnVNYJJcMkoUdTUDhWugn4G7BfwTeOyOBtLP1aQpLxQPBayR5QOPdB/snVenL0VUKOWEhrktfhVAyMVE="
  }
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
