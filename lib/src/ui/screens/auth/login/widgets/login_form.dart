import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jica/src/providers/app_state.dart';
import 'package:jica/src/services/bloc/authenticate_bloc.dart';
import 'package:jica/src/services/bloc/base_graphql_bloc.dart';
import 'package:jica/src/ui/screens/auth/register/register_screen.dart';
import 'package:jica/src/ui/screens/base/base_screen.dart';
import 'package:jica/src/ui/widgets/covid_logo.dart';
import 'package:jica/src/ui/widgets/custom_password_form_field.dart';
import 'package:jica/src/ui/widgets/custom_raised_button.dart';
import 'package:jica/src/ui/widgets/custom_text_form_field.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/constants/const.dart';
import 'package:jica/src/utils/dialogs.dart';
import 'package:jica/src/utils/error_message.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticateBloc, GraphqlState>(
      builder: (context, state) {
        return SafeArea(
          child: Material(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CovidLogo(),
                    SizedBox(height: 40),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            color: kLightAccent,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Trocchi',
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RegisterScreen.routeName,
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: kLightAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Trocchi',
                          ),
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      labelText: kEmail,
                      controller: _emailController,
                      prefixIconData: Icons.email,
                    ),
                    SizedBox(height: 20),
                    CustomPasswordFormField(
                      labelText: kPassword,
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      child: CustomRaisedButton(
                        labelText: "Login",
                        textColor: Colors.white,
                        radius: 10,
                        onPressed: signIn,
                        fillColor: kLightAccent,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Forgot password? ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Trocchi',
                            ),
                          ),
                          TextSpan(
                            text: 'Click here... ',
                            style: TextStyle(
                              color: kLightAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Trocchi',
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is GraphqlLoadingState) {
          Dialogs.showLoadingDialog(context);
        } else if (state is GraphqlErrorState) {
          Dialogs.closeLoadingDialog(context);
          displayErrors(context, state.error);
        } else if (state is GraphqlLoadedState) {
          Dialogs.closeLoadingDialog(context);
          if (state.data != null) {
            if (state.data[kLogin]['error'] != null) {
              String message = state.data[kLogin]['error']['message'];
              Dialogs.showGeneralDialog(context, text: message);
            } else {
              String token = state.result.data[kLogin]['token'];
              Provider.of<AppState>(context, listen: false)
                ..token = token
                ..updateHiveDB();
              showBaseScreen();
            }
          }
        }
      },
    );
  }

  void showBaseScreen() {
    Navigator.pushReplacementNamed(
      context,
      BaseScreen.routeName,
    );
  }

  void signIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String fcmToken = await FirebaseMessaging.instance.getToken();

    BlocProvider.of<AuthenticateBloc>(context)
      ..login(email: email, password: password, fcmToken: fcmToken);
  }
}
