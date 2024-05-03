part of 'shrimp_region_filter_bloc.dart';

enum ShrimpRegionFilterStatus {
  initial,
  loading,
  success,
  failure,
}

class ShrimpRegionFilterState extends Equatable {
  final ShrimpRegionFilterStatus status;
  final List<RegionEntity> data;
  final RegionEntity? selectedRegion;
  final int page;
  final String search;

  const ShrimpRegionFilterState({
    this.status = ShrimpRegionFilterStatus.initial,
    this.selectedRegion,
    this.data = const <RegionEntity>[],
    this.page = 1,
    this.search = '',
  });

  ShrimpRegionFilterState copyWith({
    ShrimpRegionFilterStatus? status,
    List<RegionEntity>? data,
    RegionEntity? selectedRegion,
    int? page,
    String? search,
  }) {
    return ShrimpRegionFilterState(
      status: status ?? this.status,
      selectedRegion: selectedRegion ?? this.selectedRegion,
      data: data ?? this.data,
      page: page ?? this.page,
      search: search ?? this.search,
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
        page,
        search,
      ];
}
