import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData themeData = ThemeData(
  primaryTextTheme: TextTheme(
    titleMedium: TextStyle(
      color: Colors.black,
    )
  ),
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    )
);