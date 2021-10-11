import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jica/src/ui/widgets/covid_logo.dart';
import 'package:jica/src/ui/widgets/custom_password_form_field.dart';
import 'package:jica/src/ui/widgets/custom_raised_button.dart';
import 'package:jica/src/ui/widgets/custom_text_form_field.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/constants/const.dart';

class RegisterScreen extends StatefulWidget {
  static final String routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
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
  }

  Future<void> onPressed() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    // Dialogs.showLoadingDialog(context);
    // Dialogs.closeLoadingDialog(context);
  }
}
