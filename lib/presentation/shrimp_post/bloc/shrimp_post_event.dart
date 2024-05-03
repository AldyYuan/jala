part of 'shrimp_post_bloc.dart';

sealed class ShrimpPostEvent extends Equatable {
  const ShrimpPostEvent();

  @override
  List<Object> get props => [];
}

final class ShrimpPostGet extends ShrimpPostEvent {}
