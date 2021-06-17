import 'package:clean_marketplace/domain/entity/color_pallete.dart';
import 'package:flutter/material.dart';

MaterialColor primarySwatch = const MaterialColor(
  0xFF9C44Dc,
  const <int, Color>{
    50: const Color(0xFF9C44Dc),
    100: const Color(0xFF9C44Dc),
    200: const Color(0xFF9C44Dc),
    300: const Color(0xFF9C44Dc),
    400: const Color(0xFF9C44Dc),
    500: const Color(0xFF9C44Dc),
    600: const Color(0xFF9C44Dc),
    700: const Color(0xFF9C44Dc),
    800: const Color(0xFF9C44Dc),
    900: const Color(0xFF9C44Dc),
  },
);

MaterialColor secondarySwatch = const MaterialColor(
  0xFFBC8AE1,
  const <int, Color>{
    50: const Color(0xFFBC8AE1),
    100: const Color(0xFFBC8AE1),
    200: const Color(0xFFBC8AE1),
    300: const Color(0xFFBC8AE1),
    400: const Color(0xFFBC8AE1),
    500: const Color(0xFFBC8AE1),
    600: const Color(0xFFBC8AE1),
    700: const Color(0xFFBC8AE1),
    800: const Color(0xFFBC8AE1),
    900: const Color(0xFFBC8AE1),
  },
);

class ThemeConfig {
  static ThemeData themeData = ThemeData(
    backgroundColor: colorPalette.neutral500,
    scaffoldBackgroundColor: colorPalette.neutral500,
    primarySwatch: primarySwatch,
    accentColor: secondarySwatch,
    appBarTheme: AppBarTheme(
      textTheme: appBarTextTheme,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          colorPalette.brand100,
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return colorPalette.neutral300;
            } else {
              return primarySwatch;
            }
          },
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          lightTextTheme.button!,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return colorPalette.neutral300;
            } else {
              return Colors.white;
            }
          },
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          lightTextTheme.button!,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          colorPalette.brand100,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return BorderSide(
                color: colorPalette.brand100,
                width: 2,
              );
            } else {
              return BorderSide(
                color: colorPalette.neutral400,
                width: 3,
              );
            }
          },
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    fontFamily: 'OpenSans',
    primaryTextTheme: lightTextTheme,
    accentTextTheme: lightTextTheme,
    textTheme: lightTextTheme,
    dividerTheme: DividerThemeData(
      thickness: 2,
    ),
    iconTheme: lightIconTheme,
  );

  static ColorPalette colorPalette = ColorPalette(
    brand100: Color(0xFF5635A0),
    brand200: Color(0xFF5635A0),
    accent100: Color(0xFF00E7D1),
    accent200: Color(0xFF00E7D1),
    danger100: Color.fromRGBO(173, 0, 0, 1),
    // #AD0000
    danger200: Color.fromRGBO(173, 0, 0, 1),
    // #AD0000
    warning100: Color.fromRGBO(235, 113, 0, 1),
    // #EB7100
    warning200: Color.fromRGBO(255, 156, 66, 1),
    // #FF9C42
    success100: Color.fromRGBO(0, 122, 110, 1),
    // #007A6E
    success200: Color.fromRGBO(0, 165, 149, 1),
    // #00A595
    neutral100: Color.fromRGBO(10, 10, 10, 1),
    // #0A0A0A
    neutral200: Color.fromRGBO(79, 79, 79, 1),
    // #4F4F4F
    neutral300: Color.fromRGBO(151, 151, 151, 1),
    // #979797
    neutral400: Color.fromRGBO(232, 232, 232, 1),
    // #E8E8E8
    neutral500: Color.fromRGBO(255, 255, 255, 1),
    // #FFFFFF
  );
}

TextTheme appBarTextTheme = TextTheme(
  headline6: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
);

TextTheme lightTextTheme = TextTheme(
  headline1: TextStyle(
    color: ThemeConfig.colorPalette.neutral100,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  ),
  headline2: TextStyle(
    color: ThemeConfig.colorPalette.neutral200,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  ),
  headline3: TextStyle(
    color: ThemeConfig.colorPalette.neutral200,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  ),
  headline4: TextStyle(
    color: ThemeConfig.colorPalette.neutral200,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  ),
  bodyText1: TextStyle(
    color: ThemeConfig.colorPalette.neutral200,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  ),
  bodyText2: TextStyle(
    color: ThemeConfig.colorPalette.neutral200,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  ),
  subtitle1: TextStyle(
    color: ThemeConfig.colorPalette.neutral200,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  ),
  subtitle2: TextStyle(
    color: ThemeConfig.colorPalette.neutral200,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
  ),
  button: TextStyle(
    color: ThemeConfig.colorPalette.neutral500,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  ),
  caption: TextStyle(
    fontSize: 12.0,
  ),
  overline: TextStyle(
    fontSize: 10.0,
  ),
);

IconThemeData darkIconTheme = IconThemeData(
  color: Colors.white,
);

IconThemeData lightIconTheme = IconThemeData(
  color: ThemeConfig.colorPalette.neutral200,
);
