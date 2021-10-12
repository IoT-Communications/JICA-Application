import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jica/src/api/graphql/operations/mutation/auth_mutation.dart';
import 'package:jica/src/api/graphql/operations/query/user_query.dart';
import 'package:jica/src/core/models/user.dart';
import 'package:jica/src/services/bloc/base_graphql_bloc.dart';
import 'package:jica/src/utils/debugBro.dart';
import 'package:jica/src/utils/mutation_options.dart';
import 'package:jica/src/utils/query_options.dart';

class AuthenticateBloc extends BaseGraphqlBloc<Map<String, dynamic>> {
  @override
  Map<String, dynamic> parseData(Map<String, dynamic> data) {
    return data;
  }

  void login({
    String email,
    String password,
    String fcmToken,
  }) {
    Map<String, dynamic> variables = {
      'email': email,
      'password': password,
      'fcmToken': fcmToken
    };
    add(GraphqlQueryEvent<Map<String, dynamic>>(
        data: parseData(variables),
        options: customQueryOptions(query: signInQuery, variables: variables)));
  }

  void register({
    String username,
    String email,
    String password,
  }) {
    Map<String, dynamic> variables = {
      'email': email,
      'password': password,
      'username': username,
    };
    add(
      GraphqlMutateEvent<Map<String, dynamic>>(
        options: mutationOptions(
          query: signUpMutation,
          variables: variables,
        ),
        data: parseData(variables),
      ),
    );
  }

  Future<UserModel> getUser(String token) async {
    QueryResult result = await user(customQueryOptions(query: me));
    return _userFromQueryResults(result);
  }

  UserModel _userFromQueryResults(QueryResult result) {
    return result.data != null ? UserModel.fromJson(result.data['me']) : null;
  }

  void verifyUser(String emailOrPhone) {
    Map<String, dynamic> data = {
      'emailOrPhone': emailOrPhone,
    };
    add(GraphqlMutateEvent(
        data: data,
        options: mutationOptions(
          query: verifyEmailOrPhoneMutation,
          variables: data,
        )));
  }

  void resetPassword(String password) {
    Map<String, dynamic> data = {
      'password': password,
    };
    add(GraphqlMutateEvent(
        data: data,
        options:
            mutationOptions(query: resetPasswordMutation, variables: data)));
  }

  void sendVerificationEmail() {
    add(GraphqlMutateEvent(
        data: {},
        options: mutationOptions(
          query: resendEmailVerificationMutation,
        )));
  }

  void validateSmsPin(String otpCode) {
    Map<String, dynamic> data = {
      'pin': otpCode,
    };
    add(GraphqlMutateEvent(
        data: data,
        options: mutationOptions(
          query: confirmVerificationCodeMutation,
          variables: data,
        )));
  }

  void updateUserAuthStatus() {
    add(
      GraphqlMutateEvent(
        data: {},
        options: mutationOptions(
          query: updateAuthStatusMutation,
        ),
      ),
    );
  }

  storeSmsForVerification(String smsCode) {
    Map<String, dynamic> data = {
      'pin': smsCode,
    };
    add(
      GraphqlMutateEvent(
        data: data,
        options: mutationOptions(
          query: storeVerificationCodeMutation,
          variables: data,
        ),
      ),
    );
  }
}
