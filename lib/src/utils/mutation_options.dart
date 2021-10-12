import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

MutationOptions mutationOptions({
  String query,
  Map<String, dynamic> variables,
}) {
  return MutationOptions(
    document: parseString(query),
    variables: variables,
    fetchPolicy: FetchPolicy.cacheAndNetwork,
  );
}
