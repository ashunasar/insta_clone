// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStory _$UserStoryFromJson(Map<String, dynamic> json) => UserStory(
      userId: json['userId'] as String,
      avatar: json['avatar'] as String,
      userName: json['userName'] as String,
      stories: (json['stories'] as List<dynamic>)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserStoryToJson(UserStory instance) => <String, dynamic>{
      'userId': instance.userId,
      'avatar': instance.avatar,
      'userName': instance.userName,
      'stories': instance.stories,
    };
