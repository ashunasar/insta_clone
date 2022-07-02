import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/show_stories_controller.dart';
import '../story/story_screen.dart';

class ShowStoriesScreen extends StatelessWidget {
  ShowStoriesScreen({Key? key}) : super(key: key);

  final controller = Get.put(ShowStoriesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GetBuilder(builder: (ShowStoriesController _) {
        return PageView.builder(
            controller: controller.storiesController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.userStories.length,
            itemBuilder: (BuildContext context, int i) =>
                StoryScreen(controller: controller.storyScreenController));
      }),
    );
  }
}
