part of 'shrimp_price_list_bloc.dart';

sealed class ShrimpPriceListEvent extends Equatable {
  const ShrimpPriceListEvent();

  @override
  List<Object> get props => [];
}

final class ShrimpPriceListGet extends ShrimpPriceListEvent {}

final class ShrimpPriceListFilterSize extends ShrimpPriceListEvent {
  final BuildContext context;

  const ShrimpPriceListFilterSize({required this.context});
}

final class ShrimpPriceListFilterRegion extends ShrimpPriceListEvent {
  final BuildContext context;

  const ShrimpPriceListFilterRegion({required this.context});
}
