import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks_app/core/utils/app_colors.dart';
import 'package:tasks_app/core/utils/app_constants.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(38, 99, 227, .1),
  100: Color.fromRGBO(38, 99, 227, .2),
  200: Color.fromRGBO(38, 99, 227, .3),
  300: Color.fromRGBO(38, 99, 227, .4),
  400: Color.fromRGBO(38, 99, 227, .5),
  500: Color.fromRGBO(38, 99, 227, .6),
  600: Color.fromRGBO(38, 99, 227, .7),
  700: Color.fromRGBO(38, 99, 227, .8),
  800: Color.fromRGBO(38, 99, 227, .9),
  900: Color.fromRGBO(38, 99, 227, 1),
};

ThemeData appTheme() {
  return ThemeData(
    textTheme: GoogleFonts.montserratTextTheme(),
    primaryColor: AppColors.deepPurple,
    primarySwatch: MaterialColor(0xff673ab7, color),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: AppConstants.systemUiOverlayStyle),
  );
}
