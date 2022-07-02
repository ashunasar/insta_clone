import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/preference.dart';

class ThemeService {
  //* function to return current theme (this function is called when app starts from MyApp class)
  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  //* check if current theme is saved in shared preferences
  //* if not found then return false
  bool isSavedDarkMode() {
    return Preference.getBool(Constants.isDarkMode) ?? false;
  }

  //* save dark mode status in shared preferences
  void saveThemeMode(bool isDarkMode) {
    Preference.setBool(Constants.isDarkMode, isDarkMode);
  }

  //* setting theme mode
  void setDarkMode({required bool isDarkMode}) {
    //* change current theme mode
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);

    saveThemeMode(isDarkMode);
  }
}
