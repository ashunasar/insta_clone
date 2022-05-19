import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    openNextScreen();
    super.onInit();
  }

  void openNextScreen() async {
    Future.delayed(Duration.zero, () {
      // Get.offAll(() => ());

      // if (Preference.containsKey(Constants.ACCESS_TOKEN)) {}
      Get.offAllNamed('home_screen');
    });
  }
}
