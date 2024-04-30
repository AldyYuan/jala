import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:jala/core/error/failures.dart';
import 'package:jala/core/interfaces/base_usecase.dart';
import 'package:jala/domain/entities/shrimp_price_entity.dart';
import 'package:jala/domain/repositories/shrimp_price_repository.dart';

@injectable
class GetDetailShrimpPrice extends BaseUseCase<ShrimpPriceEntity, GetDetailShrimpPriceParams> {
  final ShrimpPriceRepository repository;

  GetDetailShrimpPrice(this.repository);

  @override
  Future<Either<Failure, ShrimpPriceEntity>> call(GetDetailShrimpPriceParams params) async {
    return await repository.getDetailShrimpPrice(id: params.id);
  }
}

class GetDetailShrimpPriceParams extends Equatable {
  final int id;

  const GetDetailShrimpPriceParams({required this.id});

  @override
  List<Object?> get props => [id];
}
