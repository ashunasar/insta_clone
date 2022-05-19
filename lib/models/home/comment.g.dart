// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      cId: json['cId'] as String,
      avatar: json['avatar'] as String,
      userFullName: json['userFullName'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'cId': instance.cId,
      'avatar': instance.avatar,
      'userFullName': instance.userFullName,
      'comment': instance.comment,
    };
