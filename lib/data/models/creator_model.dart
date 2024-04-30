import 'package:jala/core/interfaces/base_model.dart';
import 'package:jala/domain/entities/creator_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'creator_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreatorModel extends BaseModel<CreatorEntity> {
  int? id;
  int? roleId;
  String? name;
  String? email;
  String? avatar;
  String? phone;
  bool? buyer;

  CreatorModel({
    this.id,
    this.roleId,
    this.name,
    this.email,
    this.avatar,
    this.phone,
    this.buyer,
  });

  @override
  CreatorEntity modelToEntity() {
    return CreatorEntity(
      id: id ?? 0,
      roleId: roleId ?? 0,
      name: name ?? '',
      email: email ?? '',
      avatar: avatar ?? '',
      phone: phone ?? '',
      buyer: buyer ?? false,
    );
  }

  factory CreatorModel.fromJson(Map<String, dynamic> json) => _$CreatorModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorModelToJson(this);
}
