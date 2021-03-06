String notificationSub = """
subscription notification(\$userId: String!){
  notification(userId: \$userId){
    id
    title
    body
    read
    author{
      id
      name
      profile{
        id
        username
        photo
      }
    }
    post{
      id
      content
      file
      fileType
      createdAt
      updatedAt
      comments{
        id
      }
      likes{
        id
        author{
          id
          name
          profile{ 
            id
            username
            photo
          }
        }
      }
      author{
        id
        name
        profile{
          id
          username
          photo
        }
      }
      community{
        id
        name
        logo
        members{
          id
          name
        }
        owners{
          id
          name
        }
      }
    }
    createdAt
    updatedAt
  }
}
""";
