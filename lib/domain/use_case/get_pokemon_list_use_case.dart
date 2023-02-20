import 'package:pokedex/domain/repository/pokemon_repository.dart';

import '../../di/injector.dart';

class GetPokemonListUseCase {
  final PokemonRepository _pokemonRepository;

  GetPokemonListUseCase({required PokemonRepository pokemonRepository}) 
    : _pokemonRepository = pokemonRepository;
  
  call() {
    return _pokemonRepository.getPokemonList();
  }
}