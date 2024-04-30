import 'package:jala/core/interfaces/base_model.dart';
import 'package:jala/data/models/creator_model.dart';
import 'package:jala/data/models/region_model.dart';
import 'package:jala/domain/entities/shrimp_price_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shrimp_price_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class ShrimpPriceModel extends BaseModel<ShrimpPriceEntity> {
  int? id;
  int? speciesId;
  num? size20;
  num? size30;
  num? size40;
  num? size50;
  num? size60;
  num? size70;
  num? size80;
  num? size90;
  num? size100;
  num? size110;
  num? size120;
  num? size130;
  num? size140;
  num? size150;
  num? size160;
  num? size170;
  num? size180;
  num? size190;
  num? size200;
  RegionModel? region;
  CreatorModel? creator;

  ShrimpPriceModel({
    this.id,
    this.speciesId,
    this.size20,
    this.size30,
    this.size40,
    this.size50,
    this.size60,
    this.size70,
    this.size80,
    this.size90,
    this.size100,
    this.size110,
    this.size120,
    this.size130,
    this.size140,
    this.size150,
    this.size160,
    this.size170,
    this.size180,
    this.size190,
    this.size200,
    this.region,
    this.creator,
  });

  @override
  ShrimpPriceEntity modelToEntity() {
    return ShrimpPriceEntity(
      id: id ?? 0,
      speciesId: speciesId ?? 0,
      size20: size20 ?? 0,
      size30: size30 ?? 0,
      size40: size40 ?? 0,
      size50: size50 ?? 0,
      size60: size60 ?? 0,
      size70: size70 ?? 0,
      size80: size80 ?? 0,
      size90: size90 ?? 0,
      size100: size100 ?? 0,
      size110: size110 ?? 0,
      size120: size120 ?? 0,
      size130: size130 ?? 0,
      size140: size140 ?? 0,
      size150: size150 ?? 0,
      size160: size160 ?? 0,
      size170: size170 ?? 0,
      size180: size180 ?? 0,
      size190: size190 ?? 0,
      size200: size200 ?? 0,
      region: region!.modelToEntity(),
      creator: creator!.modelToEntity(),
    );
  }

  factory ShrimpPriceModel.fromJson(Map<String, dynamic> json) => _$ShrimpPriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShrimpPriceModelToJson(this);
}
