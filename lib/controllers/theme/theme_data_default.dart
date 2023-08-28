// ignore: file_names
import 'package:flutter/material.dart';
import 'color_constant.dart';

ThemeData defaultThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorConstants.beyaz,
      fontFamily: 'RaleWay',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14, fontFamily: 'RaleWay'),
      ),
    );
  }