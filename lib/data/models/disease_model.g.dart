// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiseaseModel _$DiseaseModelFromJson(Map<String, dynamic> json) => DiseaseModel(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      shortName: json['short_name'] as String?,
      image: json['image'] as String?,
      slug: json['slug'] as String?,
      metaDescription: json['meta_description'] as String?,
      metaKeywords: json['meta_keywords'] as String?,
      status: json['status'] as String?,
      indication: json['indication'] as String?,
      pathogen: json['pathogen'] as String?,
      effect: json['effect'] as String?,
      stabilityVisibility: json['stability_visibility'] as String?,
      handling: json['handling'] as String?,
      regulation: json['regulation'] as String?,
      reference: json['reference'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DiseaseModelToJson(DiseaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'short_name': instance.shortName,
      'image': instance.image,
      'slug': instance.slug,
      'meta_description': instance.metaDescription,
      'meta_keywords': instance.metaKeywords,
      'status': instance.status,
      'indication': instance.indication,
      'pathogen': instance.pathogen,
      'effect': instance.effect,
      'stability_visibility': instance.stabilityVisibility,
      'handling': instance.handling,
      'regulation': instance.regulation,
      'reference': instance.reference,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
