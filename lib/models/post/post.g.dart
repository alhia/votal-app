// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    id: json['id'] as String?,
    creatorId: json['creatorId'] as String,
    displayProfile: json['displayProfile'] as bool,
    fileUrl: json['fileUrl'] as String,
    likesCount: json['likesCount'] as int?,
    likes: (json['likes'] as List<dynamic>?)
        ?.map((e) => Like.fromJson(e as Map<String, dynamic>))
        .toList(),
    caption: json['caption'] as String?,
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'displayProfile': instance.displayProfile,
      'fileUrl': instance.fileUrl,
      'likesCount': instance.likesCount,
      'likes': instance.likes,
      'caption': instance.caption,
    };
