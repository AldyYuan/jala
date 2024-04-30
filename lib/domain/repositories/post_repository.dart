import 'package:dartz/dartz.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getListPost({int perPage = 20, int page = 1});
}
