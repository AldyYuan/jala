import 'package:equatable/equatable.dart';
import 'package:jala/domain/entities/creator_entity.dart';
import 'package:jala/domain/entities/region_entity.dart';

class ShrimpPriceEntity extends Equatable {
  final int id;
  final int speciesId;
  final String date;
  final num size20;
  final num size30;
  final num size40;
  final num size50;
  final num size60;
  final num size70;
  final num size80;
  final num size90;
  final num size100;
  final num size110;
  final num size120;
  final num size130;
  final num size140;
  final num size150;
  final num size160;
  final num size170;
  final num size180;
  final num size190;
  final num size200;
  final String currencyId;
  final RegionEntity region;
  final CreatorEntity? creator;

  const ShrimpPriceEntity({
    required this.id,
    required this.speciesId,
    required this.date,
    required this.size20,
    required this.size30,
    required this.size40,
    required this.size50,
    required this.size60,
    required this.size70,
    required this.size80,
    required this.size90,
    required this.size100,
    required this.size110,
    required this.size120,
    required this.size130,
    required this.size140,
    required this.size150,
    required this.size160,
    required this.size170,
    required this.size180,
    required this.size190,
    required this.size200,
    required this.currencyId,
    required this.region,
    required this.creator,
  });

  @override
  List<Object?> get props => [
        id,
        speciesId,
        date,
        size20,
        size30,
        size40,
        size50,
        size60,
        size70,
        size80,
        size90,
        size100,
        size110,
        size120,
        size130,
        size140,
        size150,
        size160,
        size170,
        size180,
        size190,
        size200,
        currencyId,
        region,
        creator,
      ];

  num getSizeByFilter(int filterSize) {
    switch (filterSize) {
      case 20:
        return size20;
      case 30:
        return size30;
      case 40:
        return size40;
      case 50:
        return size50;
      case 60:
        return size60;
      case 70:
        return size70;
      case 80:
        return size80;
      case 90:
        return size90;
      case 100:
        return size100;
      case 110:
        return size110;
      case 120:
        return size120;
      case 130:
        return size130;
      case 140:
        return size140;
      case 150:
        return size150;
      case 160:
        return size160;
      case 170:
        return size170;
      case 180:
        return size180;
      case 190:
        return size190;
      case 200:
        return size200;
      default:
        return size20;
    }
  }
}
