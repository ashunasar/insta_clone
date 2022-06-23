import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController();

  late TabController tabController;
  TabText selectedTabText = const TabText(lable: 'Photos', position: 0);
  List<TabText> tabsText = const [
    TabText(lable: 'Photos', position: 0),
    TabText(lable: 'Reels', position: 1),
    TabText(lable: 'Videos', position: 2),
    TabText(lable: 'Tags', position: 3)
  ];

  void updateSelectedTabText(TabText e) {
    selectedTabText = e;

    pageController.animateToPage(e.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
    update();
  }

  final Gradient tabLabelGradient = const LinearGradient(
    colors: <Color>[Color(0xff444EE6), Color(0xff6C0CB8)],
  );

  // .createShader(Rect.fromLTWH(0.0, 0.0, 60.h, 27.0));
  double opacity = 0.0;

  @override
  void onInit() {
    scrollController.addListener(() {
      double currentOpacity = scrollController.offset / 369.23.h;
      if (currentOpacity >= 0.10 && currentOpacity <= 1) {
        opacity = currentOpacity - 0.10;
        update();
      }
    });
    tabController = TabController(vsync: this, length: 4);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class TabText extends Equatable {
  final String lable;
  final int position;
  const TabText({required this.lable, required this.position});

  @override
  List<Object?> get props => [lable, position];
}
