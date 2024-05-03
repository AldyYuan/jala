part of 'shrimp_region_filter_bloc.dart';

sealed class ShrimpRegionFilterEvent extends Equatable {
  const ShrimpRegionFilterEvent();

  @override
  List<Object> get props => [];
}

final class ShrimpRegionFilterGet extends ShrimpRegionFilterEvent {}

final class ShrimpRegionFilterSearch extends ShrimpRegionFilterEvent {}
