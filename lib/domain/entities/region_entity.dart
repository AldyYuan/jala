import 'package:equatable/equatable.dart';

class RegionEntity extends Equatable {
  final String id;
  final String name;
  final String countryName;
  final String provinceName;
  final String regencyName;
  final String fullName;

  const RegionEntity({
    required this.id,
    required this.name,
    required this.countryName,
    required this.provinceName,
    required this.regencyName,
    required this.fullName,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        countryName,
        provinceName,
        regencyName,
        fullName,
      ];
}
