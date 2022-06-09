import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/models/home/story.dart';

import '../../enums/story_type.dart';
import '../../models/home/user_story.dart';
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
            contentUrl: 'http://192.168.0.106:8000/image/story1.jpeg',
            type: StoryType.image),
        Story(
            sId: '2',
            contentUrl: 'http://192.168.0.106:8000/image/story2.jpeg',
            type: StoryType.image),
        Story(
            sId: '3',
            contentUrl: 'http://192.168.0.106:8000/image/story3.jpeg',
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
            contentUrl: 'http://192.168.0.106:8000/image/story4.jpeg',
            type: StoryType.image),
        Story(
            sId: '5',
            contentUrl: 'http://192.168.0.106:8000/image/story5.jpeg',
            type: StoryType.image),
        Story(
            sId: '6',
            contentUrl: 'http://192.168.0.106:8000/image/story6.jpeg',
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
            contentUrl: 'http://192.168.0.106:8000/image/story7.jpeg',
            type: StoryType.image),
        Story(
            sId: '8',
            contentUrl: 'http://192.168.0.106:8000/image/story8.jpeg',
            type: StoryType.image),
        Story(
            sId: '9',
            contentUrl: 'http://192.168.0.106:8000/image/story9.jpeg',
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
