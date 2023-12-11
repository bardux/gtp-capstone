import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF232645);
const secondaryColor = Color(0xFFD0DCF2);

TextStyle textStyle = GoogleFonts.pacifico(
  color: primaryColor,
);

const double defaultPadding = 15;
const double defaultBorderRadius = 15;
const double defaultElevation = 8;
const Duration defaultAnimationDuration = Duration(milliseconds: 200);

ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFE5B6F2),
    background: const Color(0xFFF8F8F8),
  ),
  textTheme: TextTheme(
    displayLarge: textStyle,
    displayMedium: textStyle,
    titleLarge: textStyle,
    bodyLarge: textStyle,
    bodyMedium: textStyle,
    bodySmall: textStyle,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: defaultElevation,
      backgroundColor: primaryColor,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(textStyle: GoogleFonts.pacifico()),
  ),
  dialogTheme: DialogTheme(
      titleTextStyle: GoogleFonts.pacifico(
    color: primaryColor,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  )),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
);
