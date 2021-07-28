import 'package:flutter/material.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/routes.dart';
import 'src/ui/screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JICA App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: LIGHT_GREEN,
      ),
      home: WelcomeScreen(),
      routes: routes,
    );
  }
}
