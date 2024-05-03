import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/core/interfaces/base_usecase.dart';
import 'package:jala/domain/entities/region_entity.dart';
import 'package:jala/domain/repositories/region_repository.dart';

@injectable
class GetListRegion extends BaseUseCase<List<RegionEntity>, GetListRegionParams> {
  final RegionRepository repository;

  GetListRegion(this.repository);

  @override
  Future<Either<Failure, List<RegionEntity>>> call(GetListRegionParams params) async {
    return await repository.getListRegion(
      search: params.search,
      page: params.page,
    );
  }
}

class GetListRegionParams extends Equatable {
  final String search;
  final int page;

  const GetListRegionParams({
    this.search = '',
    this.page = 1,
  });

  @override
  List<Object?> get props => [search];
}
