// ignore_for_file: prefer_const_constructors

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_clone/screens/home/comment/comment_screen.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../controllers/home/post_controller.dart';
import '../../../enums/post_actions.dart';
import '../../../gen/assets.gen.dart';
import '../../../models/home/post.dart';
import 'post_action.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    required this.post,
    Key? key,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        tag: post.pId,
        init: PostController(post: post),
        builder: (PostController postController) {
          return VisibilityDetector(
            key: Key(postController.post.pId),
            onVisibilityChanged: (visibilityInfo) {
              var visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage < 30) {
                postController.changePostAction(val: false);
              }
            },
            child: InkWell(
              onTap: () {
                postController.changePostAction();
              },
              onDoubleTap: () {
                postController.postLikingAction();
              },
              child: Container(
                height: 510.h,
                width: 380,
                margin: EdgeInsets.only(bottom: 27.h),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(postController.post.pImage),
                  ),
                  borderRadius: BorderRadius.circular(30.h),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        left: 137.w,
                        top: 209.h,
                        child: Opacity(
                          opacity: postController.heartAnimating ? 1 : 0,
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 150),
                            scale: postController.postLiking ? 1 : 0.6,
                            onEnd: () {
                              postController.postDislikingAction();
                            },
                            child: Assets.icons.hearIconGradient.svg(
                              width: 106.w,
                              height: 91.h,
                            ),
                          ),
                        )),
                    getPostAction(postController),
                    getPostCaption(postController),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget getPostCaption(PostController postController) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      left: postController.isPostActionOpned ? 18.w : -500.w,
      top: 394.h,
      child: Container(
        height: 98.h,
        width: 261.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11.r),
            gradient: LinearGradient(colors: [
              const Color(0xffFFFFFF).withOpacity(0.4),
              const Color(0xffFFFFFF).withOpacity(0.4)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  color: const Color(0xff000000).withOpacity(0.25),
                  blurRadius: 35.r,
                  spreadRadius: 5.r,
                  blurStyle: BlurStyle.inner)
            ]),
        child: Padding(
          padding: EdgeInsets.all(7.h),
          child: Column(
            children: [
              Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.5.r),
                  child: Image.asset(
                    postController.post.profilePic,
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
                SizedBox(width: 11.w),
                Text(postController.post.userFullName,
                    style: GoogleFonts.oleoScriptSwashCaps(
                        textStyle:
                            TextStyle(fontSize: 18.sp, color: Colors.white)))
              ]),
              SizedBox(height: 14.h),
              Text(
                postController.post.pCaption,
                style: GoogleFonts.lexend(
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getPostAction(PostController postController) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      left: postController.isPostActionOpned ? 285.w : 500.w,
      top: 74.h,
      child: Container(
        height: 362.h,
        width: 95.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                bottomLeft: Radius.circular(30.r)),
            gradient: LinearGradient(colors: [
              const Color(0xffFFFBFB).withOpacity(0.46),
              const Color(0xffFFFBFB).withOpacity(0.05)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.1),
                  blurRadius: 24.r,
                  blurStyle: BlurStyle.inner)
            ]),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          PostAction(
            icon: postController.postLiked
                ? PostActionIcon.heartGradient
                : PostActionIcon.heart,
            onTap: () {
              postController.postDislike();
            },
          ),
          PostAction(
              icon: PostActionIcon.comment,
              onTap: () {
                Get.to(() => CommentScreen(postController: postController),
                    transition: Transition.rightToLeftWithFade);
              }),
          PostAction(icon: PostActionIcon.save),
          PostAction(icon: PostActionIcon.share),
        ]),
      ),
    );
  }
}
