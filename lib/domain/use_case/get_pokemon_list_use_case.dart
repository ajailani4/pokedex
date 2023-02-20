import 'package:pokedex/domain/repository/pokemon_repository.dart';

import '../../di/injector.dart';

class GetPokemonListUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonListUseCase({required this.pokemonRepository});
  
  call() {
    return pokemonRepository.getPokemonList();
  }
}