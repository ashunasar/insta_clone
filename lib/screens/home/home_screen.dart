import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_clone/models/home/post.dart';
import '../../controllers/home/home_screen_controller.dart';
import '../../gen/assets.gen.dart';
import '../../models/home/comment.dart';
import 'widgets/post_widget.dart';
import 'widgets/story_widgert.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  // final HomeScreenController controller = Get.put(HomeScreenController());
  // final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (HomeScreenController controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color(0xffE9EDF1),
              body: Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Row(children: [
                        Assets.icons.addPost.svg(),
                        const Spacer(),
                        Text(
                          'Neotric Vibes',
                          // style: TextStyle(
                          //   color: Colors.black,
                          //   fontSize: 30.sp,
                          //   fontFamily: FontFamily.greatVibes,
                          //   fontWeight: FontWeight.bold,
                          // ),
                          style: GoogleFonts.satisfy(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                              letterSpacing: 2,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Assets.icons.messageIcon.svg()
                      ]),
                      SizedBox(height: 25.h),
                      SizedBox(
                        height: 60.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Assets.icons.addStoryIcon
                                .svg(height: 60.h, width: 100.w),
                            const StoryWidget(
                                imagePath:
                                    'assets/images/man working on laptop and talking on the phone.png'),
                            const StoryWidget(
                                imagePath:
                                    'assets/images/female metis t shirt pose  sunglasses.png'),
                            const StoryWidget(
                                imagePath:
                                    'assets/images/girl with a book.png'),
                            const StoryWidget(
                                imagePath:
                                    'assets/images/man sitting with smartphone.png')
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      PostWidget(
                        post: Post(
                          pId: 'postId1',
                          pImage: 'http://192.168.0.106:8000/image/image.jpeg',
                          profilePic:
                              'http://192.168.0.106:8000/image/image.jpeg',
                          userFullName: 'Jenny Wilson',
                          avatar:
                              'assets/images/man working on laptop and talking on the phone.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [
                            Comment(
                              cId: 'CommentId1',
                              avatar:
                                  'assets/images/man working on laptop and talking on the phone.png',
                              comment:
                                  'Just a random Comment Testing bro......🔥.',
                              userFullName: 'Jenny Wilson',
                            ),
                            Comment(
                              cId: 'CommentId2',
                              avatar:
                                  'assets/images/female metis t shirt pose  sunglasses.png',
                              comment:
                                  'Another random Comment Testing..........',
                              userFullName: 'Emma Watson',
                            ),
                            Comment(
                              cId: 'CommentId3',
                              avatar: 'assets/images/girl with a book.png',
                              comment:
                                  'Another random Comment Testing..........',
                              userFullName: 'Mia Melano',
                            ),
                            Comment(
                              cId: 'CommentId4',
                              avatar:
                                  'assets/images/man sitting with smartphone.png',
                              comment:
                                  'Another random Comment Testing..........',
                              userFullName: 'Eminem',
                            ),
                            Comment(
                              cId: 'CommentId4',
                              avatar:
                                  'assets/images/man sitting with smartphone.png',
                              comment:
                                  'Another random Comment Testing..........',
                              userFullName: 'Eminem',
                            ),
                          ],
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId2',
                          pImage: 'http://192.168.0.106:8000/image/image1.jpeg',
                          profilePic:
                              'http://192.168.0.106:8000/image/image1.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId3',
                          pImage: 'http://192.168.0.106:8000/image/image2.jpeg',
                          profilePic:
                              'http://192.168.0.106:8000/image/image2.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId4',
                          pImage: 'http://192.168.0.106:8000/image/image3.jpeg',
                          profilePic:
                              'http://192.168.0.106:8000/image/image3.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId5',
                          pImage: 'http://192.168.0.106:8000/image/image4.jpeg',
                          profilePic:
                              'http://192.168.0.106:8000/image/image4.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId6',
                          pImage: 'http://192.168.0.106:8000/image/image5.jpeg',
                          profilePic:
                              'http://192.168.0.106:8000/image/image5.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId7',
                          pImage: 'http://192.168.0.106:8000/image/image6.jpeg',
                          profilePic:
                              'http://192.168.0.106:8000/image/image6.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 24.w),
                color: Colors.transparent,
                child: Container(
                    height: 72.h,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(
                      color: const Color(0xff000000).withOpacity(0.94),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Assets.icons.homeIcon.svg(height: 24.h, width: 24.w),
                        Assets.icons.searchIcon.svg(height: 24.h, width: 24.w),
                        Assets.icons.notificationIcon
                            .svg(height: 24.h, width: 24.w),
                        Assets.icons.userIcon.svg(height: 24.h, width: 24.w)
                      ],
                    )),
              ),
            ),
          );
        });
  }
}
