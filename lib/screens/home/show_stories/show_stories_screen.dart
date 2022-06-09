// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/home/show_stories_controller.dart';

import '../story/story_screen.dart';

class ShowStoriesScreen extends StatefulWidget {
  const ShowStoriesScreen({Key? key}) : super(key: key);

  @override
  State<ShowStoriesScreen> createState() => _ShowStoriesScreenState();
}

class _ShowStoriesScreenState extends State<ShowStoriesScreen>
    with SingleTickerProviderStateMixin {
  // final controller = Get.put(ShowStoriesController());
  ShowStoriesController controller = Get.put(ShowStoriesController());

  late AnimationController animationController;
  late Animation transformAnimation;
  @override
  void initState() {
    controller.storyScreenController.resetAll(controller.userStories.first);
    // controller = Get.put(ShowStoriesController());
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    transformAnimation =
        Tween<double>(begin: -0.3, end: 0).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });

    // animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GetBuilder(builder: (ShowStoriesController _) {
        return PageView.builder(
            controller: controller.storiesController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.userStories.length,
            itemBuilder: (BuildContext context, int i) => Stack(
                  children: [
                    Container(
                      // transform: Matrix4.identity()
                      //   ..rotateZ(transformAnimation.value),
                      // color: i % 2 == 0 ? Colors.red : Colors.blue,
                      child: StoryScreen(
                        controller: controller.storyScreenController,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: GestureDetector(
                        onLongPress: () {
                          controller.storyScreenController.stopTimer();
                        },
                        onLongPressEnd: (LongPressEndDetails d) {
                          controller.storyScreenController
                              .startTimer(isResumed: true);
                        },
                        onTap: () async {
                          // controller.storyScreenController
                          //     .removeCurrentUserStory();
                          try {
                            controller.storyScreenController.resetTime();
                            await controller.storyScreenController
                                .resetAll(controller.userStories[i - 1]);
                            controller.storiesController.previousPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeInCirc);
                          } catch (e) {
                            Get.back();
                          }
                          // animationController.reverse();
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 835.h,
                          width: 135.w,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onLongPress: () {
                          controller.storyScreenController.stopTimer();
                        },
                        onLongPressEnd: (LongPressEndDetails d) {
                          controller.storyScreenController
                              .startTimer(isResumed: true);
                        },
                        onTap: () async {
                          // controller.storyScreenController
                          //     .removeCurrentUserStory();
                          // controller.updateCurrentPageValue(
                          //     controller.storiesController.page!.toInt());
                          try {
                            controller.storyScreenController.resetTime();
                            await controller.storyScreenController
                                .resetAll(controller.userStories[i + 1]);
                            controller.storiesController.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeInCirc);
                          } catch (e) {
                            Get.back();
                          }
                          // animationController.forward();
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 835.h,
                          width: 135.w,
                        ),
                      ),
                    ),
                  ],
                ));
      }),
    );
  }
}
