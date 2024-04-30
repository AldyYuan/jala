import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/data/datasource/disease_datasource.dart';
import 'package:jala/domain/entities/disease_entity.dart';
import 'package:jala/domain/repositories/disease_repository.dart';

@Injectable(as: DiseaseRepository)
class DiseaseRepositoryImpl implements DiseaseRepository {
  final DiseaseDataSource dataSource;

  DiseaseRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<DiseaseEntity>>> getListDisease({int perPage = 20, int page = 1}) async {
    try {
      var result = await dataSource.getListDisease(page: page, perPage: perPage);
      return Right(result.map((e) => e.modelToEntity()).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
