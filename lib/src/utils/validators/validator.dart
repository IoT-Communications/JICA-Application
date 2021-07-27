// import 'package:jica/src/utils/custom_regex_pattern.dart';
// import 'package:jica/src/utils/constants.dart';
// import 'package:recase/recase.dart';

// part 'auth_validator.dart';

// String emailRegexValidator(String email) {
//   RegExp regexEmail = new RegExp(patternEmail);
//   RegExp regexDigit = new RegExp(patternDigit);
//   if (regexEmail.hasMatch(email.trim()))
//     return null;
//   else if (!regexDigit.hasMatch(email)) {
//     return kInvalidEmailError.titleCase;
//   }
//   return null;
// }

// String phoneRegexValidator(String phoneNumber) {
//   phoneNumber = phoneNumber.split(' ').join('');
//   RegExp regexPhone = new RegExp(patternPhone);
//   RegExp regexDigit = new RegExp(patternDigit);

//   if (regexDigit.hasMatch(phoneNumber)) {
//     if (regexPhone.hasMatch(phoneNumber))
//       return null;
//     else
//       return kPhoneNumberNullError.titleCase;
//   }
//   return null;
// }
