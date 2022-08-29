import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileViewController extends GetxController {
  late PageController scrollController = PageController();
  List<String> profileViewImages = [
    'http://192.168.0.101:8000/image/view/v_first.jpeg',
    'http://192.168.0.101:8000/image/view/v2.jpeg',
    'http://192.168.0.101:8000/image/view/v3.jpeg',
    'http://192.168.0.101:8000/image/view/v4.jpeg',
    'http://192.168.0.101:8000/image/view/v5.jpeg',
  ];
  String profileImg = 'http://192.168.0.101:8000/image/profile_pic_v.jpeg';

  RxInt currentPosition = RxInt(0);

  void updateCurrentPosition(int i) {
    currentPosition(i);
    update();
  }

  // void updatePagePosition() {
  //   controller.
  // }
}
