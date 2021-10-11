import 'package:graphql/client.dart';
import 'package:jica/src/utils/config/graphql_client_api_config.dart';

class BaseGraphqlRepository {
  // ignore: close_sink
  GraphQLClient client;

  BaseGraphqlRepository() {
    client = GraphQLClientApiConfig().client;
  }

  // static final BaseGraphqlRepository _singleton =
  //     BaseGraphqlRepository._internal();

  // factory BaseGraphqlRepository() {
  //   return _singleton;
  // }

  // BaseGraphqlRepository._internal() {
  //   client = GraphQLClientApiConfig().client;
  // }

  Future<QueryResult> runQuery(QueryOptions options) async {
    return await client.query(options);
  }

  Future<QueryResult> runMutate(MutationOptions options) async {
    return await client.mutate(options);
  }

  ObservableQuery runWatchQuery(WatchQueryOptions options) {
    return client.watchQuery(options);
  }

  Stream<QueryResult> runSubscription(SubscriptionOptions options) {
    return client.subscribe(options);
  }
}
