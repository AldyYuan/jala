import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/core/interfaces/base_usecase.dart';
import 'package:jala/domain/entities/post_entity.dart';
import 'package:jala/domain/repositories/post_repository.dart';

@injectable
class GetListPost extends BaseUseCase<List<PostEntity>, GetListPostParams> {
  final PostRepository repository;

  GetListPost(this.repository);

  @override
  Future<Either<Failure, List<PostEntity>>> call(GetListPostParams params) async {
    return await repository.getListPost(page: params.page, perPage: params.perPage);
  }
}

class GetListPostParams extends Equatable {
  final int perPage;
  final int page;

  const GetListPostParams({
    this.perPage = 20,
    this.page = 1,
  });

  @override
  List<Object?> get props => [perPage, page];
}
