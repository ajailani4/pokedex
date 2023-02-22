import 'package:flutter/material.dart';
import 'package:pokedex/presentation/feature/home/controller/home_bloc.dart';
import 'package:pokedex/presentation/feature/home/controller/home_event.dart';
import 'package:pokedex/presentation/feature/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/feature/pokemon_detail/controller/pokemon_detail_bloc.dart';
import 'package:pokedex/presentation/feature/pokemon_detail/pokemon_detail_screen.dart';

import 'di/injector.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => 
            HomeBloc(getPokemonListUseCase: Injector.instance.getPokemonListUseCase)..add(GetPokemonList())
        ),
        BlocProvider<PokemonDetailBloc>(
          create: (_) =>
            PokemonDetailBloc(getPokemonDetailUseCase: Injector.instance.getPokemonDetailUseCase)
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
        ),
        home: const HomeScreen()
      ),
    );
  }
}
