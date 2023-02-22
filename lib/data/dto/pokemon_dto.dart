import 'package:pokedex/data/dto/name_dto.dart';
import 'package:pokedex/data/dto/stat_dto.dart';
import 'package:pokedex/data/dto/type_dto.dart';

import 'ability_dto.dart';

class PokemonDto {
  final int id;
  final String name;
  final String image;
  final List<TypeDto> typesDto;
  final NameDto species;
  final int height;
  final int weight;
  final List<AbilityDto> abilitiesDto;
  final List<StatDto> statsDto;

  const PokemonDto({
    required this.id,
    required this.name,
    required this.image,
    required this.typesDto,
    required this.species,
    required this.height,
    required this.weight,
    required this.abilitiesDto,
    required this.statsDto
  });

  factory PokemonDto.fromJson(Map<String, dynamic> json) {
    return PokemonDto(
      id: json['id'],
      name: json['name'],
      image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['id']}.png',
      typesDto: (json['types'] as List).map((e) => TypeDto.fromJson(e)).toList(),
      species: NameDto.fromJson(json['species']),
      height: json['height'],
      weight: json['weight'],
      abilitiesDto: (json['abilities'] as List).map((e) => AbilityDto.fromJson(e)).toList(),
      statsDto: (json['stats'] as List).map((e) => StatDto.fromJson(e)).toList()
    );
  }
}