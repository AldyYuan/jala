import 'package:dartz/dartz.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/domain/entities/region_entity.dart';

abstract class RegionRepository {
  Future<Either<Failure, List<RegionEntity>>> getListRegion({
    String search = '',
    int page = 1,
  });
}
