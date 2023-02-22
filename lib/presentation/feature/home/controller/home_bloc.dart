import 'package:bloc/bloc.dart';
import 'package:pokedex/domain/use_case/get_pokemon_list_use_case.dart';
import 'package:pokedex/presentation/feature/home/controller/home_event.dart';
import 'package:pokedex/presentation/feature/home/controller/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPokemonListUseCase _getPokemonListUseCase;

  HomeBloc({required GetPokemonListUseCase getPokemonListUseCase}) 
    : _getPokemonListUseCase = getPokemonListUseCase, super(const HomeState()) {
      on<GetPokemonList>(getPokemonList);
    }

  Future<void> getPokemonList(
    GetPokemonList event,
    Emitter<HomeState> emit
  ) async {
    emit(state.copyWith(loading: true));

    final pokemonList = await _getPokemonListUseCase();

    if (pokemonList != null) {
      emit(
        state.copyWith(
          loading: false,
          pokemonList: pokemonList
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