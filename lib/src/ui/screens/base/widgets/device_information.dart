import 'package:flutter/material.dart';

class DeviceInformation extends StatefulWidget {
  @override
  _DeviceInformationState createState() => _DeviceInformationState();
}

class _DeviceInformationState extends State<DeviceInformation> {
  @override
  Widget build(BuildContext context) {
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
  }
}
