part of 'shrimp_post_bloc.dart';

enum ShrimpPostStatus {
  initial,
  loading,
  success,
  failure,
}

class ShrimpPostState extends Equatable {
  final ShrimpPostStatus status;
  final List<PostEntity> data;
  final int page;

  const ShrimpPostState({
    this.status = ShrimpPostStatus.initial,
    this.data = const <PostEntity>[],
    this.page = 1,
  });

  ShrimpPostState copyWith({
    ShrimpPostStatus? status,
    List<PostEntity>? data,
    int? page,
  }) {
    return ShrimpPostState(
      status: status ?? this.status,
      data: data ?? this.data,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
        page,
      ];
}
