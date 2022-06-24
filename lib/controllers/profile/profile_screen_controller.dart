import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late ScrollController scrollController = ScrollController();
  late PageController pageController = PageController();

  late TabController tabController;
  late TabText selectedTabText;
  late List<TabText> tabsText;

  void updateSelectedTabText(TabText e) {
    selectedTabText = e;

    pageController.animateToPage(e.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
    update();
  }

  final Gradient tabLabelGradient = const LinearGradient(
      colors: <Color>[Color(0xff444EE6), Color(0xff6C0CB8)]);

  double opacity = 0.0;
  double whiteBgPositionFromTopConst = 356.h;
  double whiteBgPositionFromTop = 356.h;
  bool showAppbar = false;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      double currentOpacity = scrollController.offset / 369.23.h;
      if (currentOpacity >= 0.10 && currentOpacity <= 1) {
        opacity = currentOpacity - 0.10;
      }
      if (scrollController.offset > whiteBgPositionFromTopConst) {
        showAppbar = true;
      } else {
        showAppbar = false;
      }
      whiteBgPositionFromTop =
          whiteBgPositionFromTopConst - scrollController.offset;
      update();
    });
    tabController = TabController(vsync: this, length: 4);
    selectedTabText = const TabText(lable: 'Photos', position: 0);
    tabsText = const [
      TabText(lable: 'Photos', position: 0),
      TabText(lable: 'Reels', position: 1),
      TabText(lable: 'Videos', position: 2),
      TabText(lable: 'Tags', position: 3)
    ];

    update();
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
