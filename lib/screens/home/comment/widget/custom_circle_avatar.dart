import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar(
      {Key? key,
      required this.avatar,
      required this.bgColor,
      required this.width,
      required this.radius})
      : super(key: key);

  final String avatar;
  final Color bgColor;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(radius)),
        padding: EdgeInsets.all(5.r),
        child: Image.asset(avatar));
  }
}
