part of 'shrimp_price_list_bloc.dart';

enum ShrimpPriceListStatus {
  initial,
  loading,
  success,
  failure,
}

class ShrimpPriceListState extends Equatable {
  final ShrimpPriceListStatus status;
  final List<ShrimpPriceEntity> data;
  final int page;
  final RegionEntity? regionFilter;
  final int shrimpSizeFilter;

  const ShrimpPriceListState({
    this.status = ShrimpPriceListStatus.initial,
    this.data = const <ShrimpPriceEntity>[],
    this.page = 1,
    this.regionFilter,
    this.shrimpSizeFilter = 100,
  });

  ShrimpPriceListState copyWith({
    ShrimpPriceListStatus? status,
    List<ShrimpPriceEntity>? data,
    int? page,
    RegionEntity? regionFilter,
    int? shrimpSizeFilter,
  }) {
    return ShrimpPriceListState(
      status: status ?? this.status,
      data: data ?? this.data,
      page: page ?? this.page,
      regionFilter: regionFilter,
      shrimpSizeFilter: shrimpSizeFilter ?? this.shrimpSizeFilter,
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
        page,
        regionFilter,
        shrimpSizeFilter,
      ];
}
