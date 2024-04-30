import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int id;
  final int authorId;
  final int categoryId;
  final String image;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String title;
  final String seoTitle;
  final String excerpt;
  final String body;
  final String slug;
  final String metaDescription;
  final String metaKeywords;

  const PostEntity({
    required this.id,
    required this.authorId,
    required this.categoryId,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.seoTitle,
    required this.excerpt,
    required this.body,
    required this.slug,
    required this.metaDescription,
    required this.metaKeywords,
  });

  @override
  List<Object?> get props => [
        id,
        authorId,
        categoryId,
        image,
        status,
        createdAt,
        updatedAt,
        title,
        seoTitle,
        excerpt,
        body,
        slug,
        metaDescription,
        metaKeywords,
      ];
}
