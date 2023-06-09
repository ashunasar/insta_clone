import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:readmore/readmore.dart';

import '../models/comment.dart';
import '../models/post.dart';
import '../models/post_actions.dart';
import '../views/widgets/post_text_counter.dart';

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

  void showPostDetails() {
    Get.dialog(
      Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          // height: 224.h,
          width: 380.w,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          child: Material(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.userFullName,
                            style: GoogleFonts.oleoScriptSwashCaps(
                                fontSize: 20.sp),
                          ),
                          SizedBox(height: 6.h),
                          Text(post.postedDate,
                              style: GoogleFonts.lexend(
                                color: const Color(0xff969696),
                                fontSize: 14.sp,
                              )),
                        ]),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.cancel))
                  ],
                ),
                SizedBox(height: 14.h),
                ReadMoreText(
                  post.pCaption,
                  trimLines: 4,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: GoogleFonts.lexend(fontSize: 16.sp),
                ),
                SizedBox(height: 14.h),
                ReadMoreText(
                  '#fashion #joy #lifestyle',
                  textAlign: TextAlign.left,
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: GoogleFonts.lexend(fontSize: 16.sp),
                ),
                SizedBox(height: 14.h),
                Row(children: [
                  const PostTextCounter(
                    text: '27.5K',
                    type: PostActionIcon.heartGradient,
                  ),
                  SizedBox(width: 10.w),
                  const PostTextCounter(
                    text: '652',
                    type: PostActionIcon.commentGradient,
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
