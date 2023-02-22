import 'package:pokedex/data/dto/name_dto.dart';

class AbilityDto {
  final NameDto abilityNameDto;

  const AbilityDto({required this.abilityNameDto});

  factory AbilityDto.fromJson(Map<String, dynamic> json) {
    return AbilityDto(abilityNameDto: NameDto.fromJson(json['ability']));
  }
}