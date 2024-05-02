import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1B77DF);
  static const Color primaryLight = Color(0xFF859ED1);
  static const Color primaryDarker = Color(0xFF004492);

  static const Color disableBgColor = Color(0xFFE5E5E5);
  static const Color yellowBgColor = Color(0xFFFFF8E7);

  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
  );

  static FilledButtonThemeData filledButtonThemeData = FilledButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
    ),
  );

  static final ThemeData lightThemeData = ThemeData(
    colorSchemeSeed: primaryColor,
    useMaterial3: true,
    appBarTheme: appBarTheme,
    brightness: Brightness.light,
    textTheme: GoogleFonts.latoTextTheme(),
    filledButtonTheme: filledButtonThemeData,
  );

  static final ThemeData darkThemeData = ThemeData(
    colorSchemeSeed: primaryColor,
    useMaterial3: true,
    appBarTheme: appBarTheme,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.latoTextTheme(),
    filledButtonTheme: filledButtonThemeData,
  );
}
