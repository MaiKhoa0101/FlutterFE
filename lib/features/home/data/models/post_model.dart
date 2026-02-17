import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/post.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const PostModel._();

  const factory PostModel({
    @JsonKey(name: '_id') required String id,
    required String content,
    List<String>? media,
    UserModel? userInfo,
    required DateTime createdAt,
    @Default(0) int likes,
    @Default(0) int comments,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  Post toEntity() {
    // FIX: Check null + check empty trước khi lấy first
    String? mediaUrl;
    if (media != null && media!.isNotEmpty) {
      mediaUrl = media!.first;
    }

    return Post(
      id: id,
      content: content,
      imageUrl: mediaUrl,
      authorName: userInfo?.name ?? 'Anonymous',
      authorAvatar: userInfo?.avatarURL,
      createdAt: createdAt,
      likes: likes,
      comments: comments,
    );
  }
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: '_id') required String id,
    required String name,
    String? avatarURL,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
