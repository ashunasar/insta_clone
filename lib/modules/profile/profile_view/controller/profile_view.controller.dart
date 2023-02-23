import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileViewController extends GetxController {
  late PageController scrollController = PageController();
  List<String> profileViewImages = [
    'https://images-serve.onrender.com/image/view/v_first.jpeg',
    'https://images-serve.onrender.com/image/view/v2.jpeg',
    'https://images-serve.onrender.com/image/view/v3.jpeg',
    'https://images-serve.onrender.com/image/view/v4.jpeg',
    'https://images-serve.onrender.com/image/view/v5.jpeg',
  ];
  String profileImg =
      'https://images-serve.onrender.com/image/profile_pic_v.jpeg';

  RxInt currentPosition = RxInt(0);

  void updateCurrentPosition(int i) {
    currentPosition(i);
    update();
  }

  // void updatePagePosition() {
  //   controller.
  // }
}
