import 'package:pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';
import 'package:pokedex/domain/use_case/get_pokemon_detail_use_case.dart';
import 'package:pokedex/domain/use_case/get_pokemon_list_use_case.dart';

class Injector {
  Injector._();

  static final instance = Injector._();

  // Repository
  PokemonRepository get pokemonRepository => PokemonRepositoryImpl();

  // Use Case
  GetPokemonListUseCase get getPokemonListUseCase => GetPokemonListUseCase(pokemonRepository: pokemonRepository);
  GetPokemonDetailUseCase get getPokemonDetailUseCase => GetPokemonDetailUseCase(pokemonRepository: pokemonRepository);
}