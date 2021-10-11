import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jica/src/utils/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: kDarkPrimary,
  accentColor: kLightAccent,
  brightness: Brightness.light,
  backgroundColor: kLightPrimary,
  buttonColor: kLightAccent,
  buttonTheme: ButtonThemeData(
    buttonColor: kLightAccent,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
      headline6: TextStyle(
    color: kDarkPrimary,
  )),
  appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      backgroundColor: kLightAccent,
      actionsIconTheme: IconThemeData(
        color: kDarkPrimary,
      ),
      iconTheme: IconThemeData(
        color: kDarkPrimary,
      ),
      textTheme: TextTheme(
          headline6: TextStyle(
        color: kDarkPrimary,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ))),
).copyWith(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: kLightAccent,
).copyWith(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
