import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:insta_clone/modules/home/views/home_screen.dart';

import '../modules/splash_screen/view/splash_screen.dart';

class Routes {
  static const splashRoute = "/";
  static const homeScreenRoute = "/home_screen";

  static final pages = [
    GetPage(name: splashRoute, page: () => SplashScreen()),
    GetPage(name: homeScreenRoute, page: () => const HomeScreen()),
  ];
}
