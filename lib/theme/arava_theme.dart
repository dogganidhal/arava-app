import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AravaTheme {
  static final kLightPrimaryColor = Color(0xFF087E8B);
  static final kLightAccentColor = Color(0xFF087E8B);
  static final kDarkPrimaryColor = Color(0xFF03DAC6);
  static final kDarkAccentColor = Color(0xFF03DAC6);
  static final kDarkColor = Color(0xFF171717);
  static final kLightColor = Color(0xFFFDFDFD);
  static final kErrorColor = Color(0xFFFF3C38);
  static final kFeaturedColor = Color(0xFFFB2B3A);

  static final kLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kLightPrimaryColor,
    accentColor: kLightAccentColor,
    errorColor: kErrorColor,
    cursorColor: kLightPrimaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kLightAccentColor,
      elevation: 1
    ),
    colorScheme: ColorScheme.light(
      primary: kLightPrimaryColor,
      background: kLightColor,
      brightness: Brightness.dark
    ),
    fontFamily: 'CircularStd',
    scaffoldBackgroundColor: kLightColor,
    backgroundColor: kLightColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: kLightColor,
      iconTheme: IconThemeData(
        color: kLightPrimaryColor
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: kDarkColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'CircularStd'
        )
      ),
      brightness: Brightness.light,
    )
  );

  static final kDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: kDarkAccentColor,
    accentColor: kDarkAccentColor,
    errorColor: kErrorColor,
    colorScheme: ColorScheme.dark(
      primary: kDarkPrimaryColor,
      brightness: Brightness.light,
    ),
    splashColor: kDarkColor.withOpacity(0.4),
    fontFamily: 'CircularStd',
    backgroundColor: kDarkColor,
    scaffoldBackgroundColor: kDarkColor,
    cursorColor: kDarkPrimaryColor,
    textTheme: TextTheme(
      body1: TextStyle(
        color: kLightColor,
      ),
      display1: TextStyle(
        color: kLightColor
      )
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: kDarkColor.withAlpha(200),
      iconTheme: IconThemeData(
        color: kDarkPrimaryColor
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: kLightColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'CircularStd'
        )
      ),
      brightness: Brightness.dark,
    ),
  );

  static final kPremiumPoiColorList = [
    Color(0xFF6666FF),
    Color(0xFFCC66FF),
    Color(0xFFFF6699),
    Color(0xFFFF9966),
    Color(0xFF99FF66),
    Color(0xFF66FFCC),
    Color(0xFF66CCFF),
    Color(0xFF6699FF)
  ];
}