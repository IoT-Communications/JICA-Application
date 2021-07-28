// part of 'validator.dart';

// class AuthValidator {
//   static String validator({String label, String value}) {
//     value = value?.trim();
//     if (value == null || value.isEmpty) {
//       return '$label is required'.titleCase;
//     }
//     return null;
//   }

//   static String phoneValidator({String label, String value}) {
//     String isEmpty = validator(label: label, value: value);
//     if (isEmpty != null) return isEmpty;
//     return phoneRegexValidator(value);
//   }

//   static String emailValidator({String label, String value}) {
//     String isEmpty = validator(label: label, value: value);
//     if (isEmpty != null) return isEmpty;
//     return emailRegexValidator(value);
//   }

//   static String passwordValidator({String label, String value}) {
//     String isEmpty = validator(label: label, value: value);
//     if (isEmpty != null) return isEmpty;
//     if (value.length < 8) {
//       return kShortPassError.titleCase;
//     } else
//       return null;
//   }

//   static String confirmPasswordValidator({
//     String label,
//     String password,
//     String confirmPassword,
//   }) {
//     String isEmpty = validator(label: label, value: confirmPassword);
//     if (isEmpty != null) return isEmpty;
//     if (confirmPassword.length < 8)
//       return kShortPassError;
//     else if (password != confirmPassword)
//       return kMatchPassError.titleCase;
//     else
//       return null;
//   }

//   static String emailOrPhoneValidator({String label, String value}) {
//     value = value.trim();
//     String isEmpty = validator(label: label, value: value);
//     if (isEmpty != null) return isEmpty;
//     String email = emailRegexValidator(value);
//     String phone = phoneRegexValidator(value);
//     if (email != null && phone != null)
//       return kEmailOrPhoneNullError.titleCase;
//     else if (phone != null)
//       return phone;
//     else if (email != null)
//       return email;
//     else
//       return null;
//   }

//   static String validateNumber(String number) {
//     RegExp regexDigit = new RegExp(patternDigit);
//     if (regexDigit.hasMatch(number)) {
//       return null;
//     }
//     return kNumberNullError.titleCase;
//   }
// }
