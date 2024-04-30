import 'package:dartz/dartz.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/domain/entities/disease_entity.dart';

abstract class DiseaseRepository {
  Future<Either<Failure, List<DiseaseEntity>>> getListDisease({int perPage = 20, int page = 1});
}
