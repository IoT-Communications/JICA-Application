// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:plug/src/api/repository/base_repository.dart';
// import 'package:plug/src/api/graphql/operations/query/user_query.dart';
// import 'package:plug/src/utils/query_options.dart';

// class UserNameFieldValidator extends FormBloc<String, String> {
//   bool isValid = false;
//   final username = TextFieldBloc(
//     validators: [
//       FieldBlocValidators.required,
//       _min4Char,
//     ],
//   );

//   UserNameFieldValidator() {
//     addFieldBlocs(fieldBlocs: [username]);

//     username.addAsyncValidators(
//       [_checkUsername],
//     );
//   }

//   static String _min4Char(String username) {
//     if (username.trim().length < 3) {
//       return 'The username must have at least 3 characters';
//     }
//     return null;
//   }

//   Future<String> _checkUsername(String username) async {
//     bool exist = false;
//     BaseGraphqlRepository repository = BaseGraphqlRepository();
//     Map<String, dynamic> vars = {'username': username};
//     QueryResult result = await repository.runQuery(
//       customQueryOptions(query: checkUserName, variables: vars),
//     );
//     if (result.data['checkUsername'] != null &&
//         result.data['checkUsername']['message'] != null) {
//       exist = true;
//     }

//     if (exist) {
//       isValid = false;
//       return 'That username is already taken';
//     }
//     isValid = true;
//     return null;
//   }

//   @override
//   void onSubmitting() async {
//     print(username.value);
//   }
// }
