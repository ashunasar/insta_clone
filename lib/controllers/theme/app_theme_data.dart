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
      headline1: GoogleFonts.lexendDeca(
        color: Color(0xff424242),
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      headline2: GoogleFonts.lexendDeca(
        color: Color(0xff424242),
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      subtitle2: GoogleFonts.lexendDeca(
        color: Color(0xff9E9E9E),
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      headline4: GoogleFonts.lexendDeca(
        color: Color(0xff424242),
        fontSize: 10.sp,
      ),
      subtitle1: GoogleFonts.lexendDeca(
        color: Color(0xff9E9E9E),
        fontSize: 10.sp,
      ),
    ),
  );

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
