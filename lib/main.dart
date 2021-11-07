import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jica/src/providers/app_state.dart';
import 'package:jica/src/services/bloc/device_bloc.dart';
import 'package:jica/src/ui/screens/base/base_screen.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/routes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'src/ui/screens/welcome/welcome_screen.dart';
import 'src/utils/constants/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  //Graphql cache directory
  var appDir = await getApplicationDocumentsDirectory();
  await Hive.openBox(kSession);
  await HiveStore.open(path: appDir.path);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppState>(create: (_) => AppState()),
      BlocProvider(create: (context) => DeviceBloc()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  AppState _appState;
  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JICA App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: LIGHT_GREEN,
      ),
      home: navigateTo(context),
      routes: routes,
    );
  }

  Widget navigateTo(BuildContext context) {
    if (_appState.token != null)
      return BaseScreen();
    else
      return WelcomeScreen();
  }
}
