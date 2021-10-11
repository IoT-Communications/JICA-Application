String updateUserMutation = """
mutation updateUser(\$username: String, \$email: String, \$password: String,){
  updateUser(data:{
    username: \$name,
    email: \$email,
    password: \$password,
  }){
    message
  }
}
""";

String changePasswordMutation = """
mutation changePassword(\$password: String!){
    changePassword(password: \$password){
      message
    }
}
""";
