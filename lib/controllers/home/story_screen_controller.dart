import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktoklikescroller/controller.dart';
import 'package:tiktoklikescroller/types.dart';

import '../../models/home/story.dart';
import '../../models/home/user_story.dart';
import '../../utils/app_logger.dart';
import 'show_stories_controller.dart';

class StoryScreenController extends GetxController {
  // ShowStoriesController showStoriesController;
  // StoryScreenController({required this.showStoriesController});
  Controller? scrollController = Controller();
  Timer? storyTimer;
  int storyTicker = 0;
  int storyDuration = 1000;
  int tickerDuration = 10;
  int resumedOn = 0;
  int currentPosition = 0;
  UserStory? currentUserStory;

  @override
  void onInit() {
    // startTimer();
    super.onInit();
  }

  void handleCallbackEvents(ScrollEvent event) async {
    if (currentPosition == 0 && event.direction == ScrollDirection.BACKWARDS) {
      preStory();
    } else if (event.success == ScrollSuccess.SUCCESS) {
      resetTimer();
    } else if (event.success == ScrollSuccess.FAILED_END_OF_LIST) {
      AppLogger.print('end of list bro');

      nextStory();
    }
    currentPosition = scrollController?.getScrollPosition() ?? 0;
    update();
  }

  void startTimer({bool isResumed = false}) {
    if (isResumed) {
      resumedOn = storyTicker;
    } else {
      storyTicker = 0;
    }

    storyTimer =
        Timer.periodic(Duration(milliseconds: tickerDuration), (_) async {
      if (_.tick > (isResumed ? (storyDuration - resumedOn) : storyDuration)) {
        _.cancel();

        if (currentPosition < currentUserStory!.stories.length - 1) {
          if (currentUserStory != null) {
            await cacheImageSingle(
                currentUserStory!.stories[currentPosition + 1]);
          }
          scrollController?.animateToPosition(currentPosition + 1);
        } else if (currentPosition == currentUserStory!.stories.length - 1) {
          AppLogger.print('timer to push new screen');
          nextStory();
        }
        return;
      }
      if (isResumed) {
        storyTicker = resumedOn + _.tick;
      } else {
        storyTicker = _.tick;
      }
      update();
    });
  }

  void resetTime() {
    storyTimer?.cancel();
    storyTimer = null;
    storyTicker = 0;
    storyDuration = 1000;
    tickerDuration = 10;
    resumedOn = 0;
    update();
  }

  void resetTimer() {
    // storyTicker = 0;
    // storyTimer?.cancel();
    // resumedOn = 0;
    resetTime();
    startTimer();
  }

  void stopTimer() {
    storyTimer?.cancel();
  }

  Future<void> nextStory() async {
    resetTime();
    try {
      ShowStoriesController showStoriesController =
          Get.find<ShowStoriesController>();
      showStoriesController.storiesController.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInCirc);

      await showStoriesController.storyScreenController.resetAll(
          showStoriesController
              .userStories[showStoriesController.currentPageValue + 1]);
    } catch (e) {
      AppLogger.print(e);
      Get.back();
    }
  }

  Future<void> preStory() async {
    resetTime();
    ShowStoriesController showStoriesController =
        Get.find<ShowStoriesController>();
    try {
      await showStoriesController.storyScreenController.resetAll(
          showStoriesController
              .userStories[showStoriesController.currentPageValue - 1]);

      showStoriesController.storiesController.previousPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInCirc);
    } catch (e) {
      AppLogger.print(e);
      Get.back();
    }
  }

  // Future<void> cacheImage(UserStory userStory) async {
  //   for (Story i in userStory.stories) {
  //     await precacheImage(NetworkImage(i.contentUrl), Get.context!);
  //   }
  // }

  Future<void> cacheImageSingle(Story story) async {
    await precacheImage(NetworkImage(story.contentUrl), Get.context!);
  }

  Future<void> resetAll(UserStory userStory) async {
    // await cacheImage(userStory);
    removeCurrentUserStory();

    currentUserStory = userStory;
    await cacheImageSingle(currentUserStory!.stories.first);
    scrollController = Controller();
    scrollController?.addListener(handleCallbackEvents);
    resetTime();
    update();
    startTimer();
  }

  void removeCurrentUserStory() {
    currentUserStory = null;
    scrollController = null;
    storyTimer = null;
    storyTicker = 0;
    storyDuration = 1000;
    tickerDuration = 10;
    resumedOn = 0;
    currentPosition = 0;

    update();
  }

  @override
  void dispose() {
    scrollController?.disposeListeners();
    storyTimer?.cancel();
    storyTicker = 0;
    storyDuration = 1000;
    tickerDuration = 10;
    resumedOn = 0;
    currentPosition = 0;
    super.dispose();
  }
}
