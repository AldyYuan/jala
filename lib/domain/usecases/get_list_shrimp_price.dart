import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/core/interfaces/base_usecase.dart';
import 'package:jala/domain/entities/shrimp_price_entity.dart';
import 'package:jala/domain/repositories/shrimp_price_repository.dart';

@injectable
class GetListShrimpPrice extends BaseUseCase<List<ShrimpPriceEntity>, GetListShrimpPriceParams> {
  final ShrimpPriceRepository repository;

  GetListShrimpPrice(this.repository);

  @override
  Future<Either<Failure, List<ShrimpPriceEntity>>> call(GetListShrimpPriceParams params) async {
    return await repository.getListShrimpPrice(page: params.page, perPage: params.perPage, regionId: params.regionId);
  }
}

class GetListShrimpPriceParams extends Equatable {
  final int perPage;
  final int page;
  final String regionId;

  const GetListShrimpPriceParams({
    this.perPage = 20,
    this.page = 1,
    this.regionId = '',
  });

  @override
  List<Object?> get props => [perPage, page];
}
