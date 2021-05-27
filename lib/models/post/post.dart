import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:votal_app/models/like/like.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post implements _$Post {
  Post._();

  factory Post({
    String? id,
    required String creatorId,
    required bool displayProfile,
    required String fileUrl,
    int? likesCount,
    List<Like>? likes,
    String? caption,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Post.fromJson(data).copyWith(id: doc.id);
  }
}
