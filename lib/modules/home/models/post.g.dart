// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      pId: json['pId'] as String,
      pImage: json['pImage'] as String,
      profilePic: json['profilePic'] as String,
      userFullName: json['userFullName'] as String,
      pCaption: json['pCaption'] as String,
      avatar: json['avatar'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      bgColor: const ColorSerialiser().fromJson(json['bgColor'] as int),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'pId': instance.pId,
      'pImage': instance.pImage,
      'profilePic': instance.profilePic,
      'userFullName': instance.userFullName,
      'pCaption': instance.pCaption,
      'avatar': instance.avatar,
      'comments': instance.comments,
      'bgColor': const ColorSerialiser().toJson(instance.bgColor),
    };
