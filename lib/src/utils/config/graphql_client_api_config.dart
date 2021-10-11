import 'package:graphql/client.dart';
import 'package:hive/hive.dart';
import 'package:jica/src/utils/constants/const.dart';

class GraphQLClientApiConfig {
  GraphQLClient get client => initClient();

  GraphQLClient initClient() {
    //get session vars

    final Box _box = Hive.box(kSession);
    final String _token = _box.get(kToken);

    //create a authentication link
    final AuthLink _authLink = AuthLink(
      getToken: () => _token == null ? null : 'Bearer $_token',
    );

    //create a http link for queries and mutations
    final HttpLink _httpLink = HttpLink(GRAPHQL_ENDPOINT);
    Link link = _authLink.concat(_httpLink);

    //check is sub link is provided
    if (SUBSCRIPTION_ENDPOINT != null) {
      final WebSocketLink websocketLink = WebSocketLink(
        SUBSCRIPTION_ENDPOINT,
        config: SocketClientConfig(
          autoReconnect: true,
          inactivityTimeout: Duration(days: 30),
          delayBetweenReconnectionAttempts: null,
        ),
      );

      //split http requests from subscription request
      link =
          Link.split((request) => request.isSubscription, websocketLink, link);
    }

    //return graphql client
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    );
  }
}
