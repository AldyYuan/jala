// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrimp_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShrimpPriceModel _$ShrimpPriceModelFromJson(Map<String, dynamic> json) =>
    ShrimpPriceModel(
      id: (json['id'] as num?)?.toInt(),
      speciesId: (json['species_id'] as num?)?.toInt(),
      size20: json['size20'] as num?,
      size30: json['size30'] as num?,
      size40: json['size40'] as num?,
      size50: json['size50'] as num?,
      size60: json['size60'] as num?,
      size70: json['size70'] as num?,
      size80: json['size80'] as num?,
      size90: json['size90'] as num?,
      size100: json['size100'] as num?,
      size110: json['size110'] as num?,
      size120: json['size120'] as num?,
      size130: json['size130'] as num?,
      size140: json['size140'] as num?,
      size150: json['size150'] as num?,
      size160: json['size160'] as num?,
      size170: json['size170'] as num?,
      size180: json['size180'] as num?,
      size190: json['size190'] as num?,
      size200: json['size200'] as num?,
      region: json['region'] == null
          ? null
          : RegionModel.fromJson(json['region'] as Map<String, dynamic>),
      creator: json['creator'] == null
          ? null
          : CreatorModel.fromJson(json['creator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShrimpPriceModelToJson(ShrimpPriceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'species_id': instance.speciesId,
      'size20': instance.size20,
      'size30': instance.size30,
      'size40': instance.size40,
      'size50': instance.size50,
      'size60': instance.size60,
      'size70': instance.size70,
      'size80': instance.size80,
      'size90': instance.size90,
      'size100': instance.size100,
      'size110': instance.size110,
      'size120': instance.size120,
      'size130': instance.size130,
      'size140': instance.size140,
      'size150': instance.size150,
      'size160': instance.size160,
      'size170': instance.size170,
      'size180': instance.size180,
      'size190': instance.size190,
      'size200': instance.size200,
      'region': instance.region?.toJson(),
      'creator': instance.creator?.toJson(),
    };
