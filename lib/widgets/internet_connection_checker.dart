import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/connection/internet_connection_checker_controller.dart';
import 'no_internet.dart';

class InternetConnectionChecker extends StatelessWidget {
  final Widget child;
  const InternetConnectionChecker({Key? key, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InternetConnectionCheckerController>(
        init: InternetConnectionCheckerController(),
        builder: (controller) {
          //* display no internet connection widget according to internet status

          return controller.internetStatus ? child : const NoInternetWidget();
        });
  }
}
