import 'package:equatable/equatable.dart';

class CreatorEntity extends Equatable {
  final int id;
  final int roleId;
  final String name;
  final String email;
  final String avatar;
  final String phone;
  final bool? buyer;

  const CreatorEntity({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.avatar,
    required this.phone,
    required this.buyer,
  });

  @override
  List<Object?> get props => [
        id,
        roleId,
        name,
        email,
        avatar,
        phone,
        buyer,
      ];
}
