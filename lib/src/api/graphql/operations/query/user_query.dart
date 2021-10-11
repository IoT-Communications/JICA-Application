String me = """
query me{
  me{
    id
    name
    surname
    profile{
      id
      photo
      username
      createdAt
      updatedAt
    }
  }
}
""";

String checkUserName = """
query checkUsername(\$username: String){
  checkUsername(username: \$username){
    message
  }
}
""";

String userPhoto = """
query me{
  me{
    id
    profile{
      id
      photo
    }
  }
}
""";
