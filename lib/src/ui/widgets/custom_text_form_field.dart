import 'package:flutter/material.dart';
import 'custom_form_field.dart';

class CustomTextFormField extends CustomFormField {
  const CustomTextFormField({
    Key? key,
    prefixIconData,
    suffixIconData,
    @required labelText,
    @required controller,
    helperText,
    validator,
    focusNode,
  }) : super(
            key: key,
            controller: controller,
            labelText: labelText,
            helperText: helperText,
            obsecure: false,
            prefixIconData: prefixIconData,
            suffixIconData: suffixIconData,
            validator: validator,
            focusNode: focusNode);
}
