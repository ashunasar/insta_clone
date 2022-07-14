import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'comment.dart';
part 'post.g.dart';

@JsonSerializable(includeIfNull: true)
class Post {
  String pId;
  String pImage;
  String profilePic;
  String userFullName;
  String pCaption;
  String avatar;
  List<Comment> comments;
  String postedDate;
  @ColorSerialiser()
  Color bgColor;

  Post({
    required this.pId,
    required this.pImage,
    required this.profilePic,
    required this.userFullName,
    required this.pCaption,
    required this.avatar,
    required this.comments,
    required this.bgColor,
    required this.postedDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

class ColorSerialiser implements JsonConverter<Color, int> {
  const ColorSerialiser();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}
