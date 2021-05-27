import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';
part 'like.g.dart';

@freezed
abstract class Like implements _$Like {
  Like._();

  factory Like({
    required String id,
    required String userId,
    required String likedPostId,
    required bool isDislike,
  }) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);

  factory Like.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Like.fromJson(data).copyWith(id: doc.id);
  }
}
