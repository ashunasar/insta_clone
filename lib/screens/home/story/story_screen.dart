import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../gen/assets.gen.dart';
import '../comment/widget/custom_circle_avatar.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(
                width: 428.w,
                child: CachedNetworkImage(
                    imageUrl: 'http://192.168.29.149:8000/image/lisa1.jpeg',
                    placeholder: (context, s) {
                      return const Center(child: CircularProgressIndicator());
                    },
                    fit: BoxFit.fitWidth)),
            Positioned(
                top: 8.h,
                right: 10.w,
                child: Column(children: [
                  Container(
                    height: 30.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5.r),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    height: 15.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    height: 15.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ])),
            Positioned(
              bottom: 20.h,
              child: SizedBox(
                width: 428.w,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomCircleAvatar(
                          bgColor: const Color(0xffC9DAE7),
                          avatar:
                              'assets/images/man working on laptop and talking on the phone.png',
                          width: 45.w,
                          radius: 22.5.r),
                      SizedBox(
                        width: 283.w,
                        height: 45.h,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 16.h, left: 16.w),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Reply to lalalalisa_m.....',
                            hintStyle: theme.textTheme.caption!
                                .copyWith(fontWeight: FontWeight.w200),
                            border: OutlineInputBorder(
                                gapPadding: 0,
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25.r)),
                          ),
                        ),
                      ),
                      Assets.icons.heartIcon.svg(height: 26.h, width: 30.w),
                      Assets.icons.shareIconWithBackground
                          .svg(height: 45.h, width: 45.w),
                    ]),
              ),
            ),
            Positioned(
                left: 14.h,
                bottom: 4.h,
                child: Center(
                  child: Container(
                    height: 5.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(2.5.r),
                    ),
                  ),
                )),
            Positioned(
                left: 14.h,
                bottom: 4.h,
                child: Center(
                  child: Container(
                    height: 5.h,
                    width: 230.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.5.r)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
