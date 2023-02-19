import 'package:pokedex/domain/repository/pokemon_repository.dart';

class GetPokemonListUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonListUseCase({required PokemonRepository pokemonRepository}) 
      : pokemonRepository = Injector.instance.pokemonRepository;
  
  call() {
    return pokemonRepository.getPokemonList();
  }
}