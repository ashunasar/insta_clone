import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../controllers/theme/theme_service.dart';
import 'constants.dart';
import 'preference.dart';

class UtilFunctions {
  //? functions for e.g. parsing date and etc.

  //* function for displaying toast messages
  static void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }

  static String dateParse(DateTime date) {
    //TODO: change date parsing format
    return DateFormat.yMMMMd('en_US').format(date);
    // return DateFormat('yyyy-MM-dd hh:mm:ss').format(date);
  }

  //* function to change theme
  static void toggleTheme() {
    //* check for dark mode is enabled or not
    bool isDarkMode = Preference.getBool(Constants.isDarkMode) ?? false;

    //* setting dark mode according to isDarkMode value
    if (isDarkMode) {
      ThemeService().setDarkMode(isDarkMode: false);
    } else {
      ThemeService().setDarkMode(isDarkMode: true);
    }
  }

  // * setting locale lang for application
  static Locale getLocale() {
    return Preference.getString(Constants.localeLang) == null
        ? const Locale('en', 'US')
        : Locale(Preference.getString(Constants.localeLang)!,
            Preference.getString(Constants.countryCode));
  }
}
