import 'package:countdown_timer/theme/ThemePreference.dart';
import 'package:flutter/material.dart';

class ThemeProvider {
  ThemeData _themeData = darkTheme;

  ThemeData get getTheme => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
  }

  void changeTheme() {
    if (_themeData == darkTheme) {
      _themeData = lightTheme;
    } else {
      _themeData = darkTheme;
    }
  }
}
