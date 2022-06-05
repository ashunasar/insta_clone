import 'dart:async';

import 'package:get/get.dart';
import 'package:tiktoklikescroller/controller.dart';
import 'package:tiktoklikescroller/types.dart';

import '../../utils/app_logger.dart';

class StoryScreenController extends GetxController {
  final Controller scrollController = Controller();
  Timer? storyTimer;
  int storyTicker = 0;
  int storyDuration = 1000;
  int tickerDuration = 10;
  int resumedOn = 0;

  @override
  void onInit() {
    scrollController.addListener(handleCallbackEvents);
    startTimer();
    super.onInit();
  }

  int currentPosition = 0;
  void handleCallbackEvents(ScrollEvent event) {
    currentPosition = scrollController.getScrollPosition();
    if (event.success == ScrollSuccess.SUCCESS) {
      resetTimer();
    }
    if (event.success == ScrollSuccess.FAILED_END_OF_LIST) {
      AppLogger.print('end of list bro');
    }
    update();
  }

  void startTimer() {
    storyTicker = 0;
    storyTimer = Timer.periodic(Duration(milliseconds: tickerDuration), (_) {
      if (_.tick > storyDuration) {
        _.cancel();

        if (currentPosition < imageUrls.length - 1) {
          scrollController.animateToPosition(currentPosition + 1);
        } else if (currentPosition == imageUrls.length - 1) {
          AppLogger.print('timer to push new screen');
        }
        return;
      }
      storyTicker = _.tick;
      update();
    });
  }

  void resetTimer() {
    storyTicker = 0;
    storyTimer?.cancel();
    resumedOn = 0;
    startTimer();
    update();
  }

  void stopTimer() {
    storyTimer?.cancel();
  }

  void resumeTimer() {
    // storyTicker = 0;
    resumedOn = storyTicker;
    storyTimer = Timer.periodic(Duration(milliseconds: tickerDuration), (_) {
      if (_.tick > (storyDuration - resumedOn)) {
        _.cancel();
        if (currentPosition < imageUrls.length - 1) {
          scrollController.animateToPosition(currentPosition + 1);
        } else if (currentPosition == imageUrls.length - 1) {
          AppLogger.print('timer to push new screen');
        }
        return;
      }
      storyTicker = resumedOn + _.tick;
      update();
    });
  }

  List<String> imageUrls = [
    'http://192.168.0.106:8000/image/lisa1.jpeg',
    'http://192.168.0.106:8000/image/lisa2.jpeg',
    'http://192.168.0.106:8000/image/lisa3.jpeg',
    'http://192.168.0.106:8000/image/lisa4.jpeg',
    'http://192.168.0.106:8000/image/lisa5.jpeg',
  ];
  @override
  void dispose() {
    scrollController.disposeListeners();
    storyTimer?.cancel();
    super.dispose();
  }
}
