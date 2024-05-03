part of 'shrimp_price_detail_bloc.dart';

sealed class ShrimpPriceDetailEvent extends Equatable {
  const ShrimpPriceDetailEvent();

  @override
  List<Object> get props => [];
}

final class ShrimpPriceDetailGet extends ShrimpPriceDetailEvent {
  final int id;

  const ShrimpPriceDetailGet({required this.id});
}
