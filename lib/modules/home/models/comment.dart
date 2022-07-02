import 'package:json_annotation/json_annotation.dart';
part 'comment.g.dart';

@JsonSerializable()
class Comment {
  String cId;
  String avatar;
  String userFullName;
  String comment;

  Comment({
    required this.cId,
    required this.avatar,
    required this.userFullName,
    required this.comment,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
