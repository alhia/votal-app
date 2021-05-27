// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {String? id,
      required String creatorId,
      required bool displayProfile,
      required String fileUrl,
      int? likesCount,
      List<Like>? likes,
      String? caption}) {
    return _Post(
      id: id,
      creatorId: creatorId,
      displayProfile: displayProfile,
      fileUrl: fileUrl,
      likesCount: likesCount,
      likes: likes,
      caption: caption,
    );
  }

  Post fromJson(Map<String, Object> json) {
    return Post.fromJson(json);
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  String? get id => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  bool get displayProfile => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  int? get likesCount => throw _privateConstructorUsedError;
  List<Like>? get likes => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String creatorId,
      bool displayProfile,
      String fileUrl,
      int? likesCount,
      List<Like>? likes,
      String? caption});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? creatorId = freezed,
    Object? displayProfile = freezed,
    Object? fileUrl = freezed,
    Object? likesCount = freezed,
    Object? likes = freezed,
    Object? caption = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      displayProfile: displayProfile == freezed
          ? _value.displayProfile
          : displayProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      fileUrl: fileUrl == freezed
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: likesCount == freezed
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>?,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String creatorId,
      bool displayProfile,
      String fileUrl,
      int? likesCount,
      List<Like>? likes,
      String? caption});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? id = freezed,
    Object? creatorId = freezed,
    Object? displayProfile = freezed,
    Object? fileUrl = freezed,
    Object? likesCount = freezed,
    Object? likes = freezed,
    Object? caption = freezed,
  }) {
    return _then(_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      displayProfile: displayProfile == freezed
          ? _value.displayProfile
          : displayProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      fileUrl: fileUrl == freezed
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: likesCount == freezed
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>?,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post extends _Post {
  _$_Post(
      {this.id,
      required this.creatorId,
      required this.displayProfile,
      required this.fileUrl,
      this.likesCount,
      this.likes,
      this.caption})
      : super._();

  factory _$_Post.fromJson(Map<String, dynamic> json) =>
      _$_$_PostFromJson(json);

  @override
  final String? id;
  @override
  final String creatorId;
  @override
  final bool displayProfile;
  @override
  final String fileUrl;
  @override
  final int? likesCount;
  @override
  final List<Like>? likes;
  @override
  final String? caption;

  @override
  String toString() {
    return 'Post(id: $id, creatorId: $creatorId, displayProfile: $displayProfile, fileUrl: $fileUrl, likesCount: $likesCount, likes: $likes, caption: $caption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.creatorId, creatorId) ||
                const DeepCollectionEquality()
                    .equals(other.creatorId, creatorId)) &&
            (identical(other.displayProfile, displayProfile) ||
                const DeepCollectionEquality()
                    .equals(other.displayProfile, displayProfile)) &&
            (identical(other.fileUrl, fileUrl) ||
                const DeepCollectionEquality()
                    .equals(other.fileUrl, fileUrl)) &&
            (identical(other.likesCount, likesCount) ||
                const DeepCollectionEquality()
                    .equals(other.likesCount, likesCount)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(other.caption, caption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(creatorId) ^
      const DeepCollectionEquality().hash(displayProfile) ^
      const DeepCollectionEquality().hash(fileUrl) ^
      const DeepCollectionEquality().hash(likesCount) ^
      const DeepCollectionEquality().hash(likes) ^
      const DeepCollectionEquality().hash(caption);

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostToJson(this);
  }
}

abstract class _Post extends Post {
  factory _Post(
      {String? id,
      required String creatorId,
      required bool displayProfile,
      required String fileUrl,
      int? likesCount,
      List<Like>? likes,
      String? caption}) = _$_Post;
  _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get creatorId => throw _privateConstructorUsedError;
  @override
  bool get displayProfile => throw _privateConstructorUsedError;
  @override
  String get fileUrl => throw _privateConstructorUsedError;
  @override
  int? get likesCount => throw _privateConstructorUsedError;
  @override
  List<Like>? get likes => throw _privateConstructorUsedError;
  @override
  String? get caption => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}
