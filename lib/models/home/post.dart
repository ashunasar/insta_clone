import 'package:json_annotation/json_annotation.dart';

import 'comment.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
  String pId;
  String pImage;
  String profilePic;
  String userFullName;
  String pCaption;
  String avatar;
  List<Comment> comments;

  Post(
      {required this.pId,
      required this.pImage,
      required this.profilePic,
      required this.userFullName,
      required this.pCaption,
      required this.avatar,
      required this.comments});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
