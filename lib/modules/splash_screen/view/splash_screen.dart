import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/global.dart';
import '../controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenController controller = Get.put(SplashScreenController());

  SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              SizedBox(height: 196.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 57.w),
                child: Image.asset(
                  Global.appLogoPath,
                  height: 154.h,
                  width: 246.w,
                ),
              ),
              SizedBox(height: 154.h),
              Text(
                Global.appName,
                style: GoogleFonts.lexendDeca(
                  textStyle: Theme.of(context).textTheme.headline2,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                Global.tagLine,
                style: GoogleFonts.lexendDeca(
                  textStyle: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
