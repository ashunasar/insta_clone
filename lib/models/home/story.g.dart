// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      sId: json['sId'] as String,
      contentUrl: json['contentUrl'] as String,
      type: $enumDecode(_$StoryTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'sId': instance.sId,
      'contentUrl': instance.contentUrl,
      'type': _$StoryTypeEnumMap[instance.type],
    };

const _$StoryTypeEnumMap = {
  StoryType.image: 'image',
  StoryType.gif: 'gif',
  StoryType.video: 'video',
};
