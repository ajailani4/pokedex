import 'package:pokedex/domain/model/pokemon.dart';
import 'package:pokedex/domain/model/pokemon_item.dart';

abstract class PokemonRepository {
  Future<List<PokemonItem>> getPokemonList();
  Future<Pokemon> getPokemonDetail(int id);
}