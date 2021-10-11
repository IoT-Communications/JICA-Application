import 'package:graphql_flutter/graphql_flutter.dart';

SubscriptionOptions subscriptionOptions(
  String query,
  String operationName,
  Map<String, dynamic> variables,
) {
  return SubscriptionOptions(
    document: gql(query),
    operationName: operationName,
    variables: variables,
  );
}
