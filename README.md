
# Vinyl Chum

Vinyl Chum is a web app I have designed for storing information about personal vinyl record collection. The app was designed using Spring Boot (Java) and MySQL.


## Features

- User login & registration w. bCrypt for security
- Adding, removing and modifying entries in the collection
- Automatic matching and fetching of cover art via Discogs.com API
- External search using queries sent to Discogs.com


## Roadmap

Coming in Q4 of 2022:

- Responsive frontend design
- Adding records directly from the Discogs.com database
- Internal collection search/parsing and pagination
- Internal social network facilitating communication between users
- OAuth implentation
## Contributing

Contributions are always welcome!

1) To get started, make sure set up your application.properties:

spring.datasource.user = ... 
spring.datasource.password = ...

2) Obtain a free API key from Discogs.com:

https://www.discogs.com/settings/developers

3) Add your key to the API_Key variable in the MainController.java

You are all set!