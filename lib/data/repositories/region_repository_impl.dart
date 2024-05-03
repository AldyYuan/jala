import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/data/datasource/region_datasource.dart';
import 'package:jala/domain/entities/region_entity.dart';
import 'package:jala/domain/repositories/region_repository.dart';

@Injectable(as: RegionRepository)
class RegionRepositoryImpl implements RegionRepository {
  final RegionDataSource dataSource;

  RegionRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<RegionEntity>>> getListRegion({
    String search = '',
    int page = 1,
  }) async {
    try {
      var result = await dataSource.getListRegion(
        search: search,
        page: page,
      );
      return Right(result.map((e) => e.modelToEntity()).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
