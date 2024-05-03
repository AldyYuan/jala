import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jala/domain/entities/shrimp_price_entity.dart';
import 'package:jala/domain/usecases/get_detail_shrimp_price.dart';

part 'shrimp_price_detail_event.dart';
part 'shrimp_price_detail_state.dart';

class ShrimpPriceDetailBloc extends Bloc<ShrimpPriceDetailEvent, ShrimpPriceDetailState> {
  final GetDetailShrimpPrice getDetailShrimpPrice;

  ShrimpPriceDetailBloc(this.getDetailShrimpPrice) : super(const ShrimpPriceDetailState()) {
    on<ShrimpPriceDetailGet>(_onShrimpPriceDetailGet);
  }

  Future<void> _onShrimpPriceDetailGet(
    ShrimpPriceDetailGet event,
    Emitter<ShrimpPriceDetailState> emit,
  ) async {
    emit(state.copyWith(status: ShrimpPriceDetailStatus.loading));

    var either = await getDetailShrimpPrice(
      GetDetailShrimpPriceParams(
        id: event.id,
      ),
    );

    either.fold(
      (l) {
        emit(state.copyWith(status: ShrimpPriceDetailStatus.failure));
      },
      (r) {
        emit(state.copyWith(
          status: ShrimpPriceDetailStatus.success,
          data: r,
        ));
      },
    );
  }
}
