String subPosts = """
    subscription posts{
      posts{
        data{
          id
          content
          visible
          file
          fileType
          createdAt
          updatedAt
          author{
            id
            name
            followers{
              id
            }
            profile{
              id
              username
              photo
            }
          }
          comments{
            id
            createdAt
            updatedAt
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
        message
      }
    }
""";
String subPost = """
    subscription post(\$id: String!){
      post(id: \$id){
        data{
          id
          content
          visible
          file
          fileType
          createdAt
          updatedAt
          author{
            id
            name
            followers{
              id
            }
            profile{
              id
              username
              photo
            }
          }
          comments{
            id
            description
            picture
            replies{
              id
              description
              picture
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
            reactions{
              id
              name
              author{
                id
                name
                profile{
                  id
                  username
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
            createdAt
            updatedAt
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
        message
      }
    }
""";

String fetchUsers = """
  subscription fetchOnlineUsers {
  online_users {
    user {
      name
    }
  }
  """;

String communitySub = """
    subscription community(\$id:String!){
      community(id: \$id) {
        data{
          id
          content
          visible
          file
          fileType
          createdAt
          updatedAt
          author{
            id
            name
            followers{
              id
            }
            profile{
              id
              username
              photo
            }
          }
          comments{
            id
            description
            picture
            replies{
              id
              description
              picture
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
            reactions{
              id
              name
              author{
                id
                name
                profile{
                  id
                  username
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
            createdAt
            updatedAt
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
        message
    }
 }
  """;

String fetchComment = """
    subscription comment(\$postId:String!){
      comment(postId:\$postId){
        data {
          id
          text
          createdAt
          updatedAt
          author{
            id
            name
            email
          }
        }
        message
      }
    }
  """;

String reactions = """
  subscription reactions(\$postId:String!){
      reactions(postId:\$postId){
        data {
          id
          reaction
          user{
            id
            name
            email
          }
        }
        message
      }
    }
  """;

String fetchReply = """
    subscription reply(\$commentId:String!){
      reply(commentId:\$commentId){
        data {
          id
          reply
          createdAt
          updatedAt
          author{
            id
            name
          }
        }
        message
      }
    }
  """;
