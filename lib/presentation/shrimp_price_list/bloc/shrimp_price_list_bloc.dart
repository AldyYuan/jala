import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jala/domain/entities/shrimp_price_entity.dart';
import 'package:jala/domain/usecases/get_list_shrimp_price.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'shrimp_price_list_event.dart';
part 'shrimp_price_list_state.dart';

class ShrimpPriceListBloc extends Bloc<ShrimpPriceListEvent, ShrimpPriceListState> {
  // Refresh Controller
  final RefreshController refreshController = RefreshController(initialRefresh: true);

  final GetListShrimpPrice getListShrimpPrice;

  ShrimpPriceListBloc({required this.getListShrimpPrice}) : super(const ShrimpPriceListState()) {
    on<ShrimpPriceListGet>(_onShrimpPriceListGet);
  }

  Future<void> _onShrimpPriceListGet(
    ShrimpPriceListGet event,
    Emitter<ShrimpPriceListState> emit,
  ) async {
    // Refresh
    if (refreshController.isRefresh) {
      refreshController.resetNoData();
      emit(
        state.copyWith(
          data: [],
          page: 1,
        ),
      );
    }

    emit(state.copyWith(status: ShrimpPriceListStatus.loading));

    var either = await getListShrimpPrice(
      GetListShrimpPriceParams(
        page: state.page,
        regionId: '',
      ),
    );

    either.fold(
      (l) {
        emit(state.copyWith(status: ShrimpPriceListStatus.failure));

        if (refreshController.isRefresh) refreshController.refreshFailed();
        if (refreshController.isLoading) refreshController.loadFailed();
      },
      (r) {
        final List<ShrimpPriceEntity> result = r;

        emit(state.copyWith(
          status: ShrimpPriceListStatus.success,
          data: List.of(state.data)..addAll(result),
          page: state.page + 1,
        ));

        if (refreshController.isRefresh) refreshController.refreshCompleted();
        if (refreshController.isLoading && result.isNotEmpty) refreshController.loadComplete();
        if (refreshController.isLoading && result.isEmpty) refreshController.loadNoData();
      },
    );
  }
}
