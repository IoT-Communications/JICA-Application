import 'package:jica/src/api/graphql/operations/query/device_location_query.dart';
import 'package:jica/src/services/bloc/base_graphql_bloc.dart';
import 'package:jica/src/utils/debugBro.dart';
import 'package:jica/src/utils/query_options.dart';

class DeviceBloc extends BaseGraphqlBloc<Map<String, dynamic>> {
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

  void getBatteryInfo(String deviceID) {
    _getDeviceInfo(
        deviceID: deviceID, queryString: deviceBatteryInformationQuery);
  }

  void getHealthInfo(String deviceID) {
    _getDeviceInfo(
        deviceID: deviceID, queryString: deviceHealthInformationQuery);
  }

  void getTemperatureInfo(String deviceID) {
    _getDeviceInfo(deviceID: deviceID, queryString: deviceTempInformationQuery);
  }

  void getAlarmInfo(String deviceID) {
    _getDeviceInfo(
        deviceID: deviceID, queryString: deviceAlarmInformationQuery);
  }

  void _getDeviceInfo({String deviceID, String queryString}) {
    Map<String, dynamic> payload = {
      'deviceID': deviceID,
    };
    logger.e(payload);
    add(
      GraphqlQueryEvent(
        options: customQueryOptions(query: queryString, variables: payload),
        data: payload,
      ),
    );
  }
}
