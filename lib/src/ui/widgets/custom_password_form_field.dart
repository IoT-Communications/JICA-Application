import 'package:flutter/material.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:jica/src/utils/constants/const.dart';
import 'package:recase/recase.dart';

ValueNotifier<bool> isObsecure = ValueNotifier<bool>(true);

class CustomPasswordFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final FocusNode focusNode;

  //need to pass this var incase the field is confirm password;
  final String password;

  CustomPasswordFormField({
    this.controller,
    this.labelText = kPassword,
    this.password,
    this.focusNode,
  });

  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isObsecure,
      builder: (context, bool isObsecure, _) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            obscureText: isObsecure,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: kLightAccent,
              ),
              labelText: labelText?.titleCase,
              errorStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kLightAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kLightAccent),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kLightAccent),
              ),
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(color: kLightAccent),
                  child: Icon(
                    Icons.lock,
                    color: kLightAccent,
                  ),
                ),
                padding: EdgeInsets.only(left: 30, right: 10),
              ),
              suffix: GestureDetector(
                child: isObsecure
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.visibility_off),
                onTap: onTap,
              ),
            ),
            autocorrect: true,
            validator: (value) {
              if (labelText == kPassword || labelText == kNewPassword) {
                // return passwordValidator(
                //   label: kPassword,
                //   value: value,
                // );
              } else {
                // return confirmPasswordValidator(
                //   confirmPassword: value,
                //   label: labelText,
                //   password: password,
                // );
              }
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
          ),
        );
      },
    );
  }

  void onTap() {
    if (isObsecure.value)
      isObsecure.value = false;
    else
      isObsecure.value = true;
  }
}
