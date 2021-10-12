import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jica/src/services/bloc/authenticate_bloc.dart';
import 'package:jica/src/services/bloc/base_graphql_bloc.dart';
import 'package:jica/src/ui/screens/auth/login/login_screen.dart';
import 'package:jica/src/ui/widgets/covid_logo.dart';
import 'package:jica/src/ui/widgets/custom_password_form_field.dart';
import 'package:jica/src/ui/widgets/custom_raised_button.dart';
import 'package:jica/src/ui/widgets/custom_text_form_field.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/constants/const.dart';
import 'package:flutter/gestures.dart';
import 'package:jica/src/utils/debugBro.dart';
import 'package:jica/src/utils/dialogs.dart';
import 'package:jica/src/utils/error_message.dart';
import 'package:jica/src/utils/toast.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticateBloc, GraphqlState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    CovidLogo(),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Register',
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
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                        child: Text(
                          'Login',
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
                      labelText: kUsername,
                      controller: _usernameController,
                      prefixIconData: Icons.person_pin_circle_sharp,
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    CustomPasswordFormField(
                      labelText: kConfirmPassword,
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      child: CustomRaisedButton(
                        labelText: "Register",
                        textColor: Colors.white,
                        radius: 10,
                        onPressed: signUp,
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
                            text: 'Already have account? ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Trocchi',
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pop(context),
                            text: 'Login here... ',
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
          logger.e(state.error);
          displayErrors(context, state.error);
        } else if (state is GraphqlLoadedState) {
          Dialogs.closeLoadingDialog(context);

          if (state.data != null) {
            if (state.data[kRegister]['error'] != null) {
              String message = state.data[kRegister]['error']['message'];
              Dialogs.showGeneralDialog(context, text: message);
            } else {
              loadToast('Successfully registered..', context);
              showLoginScreen();
            }
          }
        }
      },
    );
  }

  void showLoginScreen() {
    Navigator.pushReplacementNamed(
      context,
      LoginScreen.routeName,
    );
  }

  void signUp() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String username = _usernameController.text.trim();
    context.read<AuthenticateBloc>()
      ..register(email: email, password: password, username: username);
  }
}
