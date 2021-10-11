import 'package:flutter/material.dart';
import 'package:jica/src/ui/screens/auth/login/login_screen.dart';
import 'package:jica/src/ui/screens/base/base_screen.dart';

class AuthWrapper extends StatelessWidget {
  static final String routeName = '/auth_wrapper';

  @override
  Widget build(BuildContext context) {
    //if (!false) return BaseScreen();
    return LoginScreen();
  }
}
