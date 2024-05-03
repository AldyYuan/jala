part of 'shrimp_disease_bloc.dart';

sealed class ShrimpDiseaseEvent extends Equatable {
  const ShrimpDiseaseEvent();

  @override
  List<Object> get props => [];
}

final class ShrimpDiseaseGet extends ShrimpDiseaseEvent {}
