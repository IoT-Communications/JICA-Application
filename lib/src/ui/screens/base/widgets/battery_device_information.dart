import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jica/src/services/bloc/base_graphql_bloc.dart';
import 'package:jica/src/services/bloc/device_bloc.dart';

class BatteryDeviceInformation extends StatelessWidget {
  final String deviceID;

  const BatteryDeviceInformation({Key key, this.deviceID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeviceBloc(),
      child: BlocConsumer<DeviceBloc, GraphqlState>(
        builder: (BuildContext context, GraphqlState state) {
          if (state is GraphqlInitialState) {
            context.read<DeviceBloc>()..getBatteryInfo(deviceID);
          }
          return DataTable(
            columnSpacing: 10,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Voltage',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Level',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'stepNum',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'signalStrength',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Timestamp',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Sarah')),
                  DataCell(Text('19')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Janine')),
                  DataCell(Text('43')),
                  DataCell(Text('Professor')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('William')),
                  DataCell(Text('27')),
                  DataCell(Text('Associate Professor')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                ],
              ),
            ],
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
