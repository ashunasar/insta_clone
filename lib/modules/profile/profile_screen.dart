import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collection/collection.dart';
import 'package:insta_clone/modules/profile/models/teb_text.dart';
import '../../gen/assets.gen.dart';
import 'controller/profile_screen_controller.dart';
import 'post_list_view/post_list_view.dart';
import 'profile_view/profile_view.dart';
import 'widgets/highlight_widget.dart';
import 'widgets/text_count_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProfileScreenController());
  final containerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return SafeArea(
      child: GetBuilder(builder: (ProfileScreenController _) {
        return Material(
          child: Stack(children: [
            Positioned(
                top: 0,
                left: 0,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://images-serve.onrender.com/image/v_cover.png',
                      fit: BoxFit.cover,
                      width: width,
                      height: 369.23.h,
                    ),
                  ],
                )),
            Container(
              color: Colors.grey.withOpacity(controller.opacity),
              width: width,
              height: 369.23.h,
            ),
            Positioned(
                top: controller.whiteBgPositionFromTop,
                child: Container(
                  height: 556.77.h + controller.profileContentheight,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r)),
                  ),
                )),
            SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    SizedBox(height: 306.h),
                    SizedBox(
                        height: 100.h,
                        width: width,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 164.w,
                                  padding: EdgeInsets.only(top: 24.h),
                                  child: Text('Kim Taehyung',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold)))),
                              Container(
                                  height: 100.h,
                                  width: 100.w,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      image: const DecorationImage(
                                          image: Svg(
                                              'assets/icons/story_border.svg'))),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 7.w),
                                  child: CircleAvatar(
                                      radius: 46.r,
                                      backgroundImage:
                                          const CachedNetworkImageProvider(
                                              'https://images-serve.onrender.com/image/profile_pic_v.jpeg'))),
                              Container(
                                  width: 164.w,
                                  padding: EdgeInsets.only(top: 24.h),
                                  child: Text('@kimyung',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold)))),
                            ])),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          TextCountWidget(count: '76', title: 'Posts'),
                          TextCountWidget(count: '1.2K', title: 'Followers'),
                          TextCountWidget(count: '38', title: 'Following'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 38.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Assets.icons.editIcon.svg(),
                            Assets.icons.addIcon.svg(),
                            Assets.icons.setting.svg(),
                            InkWell(
                                onTap: () {
                                  Get.to(() => ProfileView());
                                },
                                child: Assets.icons.view.svg()),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 53.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Assets.icons.addStoryWithoutGradientBg.svg(),
                            const HighlightWidget(
                                imagePath:
                                    'https://images-serve.onrender.com/image/highlight/highlight1.jpeg'),
                            const HighlightWidget(
                                imagePath:
                                    'https://images-serve.onrender.com/image/highlight/highlight2.jpeg'),
                            const HighlightWidget(
                                imagePath:
                                    'https://images-serve.onrender.com/image/highlight/highlight3.jpeg'),
                            const HighlightWidget(
                                imagePath:
                                    'https://images-serve.onrender.com/image/highlight/highlight4.jpeg'),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.tabsText.map((e) {
                          return InkWell(
                              onTap: () {
                                controller.updateSelectedTabText(e);
                              },
                              child: SizedBox(
                                  height: 41.h,
                                  child: e == controller.selectedTabText
                                      ? Column(children: [
                                          ShaderMask(
                                              blendMode: BlendMode.srcIn,
                                              shaderCallback: (bounds) =>
                                                  controller
                                                      .tabLabelGradient
                                                      .createShader(
                                                          Rect.fromLTWH(
                                                              0,
                                                              0,
                                                              bounds.width,
                                                              bounds.height)),
                                              child: Text(e.lable)),
                                          SizedBox(height: 8.h),
                                          Container(
                                              height: 3.h,
                                              width: 13.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.5.r),
                                                  gradient: controller
                                                      .tabLabelGradient))
                                        ])
                                      : Text(e.lable,
                                          style: const TextStyle(
                                              color: Colors.grey))));
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: controller.profileContentheight,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Visibility(
                              visible: controller.selectedTabText.type ==
                                  TabType.photos,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() =>
                                              const PostListView(initPage: 0));
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          child: CachedNetworkImage(
                                            height: 269.h,
                                            width: 269.w,
                                            imageUrl:
                                                controller.profileImages.first,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Column(children: [
                                        if (controller.profileImages.length >=
                                            2)
                                          InkWell(
                                            onTap: () {
                                              Get.to(() => const PostListView(
                                                  initPage: 1));
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              child: CachedNetworkImage(
                                                height: 128.h,
                                                width: 128.w,
                                                imageUrl:
                                                    controller.profileImages[1],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        SizedBox(height: 12.h),
                                        if (controller.profileImages.length >=
                                            3)
                                          InkWell(
                                            onTap: () {
                                              Get.to(() => const PostListView(
                                                  initPage: 2));
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              child: CachedNetworkImage(
                                                height: 128.h,
                                                width: 128.w,
                                                imageUrl:
                                                    controller.profileImages[2],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                      ]),
                                    ],
                                  ),
                                  SizedBox(height: 11.h),
                                  Wrap(
                                    spacing: 12.w,
                                    runSpacing: 11.h,
                                    children: controller.profileImages
                                        .skip(3)
                                        .mapIndexed((i, e) => InkWell(
                                              onTap: () {
                                                // Get.to(() => PostListView(
                                                //     initPage: i + 3));
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                child: CachedNetworkImage(
                                                  height: 128.h,
                                                  width: 126.w,
                                                  imageUrl: e,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Wrap(
                                spacing: 10.w,
                                runSpacing: 20.h,
                                children: controller.reals
                                    .map((e) => Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              child: CachedNetworkImage(
                                                height: 270.h,
                                                width: 199.w,
                                                imageUrl: e.contentUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              left: 10.w,
                                              bottom: 10.h,
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.play_arrow,
                                                      color: Colors.white),
                                                  SizedBox(width: 9.w),
                                                  Text(e.viewsCount)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              )),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Wrap(
                                spacing: 10.w,
                                runSpacing: 20.h,
                                children: controller.videos
                                    .map((e) => Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              child: CachedNetworkImage(
                                                height: 199.h,
                                                width: 199.w,
                                                imageUrl: e.contentUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              left: 10.w,
                                              bottom: 10.h,
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.play_arrow,
                                                      color: Colors.white),
                                                  SizedBox(width: 9.w),
                                                  Text(e.viewsCount)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Wrap(
                              spacing: 12.w,
                              runSpacing: 11.h,
                              children: controller.tags
                                  .map((e) => ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        child: CachedNetworkImage(
                                          height: 128.h,
                                          width: 126.w,
                                          imageUrl: e,
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: controller.showAppbar,
              child: Container(
                  height: 46.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 20.h),
                        blurRadius: 40.r,
                        color: const Color(0xff7090B0).withOpacity(0.25),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Assets.icons.arrowBackGradient.svg(),
                      Text('Kim Taehyung',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold))),
                      Assets.icons.settingIconGradient.svg(),
                    ],
                  )),
            ),
          ]),
        );
      }),
    );
  }
}
