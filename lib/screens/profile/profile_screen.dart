// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_clone/controllers/profile/profile_screen_controller.dart';

import '../../gen/assets.gen.dart';
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
                      imageUrl: 'http://192.168.0.102:8000/image/v_cover.png',
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
                  height: 556.77.h,
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
                                      image: DecorationImage(
                                          image: Svg(
                                              'assets/icons/story_border.svg'))),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 7.w),
                                  child: CircleAvatar(
                                      radius: 46.r,
                                      backgroundImage: CachedNetworkImageProvider(
                                          'http://192.168.0.102:8000/image/profile_pic_v.jpeg'))),
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
                        children: [
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
                            Assets.icons.view.svg(),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 53.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Assets.icons.addStoryWithoutGradientBg.svg(),
                            HighlightWidget(
                                imagePath:
                                    'http://192.168.0.102:8000/image/highlight1.jpeg'),
                            HighlightWidget(
                                imagePath:
                                    'http://192.168.0.102:8000/image/highlight2.jpeg'),
                            HighlightWidget(
                                imagePath:
                                    'http://192.168.0.102:8000/image/highlight3.jpeg'),
                            HighlightWidget(
                                imagePath:
                                    'http://192.168.0.102:8000/image/highlight4.jpeg'),
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
                                          style:
                                              TextStyle(color: Colors.grey))));
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 408.h,
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        children: [
                          Container(color: Colors.red),
                          Container(color: Colors.blue),
                          Container(color: Colors.green),
                          Container(color: Colors.pink),
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

class HighlightWidget extends StatelessWidget {
  const HighlightWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 60.w,
      decoration: BoxDecoration(
          border: Border.all(
            width: 4.h,
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(30.r)),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(28.r)),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
