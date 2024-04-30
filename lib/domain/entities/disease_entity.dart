import 'package:equatable/equatable.dart';

class DiseaseEntity extends Equatable {
  final int id;
  final String fullName;
  final String shortName;
  final String image;
  final String slug;
  final String metaDescription;
  final String metaKeywords;
  final String status;
  final String indication;
  final String pathogen;
  final String effect;
  final String stabilityVisibility;
  final String handling;
  final String regulation;
  final String reference;
  final String createdAt;
  final String updatedAt;

  const DiseaseEntity({
    required this.id,
    required this.fullName,
    required this.shortName,
    required this.image,
    required this.slug,
    required this.metaDescription,
    required this.metaKeywords,
    required this.status,
    required this.indication,
    required this.pathogen,
    required this.effect,
    required this.stabilityVisibility,
    required this.handling,
    required this.regulation,
    required this.reference,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        shortName,
        image,
        slug,
        metaDescription,
        metaKeywords,
        status,
        indication,
        pathogen,
        effect,
        stabilityVisibility,
        handling,
        regulation,
        reference,
        createdAt,
        updatedAt,
      ];
}
