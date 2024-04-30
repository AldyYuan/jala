// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: (json['id'] as num?)?.toInt(),
      authorId: (json['author_id'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      image: json['image'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      title: json['title'] as String?,
      seoTitle: json['seo_title'] as String?,
      excerpt: json['excerpt'] as String?,
      body: json['body'] as String?,
      slug: json['slug'] as String?,
      metaDescription: json['meta_description'] as String?,
      metaKeywords: json['meta_keywords'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'author_id': instance.authorId,
      'category_id': instance.categoryId,
      'image': instance.image,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'title': instance.title,
      'seo_title': instance.seoTitle,
      'excerpt': instance.excerpt,
      'body': instance.body,
      'slug': instance.slug,
      'meta_description': instance.metaDescription,
      'meta_keywords': instance.metaKeywords,
    };
