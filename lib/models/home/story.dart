import 'package:insta_clone/enums/story_type.dart';
import 'package:json_annotation/json_annotation.dart';
part 'story.g.dart';

@JsonSerializable()
class Story {
  String sId;
  String contentUrl;
  StoryType type;

  Story({required this.sId, required this.contentUrl, required this.type});

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  Map<String, dynamic> toJson() => _$StoryToJson(this);
}
