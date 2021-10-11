part of '../../services/bloc/base_graphql_bloc.dart';

abstract class GraphqlEvent<T> {
  final T data;

  GraphqlEvent({this.data});
}

class GraphqlLoadingEvent<T> extends GraphqlEvent<T> {
  final QueryResult result;

  GraphqlLoadingEvent({@required this.result});
}

class GraphqlErrorEvent<T> extends GraphqlEvent<T> {
  final QueryResult result;
  final List<Exception> error;
  GraphqlErrorEvent({@required this.error, @required this.result});
}

class GraphqlRefetchEvent<T> extends GraphqlEvent<T> {}

class GraphqlMutateEvent<T> extends GraphqlEvent<T> {
  MutationOptions options;
  final T data;
  GraphqlMutateEvent({@required this.options, @required this.data})
      : super(data: data);
}

class GraphqlFetchMoreEvent<T> extends GraphqlEvent<T> {
  final QueryOptions options;

  GraphqlFetchMoreEvent({@required this.options});
}

class GraphqlQueryEvent<T> extends GraphqlEvent<T> {
  QueryOptions options;
  final T data;
  GraphqlQueryEvent({@required this.options, @required this.data})
      : super(data: data);
}

class GraphqlInitialEvent<T> extends GraphqlEvent<T> {
  final T data;
  GraphqlInitialEvent({@required this.data}) : super(data: data);
}
