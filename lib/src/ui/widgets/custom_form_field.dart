import 'package:flutter/material.dart';
import 'package:jica/src/utils/colors.dart';
import 'package:recase/recase.dart';

class CustomFormField extends StatelessWidget {
  final bool? obsecure;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final String? labelText;
  final String? helperText;
  final TextEditingController? controller;
  final double radius;
  final Function? validator;
  final Function? onSuffixTap;
  final FocusNode? focusNode;

  const CustomFormField({
    Key? key,
    this.obsecure,
    this.prefixIconData,
    this.suffixIconData,
    @required this.labelText,
    @required this.controller,
    this.helperText,
    this.radius = 10,
    this.validator,
    this.onSuffixTap,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: kLightAccent,
          ),
          labelText: labelText?.titleCase,
          helperText: helperText,
          errorStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: kLightAccent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: kLightAccent,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
          prefixIcon: prefixIconData != null
              ? Padding(
                  child: IconTheme(
                    data: IconThemeData(color: kLightAccent),
                    child: Icon(
                      prefixIconData,
                      color: kLightAccent,
                    ),
                  ),
                  padding: EdgeInsets.only(left: 30, right: 10),
                )
              : SizedBox.shrink(),
          suffix: onSuffixTap != null
              ? IconButton(
                  color: kLightAccent,
                  icon: Icon(suffixIconData),
                  onPressed: () => onSuffixTap,
                )
              : SizedBox.shrink(),
        ),
        onEditingComplete: () {
          if (focusNode != null)
            focusNode?.unfocus();
          else
            FocusScope.of(context).unfocus();
        },
        autocorrect: true,
        validator: (text) {
          if (validator != null) {
            return validator!(label: labelText, value: text);
          }
          return null;
        },
      ),
    );
  }
}
