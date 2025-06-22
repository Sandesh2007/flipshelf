import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red[600],
  fontFamily: "Poppins",
  textTheme: GoogleFonts.poppinsTextTheme(),
  colorScheme: ColorScheme.light(
    primary: Colors.red[600]!,
    secondary: Colors.black87,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black87,
    tertiary: Colors.white,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color.fromRGBO(18, 18, 18, 1),
  primaryColor: Colors.red[600],
  fontFamily: "Poppins",
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.red[600]!,
    secondary: Colors.white,
    onSecondary: Colors.black,
    surface: Color(0xFF121212),
    onSurface: Colors.white,
    tertiary: Colors.white,
  ),
);