import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jica/src/core/models/device_location.dart';
import 'package:jica/src/services/bloc/base_graphql_bloc.dart';
import 'package:jica/src/services/bloc/device_location_bloc.dart';
import 'package:jica/src/ui/screens/base/widgets/map_screen.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/debugBro.dart';
import 'package:jica/src/utils/dialogs.dart';
import "package:collection/collection.dart";

class BaseScreen extends StatelessWidget {
  static final String routeName = '/base';

  Map<String, dynamic> _groupedDeviceLocations;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeviceLocationBloc>(
      create: (context) => DeviceLocationBloc(),
      child: BlocConsumer<DeviceLocationBloc, GraphqlState>(
        builder: (BuildContext context, GraphqlState state) {
          if (state is GraphqlInitialState) {
            getDeviceLocations(context);
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: kLightAccent,
              title: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Trocchi',
                  decorationColor: Colors.black,
                  decorationThickness: 1.0,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () => getDeviceLocations(context),
                  icon: Icon(
                    Icons.refresh,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.location_searching,
                  ),
                )
              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: kLightAccent,
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"),
                      ),
                      accountName: Text(
                        "Moffat More",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      accountEmail: Text(
                        "more@iotcomms.co.bw",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
                    onTap: () {
                      print("Clicked");
                    },
                  ),
                  ListTile(
                    title: Text('Watches'),
                    leading: Icon(Icons.watch),
                    onTap: () {
                      print("Clicked");
                    },
                  ),
                  ListTile(
                    title: Text('Contacts'),
                    leading: Icon(Icons.group),
                    onTap: () {
                      print("Clicked");
                    },
                  ),
                  ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings),
                    onTap: () {
                      print("Clicked");
                    },
                  ),
                  ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.power_settings_new),
                    onTap: () {
                      signOut(context);
                    },
                  ),
                ],
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: state is GraphqlLoadingState
                  ? Container()
                  : MapScreen(
                      groupedDeviceLocations: _groupedDeviceLocations,
                    ),
            ),
            //bottomNavigationBar: Container(),
          );
        },
        listener: (BuildContext context, GraphqlState state) {
          if (state is GraphqlLoadingState) {
            Dialogs.showLoadingDialog(context, message: 'Loading devices...');
          } else if (state is GraphqlLoadedState) {
            Dialogs.closeLoadingDialog(context);
            Map error = state.data['getDeviceLocations']['error'];
            if (error != null) {
              Dialogs.showGeneralDialog(
                context,
                text: error['message'],
              );
            } else {
              List _deviceLocationsMap =
                  state.data['getDeviceLocations']['deviceLocations'];

              List<DeviceLocation> _deviceLocations =
                  AutogeneratedDeviceLocation.fromJson(
                {'results': _deviceLocationsMap},
              ).results;

              _groupedDeviceLocations = groupBy(_deviceLocations,
                  (deviceLocation) => deviceLocation.deviceID);
            }
          }
        },
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {}

  void getDeviceLocations(BuildContext context) {
    context.read<DeviceLocationBloc>()..getDeviceLocations();
  }
}
