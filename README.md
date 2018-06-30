# Project for testing GraphQL on Rails app

This project implements a GraphQL server for a Hackernews clone that has the following features:

- show a list of links
- authentication system
- users can create new links
- users can vote for links

## Queries

Open GraphQL IDE : /graphiql

1. Get all links

```
query {
  allLinks{
    id
    url
    description
  }
}
```

2. Create a link

```
mutation {
  createLink(
    url: "URL",
    description: "DESCRIPTION"
  ) {
    id
    url
    description
  }
}
```

3. Create an user

```
mutation{
  createUser(
    name: "USER"
    authProvider: {
      email: {
       email: "EMAIL",
       password: "PASSWORD"
      }
    }
  ) {
    id
    name
    email
  }
}
```

4. Sign in

```
mutation{
  signinUser(
    email: {
      email: "EMAIL",
      password: "PASSWORD"
    }
  ){
    token
    user{
      id
    }
  }
}
```

5. Attach link to user

Need to run a Sign in mutation before

```
mutation{
  createLink(
    url: "LINK",
    description: "DESCRIPTION"
  ) {
    id
    url
    description
    postedBy {
      id
      name
    }
  }
}
``` 

6. Attach link to user and vote

Need to run a Sign in mutation before

```
mutation{
  createVote(linkId:"3"){
    link {
      description
    }
    user {
      name
    }
  }
}
```

7. Get all votes for links

```
query {
  allLinks{
    votes{
      id
    }
  }
}
```

8. Get all votes for users

```
query {
  allLinks{
    id
    postedBy{
      id
      name
    }
    votes{
      link{
        description
      }
    }
  }
}
```

9. Search

```
query{
  allLinks(filter: {description_contains: "TERM"}){
    id
    description
  }
}
``` 

With an operator : 

```
query{
  allLinks(filter: {
    description_contains: "TERM"
    OR: {
      description_contains: "TERM"
    }
  }){
    id
    description
  }
}
```

10. Update link description

```
mutation{
  UpdateLinkDescription(linkId:"linkID", description:"NEW_DESCRIPTION"){
    id
    description
  }
}
```

11. Destroy link

```
mutation{
  destroyLink(linkId:"linkID"){
    id
    description
  }
}
```

