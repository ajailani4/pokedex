import 'name_dto.dart';

class StatDto {
  final int baseStat;
  final NameDto statNameDto;

  const StatDto({
    required this.baseStat,
    required this.statNameDto
  });

  factory StatDto.fromJson(Map<String, dynamic> json) {
    return StatDto(
      baseStat: json['base_stat'],
      statNameDto: NameDto.fromJson(json['stat'])
    );
  }
}