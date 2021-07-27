import 'package:flutter/material.dart';
import 'package:jica/src/ui/widgets/my_custom_clipper.dart';
import 'package:jica/src/utils/colors.dart';

class CovidLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kLightAccent,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/covid_logo.png',
          ),
        ),
      ),
      height: 200,
      width: MediaQuery.of(context).size.width,
    );
  }
}
