import 'package:jica/src/api/graphql/operations/query/device_location_query.dart';
import 'package:jica/src/services/bloc/base_graphql_bloc.dart';
import 'package:jica/src/utils/query_options.dart';

class MapBloc extends BaseGraphqlBloc<Map<String, dynamic>> {
  @override
  Map<String, dynamic> parseData(Map<String, dynamic> data) {
    return data;
  }

  void getDeviceLocations() {
    add(
      GraphqlQueryEvent(
        options: customWatchQueryOptions(query: getDeviceLocationsQuery),
        data: null,
      ),
    );
  }
}
