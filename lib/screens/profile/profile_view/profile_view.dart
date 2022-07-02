import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/profile_view.controller.dart';
import 'physics/custom_page_view_scroll_physics.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  final controller = Get.put(ProfileViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (ProfileViewController _) {
      return Scaffold(
          body: Stack(
        children: [
          PageView.builder(
              itemCount: _.profileViewImages.length,
              physics: const CustomPageViewScrollPhysics(),
              controller: _.scrollController,
              onPageChanged: _.updateCurrentPosition,
              itemBuilder: (BuildContext context, int i) {
                return CachedNetworkImage(
                  imageUrl: _.profileViewImages[i],
                  fit: BoxFit.cover,
                  placeholder: (context, i) {
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              }),
          Positioned(
              top: 50.h,
              right: 10.w,
              child: Row(
                  children: _.profileViewImages.mapIndexed((i, e) {
                return Obx(() => AnimatedContainer(
                      margin: const EdgeInsets.only(right: 5),
                      width: i == _.currentPosition.value ? 30.w : 15.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5.r),
                        color: i == _.currentPosition.value
                            ? Colors.white
                            : Colors.white.withOpacity(0.3),
                      ),
                      duration: const Duration(milliseconds: 300),
                    ));
              }).toList())),
          Positioned(
            top: 481.h,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                int sensitivity = 8;
                if (details.delta.dx > sensitivity) {
                  _.scrollController.previousPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                } else if (details.delta.dx < -sensitivity) {
                  _.scrollController.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                }
              },
              child: Container(
                color: Colors.transparent,
                width: 307.w,
                padding: EdgeInsets.only(left: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: CachedNetworkImage(
                              height: 30.h,
                              width: 30.h,
                              imageUrl: _.profileImg,
                              fit: BoxFit.cover)),
                      SizedBox(width: 12.w),
                      Text('@thv',
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp)))
                    ]),
                    Text(
                      'Kim Taehyung',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 56.sp,
                      ),
                    ),
                    SizedBox(height: 21.h),
                    Text(
                        'Singer | Model | Actor \nHomesexual 🏳️‍🌈\nCoffee sucks \nEveryone, jiminie pabo \nBts Army 💜',
                        style: TextStyle(fontSize: 20.sp)),
                    SizedBox(height: 10.w),
                    Row(children: [
                      const Icon(Icons.location_on, color: Colors.white),
                      Text(
                        'Daegu,South Korea',
                        style: GoogleFonts.teko(
                            textStyle: TextStyle(fontSize: 20.sp)),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ));
    });
  }
}
