import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/post_controller.dart';

class ShareWidget extends StatefulWidget {
  const ShareWidget(
      {required this.imagePath,
      Key? key,
      required this.name,
      required this.postController})
      : super(key: key);
  final String imagePath;
  final String name;
  final PostController postController;

  @override
  State<ShareWidget> createState() => _ShareWidgetState();
}

class _ShareWidgetState extends State<ShareWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          if (isSelected) {
            widget.postController.addSelectedUser(widget.name);
          }
        });
      },
      child: Column(
        children: [
          Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Svg(isSelected
                          ? 'assets/icons/story.svg'
                          : 'assets/icons/story_share.svg'))),
              child: Center(
                  child: Image.asset(
                widget.imagePath,
                height: 39.h,
                width: 39.w,
              ))),
          Text(
            widget.name,
            textAlign: TextAlign.center,
            style: theme.textTheme.caption!.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
