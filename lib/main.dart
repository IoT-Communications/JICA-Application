import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jica/src/services/auth_service.dart';
import 'package:jica/src/services/home_service.dart';
import 'package:jica/src/services/profile_service.dart';
import 'package:jica/src/services/watch_service.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/routes.dart';
import 'package:provider/provider.dart';
import 'src/ui/screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => HomeService()),
        ChangeNotifierProvider(create: (_) => ProfileService()),
        ChangeNotifierProvider(create: (_) => WatchService()),
        StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges,
            initialData: null)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JICA App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: LIGHT_GREEN,
        ),
        home: WelcomeScreen(),
        routes: routes,
      ),
    );
  }
}
