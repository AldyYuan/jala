import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF1B77DF);

const AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: primaryColor,
  foregroundColor: Colors.white,
);

final ThemeData lightThemeData = ThemeData(
  colorSchemeSeed: primaryColor,
  useMaterial3: true,
  appBarTheme: appBarTheme,
  brightness: Brightness.light,
  textTheme: GoogleFonts.latoTextTheme(),
);

final ThemeData darkThemeData = ThemeData(
  colorSchemeSeed: primaryColor,
  useMaterial3: true,
  appBarTheme: appBarTheme,
  brightness: Brightness.dark,
  textTheme: GoogleFonts.latoTextTheme(),
);
