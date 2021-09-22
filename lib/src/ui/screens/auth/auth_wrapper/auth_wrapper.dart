import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jica/src/ui/screens/auth/login/login_screen.dart';
import 'package:jica/src/ui/screens/base/base_screen.dart';
import 'package:provider/src/provider.dart';

class AuthWrapper extends StatelessWidget {
  static final String routeName = '/auth_wrapper';

  @override
  Widget build(BuildContext context) {
    final User firebaseUser = context.watch<User>();
    if (firebaseUser != null) return BaseScreen();
    return LoginScreen();
  }
}
