import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/core/interfaces/base_usecase.dart';
import 'package:jala/domain/entities/disease_entity.dart';
import 'package:jala/domain/repositories/disease_repository.dart';

class GetListDisease extends BaseUseCase<List<DiseaseEntity>, GetListDiseaseParams> {
  final DiseaseRepository repository;

  GetListDisease(this.repository);

  @override
  Future<Either<Failure, List<DiseaseEntity>>> call(GetListDiseaseParams params) async {
    return await repository.getListDisease(page: params.page, perPage: params.perPage);
  }
}

class GetListDiseaseParams extends Equatable {
  final int perPage;
  final int page;

  const GetListDiseaseParams({
    this.perPage = 20,
    this.page = 1,
  });

  @override
  List<Object?> get props => [perPage, page];
}
