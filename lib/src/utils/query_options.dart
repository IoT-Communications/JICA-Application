import 'package:graphql_flutter/graphql_flutter.dart';

QueryOptions customQueryOptions({
  String query,
  Map<String, dynamic> variables,
}) {
  return QueryOptions(
    document: gql(query),
    fetchPolicy: FetchPolicy.cacheAndNetwork,
    variables: variables,
  );
}

QueryOptions customWatchQueryOptions({
  String query,
  Map<String, dynamic> variables = const {},
}) {
  return WatchQueryOptions(
    document: gql(query),
    variables: variables,
    eagerlyFetchResults: true,
    fetchResults: true,
    fetchPolicy: FetchPolicy.cacheAndNetwork,
    pollInterval: Duration(seconds: 15),
  );
}
