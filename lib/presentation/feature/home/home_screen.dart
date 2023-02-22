import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/feature/home/controller/home_bloc.dart';
import 'package:pokedex/presentation/feature/home/controller/home_state.dart';
import 'package:pokedex/presentation/feature/pokemon_detail/pokemon_detail_screen.dart';

import 'component/pokemon_item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.error == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cannot retrieved pokemon list')
            )
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    'Pokedex',
                    style: theme.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (_, state) {
                    if (state.loading == true) {
                      return const Center(
                        heightFactor: 15,
                        child: CircularProgressIndicator()
                      );
                    } else {
                      final pokemonList = state.pokemonList;

                      if (pokemonList != null) {
                        return GridView.builder(
                          itemCount: pokemonList.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return PokemonItemCard(
                              pokemonItem: pokemonList[index],
                              onClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const PokemonDetailScreen(),
                                    settings: RouteSettings(
                                      arguments: pokemonList[index].id
                                    )
                                  )
                                );
                              },
                            );
                          }
                        );
                      } else {
                        return const Center(child: Text('No data'));
                      }
                    }
                  }
                )
              ]
            )
          )
        )
      ),
    );
  }
}