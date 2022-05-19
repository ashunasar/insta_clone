import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  bool isAuthenticated = false;

  Future<bool> fakeDelay() async {
    Future.delayed(Duration(seconds: 1), () {
      return true;
    });
    return true;
  }
}
