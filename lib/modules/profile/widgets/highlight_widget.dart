import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
