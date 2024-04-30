import 'package:jala/core/interfaces/base_model.dart';
import 'package:jala/domain/entities/region_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'region_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegionModel extends BaseModel<RegionEntity> {
  String? id;
  String? name;
  String? countryName;
  String? provinceName;
  String? regencyName;
  String? fullName;

  RegionModel({
    this.id,
    this.name,
    this.countryName,
    this.provinceName,
    this.regencyName,
    this.fullName,
  });

  @override
  RegionEntity modelToEntity() {
    return RegionEntity(
      id: id ?? '',
      name: name ?? '',
      countryName: countryName ?? '',
      provinceName: provinceName ?? '',
      regencyName: regencyName ?? '',
      fullName: fullName ?? '',
    );
  }

  factory RegionModel.fromJson(Map<String, dynamic> json) => _$RegionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionModelToJson(this);
}
