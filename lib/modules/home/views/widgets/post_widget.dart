// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../gen/assets.gen.dart';
import '../../controllers/post_controller.dart';
import '../../models/post.dart';
import '../../models/post_actions.dart';
import '../comment/comment_screen.dart';
import 'post_action.dart';
import 'share_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    required this.post,
    Key? key,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 27.h),
      child: GetBuilder(
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
                onLongPress: () {
                  Get.bottomSheet(
                      ShareBottomSheet(postController: postController));
                },
                child: Container(
                  height: 597.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 510.h,
                        width: 380.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.h),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: CachedNetworkImage(
                          imageUrl: postController.post.pImage,
                          fit: BoxFit.cover,
                          placeholder: (BuildContext contexdt, String s) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ),
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
                              child: Assets.icons.heartIconGradient.svg(
                                width: 106.w,
                                height: 91.h,
                              ),
                            ),
                          )),
                      getPostAction(postController),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                            width: 380.w,
                            height: 597.h - 510.h,
                            child: Row(children: [
                              Container(
                                  margin:
                                      EdgeInsets.only(left: 18.w, right: 15.w),
                                  height: 45.h,
                                  width: 45.w,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(25.r)),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          postController.post.profilePic)),
                              Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(postController.post.userFullName,
                                        style: GoogleFonts.oleoScriptSwashCaps(
                                            fontSize: 16.sp)),
                                    Text(postController.post.postedDate,
                                        style: GoogleFonts.lexend(
                                            fontSize: 12.sp,
                                            color: Color(0xff969696))),
                                  ]),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  postController.showPostDetails();
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 40.w,
                                  color: Colors.transparent,
                                  margin: EdgeInsets.only(right: 15.w),
                                  child: Center(
                                    child: Assets.icons.moreDetails.svg(),
                                  ),
                                ),
                              )
                            ])),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
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
                  child: CachedNetworkImage(
                    imageUrl: postController.post.profilePic,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const CircularProgressIndicator(),
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
          PostAction(
              icon: PostActionIcon.share,
              onTap: () {
                Get.bottomSheet(
                    ShareBottomSheet(postController: postController));
              }),
        ]),
      ),
    );
  }
}

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({
    Key? key,
    required this.postController,
  }) : super(key: key);

  final PostController postController;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 7.w),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 11.h),
      height: 371.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFFFBFB).withOpacity(0.5),
            Color(0xffFFFBFB).withOpacity(0),
          ],
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 0),
              color: const Color(0xffffffff).withOpacity(0.25),
              blurRadius: 24.r,
              // spreadRadius: 5.r,
              blurStyle: BlurStyle.inner)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Share', style: theme.textTheme.headline5),
          SizedBox(height: 12.h),
          Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.r),
            ),
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(
                    color: Color(0xff969696), fontWeight: FontWeight.w100),
                contentPadding: EdgeInsets.only(left: 28.w, top: 13.h),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Assets.icons.searchIconGradient.svg(),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 19.w,
            runSpacing: 16.h,
            children: [
              ShareWidget(
                  imagePath: 'assets/images/share_1.png',
                  name: 'Gourav',
                  postController: postController),
              ShareWidget(
                  imagePath: 'assets/images/share_2.png',
                  name: 'Sandeep',
                  postController: postController),
              ShareWidget(
                  imagePath: 'assets/images/share_3.png',
                  name: 'Sagar',
                  postController: postController),
              ShareWidget(
                  imagePath: 'assets/images/share_4.png',
                  name: 'Abhishek',
                  postController: postController),
              ShareWidget(
                  imagePath: 'assets/images/share_5.png',
                  name: 'Arunima',
                  postController: postController),
              ShareWidget(
                  imagePath: 'assets/images/share_6.png',
                  name: 'Rahul',
                  postController: postController),
              ShareWidget(
                  imagePath: 'assets/images/share_7.png',
                  name: 'Sami',
                  postController: postController),
              ShareWidget(
                  imagePath: 'assets/images/share_8.png',
                  name: 'Siddhart',
                  postController: postController),
              ShareWidget(
                  imagePath: 'assets/images/share_9.png',
                  name: 'Vaihav',
                  postController: postController),
              ShareWidget(
                  imagePath: 'assets/images/share_10.png',
                  name: 'Ayesha',
                  postController: postController),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                postController.sharePost();
              },
              child: Text('Share',
                  style:
                      theme.textTheme.caption!.copyWith(color: Colors.white)),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(108.w, 35.h)),
                backgroundColor: MaterialStateProperty.all(Color(0xff6B5ECD)),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
