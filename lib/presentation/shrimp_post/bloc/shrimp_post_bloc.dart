import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jala/domain/entities/post_entity.dart';
import 'package:jala/domain/usecases/get_list_post.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'shrimp_post_event.dart';
part 'shrimp_post_state.dart';

class ShrimpPostBloc extends Bloc<ShrimpPostEvent, ShrimpPostState> {
  // Refresh Controller
  final RefreshController refreshController = RefreshController(initialRefresh: true);

  final GetListPost getListPost;

  ShrimpPostBloc(this.getListPost) : super(const ShrimpPostState()) {
    on<ShrimpPostGet>(_onShrimpPostGet);
  }

  Future<void> _onShrimpPostGet(
    ShrimpPostGet event,
    Emitter<ShrimpPostState> emit,
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

    emit(state.copyWith(status: ShrimpPostStatus.loading));

    var either = await getListPost(
      GetListPostParams(
        page: state.page,
      ),
    );

    either.fold(
      (l) {
        emit(state.copyWith(status: ShrimpPostStatus.failure));

        if (refreshController.isRefresh) refreshController.refreshFailed();
        if (refreshController.isLoading) refreshController.loadFailed();
      },
      (r) {
        final List<PostEntity> result = r;

        emit(state.copyWith(
          status: ShrimpPostStatus.success,
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
