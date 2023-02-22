import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/model/pokemon.dart';

class PokemonDetailState extends Equatable {
  final bool? loading;
  final Pokemon? pokemon;
  final bool? error;

  const PokemonDetailState({
    this.loading,
    this.pokemon,
    this.error
  });

  PokemonDetailState copyWith({
    loading,
    pokemon,
    error
  }) {
    return PokemonDetailState(
      loading: loading,
      pokemon: pokemon,
      error: error
    );
  }

  @override
  List<Object?> get props => [loading, pokemon, error];
}