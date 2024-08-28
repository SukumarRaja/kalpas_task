import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: '',
  primaryColor: const Color(0xFF123764),
  secondaryHeaderColor: const Color(0xFF1ED7AA),
  disabledColor: const Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFF517be9))),
  popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white, surfaceTintColor: Colors.white),
  dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500))),
  bottomAppBarTheme: const BottomAppBarTheme(
    surfaceTintColor: Colors.white,
    height: 60,
    padding: EdgeInsets.symmetric(vertical: 5),
  ),
  dividerTheme:
      const DividerThemeData(thickness: 0.2, color: Color(0xFFA0A4A8)),
  colorScheme: const ColorScheme.light(
          primary: Color(0xFF8f8f8f),
          tertiary: Color(0xff9c9c9e),
          tertiaryContainer: Color(0xff171DB6),
          secondary: Color(0xff9c9c9e))
      .copyWith(background: const Color(0xFFF3F3F3))
      .copyWith(error: const Color(0xFFE84D4F)),
);
