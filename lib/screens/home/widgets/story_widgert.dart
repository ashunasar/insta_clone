import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../show_stories/show_stories_screen.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({required this.imagePath, Key? key}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(
        //   () => StoryScreen(
        //     id: '23434',
        //   ),
        //   duration: const Duration(milliseconds: 800),
        //   transition: Transition.cupertinoDialog,
        //   fullscreenDialog: true,
        // );
        Get.to(
          () => ShowStoriesScreen(),
          duration: const Duration(milliseconds: 800),
          transition: Transition.cupertinoDialog,
          fullscreenDialog: true,
        );
      },
      child: Container(
          height: 60.h,
          width: 60.w,
          decoration: const BoxDecoration(
            image: DecorationImage(image: Svg('assets/icons/story.svg')),
          ),
          margin: EdgeInsets.only(left: 20.w),
          child: Center(
              child: Image.asset(
            imagePath,
            height: 39.h,
            width: 39.w,
          ))),
    );
  }
}
