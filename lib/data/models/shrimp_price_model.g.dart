// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrimp_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShrimpPriceModel _$ShrimpPriceModelFromJson(Map<String, dynamic> json) =>
    ShrimpPriceModel(
      id: (json['id'] as num?)?.toInt(),
      speciesId: (json['species_id'] as num?)?.toInt(),
      size20: json['size_20'] as num?,
      size30: json['size_30'] as num?,
      size40: json['size_40'] as num?,
      size50: json['size_50'] as num?,
      size60: json['size_60'] as num?,
      size70: json['size_70'] as num?,
      size80: json['size_80'] as num?,
      size90: json['size_90'] as num?,
      size100: json['size_100'] as num?,
      size110: json['size_110'] as num?,
      size120: json['size_120'] as num?,
      size130: json['size_130'] as num?,
      size140: json['size_140'] as num?,
      size150: json['size_150'] as num?,
      size160: json['size_160'] as num?,
      size170: json['size_170'] as num?,
      size180: json['size_180'] as num?,
      size190: json['size_190'] as num?,
      size200: json['size_200'] as num?,
      currencyId: json['currency_id'] as String?,
      region: json['region'] == null
          ? null
          : RegionModel.fromJson(json['region'] as Map<String, dynamic>),
      creator: json['creator'] == null
          ? null
          : CreatorModel.fromJson(json['creator'] as Map<String, dynamic>),
    )..date = json['date'] as String?;

Map<String, dynamic> _$ShrimpPriceModelToJson(ShrimpPriceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'species_id': instance.speciesId,
      'date': instance.date,
      'size_20': instance.size20,
      'size_30': instance.size30,
      'size_40': instance.size40,
      'size_50': instance.size50,
      'size_60': instance.size60,
      'size_70': instance.size70,
      'size_80': instance.size80,
      'size_90': instance.size90,
      'size_100': instance.size100,
      'size_110': instance.size110,
      'size_120': instance.size120,
      'size_130': instance.size130,
      'size_140': instance.size140,
      'size_150': instance.size150,
      'size_160': instance.size160,
      'size_170': instance.size170,
      'size_180': instance.size180,
      'size_190': instance.size190,
      'size_200': instance.size200,
      'currency_id': instance.currencyId,
      'region': instance.region?.toJson(),
      'creator': instance.creator?.toJson(),
    };
