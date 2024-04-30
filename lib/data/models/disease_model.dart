import 'package:jala/core/interfaces/base_model.dart';
import 'package:jala/domain/entities/disease_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'disease_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DiseaseModel extends BaseModel<DiseaseEntity> {
  int? id;
  String? fullName;
  String? shortName;
  String? image;
  String? slug;
  String? metaDescription;
  String? metaKeywords;
  String? status;
  String? indication;
  String? pathogen;
  String? effect;
  String? stabilityVisibility;
  String? handling;
  String? regulation;
  String? reference;
  String? createdAt;
  String? updatedAt;

  DiseaseModel({
    this.id,
    this.fullName,
    this.shortName,
    this.image,
    this.slug,
    this.metaDescription,
    this.metaKeywords,
    this.status,
    this.indication,
    this.pathogen,
    this.effect,
    this.stabilityVisibility,
    this.handling,
    this.regulation,
    this.reference,
    this.createdAt,
    this.updatedAt,
  });

  @override
  DiseaseEntity modelToEntity() {
    return DiseaseEntity(
      id: id ?? 0,
      fullName: fullName ?? '',
      shortName: shortName ?? '',
      image: image ?? '',
      slug: slug ?? '',
      metaDescription: metaDescription ?? '',
      metaKeywords: metaKeywords ?? '',
      status: status ?? '',
      indication: indication ?? '',
      pathogen: pathogen ?? '',
      effect: effect ?? '',
      stabilityVisibility: stabilityVisibility ?? '',
      handling: handling ?? '',
      regulation: regulation ?? '',
      reference: reference ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
    );
  }

  factory DiseaseModel.fromJson(Map<String, dynamic> json) => _$DiseaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiseaseModelToJson(this);
}
