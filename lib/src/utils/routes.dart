import 'package:flutter/material.dart';
import 'package:jica/src/ui/screens/auth/login/login_screen.dart';
import 'package:jica/src/ui/screens/auth/register/register_screen.dart';
import 'package:jica/src/ui/screens/welcome/welcome_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.routeName: (_) => LoginScreen(),
  WelcomeScreen.routeName: (_) => WelcomeScreen(),
  RegisterScreen.routeName: (_) => RegisterScreen(),
};
