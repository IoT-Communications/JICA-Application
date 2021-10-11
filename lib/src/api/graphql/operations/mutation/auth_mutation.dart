String signinMutation = """
mutation login(\$email:String!, \$password:String!, \$fcmToken:String!){
  login(email:\$email,password:\$password, fcmToken:\$fcmToken){
    error{
      path
      message
    }
    token
  }
}
""";

String signupMutation = """
mutation register(\$email:String!, \$password:String!,\$username:String!){
  register(email:\$email,password:\$password,username:\$username){
    error{
      path
      message
    }
    token
  }
}
""";

String verifyEmailOrPhoneMutation = """
mutation verifyEmailOrPhone(\$email:String!){
  verifyEmailOrPhone(email: \$email){
    error{
      path
      message
    }
    token
  }
}
""";

String resetPasswordMutation = """
mutation resetPassword(\$password:String!){
  resetPassword(password:\$password){
    error{
      path
      message
    }
    token
  }
}
""";

String resendEmailVerificationMutation = """
mutation resendEmailVerification{
  resendEmailVerification{
    message
  }
}
""";

String confirmVerificationCodeMutation = """
mutation confirmVerificationCode(\$pin:String!){
  confirmVerificationCode(pin:\$pin){
    message
    token
    id
    email
    phone
    status
  }
}
""";

String storeVerificationCodeMutation = """
mutation storeVerificationCode(\$pin:String!){
  storeVerificationCode(pin:\$pin){
    message
  }
}
""";

String updateAuthStatusMutation = """
mutation updateAuthStatus{
  updateAuthStatus{
    message
    token
    id
    email
    phone
    status
  }
}
""";
