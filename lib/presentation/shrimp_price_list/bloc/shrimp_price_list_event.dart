part of 'shrimp_price_list_bloc.dart';

sealed class ShrimpPriceListEvent extends Equatable {
  const ShrimpPriceListEvent();

  @override
  List<Object> get props => [];
}

final class ShrimpPriceListGet extends ShrimpPriceListEvent {}
