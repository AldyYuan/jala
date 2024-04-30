import 'package:jala/core/interfaces/base_model.dart';
import 'package:jala/domain/entities/post_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PostModel extends BaseModel<PostEntity> {
  int? id;
  int? authorId;
  int? categoryId;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? seoTitle;
  String? excerpt;
  String? body;
  String? slug;
  String? metaDescription;
  String? metaKeywords;

  PostModel({
    this.id,
    this.authorId,
    this.categoryId,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.seoTitle,
    this.excerpt,
    this.body,
    this.slug,
    this.metaDescription,
    this.metaKeywords,
  });

  @override
  PostEntity modelToEntity() {
    return PostEntity(
      id: id ?? 0,
      authorId: authorId ?? 0,
      categoryId: categoryId ?? 0,
      image: image ?? '',
      status: status ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      title: title ?? '',
      seoTitle: seoTitle ?? '',
      excerpt: excerpt ?? '',
      body: body ?? '',
      slug: slug ?? '',
      metaDescription: metaDescription ?? '',
      metaKeywords: metaKeywords ?? '',
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
