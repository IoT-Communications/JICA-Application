import 'package:flutter/material.dart';
import 'package:jica/src/ui/widgets/covid_logo.dart';
import 'package:jica/src/ui/widgets/custom_password_form_field.dart';
import 'package:jica/src/ui/widgets/custom_raised_button.dart';
import 'package:jica/src/ui/widgets/custom_text_form_field.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/constants/const.dart';

class ResetPasswordScreen extends StatefulWidget {
  static final String routeName = '/reset_password';

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
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
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Reset Password',
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
                    'Back',
                    style: TextStyle(
                      color: kLightAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Trocchi',
                    ),
                  ),
                ),
              ),
              CustomPasswordFormField(
                labelText: kPassword,
                controller: _passwordController,
              ),
              SizedBox(
                height: 20,
              ),
              CustomPasswordFormField(
                labelText: kNewPassword,
                controller: _newPasswordController,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50,
                child: CustomRaisedButton(
                  labelText: "Reset Password",
                  textColor: Colors.white,
                  radius: 10,
                  onPressed: onPressed,
                  fillColor: kLightAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() {}
}
