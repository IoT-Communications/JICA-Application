part of '../services/bloc/base_graphql_bloc.dart';

abstract class GraphqlState<T> {
  final T data;

  const GraphqlState({@required this.data});
}

class GraphqlInitialState<T> extends GraphqlState<T> {}

class GraphqlLoadingState<T> extends GraphqlState<T> {
  final T data;
  GraphqlLoadingState({this.data}) : super(data: data);
}

class GraphqlLoadingStreamState<T> extends GraphqlState<T> {
  GraphqlLoadingStreamState() : super(data: null);
}

class GraphqlErrorState<T> extends GraphqlState<T> {
  final OperationException error;
  final QueryResult result;

  GraphqlErrorState({@required this.error, @required this.result})
      : super(data: null);
}

class GraphqlLoadedState<T> extends GraphqlState<T> {
  final QueryResult result;
  GraphqlLoadedState({@required T data, @required this.result})
      : super(data: data);
}

class GraphqlRefetchState<T> extends GraphqlState<T> {
  final QueryResult result;

  GraphqlRefetchState({@required T data, @required this.result})
      : super(data: data);
}

class GraphqlFetchMoreState<T> extends GraphqlState<T> {
  final QueryResult result;

  GraphqlFetchMoreState({@required T data, @required this.result})
      : super(data: data);
}

class GraphqlLoadedStreamState<T> extends GraphqlState<T> {
  Stream<QueryResult> stream;
  GraphqlLoadedStreamState({@required T data, @required this.stream})
      : super(data: data);
}

class GraphqlLoadedSubState<T> extends GraphqlState<T> {
  Stream<QueryResult> result;
  GraphqlLoadedSubState({@required T data, @required this.result})
      : super(data: data);
}
