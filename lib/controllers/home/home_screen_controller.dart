import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/api.dart';
import '../../utils/app_logger.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() async {
    //* save token value when widget gets initilized
    // Preference.setString(Constants.TOKEN, 'Asim');
    // await userData();
    super.onInit();
  }

  //* codes for todo List

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // hit api reqeust

  Future addTask() async {
    Get.defaultDialog(
      barrierDismissible: false,
      title: "Adding Task...",
      content: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Color(0xff6B5ECD)),
      ),
    );
    try {
//* storeing api response in res
      await UserApi().addTask(titleController.text, descriptionController.text);
      titleController.clear();
      descriptionController.clear();
      Get.back();
    } on DioError catch (e) {
      titleController.clear();
      descriptionController.clear();
      Get.back();

      //* logging error message
      AppLogger.print(e.message);
    }
  }

  String email = '';
  String userId = '';
  Future userData() async {
    debugPrint('called this ');
    var res = await UserApi().userData();
    email = res.data['email'];
    userId = res.data['userId'];

    update();
  }
}
