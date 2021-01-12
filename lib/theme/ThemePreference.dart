import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Color(0xff212121),
  accentColor: Color(0xfff5f5f5),
  accentIconTheme: IconThemeData(color: Colors.black),
  iconTheme: IconThemeData(color: Colors.white),
);

final lightTheme = ThemeData(
  primaryColor: Color(0xfff5f5f5),
  brightness: Brightness.light,
  backgroundColor: Color(0xffe5e5e5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  iconTheme: IconThemeData(color: Colors.black),
);
