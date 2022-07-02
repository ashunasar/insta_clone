import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeData {
  //TODO: change your light theme data
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.black),
      primaryColor: Color(0xff6B5ECD),
      appBarTheme: AppBarTheme(
        backwardsCompatibility: false,
        backgroundColor: Color(0xff6B5ECD),
        elevation: 5,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 14.sp,
        ),
      ),
      scaffoldBackgroundColor: Color(0xffF5F6F9),
      backgroundColor: Color(0xffFFFFFF),
      accentColor: Color(0xff6B5ECD),
      shadowColor: Color(0xff0000000d),
      buttonColor: Colors.white,
      focusColor: Color(0xff6B5ECD),
      textTheme: TextTheme(
        headline1: GoogleFonts.openSans(
            fontSize: 95.sp, fontWeight: FontWeight.w300, letterSpacing: -1.5),
        headline2: GoogleFonts.openSans(
            fontSize: 59.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5),
        headline3:
            GoogleFonts.openSans(fontSize: 48, fontWeight: FontWeight.w400),
        headline4: GoogleFonts.openSans(
            fontSize: 34.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        headline5:
            GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w400),
        headline6: GoogleFonts.openSans(
            fontSize: 20.sp, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        subtitle1: GoogleFonts.openSans(
            fontSize: 16.sp, fontWeight: FontWeight.w400, letterSpacing: 0.15),
        subtitle2: GoogleFonts.openSans(
            fontSize: 14.sp, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        bodyText1: GoogleFonts.openSans(
            fontSize: 16.sp, fontWeight: FontWeight.w400, letterSpacing: 0.5),
        bodyText2: GoogleFonts.openSans(
            fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        button: GoogleFonts.openSans(
            fontSize: 14.sp, fontWeight: FontWeight.w500, letterSpacing: 1.25),
        caption: GoogleFonts.openSans(
            fontSize: 12.sp, fontWeight: FontWeight.w400, letterSpacing: 0.4),
        overline: GoogleFonts.openSans(
            fontSize: 10.sp, fontWeight: FontWeight.w400, letterSpacing: 1.5),
      ));

//TODO: change your dark theme data
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    primaryColor: Color(0xff6B5ECD),
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      backgroundColor: Color(0xff1F1D2C),
      elevation: 5,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 14.sp,
      ),
    ),
    scaffoldBackgroundColor: Color(0xff1F1D2C),
    backgroundColor: Color(0xff262837),
    focusColor: Colors.white,
    accentColor: Color(0xff262837),
    shadowColor: Color(0xff0000000d),
    buttonColor: Colors.white,
    textTheme: TextTheme(
        headline1: GoogleFonts.lexendDeca(
          color: Color(0xffE8E8E8),
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        headline2: GoogleFonts.lexendDeca(
          color: Color(0xffE8E8E8),
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        headline4: GoogleFonts.lexendDeca(
          color: Color(0xffE8E8E8),
          fontSize: 10.sp,
        ),
        subtitle1: GoogleFonts.lexendDeca(
          color: Color(0xff9E9E9E),
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
        subtitle2: GoogleFonts.lexendDeca(
          color: Color(0xff9E9E9E),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        )),
  );
}
