import 'package:pokedex/data/dto/pokemon_item_dto.dart';
import 'package:pokedex/domain/model/pokemon_item.dart';

class PokemonItemMapper {
  PokemonItemMapper._();

  static final instance = PokemonItemMapper._();

  PokemonItem mapToModel(PokemonItemDto pokemonItemDto) {
    return PokemonItem(
      id: int.parse(pokemonItemDto.url.split('/')[6]),
      name: pokemonItemDto.name[0].toUpperCase() + pokemonItemDto.name.substring(1).toLowerCase(),
      image: pokemonItemDto.image
    );
  }
}