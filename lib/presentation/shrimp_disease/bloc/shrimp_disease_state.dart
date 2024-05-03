part of 'shrimp_disease_bloc.dart';

enum ShrimpDiseaseStatus {
  initial,
  loading,
  success,
  failure,
}

class ShrimpDiseaseState extends Equatable {
  final ShrimpDiseaseStatus status;
  final List<DiseaseEntity> data;
  final int page;

  const ShrimpDiseaseState({
    this.status = ShrimpDiseaseStatus.initial,
    this.data = const <DiseaseEntity>[],
    this.page = 1,
  });

  ShrimpDiseaseState copyWith({
    ShrimpDiseaseStatus? status,
    List<DiseaseEntity>? data,
    int? page,
  }) {
    return ShrimpDiseaseState(
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
