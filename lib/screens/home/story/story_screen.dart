import 'package:collection/collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

import '../../../controllers/home/story_screen_controller.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/app_logger.dart';
import '../comment/widget/custom_circle_avatar.dart';

class StoryScreen extends StatelessWidget {
  StoryScreen({Key? key}) : super(key: key);
  final StoryScreenController controller = Get.put(StoryScreenController());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder(
        // init: controller,
        builder: (StoryScreenController _) {
      return Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              SizedBox(
                  width: 428.w,
                  child: GestureDetector(
                    onLongPress: () {
                      controller.stopTimer();
                    },
                    onLongPressEnd: (LongPressEndDetails d) {
                      controller.resumeTimer();
                    },
                    child: TikTokStyleFullPageScroller(
                        contentSize: controller.imageUrls.length,
                        swipeVelocityThreshold: 2000,
                        animationDuration: const Duration(milliseconds: 200),
                        controller: controller.scrollController,
                        builder: (BuildContext context, int i) {
                          return CachedNetworkImage(
                              imageUrl: controller.imageUrls[i],
                              placeholder: (context, s) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              },
                              fit: BoxFit.fitWidth);
                        }),
                  )),
              Positioned(
                  top: 35.h,
                  right: 10.w,
                  child: Column(
                      children: controller.imageUrls.mapIndexed((i, e) {
                    return AnimatedContainer(
                      margin: const EdgeInsets.only(bottom: 5),
                      height: i == controller.currentPosition ? 30.h : 15.h,
                      width: 15.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5.r),
                        color: i == controller.currentPosition
                            ? Colors.white
                            : Colors.white.withOpacity(0.3),
                      ),
                      duration: const Duration(milliseconds: 300),
                    );
                  }).toList())),
              Positioned(
                bottom: 20.h,
                child: SizedBox(
                  width: 428.w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCircleAvatar(
                            bgColor: const Color(0xffC9DAE7),
                            avatar:
                                'assets/images/man working on laptop and talking on the phone.png',
                            width: 45.w,
                            radius: 22.5.r),
                        SizedBox(
                          width: 283.w,
                          height: 45.h,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 16.h, left: 16.w),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Reply to lalalalisa_m.....',
                              hintStyle: theme.textTheme.caption!
                                  .copyWith(fontWeight: FontWeight.w200),
                              border: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(25.r)),
                            ),
                          ),
                        ),
                        Assets.icons.heartIcon.svg(height: 26.h, width: 30.w),
                        Assets.icons.shareIconWithBackground
                            .svg(height: 45.h, width: 45.w),
                      ]),
                ),
              ),
              Positioned(
                  left: 14.h,
                  bottom: 4.h,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5.r)),
                    height: 5.h,
                    width: 400.w,
                    clipBehavior: Clip.antiAlias,
                    child: LinearProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        value:
                            controller.storyTicker / controller.storyDuration),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
