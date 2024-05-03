part of 'shrimp_price_detail_bloc.dart';

enum ShrimpPriceDetailStatus {
  initial,
  loading,
  success,
  failure,
}

class ShrimpPriceDetailState extends Equatable {
  final ShrimpPriceDetailStatus status;
  final ShrimpPriceEntity? data;

  const ShrimpPriceDetailState({
    this.status = ShrimpPriceDetailStatus.initial,
    this.data,
  });

  ShrimpPriceDetailState copyWith({
    ShrimpPriceDetailStatus? status,
    ShrimpPriceEntity? data,
  }) {
    return ShrimpPriceDetailState(
      status: status ?? this.status,
      data: data,
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}
