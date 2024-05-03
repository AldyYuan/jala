import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jala/domain/entities/region_entity.dart';
import 'package:jala/domain/entities/shrimp_price_entity.dart';
import 'package:jala/domain/usecases/get_list_shrimp_price.dart';
import 'package:jala/presentation/shrimp_price_list/dialogs/shrimp_region_filter/page/shrimp_region_filter.dart';
import 'package:jala/presentation/shrimp_price_list/dialogs/shrimp_size_filter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'shrimp_price_list_event.dart';
part 'shrimp_price_list_state.dart';

class ShrimpPriceListBloc extends Bloc<ShrimpPriceListEvent, ShrimpPriceListState> {
  // Refresh Controller
  final RefreshController refreshController = RefreshController(initialRefresh: true);

  final GetListShrimpPrice getListShrimpPrice;

  ShrimpPriceListBloc(this.getListShrimpPrice) : super(const ShrimpPriceListState()) {
    on<ShrimpPriceListGet>(_onShrimpPriceListGet);
    on<ShrimpPriceListFilterSize>(_onShrimpPriceListFilterSize);
    on<ShrimpPriceListFilterRegion>(_onShrimpPriceListFilterRegion);
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
        regionId: state.regionFilter?.id ?? "",
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

  Future<void> _onShrimpPriceListFilterSize(
    ShrimpPriceListFilterSize event,
    Emitter<ShrimpPriceListState> emit,
  ) async {
    var res = await showModalBottomSheet(
      isScrollControlled: true,
      context: event.context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8,
          maxChildSize: 1,
          minChildSize: .5,
          builder: (context, scrollController) {
            return ShrimpSizeFilter(oldSelected: state.shrimpSizeFilter);
          },
        );
      },
    );

    if (res != null) {
      refreshController.requestRefresh();
      emit(state.copyWith(shrimpSizeFilter: res));
    }
  }

  Future<void> _onShrimpPriceListFilterRegion(
    ShrimpPriceListFilterRegion event,
    Emitter<ShrimpPriceListState> emit,
  ) async {
    var res = await showModalBottomSheet(
      isScrollControlled: true,
      context: event.context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8,
          maxChildSize: 1,
          minChildSize: .5,
          builder: (context, scrollController) {
            return ShrimpRegionFilter(oldSelected: state.regionFilter);
          },
        );
      },
    );

    if (res != null) {
      emit(state.copyWith(regionFilter: res is bool ? null : res));
      refreshController.requestRefresh();
    }
  }
}
