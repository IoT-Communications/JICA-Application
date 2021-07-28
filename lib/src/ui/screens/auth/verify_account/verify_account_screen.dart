import 'package:flutter/material.dart';
import 'package:jica/src/ui/screens/auth/register/register_screen.dart';
import 'package:jica/src/ui/screens/welcome/welcome_screen.dart';
import 'package:jica/src/ui/widgets/covid_logo.dart';
import 'package:jica/src/ui/widgets/custom_raised_button.dart';
import 'package:jica/src/ui/widgets/custom_text_form_field.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/constants.dart';

class VerifyAccountScreen extends StatefulWidget {
  static final String routeName = '/verify_account';

  @override
  _VerifyAccountScreenState createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  TextEditingController _usernameController = TextEditingController();
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
                    'Verify Account',
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
              CustomTextFormField(
                labelText: kUsername,
                controller: _usernameController,
                prefixIconData: Icons.person_pin_circle_sharp,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50,
                child: CustomRaisedButton(
                  labelText: "Verify",
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
