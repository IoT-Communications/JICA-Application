String getCommentReplies = """
query getCommentReplies(\$commentId){
  getCommentReplies(commentId: \$commentId){
    id
    reply
    createdAt
    updatedAt
    author{
      id
      name
      email
      profile{
        id
        photo
        username
      }
    }
  }
}
""";
String getComments = """
query comments(\$postId: String!, \$after: String){
  comments(postId: \$postId, after:\$after){
    cursor
    hasMore
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
  }
}
""";

String countLikes = """
query countLikes(\$postId: String){
  countLikes(postId: \$postId)
}
""";

String suggestFriendQuery = """
query suggestFriend(\$postId: String!, \$username: String!){
  suggestFriend(postId: \$postId, username: \$username){
    id
    name
    surname
    profile{
      id
      username
      photo
    }
  }
}
""";
