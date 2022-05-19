import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/connection/internet_connection_checker_controller.dart';
import 'controllers/internationalization/messages.dart';
import 'controllers/theme/app_theme_data.dart';
import 'controllers/theme/theme_service.dart';
import 'middleware/auth_middleware.dart';
import 'screens/home/home_screen.dart';
import 'screens/splashScreen/splash_screen.dart';
import 'utils/global.dart';
import 'utils/preference.dart';
import 'utils/utils_functions.dart';
import 'widgets/internet_connection_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.load();

  if (kReleaseMode) {
    //TODO: change base url for release mode
    Global.baseurl = "https://reqres.in/";
  } else if (kProfileMode) {
    //TODO: change base url for profile mode

    Global.baseurl = "https://reqres.in/";
  } else {
    //TODO: change base url for debug mode

    Global.baseurl = "http://192.168.29.149:3000";
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Global.designSize,
      builder: (child) => GetMaterialApp(
        onInit: () {
          Get.put<InternetConnectionCheckerController>(
              InternetConnectionCheckerController(),
              permanent: true);

          Get.lazyPut(() => InternetConnectionCheckerController());

          // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
        },
        translations: Messages(),
        locale: UtilFunctions.getLocale(),
        fallbackLocale: Global.fallbackLocale,
        debugShowCheckedModeBanner: false,
        title: Global.appName,
        // theme: AppThemeData.lightTheme,
        // darkTheme: AppThemeData.darkTheme,
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: GoogleFonts.lexend(
                fontSize: 97,
                fontWeight: FontWeight.w300,
                letterSpacing: -1.5,
                color: Colors.red),
            headline2: GoogleFonts.lexend(
                fontSize: 61,
                fontWeight: FontWeight.w300,
                letterSpacing: -0.5,
                color: Colors.red),
            headline3: GoogleFonts.lexend(
                fontSize: 48, fontWeight: FontWeight.w400, color: Colors.red),
            headline4: GoogleFonts.lexend(
                fontSize: 34,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
                color: Colors.red),
            headline5: GoogleFonts.lexend(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.red),
            headline6: GoogleFonts.lexend(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: Colors.red),
            subtitle1: GoogleFonts.lexend(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.15,
            ),
            subtitle2: GoogleFonts.lexend(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                color: Colors.red),
            bodyText1: GoogleFonts.lexend(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: Colors.red),
            bodyText2: GoogleFonts.lexend(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
                color: Colors.white),
            button: GoogleFonts.lexend(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.25,
                color: Colors.red),
            caption: GoogleFonts.lexend(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.4,
                color: const Color(0xff969696)),
            overline: GoogleFonts.lexend(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
                color: Colors.red),
          ),
        ),
        themeMode: ThemeService().getThemeMode(),
        home: InternetConnectionChecker(child: SplashScreen()),
        getPages: [
          GetPage(
              name: '/home_screen',
              page: () => HomeScreen(),
              transition: Transition.rightToLeftWithFade,
              middlewares: [AuthMiddleware()]),
          // GetPage(
          //     name: '/comment_screen',
          //     page: () => CommentScreen(),
          //     transition: Transition.rightToLeftWithFade,
          //     middlewares: [AuthMiddleware()]),
        ],
      ),
    );
  }
}
