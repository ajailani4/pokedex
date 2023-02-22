import 'package:pokedex/domain/repository/pokemon_repository.dart';

class GetPokemonDetailUseCase {
  final PokemonRepository _pokemonRepository;

  GetPokemonDetailUseCase({required pokemonRepository}) 
    : _pokemonRepository = pokemonRepository;

  call(int id) {
    return _pokemonRepository.getPokemonDetail(id);
  }
}