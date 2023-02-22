import 'package:bloc/bloc.dart';
import 'package:pokedex/domain/use_case/get_pokemon_detail_use_case.dart';
import 'package:pokedex/presentation/feature/pokemon_detail/controller/pokemon_detail_event.dart';
import 'package:pokedex/presentation/feature/pokemon_detail/controller/pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final GetPokemonDetailUseCase _getPokemonDetailUseCase;

  PokemonDetailBloc({required getPokemonDetailUseCase})
    : _getPokemonDetailUseCase = getPokemonDetailUseCase, super(const PokemonDetailState()) {
      on<GetPokemonDetail>(getPokemonDetail);
    }

  Future<void> getPokemonDetail(
    GetPokemonDetail event,
    Emitter<PokemonDetailState> emit
  ) async {
    emit(state.copyWith(loading: true));

    final pokemon = await _getPokemonDetailUseCase(event.id);

    if (pokemon != null) {
      emit(
        state.copyWith(
          loading: false,
          pokemon: pokemon
        )
      );
    } else {
      emit(
        state.copyWith(
          loading: false,
          error: true
        )
      );
    }
  }
}