import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jala/domain/entities/region_entity.dart';
import 'package:jala/domain/usecases/get_list_region.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'shrimp_region_filter_event.dart';
part 'shrimp_region_filter_state.dart';

class ShrimpRegionFilterBloc extends Bloc<ShrimpRegionFilterEvent, ShrimpRegionFilterState> {
  // Refresh Controller
  final RefreshController refreshController = RefreshController(initialRefresh: true);

  // Text Editing Controller
  final TextEditingController txtSearch = TextEditingController();
  Timer? _debounce;

  final GetListRegion getListRegion;

  ShrimpRegionFilterBloc(this.getListRegion) : super(const ShrimpRegionFilterState()) {
    on<ShrimpRegionFilterGet>(_onShrimpPriceRegionFilterGet);
    on<ShrimpRegionFilterSearch>(_onShrimpPriceRegionFilterSearch);
  }

  Future<void> _onShrimpPriceRegionFilterGet(
    ShrimpRegionFilterGet event,
    Emitter<ShrimpRegionFilterState> emit,
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

    emit(state.copyWith(status: ShrimpRegionFilterStatus.loading));

    var either = await getListRegion(
      GetListRegionParams(
        page: state.page,
        search: txtSearch.text,
      ),
    );

    either.fold(
      (l) {
        emit(state.copyWith(status: ShrimpRegionFilterStatus.failure));

        if (refreshController.isRefresh) refreshController.refreshFailed();
        if (refreshController.isLoading) refreshController.loadFailed();
      },
      (r) {
        final List<RegionEntity> result = r;

        emit(state.copyWith(
          status: ShrimpRegionFilterStatus.success,
          data: List.of(state.data)..addAll(result),
          page: state.page + 1,
        ));

        if (refreshController.isRefresh) refreshController.refreshCompleted();
        if (refreshController.isLoading && result.isNotEmpty) refreshController.loadComplete();
        if (refreshController.isLoading && result.isEmpty) refreshController.loadNoData();
      },
    );
  }

  Future<void> _onShrimpPriceRegionFilterSearch(
    ShrimpRegionFilterSearch event,
    Emitter<ShrimpRegionFilterState> emit,
  ) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      refreshController.requestRefresh();
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
