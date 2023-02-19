import 'package:pokedex/domain/model/pokemon_item.dart';

abstract class PokemonRepository {
  Future<List<PokemonItem>> getPokemonList();
}