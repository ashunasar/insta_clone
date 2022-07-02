import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../home/widgets/post_widget.dart';
import 'controller/post_list_view_controller.dart';

class PostListView extends StatelessWidget {
  const PostListView({Key? key, required this.initPage}) : super(key: key);
  final int initPage;
  // final PostListViewController controller = Get.put();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostListViewController>(
      init: PostListViewController(initPage),
      builder: (_) {
        return Scaffold(
            body: ScrollablePositionedList.builder(
          itemCount: _.posts.length,
          // controller: _.scrollController,
          itemScrollController: _.scrollController,
          itemBuilder: (BuildContext context, int index) {
            return PostWidget(post: _.posts[index]);
          },
          // children: _.posts.map((e) => PostWidget(post: e)).toList())
        ));
      },
    );
  }
}
