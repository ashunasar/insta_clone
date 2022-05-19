import 'package:get/get.dart';

class InternetConnectionCheckerController extends GetxController {
  //* variable for check internet status default it will be true
  bool internetStatus = true;

  //* update internet status
  updateInternetStatus({required bool status}) {
    internetStatus = status;

    update();
  }
}
