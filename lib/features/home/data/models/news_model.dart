import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/news.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const NewsModel._();

  const factory NewsModel({
    @JsonKey(name: '_id') required String id,
    required String title,
    required String content,
    List<String>? media,
    required DateTime createdAt,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);

  News toEntity() => News(
    id: id,
    title: title,
    content: content,
    imageUrl: media?.isNotEmpty == true ? media!.first : null,
    createdAt: createdAt,
  );
}
