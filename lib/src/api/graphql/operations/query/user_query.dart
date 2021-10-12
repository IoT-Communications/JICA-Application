String signInQuery = """
query login(\$email:String!, \$password:String!, \$fcmToken:String!){
  login(email:\$email,password:\$password, fcmToken:\$fcmToken){
    error{
      path
      message
    }
    token
  }
}
""";

String me = """
query me{
  me{
    id
    username
    email
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
