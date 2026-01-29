import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[900],
  colorScheme: ColorScheme.light(
    primary: Colors.yellow,
    secondary: Colors.green,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.yellow,
    titleTextStyle: TextStyle(
      color: Colors.black, // цвет текста заголовка
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  dividerColor: Colors.white24,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white, // цвет текста заголовка
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
  ),
);