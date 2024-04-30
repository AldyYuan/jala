// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorModel _$CreatorModelFromJson(Map<String, dynamic> json) => CreatorModel(
      id: (json['id'] as num?)?.toInt(),
      roleId: (json['role_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      buyer: json['buyer'] as bool?,
    );

Map<String, dynamic> _$CreatorModelToJson(CreatorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role_id': instance.roleId,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'buyer': instance.buyer,
    };
