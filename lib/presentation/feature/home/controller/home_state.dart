import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/model/pokemon_item.dart';

class HomeState extends Equatable {
  final bool? loading;
  final List<PokemonItem>? pokemonList;
  final bool? error;

  const HomeState({
    this.loading,
    this.pokemonList,
    this.error
  });

  HomeState copyWith({
    loading,
    pokemonList,
    error
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      pokemonList: pokemonList ?? this.pokemonList,
      error: error ?? this.error
    );
  }

  @override
  List<Object?> get props => [loading, pokemonList, error];
}