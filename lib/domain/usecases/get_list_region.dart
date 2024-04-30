import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/core/interfaces/base_usecase.dart';
import 'package:jala/domain/entities/region_entity.dart';
import 'package:jala/domain/repositories/region_repository.dart';

class GetListRegion extends BaseUseCase<List<RegionEntity>, GetListRegionParams> {
  final RegionRepository repository;

  GetListRegion(this.repository);

  @override
  Future<Either<Failure, List<RegionEntity>>> call(GetListRegionParams params) async {
    return await repository.getListRegion(search: params.search);
  }
}

class GetListRegionParams extends Equatable {
  final String search;

  const GetListRegionParams({
    this.search = '',
  });

  @override
  List<Object?> get props => [search];
}
