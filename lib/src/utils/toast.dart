import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void loadToast(String msg, BuildContext context, {int gravity}) {
  Toast.show(
    msg,
    context,
    duration: Toast.LENGTH_LONG,
    backgroundRadius: 10,
    gravity: gravity ?? Toast.TOP,
  );
}
