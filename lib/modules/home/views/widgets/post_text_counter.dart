import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../models/post_actions.dart';

class PostTextCounter extends StatelessWidget {
  const PostTextCounter({
    Key? key,
    required this.type,
    required this.text,
  }) : super(key: key);

  final PostActionIcon type;
  final String text;

  Widget get getPostActionIcon {
    switch (type) {
      case PostActionIcon.heartGradient:
        return Assets.icons.heartIconGradient.svg(width: 27.2.w);
      case PostActionIcon.commentGradient:
        return Assets.icons.messageIconGradient.svg(width: 22.w);
      default:
        return Assets.icons.heartIconGradient.svg(width: 27.2.w);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(30.r)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            getPostActionIcon,
            SizedBox(width: 10.w),
            Text(text, style: GoogleFonts.lexend(fontSize: 19.sp)),
          ]),
    );
  }
}
