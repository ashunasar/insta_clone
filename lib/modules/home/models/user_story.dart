import 'package:json_annotation/json_annotation.dart';

import 'story.dart';
part 'user_story.g.dart';

@JsonSerializable()
class UserStory {
  String userId;
  String avatar;
  String userName;
  List<Story> stories;

  UserStory(
      {required this.userId,
      required this.avatar,
      required this.userName,
      required this.stories});

  factory UserStory.fromJson(Map<String, dynamic> json) =>
      _$UserStoryFromJson(json);

  Map<String, dynamic> toJson() => _$UserStoryToJson(this);
}
