import 'package:pokedex/data/dto/pokemon_dto.dart';
import 'package:pokedex/data/mapper/ability_mapper.dart';
import 'package:pokedex/data/mapper/name_mapper.dart';
import 'package:pokedex/data/mapper/stat_mapper.dart';
import 'package:pokedex/data/mapper/type_mapper.dart';
import 'package:pokedex/domain/model/pokemon.dart';

class PokemonMapper {
  PokemonMapper._();

  static final instance = PokemonMapper._();

  Pokemon mapToModel(PokemonDto pokemonDto) {
    return Pokemon(
      id: pokemonDto.id,
      name: pokemonDto.name[0].toUpperCase() + pokemonDto.name.substring(1).toLowerCase(),
      image: pokemonDto.image,
      types: pokemonDto.typesDto.map((e) =>  TypeMapper.instance.mapToModel(e)).toList(),
      species: NameMapper.instance.mapToModel(pokemonDto.species),
      height: pokemonDto.height,
      weight: pokemonDto.weight,
      abilities: pokemonDto.abilitiesDto.map((e) => AbilityMapper.instance.mapToModel(e)).toList(),
      stats: pokemonDto.statsDto.map((e) => StatMapper.instance.mapToModel(e)).toList()
    );
  }
}