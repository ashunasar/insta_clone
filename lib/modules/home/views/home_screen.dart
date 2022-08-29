import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/assets.gen.dart';
import '../../profile/profile_screen.dart';
import '../controllers/home_screen_controller.dart';
import '../models/comment.dart';
import '../models/post.dart';
import 'widgets/post_widget.dart';
import 'widgets/story_widgert.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                          style: GoogleFonts.satisfy(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                              letterSpacing: 2,
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
                          pImage:
                              'http://192.168.0.101:8000/image/posts/post.jpeg',
                          profilePic:
                              'http://192.168.0.101:8000/image/posts/post.jpeg',
                          userFullName: 'Jenny Wilson',
                          avatar:
                              'assets/images/man working on laptop and talking on the phone.png',
                          pCaption:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum..',
                          postedDate: 'Yesterday',
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
                          bgColor: const Color.fromRGBO(226, 215, 233, 1),
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId2',
                          pImage:
                              'http://192.168.0.101:8000/image/posts/post1.jpeg',
                          profilePic:
                              'http://192.168.0.101:8000/image/posts/post1.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                          bgColor: const Color.fromRGBO(24, 45, 53, 1),
                          postedDate: 'Yesterday',
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId3',
                          pImage:
                              'http://192.168.0.101:8000/image/posts/post2.jpeg',
                          profilePic:
                              'http://192.168.0.101:8000/image/posts/post2.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                          bgColor: const Color.fromRGBO(5, 9, 15, 1),
                          postedDate: 'Yesterday',
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId4',
                          pImage:
                              'http://192.168.0.101:8000/image/posts/post3.jpeg',
                          profilePic:
                              'http://192.168.0.101:8000/image/posts/post3.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                          bgColor: const Color.fromRGBO(49, 52, 66, 1),
                          postedDate: 'Yesterday',
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId5',
                          pImage:
                              'http://192.168.0.101:8000/image/posts/post4.jpeg',
                          profilePic:
                              'http://192.168.0.101:8000/image/posts/post4.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                          bgColor: const Color.fromRGBO(207, 188, 151, 1),
                          postedDate: 'Yesterday',
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId6',
                          pImage:
                              'http://192.168.0.101:8000/image/posts/post5.jpeg',
                          profilePic:
                              'http://192.168.0.101:8000/image/posts/post5.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                          bgColor: const Color.fromRGBO(71, 63, 48, 1),
                          postedDate: 'Yesterday',
                        ),
                      ),
                      PostWidget(
                        post: Post(
                          pId: 'postId7',
                          pImage:
                              'http://192.168.0.101:8000/image/posts/post6.jpeg',
                          profilePic:
                              'http://192.168.0.101:8000/image/posts/post6.jpeg',
                          userFullName: 'Emmily Griffin',
                          avatar: 'assets/images/girl with a book.png',
                          pCaption:
                              'Life is like a mirror, we get the best results when we smile.',
                          comments: [],
                          bgColor: const Color.fromRGBO(58, 67, 37, 1),
                          postedDate: 'Yesterday',
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
                    width: 380.w,
                    height: 72.h,
                    // padding: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(
                      color: const Color(0xff000000).withOpacity(0.94),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 72.h,
                            width: 95.w,
                            alignment: Alignment.center,
                            child: Assets.icons.homeIcon
                                .svg(height: 24.h, width: 24.w)),
                        Container(
                            height: 72.h,
                            width: 95.w,
                            alignment: Alignment.center,
                            child: Assets.icons.searchIcon
                                .svg(height: 24.h, width: 24.w)),
                        Container(
                          height: 72.h,
                          width: 95.w,
                          alignment: Alignment.center,
                          child: Assets.icons.notificationIcon
                              .svg(height: 24.h, width: 24.w),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => ProfileScreen());
                          },
                          child: Container(
                              height: 72.h,
                              width: 95.w,
                              alignment: Alignment.center,
                              child: Assets.icons.userIcon
                                  .svg(height: 24.h, width: 24.w)),
                        )
                      ],
                    )),
              ),
            ),
          );
        });
  }
}
