import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeData {
  //TODO: change your light theme data
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryColor: const Color(0xff6B5ECD),
    appBarTheme: AppBarTheme(
      // backwardsCompatibility: false,
      backgroundColor: const Color(0xff6B5ECD),
      elevation: 5,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 14.sp,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xffF5F6F9),
    shadowColor: const Color(0xff0000000d),
    focusColor: const Color(0xff6B5ECD),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.openSans(
          fontSize: 95.sp, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: GoogleFonts.openSans(
          fontSize: 59.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall:
          GoogleFonts.openSans(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: GoogleFonts.openSans(
          fontSize: 34.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall:
          GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w400),
      titleLarge: GoogleFonts.openSans(
          fontSize: 20.sp, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: GoogleFonts.openSans(
          fontSize: 16.sp, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: GoogleFonts.openSans(
          fontSize: 14.sp, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: GoogleFonts.openSans(
          fontSize: 16.sp, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.openSans(
          fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      labelLarge: GoogleFonts.openSans(
          fontSize: 14.sp, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: GoogleFonts.openSans(
          fontSize: 12.sp, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: GoogleFonts.openSans(
          fontSize: 10.sp, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
    // colorScheme:
    //     ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff6B5ECD)),
    // colorScheme: const ColorScheme(background: Color(0xffFFFFFF)),
  );

//TODO: change your dark theme data
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryColor: const Color(0xff6B5ECD),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xff1F1D2C),
      elevation: 5,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 14.sp,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xff1F1D2C),
    focusColor: Colors.white,
    shadowColor: const Color(0xff0000000d),
    textTheme: TextTheme(
        displayLarge: GoogleFonts.lexendDeca(
          color: const Color(0xffE8E8E8),
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: GoogleFonts.lexendDeca(
          color: const Color(0xffE8E8E8),
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: GoogleFonts.lexendDeca(
          color: const Color(0xffE8E8E8),
          fontSize: 10.sp,
        ),
        titleMedium: GoogleFonts.lexendDeca(
          color: const Color(0xff9E9E9E),
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: GoogleFonts.lexendDeca(
          color: const Color(0xff9E9E9E),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        )),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff262837)),
    // colorScheme: const ColorScheme(background: Color(0xff262837)),
  );
}
