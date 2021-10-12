import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:graphql/client.dart';
import 'package:meta/meta.dart';

import 'package:jica/src/api/repository/base_repository.dart';
import 'package:jica/src/utils/debugBro.dart';
import 'package:jica/src/utils/query_options.dart';
import 'package:jica/src/utils/subscription_options.dart';
part '../../api/graphql/graphql_event.dart';
part '../../providers/graphql_state.dart';

abstract class BaseGraphqlBloc<T>
    extends Bloc<GraphqlEvent<T>, GraphqlState<T>> {
  BaseGraphqlRepository repository = BaseGraphqlRepository();

  BaseGraphqlBloc() : super(GraphqlInitialState<T>());

  T parseData(Map<String, dynamic> data);

  Stream<QueryResult> getSubscriptionStream({
    String query,
    String operationName,
    Map<String, dynamic> variables,
  }) {
    SubscriptionOptions options =
        subscriptionOptions(query, operationName, variables);
    return repository.runSubscription(options);
  }

  ObservableQuery getQueryStream({
    String query,
    Map<String, dynamic> variables = const {},
  }) {
    QueryOptions options =
        customWatchQueryOptions(query: query, variables: variables);
    return repository.runWatchQuery(options);
  }

  GraphqlState<T> get initialState => GraphqlInitialState<T>();

  @override
  Stream<GraphqlState<T>> mapEventToState(GraphqlEvent<T> event) async* {
    try {
      yield GraphqlLoadingState<T>(data: event.data);

      if (event is GraphqlRefetchEvent<T>) {
        yield GraphqlRefetchState<T>(data: state.data, result: null);
      } else if (event is GraphqlQueryEvent<T>) {
        try {
          QueryResult queryResults = await repository.runQuery(event.options);
          if (queryResults.data == null) {
            yield GraphqlErrorState<T>(
                error: queryResults.exception, result: null);
          } else {
            yield GraphqlLoadedState<T>(
                data: parseData(queryResults.data), result: queryResults);
          }
        } on Exception catch (e) {
          yield GraphqlErrorState<T>(error: e, result: null);
          return;
        }
      } else if (event is GraphqlMutateEvent<T>) {
        try {
          QueryResult queryResults = await repository.runMutate(event.options);
          logger.wtf(queryResults.exception);
          if (queryResults.data == null) {
            yield GraphqlErrorState<T>(
                error: queryResults.exception, result: queryResults);
          } else {
            yield GraphqlLoadedState<T>(
                data: parseData(queryResults.data), result: queryResults);
          }
        } on Exception catch (e) {
          yield GraphqlErrorState<T>(error: e, result: null);
          return;
        }
      } else if (event is GraphqlErrorEvent<T>) {
        yield GraphqlErrorState<T>(error: event.error[0], result: null);
      } else if (event is GraphqlFetchMoreEvent<T>) {
        yield GraphqlFetchMoreState<T>(data: state.data, result: null);
      } else if (event is GraphqlInitialEvent) {
        yield GraphqlInitialState<T>();
      }
    } catch (e) {
      yield GraphqlErrorState<T>(error: null, result: null);
      return;
    }
  }

  Future<QueryResult> user(QueryOptions options) async {
    QueryResult userResults = await repository.runQuery(options);
    return userResults;
  }
}
