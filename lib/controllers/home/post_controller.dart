import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/models/home/comment.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../models/home/post.dart';

class PostController extends GetxController {
  final Post post;
  PostController({required this.post});
  bool isPostActionOpned = false;
  void changePostAction({bool? val}) {
    isPostActionOpned = val ?? !isPostActionOpned;
    update();
  }

  bool postLiking = false;
  bool heartAnimating = false;
  bool postLiked = false;

  void postLikingAction() {
    postLiked = true;
    postLiking = true;
    heartAnimating = true;
    update();
  }

  void postDislike() {
    if (postLiked) {
      postLiked = false;
    } else {
      postLikingAction();
    }
    update();
  }

  void postDislikingAction() {
    Future.delayed(const Duration(milliseconds: 100), () {
      postLiking = false;
      heartAnimating = false;
      update();
    });
  }

  PaletteGenerator? paletteGenerator;
  Future<void> updatePaletteGenerator(
    ImageProvider image,
  ) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      image,
      maximumColorCount: 6,
    );
    update();
  }

  Color pickedColor = const Color(0xff07BBDF);

  Color get backgroundColor {
    int count = 0;
    if (pickedColor.red > 240) {
      count++;
    }
    if (pickedColor.green > 240) {
      count++;
    }
    if (pickedColor.blue > 240) {
      count++;
    }
    if (count < 3) {
      return pickedColor;
    }
    return Colors.red;
  }

  TextEditingController commentController = TextEditingController();
  void addComment() {
    post.comments.add(Comment(
        cId: 'commentIdRandom',
        avatar: post.avatar,
        userFullName: post.userFullName,
        comment: commentController.text));
    commentController.clear();
    update();
  }

  @override
  void onInit() {
    updatePaletteGenerator(
        CachedNetworkImageProvider(post.pImage, maxHeight: 510, maxWidth: 380));
    super.onInit();
  }

  List<String> selectedUsers = [];

  void addSelectedUser(String name) {
    selectedUsers.add(name);
    update();
  }

  void sharePost() {
    Get.back();
    Get.snackbar('Message', 'Post has been shared to selected users',
        snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
    selectedUsers.clear();
    update();
  }
}
