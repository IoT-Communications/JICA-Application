import 'package:flutter/material.dart';
import 'package:jica/src/services/auth_service.dart';
import 'package:jica/src/ui/screens/auth/register/register_screen.dart';
import 'package:jica/src/ui/screens/base/base_screen.dart';
import 'package:jica/src/ui/widgets/covid_logo.dart';
import 'package:jica/src/ui/widgets/custom_password_form_field.dart';
import 'package:jica/src/ui/widgets/custom_raised_button.dart';
import 'package:jica/src/ui/widgets/custom_text_form_field.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/constants.dart';
import 'package:jica/src/utils/dialogs.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
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
                  onPressed: onPressed,
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
    );
  }

  void onPressed() {
    Navigator.pushReplacementNamed(
      context,
      BaseScreen.routeName,
    );
  }

  Future<void> signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    Dialogs.showLoadingDialog(context);
    await context.read<AuthService>().signIn(email, password);
    Dialogs.closeLoadingDialog(context);
  }
}
