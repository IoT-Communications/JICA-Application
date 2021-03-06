import "package:flutter/material.dart";
import 'package:jica/src/ui/screens/auth/auth_wrapper/auth_wrapper.dart';
import 'package:jica/src/ui/widgets/covid_logo.dart';
import "package:jica/src/ui/widgets/custom_raised_button.dart";
import 'package:jica/src/ui/widgets/shadow_text.dart';
import "package:jica/src/utils/colors.dart";

class WelcomeScreen extends StatelessWidget {
  static final String routeName = '/welcome';

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
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      CovidLogo(),
                      SizedBox(height: 20),
                      ShadowText(
                        "Covid 19",
                        style: TextStyle(
                          color: kLightAccent,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Trocchi',
                          decorationColor: Colors.black,
                          decorationThickness: 1.0,
                        ),
                      ),
                      ShadowText(
                        "Contact Tracing",
                        style: TextStyle(
                          color: kLightAccent,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Trocchi',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Text(
                    "Lorem ipsum dolor sit amet, "
                    "consectetur adipiscing elit. Proin maecenas vulputate "
                    "quam mi risus id. Interdum nec purus sit libero pharetra. "
                    "Cursus sed duis sed pulvinar sagittis scelerisque gravida "
                    "commodo. Viverra viverra quisque nullam nec adipiscing cras "
                    "diam.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Trocchi',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 50,
                  child: CustomRaisedButton(
                    labelText: "Get Started",
                    textColor: Colors.white,
                    radius: 10,
                    onPressed: () => onPressed(context),
                    fillColor: kLightAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    Navigator.pushNamed(context, AuthWrapper.routeName);
  }
}
