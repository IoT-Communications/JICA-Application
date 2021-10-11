import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jica/src/services/bloc/authenticate_bloc.dart';
import 'package:jica/src/ui/screens/auth/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  static final String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticateBloc>(
        create: (context) => AuthenticateBloc(), child: LoginForm());
  }
}
