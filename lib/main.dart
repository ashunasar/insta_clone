import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakelock/wakelock.dart';
import 'config/environment.dart';
import 'internationalization/messages.dart';
import 'modules/splash_screen/view/splash_screen.dart';
import 'routes/pages.routes.dart';
import 'services/theme/app_theme_data.dart';
import 'services/theme/theme_service.dart';
import 'shared/widgets/internet_connection_checker.dart';
import 'utils/global.dart';
import 'utils/preference.dart';
import 'utils/utils_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.load();

  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: "DEV",
  );
  Environment.instance().initConfig(environment);

  Global.host = Environment.instance().config.host;

  Wakelock.enable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Global.designSize,
      builder: (context, child) => GetMaterialApp(
        translations: Messages(),
        locale: UtilFunctions.getLocale(),
        fallbackLocale: Global.fallbackLocale,
        debugShowCheckedModeBanner: false,
        title: Global.appName,
        // theme: AppThemeData.lightTheme,
        // darkTheme: AppThemeData.darkTheme,
        // themeMode: ThemeService().getThemeMode(),
        home: InternetConnectionChecker(child: SplashScreen()),
        getPages: Routes.pages,
      ),
    );
  }
}
