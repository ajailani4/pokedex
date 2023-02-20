import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/feature/home/controller/home_bloc.dart';
import 'package:pokedex/presentation/feature/home/controller/home_event.dart';
import 'package:pokedex/presentation/feature/home/controller/home_state.dart';

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
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: Text(
                    'Pokedex',
                    style: theme.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                const SizedBox(height: 20.0),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (_, state) {
                    if (state.loading == true) {
                      return const Center(child: CircularProgressIndicator());
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
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Image.network(
                                      pokemonList[index].image,
                                      width: double.infinity,
                                      height: 150.0
                                    ),
                                    const SizedBox(height: 15.0),
                                    Text(
                                      pokemonList[index].name,
                                      style: theme.textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  ]
                                )
                              )
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