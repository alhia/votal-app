// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Like _$_$_LikeFromJson(Map<String, dynamic> json) {
  return _$_Like(
    id: json['id'] as String,
    userId: json['userId'] as String,
    likedPostId: json['likedPostId'] as String,
    isDislike: json['isDislike'] as bool,
  );
}

Map<String, dynamic> _$_$_LikeToJson(_$_Like instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'likedPostId': instance.likedPostId,
      'isDislike': instance.isDislike,
    };
