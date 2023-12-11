import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle = GoogleFonts.pacifico(
  color: const Color(0xFF222B45),
);

const double defaultPadding = 15;
const double defaultBorderRadius = 15;
const double defaultElevation = 8;
const Duration defaultAnimationDuration = Duration(milliseconds: 200);

const primaryColor = Color(0xFF232645);

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
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
);
