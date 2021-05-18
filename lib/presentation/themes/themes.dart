import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coddr/common/constants/size_constants.dart';
import 'package:coddr/common/constants/size_constants.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static final TextStyle headline6 = TextStyle(
      fontSize: Sizes.dimen_20, fontWeight: FontWeight.w500, wordSpacing: 0.15);

  static final TextStyle headline5 = TextStyle(
      fontSize: Sizes.dimen_24, fontWeight: FontWeight.w400, wordSpacing: 0.0);

  static final TextStyle headline4 = TextStyle(
      fontSize: Sizes.dimen_30, fontWeight: FontWeight.w400, wordSpacing: 0.25);

  static final TextStyle headline3 = TextStyle(
      fontSize: Sizes.dimen_48, fontWeight: FontWeight.w400, wordSpacing: 0.0);

  static final TextStyle headline2 = TextStyle(
      fontSize: Sizes.dimen_60, fontWeight: FontWeight.w300, wordSpacing: -0.5);

  static final TextStyle headline1 = TextStyle(
      fontSize: Sizes.dimen_96, fontWeight: FontWeight.w300, wordSpacing: -1.5);

  static final TextStyle subtitle1 = TextStyle(
      fontSize: Sizes.dimen_16, fontWeight: FontWeight.w300, wordSpacing: 0.15);

  static final TextStyle subtitle2 = TextStyle(
      fontSize: Sizes.dimen_14, fontWeight: FontWeight.w400, wordSpacing: 0.1);

  static final TextStyle bodyText1 = TextStyle(
      fontSize: Sizes.dimen_16, fontWeight: FontWeight.w300, wordSpacing: 0.5);

  static final TextStyle bodyText2 = TextStyle(
      fontSize: Sizes.dimen_14, fontWeight: FontWeight.w300, wordSpacing: 0.25);

  static final TextStyle button = TextStyle(
      fontSize: Sizes.dimen_14, fontWeight: FontWeight.w400, wordSpacing: 1.25);

  static final TextStyle caption = TextStyle(
      fontSize: Sizes.dimen_12, fontWeight: FontWeight.w300, wordSpacing: 0.4);

  static final TextStyle overline = TextStyle(
      fontSize: Sizes.dimen_10, fontWeight: FontWeight.w300, wordSpacing: 1.5);

  static getTextTheme() => TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        headline4: headline4,
        headline5: headline5,
        headline6: headline6,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
        bodyText1: bodyText1,
        bodyText2: bodyText2,
        button: button,
        caption: caption,
        overline: overline,
      );
}
