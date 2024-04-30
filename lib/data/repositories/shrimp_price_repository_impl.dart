import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/data/datasource/shrimp_price_datasource.dart';
import 'package:jala/domain/entities/shrimp_price_entity.dart';
import 'package:jala/domain/repositories/shrimp_price_repository.dart';

@Injectable(as: ShrimpPriceRepository)
class ShrimpPriceRepositoryImpl implements ShrimpPriceRepository {
  final ShrimpPriceDataSource dataSource;

  ShrimpPriceRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, ShrimpPriceEntity>> getDetailShrimpPrice({required int id}) async {
    try {
      var result = await dataSource.getDetailShrimpPrice(id: id);
      return Right(result.modelToEntity());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ShrimpPriceEntity>>> getListShrimpPrice({int perPage = 20, int page = 1, String regionId = ''}) async {
    try {
      var result = await dataSource.getListShrimpPrice(perPage: perPage, page: page, regionId: regionId);
      return Right(result.map((e) => e.modelToEntity()).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
