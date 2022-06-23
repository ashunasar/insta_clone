import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCountWidget extends StatelessWidget {
  const TextCountWidget({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      width: 62.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 20.h),
            blurRadius: 40.r,
            color: const Color(0xff7090B0).withOpacity(0.25),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(count,
              style: GoogleFonts.lexend(
                textStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
              )),
          SizedBox(height: 8.h),
          Text(title,
              style: GoogleFonts.lexend(
                textStyle: TextStyle(
                  fontSize: 8.sp,
                  color: Color(0xffC7C7C7),
                ),
              )),
        ],
      ),
    );
  }
}
