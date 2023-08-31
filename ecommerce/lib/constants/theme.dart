import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  const ThemeManager._();
  static const ThemeManager shared = ThemeManager._();

  ThemeData getLightTheme() => ThemeData(
        useMaterial3: true,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      );

  ThemeData getDarkTheme() => ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(255, 113, 104, 65),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromARGB(255, 161, 150, 100),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 156, 115, 14),
        ),
      );
}
