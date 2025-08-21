import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ValueNotifier<bool> {
  final SharedPreferences sharedPreferences;

  ThemeController({required this.sharedPreferences})
    : super(sharedPreferences.getBool("isDark") ?? false);

  void toggleTheme() {
    value = !value;
    sharedPreferences.setBool("isDark", value);
  }
}
