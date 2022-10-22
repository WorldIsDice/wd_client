import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getInitTheme() {
  Color transparent = const Color.fromRGBO(0, 0, 0, 0);
  Color lightRed = const Color.fromRGBO(251, 240, 240, 1);
  Color brightRed = const Color.fromRGBO(239, 68, 68, 1);
  Color activeRed = const Color.fromRGBO(174, 23, 20, 1);
  Color primaryRed = const Color.fromRGBO(134, 16, 14, 1);
  Color textRed = const Color.fromRGBO(217, 86, 61, 1);

  Color lightBlue = const Color.fromRGBO(228, 241, 255, 1);
  Color blue = const Color.fromRGBO(41, 133, 238, 1);
  Color darkBlue = const Color.fromRGBO(12, 94, 188, 1);

  Color lightGreen = const Color.fromRGBO(220, 255, 221, 1);
  Color green = const Color.fromRGBO(37, 134, 41, 1);
  Color darkGreen = const Color.fromRGBO(23, 87, 25, 1);

  Color lightYellow = const Color.fromRGBO(255, 249, 241, 1);
  Color yellow20 = const Color.fromRGBO(255, 235, 211, 1);
  Color yellow = const Color.fromRGBO(255, 220, 103, 1);
  Color darkYellow = const Color.fromRGBO(255, 196, 0, 1);

  Color white = const Color.fromRGBO(255, 255, 255, 1);
  Color bgColor = const Color.fromRGBO(242, 242, 242, 1);
  Color dark10 = const Color.fromRGBO(249, 249, 249, 1);
  Color dark20 = const Color.fromRGBO(226, 226, 226, 1);
  Color dark60 = const Color.fromRGBO(158, 158, 158, 1);
  Color dark80 = const Color.fromRGBO(90, 90, 90, 1);
  Color dark100 = const Color.fromRGBO(18, 18, 18, 1);
  Color headerBlack = const Color.fromRGBO(27, 16, 18, 1);

  final ThemeData theme = ThemeData(
    primaryColor: primaryRed,
    primaryColorLight: brightRed,
    primaryColorDark: primaryRed,
    outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom(foregroundColor: green)),
    scaffoldBackgroundColor: bgColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(green),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(color: primaryRed),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
      fillColor: MaterialStateProperty.all(green),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryRed,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
      ),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryRed,
      secondary: primaryRed,
      background: bgColor,
    ),
  ).copyFrom(
    CustomThemeData(
      colors: ThemeColors(
        transparent: transparent,
        lightRed: lightRed,
        brightRed: brightRed,
        activeRed: activeRed,
        primaryRed: primaryRed,
        textRed: textRed,
        lightBlue: lightBlue,
        blue: blue,
        darkBlue: darkBlue,
        lightGreen: lightGreen,
        green: green,
        darkGreen: darkGreen,
        lightYellow: lightYellow,
        yellow20: yellow20,
        yellow: yellow,
        darkYellow: darkYellow,
        white: white,
        bgColor: bgColor,
        dark10: dark10,
        dark20: dark20,
        dark60: dark60,
        dark80: dark80,
        dark100: dark100,
        headerBlack: headerBlack,
      ),
      fontStyle: ThemeFontStyle(
        superhero: const TextStyle(fontSize: 60, fontWeight: FontWeight.w700),
        hero: const TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
        titleBold: const TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
        titleMedium: const TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
        titleRegular: const TextStyle(fontSize: 42, fontWeight: FontWeight.w400),
        subBold: const TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
        subMedium: const TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
        subRegular: const TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
        captionMedium: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        captionRegular: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        label: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
    ),
  );

  return theme;
}

CustomThemeData? _appTheme;

extension CustomTheme on ThemeData {
  CustomThemeData get appTheme => _appTheme!;

  ThemeData copyFrom(CustomThemeData appTheme) {
    _appTheme = appTheme;

    return this;
  }
}

class CustomThemeData {
  CustomThemeData({required this.colors, required this.fontStyle});

  final ThemeColors colors;
  final ThemeFontStyle fontStyle;
}

class ThemeColors {
  ThemeColors({
    required this.transparent,
    required this.lightRed,
    required this.brightRed,
    required this.activeRed,
    required this.primaryRed,
    required this.textRed,
    required this.lightBlue,
    required this.blue,
    required this.darkBlue,
    required this.lightGreen,
    required this.green,
    required this.darkGreen,
    required this.lightYellow,
    required this.yellow20,
    required this.yellow,
    required this.darkYellow,
    required this.white,
    required this.bgColor,
    required this.dark10,
    required this.dark20,
    required this.dark60,
    required this.dark80,
    required this.dark100,
    required this.headerBlack,
  });

  final Color transparent;
  final Color lightRed;
  final Color brightRed;
  final Color activeRed;
  final Color primaryRed;
  final Color textRed;
  final Color lightBlue;
  final Color blue;
  final Color darkBlue;
  final Color lightGreen;
  final Color green;
  final Color darkGreen;
  final Color lightYellow;
  final Color yellow20;
  final Color yellow;
  final Color darkYellow;
  final Color white;
  final Color bgColor;
  final Color dark10;
  final Color dark20;
  final Color dark60;
  final Color dark80;
  final Color dark100;
  final Color headerBlack;
}

class ThemeFontStyle {
  ThemeFontStyle({
    required this.superhero,
    required this.hero,
    required this.titleBold,
    required this.titleMedium,
    required this.titleRegular,
    required this.subBold,
    required this.subMedium,
    required this.subRegular,
    required this.captionMedium,
    required this.captionRegular,
    required this.label,
  });

  TextStyle superhero;
  TextStyle hero;
  TextStyle titleBold;
  TextStyle titleMedium;
  TextStyle titleRegular;
  TextStyle subBold;
  TextStyle subMedium;
  TextStyle subRegular;
  TextStyle captionMedium;
  TextStyle captionRegular;
  TextStyle label;
}
