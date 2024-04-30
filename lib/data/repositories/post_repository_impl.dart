import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/data/datasource/post_datasource.dart';
import 'package:jala/domain/entities/post_entity.dart';
import 'package:jala/domain/repositories/post_repository.dart';

@Injectable(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostDataSource dataSource;

  PostRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<PostEntity>>> getListPost({int perPage = 20, int page = 1}) async {
    try {
      var result = await dataSource.getListPost(page: page, perPage: perPage);
      return Right(result.map((e) => e.modelToEntity()).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
