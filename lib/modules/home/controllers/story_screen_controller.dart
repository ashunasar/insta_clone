import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:tiktoklikescroller/controller.dart';
import 'package:tiktoklikescroller/types.dart';

import '../../../utils/app_logger.dart';
import '../models/story.dart';
import '../models/user_story.dart';
import 'show_stories_controller.dart';

class StoryScreenController extends GetxController {
  Controller? scrollController = Controller();
  Timer? storyTimer;
  int storyTicker = 0;
  int storyDuration = 1000;
  int tickerDuration = 10;
  int resumedOn = 0;
  int currentPosition = 0;
  UserStory? currentUserStory;
  File? currentStoryFile;
  RxBool canStartTimer = false.obs;

  void handleCallbackEvents(ScrollEvent event) async {
    if (currentPosition == 0 && event.direction == ScrollDirection.BACKWARDS) {
      preStory();
    } else if (event.success == ScrollSuccess.SUCCESS) {
      removeCurrentFile();
      if (canStartTimer.value) {
        canStartTimer.toggle();
      }
    } else if (event.success == ScrollSuccess.FAILED_END_OF_LIST) {
      AppLogger.printLog('end of list bro');
      nextStory();
    }
    currentPosition = scrollController?.getScrollPosition() ?? 0;
    update();
  }

  void startTimer({bool isResumed = false}) {
    if (canStartTimer.value) {
      if (isResumed) {
        resumedOn = storyTicker;
      } else {
        storyTicker = 0;
      }

      storyTimer =
          Timer.periodic(Duration(milliseconds: tickerDuration), (_) async {
        if (_.tick >
            (isResumed ? (storyDuration - resumedOn) : storyDuration)) {
          _.cancel();

          if (currentPosition < currentUserStory!.stories.length - 1) {
            scrollController?.animateToPosition(currentPosition + 1);
          } else if (currentPosition == currentUserStory!.stories.length - 1) {
            AppLogger.printLog('timer to push new screen');
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
    resetTime();
    startTimer();
  }

  void stopTimer() {
    storyTimer?.cancel();
  }

  Future<void> nextStory() async {
    removeCurrentFile();
    resetTime();
    try {
      ShowStoriesController showStoriesController =
          Get.find<ShowStoriesController>();
      await showStoriesController.storyScreenController.resetAll(
          showStoriesController
              .userStories[showStoriesController.currentPageValue + 1]);
      showStoriesController.storiesController.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInCirc);
    } catch (e) {
      AppLogger.printLog(e);
      Get.back();
    }
  }

  Future<void> preStory() async {
    removeCurrentFile();
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
      AppLogger.printLog(e);
      Get.back();
    }
  }

  Future<void> cacheImageSingle(Story story) async {
    if (canStartTimer.value) {
      canStartTimer.toggle();
    }
    currentStoryFile =
        await DefaultCacheManager().getSingleFile(story.contentUrl);
    canStartTimer.toggle();
  }

  Future<void> resetAll(UserStory userStory) async {
    removeCurrentUserStory();
    currentUserStory = userStory;
    scrollController = Controller();
    scrollController?.addListener(handleCallbackEvents);
    update();
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

  void removeCurrentFile() {
    currentStoryFile = null;
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
