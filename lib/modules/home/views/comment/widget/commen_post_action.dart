import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../models/post_actions.dart';

class CommentPostAction extends StatelessWidget {
  const CommentPostAction({
    required this.icon,
    required this.count,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final PostActionIcon icon;
  final VoidCallback? onTap;
  final int count;

  Widget get getIcon {
    switch (icon) {
      case PostActionIcon.heart:
        return Assets.icons.heartIcon.svg(height: 18.h, width: 20.w);

      case PostActionIcon.comment:
        return Assets.icons.commentIcon.svg(width: 18.w);

      case PostActionIcon.save:
        return Assets.icons.saveIcon.svg(height: 18.h, width: 14.w);

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

  Widget get countText {
    switch (icon) {
      case PostActionIcon.heart:
        return Text('$count Likes');
      case PostActionIcon.heartGradient:
        return Text('$count Likes');
      case PostActionIcon.commentGradient:
        return Text('$count Comments');
      case PostActionIcon.comment:
        return Text('$count Comments');
      case PostActionIcon.save:
        return const Text(' ');
      case PostActionIcon.saveGradient:
        return const Text(' ');
      case PostActionIcon.share:
        return Text('$count Likes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [getIcon, SizedBox(width: 10.w), countText]);
  }
}
