import 'package:dartz/dartz.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/domain/entities/shrimp_price_entity.dart';

abstract class ShrimpPriceRepository {
  Future<Either<Failure, List<ShrimpPriceEntity>>> getListShrimpPrice({
    int perPage = 20,
    int page = 1,
    String regionId = '',
  });

  Future<Either<Failure, ShrimpPriceEntity>> getDetailShrimpPrice({
    required int id,
  });
}
