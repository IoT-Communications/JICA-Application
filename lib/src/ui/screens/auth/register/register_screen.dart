import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jica/src/services/bloc/authenticate_bloc.dart';
import 'package:jica/src/ui/screens/auth/register/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  static final String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticateBloc>(
      create: (context) => AuthenticateBloc(),
      child: RegisterForm(),
    );
  }
}
