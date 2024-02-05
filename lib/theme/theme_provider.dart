import 'package:bubble_tea_app/theme/dark_mode.dart';
import 'package:bubble_tea_app/theme/light_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // по умолчанию
  ThemeData _themeData = lightMode;

  // GET
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  // SET

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // метод общей темы
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
