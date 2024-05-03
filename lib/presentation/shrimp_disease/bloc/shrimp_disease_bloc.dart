import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jala/domain/entities/disease_entity.dart';
import 'package:jala/domain/usecases/get_list_disease.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'shrimp_disease_event.dart';
part 'shrimp_disease_state.dart';

class ShrimpDiseaseBloc extends Bloc<ShrimpDiseaseEvent, ShrimpDiseaseState> {
  // Refresh Controller
  final RefreshController refreshController = RefreshController();

  final GetListDisease getListDisease;

  ShrimpDiseaseBloc(this.getListDisease) : super(const ShrimpDiseaseState()) {
    on<ShrimpDiseaseGet>(_onShrimpDiseaseGet);
  }

  Future<void> _onShrimpDiseaseGet(
    ShrimpDiseaseGet event,
    Emitter<ShrimpDiseaseState> emit,
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

    emit(state.copyWith(status: ShrimpDiseaseStatus.loading));

    var either = await getListDisease(
      GetListDiseaseParams(
        page: state.page,
      ),
    );

    either.fold(
      (l) {
        emit(state.copyWith(status: ShrimpDiseaseStatus.failure));

        if (refreshController.isRefresh) refreshController.refreshFailed();
        if (refreshController.isLoading) refreshController.loadFailed();
      },
      (r) {
        final List<DiseaseEntity> result = r;

        emit(state.copyWith(
          status: ShrimpDiseaseStatus.success,
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
