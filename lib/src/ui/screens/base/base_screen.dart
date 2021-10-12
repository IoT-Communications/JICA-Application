import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jica/src/services/bloc/base_graphql_bloc.dart';
import 'package:jica/src/services/bloc/map_bloc.dart';
import 'package:jica/src/ui/screens/base/widgets/map_screen.dart';
import 'package:jica/src/utils/colors.dart';

class BaseScreen extends StatelessWidget {
  static final String routeName = '/base';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapBloc>(
      create: (context) => MapBloc(),
      child: BlocConsumer<MapBloc, GraphqlState>(
        builder: (BuildContext context, GraphqlState state) {
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
              child: MapScreen(),
            ),
            //bottomNavigationBar: Container(),
          );
        },
        listener: (BuildContext context, GraphqlState state) {},
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {}
}
