import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_clone/controllers/home/post_controller.dart';
import '../../../enums/post_actions.dart';
import '../../../gen/assets.gen.dart';
import '../../../models/home/comment.dart';
import 'widget/commen_post_action.dart';
import 'widget/custom_circle_avatar.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({required this.postController, Key? key})
      : super(key: key);
  final PostController postController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Builder(builder: (context) {
      return GetBuilder(
          init: postController,
          builder: (PostController postController) {
            return Scaffold(
              backgroundColor: const Color(0xffE9EDF1),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 58.h,
                          width: 428.w,
                          color: postController.paletteGenerator?.colors.last,
                          padding: EdgeInsets.only(top: 24.h, left: 24.h),
                          alignment: Alignment.topLeft,
                          child: Assets.icons.arrowBackGradient.svg(
                            height: 16.h,
                            width: 32.w,
                          ),
                        ),
                        Container(
                          height: 433.h,
                          width: 428.w,
                          padding: EdgeInsets.only(
                              top: 11.h, left: 59.w, right: 59.w),
                          decoration: BoxDecoration(
                              color:
                                  postController.paletteGenerator?.colors.last,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.r),
                                bottomRight: Radius.circular(30.r),
                              )),
                          child: Column(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),
                              child: Image.asset(
                                postController.post.pImage,
                                width: 310.w,
                                height: 359.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 22.h),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CommentPostAction(
                                      icon: PostActionIcon.heart, count: 10),
                                  CommentPostAction(
                                      icon: PostActionIcon.comment,
                                      count:
                                          postController.post.comments.length),
                                  const CommentPostAction(
                                      icon: PostActionIcon.save, count: 0)
                                ]),
                          ]),
                        ),
                        SizedBox(height: 55.h),
                        for (Comment i in postController.post.comments)
                          ListTile(
                            leading: CustomCircleAvatar(
                              bgColor:
                                  postController.paletteGenerator!.colors.last,
                              avatar: i.avatar,
                              width: 56.w,
                              radius: 28.r,
                            ),
                            title: Text(i.userFullName),
                            subtitle: Text(i.comment),
                            trailing: Assets.icons.heartIcon.svg(),
                          ),
                        SizedBox(height: 75.h),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0, child: Bottom(postController: postController)),
                ],
              ),
            );
          });
    }));
  }
}

class Bottom extends StatelessWidget {
  const Bottom({
    Key? key,
    required this.postController,
  }) : super(key: key);

  final PostController postController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 428.w,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: postController.paletteGenerator!.colors.last.withOpacity(0.6),
      ),
      child: Center(
        child: Container(
            height: 45.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCircleAvatar(
                    bgColor: postController.paletteGenerator!.colors.last,
                    avatar: postController.post.avatar,
                    width: 25.w,
                    radius: 12.5.r,
                  ),
                  Center(
                    child: SizedBox(
                      width: 254.w,
                      height: 26.h,
                      child: TextField(
                        controller: postController.commentController,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Add a comment...',
                          hintStyle: TextStyle(
                              color: Color(0xff969696),
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      postController.addComment();
                    },
                    child: Assets.icons.shareIconWithBackground
                        .svg(height: 25.h, width: 25.w),
                  )
                ])),
      ),
    );
  }
}
