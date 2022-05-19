import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../enums/post_actions.dart';
import '../../../gen/assets.gen.dart';

class PostAction extends StatelessWidget {
  const PostAction({
    required this.icon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final PostActionIcon icon;
  final VoidCallback? onTap;

  Widget get getIcon {
    switch (icon) {
      case PostActionIcon.heart:
        return Assets.icons.heartIcon.svg(height: 18.h, width: 20.w);

      case PostActionIcon.comment:
        return Assets.icons.commentIcon.svg(height: 24.h, width: 24.w);

      case PostActionIcon.save:
        return Assets.icons.saveIcon.svg(height: 22.h, width: 18.w);

      case PostActionIcon.share:
        return Assets.icons.shareIcon.svg(height: 24.h, width: 24.w);
      case PostActionIcon.heartGradient:
        return Assets.icons.hearIconGradient.svg(height: 18.h, width: 20.w);

      case PostActionIcon.commentGradient:
        return Assets.icons.heartIcon.svg(height: 18.h, width: 20.w);
      case PostActionIcon.saveGradient:
        return Assets.icons.heartIcon.svg(height: 18.h, width: 20.w);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            const Color(0xFFEFE5D4),
            const Color(0xFFEFE5D4).withOpacity(0)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 5.r,
              blurRadius: 35.r,
            ),
          ],
        ),
        child: Center(child: getIcon),
      ),
    );
  }
}
