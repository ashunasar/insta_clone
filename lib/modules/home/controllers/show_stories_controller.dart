import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/story.dart';
import '../models/story_type.dart';
import '../models/user_story.dart';
import 'story_screen_controller.dart';

class ShowStoriesController extends GetxController {
  PageController storiesController = PageController();

  StoryScreenController storyScreenController =
      Get.put(StoryScreenController());

  @override
  void onInit() {
    storyScreenController.resetAll(userStories.first);
    storiesController.addListener(() {
      updateCurrentPageValue(storiesController.page!.toInt());
    });
    super.onInit();
  }

  List<UserStory> userStories = [
    UserStory(
      avatar: '',
      stories: [
        Story(
            sId: '1',
            contentUrl:
                'https://images.unsplash.com/photo-1495430288918-03be19c7c485?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=jpeg&fit=crop&w=2787&q=80',
            type: StoryType.image),
        Story(
            sId: '2',
            contentUrl:
                'https://images.unsplash.com/photo-1505322022379-7c3353ee6291?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=jpeg&fit=crop&w=1500&q=80',
            type: StoryType.image),
        Story(
            sId: '3',
            contentUrl:
                'https://images.unsplash.com/photo-1532767153582-b1a0e5145009?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=jpeg&fit=crop&w=2814&q=80',
            type: StoryType.image)
      ],
      userId: '',
      userName: '',
    ),
    UserStory(
      avatar: '',
      stories: [
        Story(
            sId: '4',
            contentUrl:
                'https://images.unsplash.com/photo-1654222182084-9128dbf0fa7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=jpeg&fit=crop&w=2787&q=80',
            type: StoryType.image),
        Story(
            sId: '5',
            contentUrl:
                'https://images.unsplash.com/photo-1638722238710-11aaf1794804?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=jpeg&fit=crop&w=2787&q=80',
            type: StoryType.image),
        Story(
            sId: '6',
            contentUrl:
                'https://images.unsplash.com/photo-1634295912158-9c847b6b3a40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=jpeg&fit=crop&w=2787&q=80',
            type: StoryType.image)
      ],
      userId: '',
      userName: '',
    ),
    UserStory(
      avatar: '',
      stories: [
        Story(
            sId: '7',
            contentUrl:
                'https://images.unsplash.com/photo-1635333496622-1df7af1d392c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=jpeg&fit=crop&w=2835&q=80',
            type: StoryType.image),
        Story(
            sId: '8',
            contentUrl:
                'https://images.unsplash.com/photo-1637420989235-a84f81d3d077?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=jpeg&fit=crop&w=3027&q=80',
            type: StoryType.image),
        Story(
            sId: '9',
            contentUrl:
                'https://images.unsplash.com/photo-1628067630818-fa3e19d96b27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=jpeg&fit=crop&w=2160&q=80',
            type: StoryType.image)
      ],
      userId: '',
      userName: '',
    ),
  ];

  int currentPageValue = 0;
  updateCurrentPageValue(int page) {
    currentPageValue = page;
    update();
  }
}
