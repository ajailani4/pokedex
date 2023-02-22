abstract class PokemonDetailEvent {
  const PokemonDetailEvent();
}

class GetPokemonDetail extends PokemonDetailEvent {
  final int id;

  GetPokemonDetail(this.id);
}