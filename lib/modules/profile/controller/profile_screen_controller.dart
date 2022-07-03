import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_logger.dart';
import '../models/reels.dart';
import '../models/teb_text.dart';
import '../models/video.dart';

class ProfileScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late ScrollController scrollController = ScrollController();
  late PageController pageController = PageController();

  late TabController tabController;
  late TabText selectedTabText;
  late List<TabText> tabsText;

  double profileContentheight = 0;
  void updateSelectedTabText(TabText e) {
    selectedTabText = e;

    pageController.animateToPage(e.position,
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
    setHeight(e);
    update();
  }

  void setHeight(TabText e) {
    if (e.type == TabType.photos) {
      profileContentheight = 269.h + 11.h;
      profileContentheight +=
          (profileImages.skip(3).length / 3).ceil() * (128.h + 11.h);
    }
    if (e.type == TabType.reels) {
      profileContentheight = (reals.length / 2).ceil() * (270.h + 20.h);
    }

    if (e.type == TabType.videos) {
      profileContentheight = (reals.length / 2).ceil() * (199.h + 20.h);
    }
    if (e.type == TabType.tags) {
      profileContentheight = (tags.length / 3).ceil() * (128.h + 11.h);
    }
    update();
  }

  final Gradient tabLabelGradient = const LinearGradient(
      colors: <Color>[Color(0xff444EE6), Color(0xff6C0CB8)]);

  double opacity = 0.0;
  double whiteBgPositionFromTopConst = 356.h;
  double whiteBgPositionFromTop = 356.h;
  bool showAppbar = false;

  List<String> profileImages = [
    'http://192.168.0.100:8000/image/v1.jpeg',
    'http://192.168.0.100:8000/image/v2.jpeg',
    'http://192.168.0.100:8000/image/v3.jpeg',
    'http://192.168.0.100:8000/image/v4.jpeg',
    'http://192.168.0.100:8000/image/v5.jpeg',
    'http://192.168.0.100:8000/image/v6.jpeg',
    'http://192.168.0.100:8000/image/v7.jpeg',
    'http://192.168.0.100:8000/image/v8.jpeg',
    'http://192.168.0.100:8000/image/v9.jpeg',
  ];

  List<String> tags = [
    'http://192.168.0.100:8000/image/v1.jpeg',
    'http://192.168.0.100:8000/image/v2.jpeg',
    'http://192.168.0.100:8000/image/v3.jpeg',
    'http://192.168.0.100:8000/image/v4.jpeg',
    'http://192.168.0.100:8000/image/v5.jpeg',
    'http://192.168.0.100:8000/image/v6.jpeg',
    'http://192.168.0.100:8000/image/v7.jpeg',
    'http://192.168.0.100:8000/image/v8.jpeg',
    'http://192.168.0.100:8000/image/v9.jpeg'
  ];

  List<Reel> reals = [
    Reel(
        id: '1',
        viewsCount: '256K',
        contentUrl: 'http://192.168.0.100:8000/image/v1.jpeg'),
    Reel(
        id: '1',
        viewsCount: '220K',
        contentUrl: 'http://192.168.0.100:8000/image/v2.jpeg'),
    Reel(
        id: '1',
        viewsCount: '358K',
        contentUrl: 'http://192.168.0.100:8000/image/v3.jpeg'),
    Reel(
        id: '1',
        viewsCount: '240K',
        contentUrl: 'http://192.168.0.100:8000/image/v4.jpeg'),
    Reel(
        id: '1',
        viewsCount: '256K',
        contentUrl: 'http://192.168.0.100:8000/image/v5.jpeg'),
    Reel(
        id: '1',
        viewsCount: '220K',
        contentUrl: 'http://192.168.0.100:8000/image/v6.jpeg'),
    Reel(
        id: '1',
        viewsCount: '358K',
        contentUrl: 'http://192.168.0.100:8000/image/v7.jpeg'),
    Reel(
        id: '1',
        viewsCount: '240K',
        contentUrl: 'http://192.168.0.100:8000/image/v8.jpeg'),
  ];

  List<Video> videos = [
    Video(
        id: '1',
        viewsCount: '256K',
        contentUrl: 'http://192.168.0.100:8000/image/v1.jpeg'),
    Video(
        id: '1',
        viewsCount: '220K',
        contentUrl: 'http://192.168.0.100:8000/image/v2.jpeg'),
    Video(
        id: '1',
        viewsCount: '358K',
        contentUrl: 'http://192.168.0.100:8000/image/v3.jpeg'),
    Video(
        id: '1',
        viewsCount: '240K',
        contentUrl: 'http://192.168.0.100:8000/image/v4.jpeg'),
    Video(
        id: '1',
        viewsCount: '256K',
        contentUrl: 'http://192.168.0.100:8000/image/v5.jpeg'),
    Video(
        id: '1',
        viewsCount: '220K',
        contentUrl: 'http://192.168.0.100:8000/image/v6.jpeg'),
    Video(
        id: '1',
        viewsCount: '358K',
        contentUrl: 'http://192.168.0.100:8000/image/v7.jpeg'),
    Video(
        id: '1',
        viewsCount: '240K',
        contentUrl: 'http://192.168.0.100:8000/image/v8.jpeg'),
  ];

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
    selectedTabText =
        const TabText(lable: 'Photos', position: 0, type: TabType.photos);
    tabsText = const [
      TabText(lable: 'Photos', position: 0, type: TabType.photos),
      TabText(lable: 'Reels', position: 1, type: TabType.reels),
      TabText(lable: 'Videos', position: 2, type: TabType.videos),
      TabText(lable: 'Tags', position: 3, type: TabType.tags)
    ];

    profileContentheight = 269.h + 11.h;
    profileContentheight +=
        (profileImages.skip(3).length / 3).ceil() * (128.h + 11.h);
    AppLogger.printLog(
        'calc is ${(profileImages.length / 3).ceil() * (128.h + 11.h)}');

    update();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
