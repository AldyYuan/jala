// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      countryId: json['country_id'] as String?,
      countryName: json['country_name'] as String?,
      provinceName: json['province_name'] as String?,
      regencyName: json['regency_name'] as String?,
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'province_name': instance.provinceName,
      'regency_name': instance.regencyName,
      'full_name': instance.fullName,
    };
