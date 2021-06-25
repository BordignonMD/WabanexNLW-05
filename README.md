# Wabanex

Wabanex is an API used for training management and monitoring. Through the API it is possible to register users and trainings and list the current training of each user.
This project was developed during NLW #05.

  * [Technologies](#Technologies)
  * [Installation](#Installation)
  * [GraphQL documentation](#GraphQL-documentation)
  * [Requirements](#Requirements)
  * [Phoenix references](#Phoenix-references)
  * [Support](#Support)

## Technologies

This project was developed with the following technologies:

  * [Elixir](https://elixir-lang.org/)
  * [Phoenix](https://phoenixframework.org/)
  * [GraphQL](https://graphql.org/)
  * [PostgreSQL](https://www.postgresql.org/)

## Installation

1. Clone this repository

```
git clone https://github.com/BordignonMD/WabanexNLW-05.git
```

2. Change directory location

```
cd /path/to/wabanexnlw-05
```

3. Install and compile dependencies

```
mix do deps.get, deps.compile
```

4. Create, migrate, and seed the database

```
mix ecto.create
mix ecto.migrate
mix ecto.seed
```

5. Start the server

```
mix phx.server
```

6. Navigate to our application within the browser

```
open http://localhost:4000/graphiql
```

7. Enter and run GraphQL query

```
{
  getUser(id: "0c4ebce0-1fd9-4304-9327-43a95efefe24"){
    email
    name
  }
}
```

8. Run the GraphQL query

```
Control + Enter
```

Note: The GraphQL query is responding with same response but different shape within the GraphiQL browser because Elixir Maps perform no ordering on insertion.

## GraphQL documentation

### Types

```
type: CreateUserInput {
  name: String!,
  email: String!,
  password: String!
}
```

```
type: CreateTrainingInput {
  userId: UUID4!,
  startDate: String!,
  endDate: String!, 
  exercises: [CreateExerciseInput]
}
```

```
type: CreateExerciseInput {
  name: String!,
  protocolDescription: String!,
  repetitions: String!,
  youtubeVideoUrl: String!
}
```

### Schemas

```
type User{
  id: UUID4!,
  name: String!,
  email: String!,
  password: String!,
  training: Training
}
```

```
type Training{
  id: UUID4!,
  startDate: String!,
  endDate: String!,
  exercises: [Exercise]
}
```

```
type Exercise{
  id: UUID4!, 
  name: String!,
  protocolDescription: String!,
  repetitions: String!,
  youtubeVideoUrl: String!
}
```

### Queries

```
{getUser(id: UUID4!): User}
```

### Mutations

```
mutation{createTraining(input: CreateTrainingInput!): Training}
```

```
mutation{createUser(input: CreateUserInput!): User}
```

## Requirements

### Current requirements

  * Create user
  * Create training
  * List current training

### Future requirements

  * Authentication
  * List all trainings
  * List all users
  * Delete user
  * Delete training
  * Update user
  * Update training

## Phoenix references

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Support

Bug reports and feature requests can be filed with the rest for the Phoenix project here:

  * [File Bug Reports and Features](https://github.com/BordignonMD/WabanexNLW-05/issues)