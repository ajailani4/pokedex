import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/feature/pokemon_detail/controller/pokemon_detail_bloc.dart';
import 'package:pokedex/presentation/feature/pokemon_detail/controller/pokemon_detail_event.dart';
import 'package:pokedex/presentation/feature/pokemon_detail/controller/pokemon_detail_state.dart';

import 'component/labeled_linear_progress_bar.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final theme = Theme.of(context);

    context.read<PokemonDetailBloc>().add(GetPokemonDetail(id));

    return BlocListener<PokemonDetailBloc, PokemonDetailState>(
      listener: (context, state) {
        if (state.error == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cannot retrieved pokemon detail')
            )
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => Navigator.pop(context)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
            child: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
              builder: (_, state) {
                if (state.loading == true) {
                  return const Center(
                    heightFactor: 15,
                    child: CircularProgressIndicator()
                  );
                } else {
                  final pokemon = state.pokemon;

                  if (pokemon != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name,
                          style: theme.textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            for (var type in pokemon.types) 
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: Chip(
                                  backgroundColor: theme.colorScheme.secondaryContainer,
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  label: Text(
                                    type.typeName.name,
                                    style: theme.textTheme.labelLarge!.copyWith(
                                      color: theme.colorScheme.onSecondaryContainer
                                    )
                                  )
                                ),
                              )
                            
                          ]
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: Image.network(
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
                            width: 230,
                            height: 230,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'About',
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: theme.colorScheme.onSecondaryContainer,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Species',
                                            style: theme.textTheme.bodyMedium!.copyWith(
                                              color: theme.colorScheme.outline,
                                              fontWeight: FontWeight.bold
                                            )
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'Height',
                                            style: theme.textTheme.bodyMedium!.copyWith(
                                              color: theme.colorScheme.outline,
                                              fontWeight: FontWeight.bold
                                            )
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'Weight',
                                            style: theme.textTheme.bodyMedium!.copyWith(
                                              color: theme.colorScheme.outline,
                                              fontWeight: FontWeight.bold
                                            )
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'Abilities',
                                            style: theme.textTheme.bodyMedium!.copyWith(
                                              color: theme.colorScheme.outline,
                                              fontWeight: FontWeight.bold
                                            )
                                          )
                                        ]
                                      ),
                                      const SizedBox(width: 40),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            pokemon.species.name,
                                            style: theme.textTheme.bodyMedium
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            '${pokemon.height} cm',
                                            style: theme.textTheme.bodyMedium
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            '${pokemon.weight} kg',
                                            style: theme.textTheme.bodyMedium!
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            pokemon.abilities.map((e) => e.abilityName.name).toList().join(', '),
                                            style: theme.textTheme.bodyMedium
                                          )
                                        ]
                                      )
                                    ]
                                  ),
                                  const SizedBox(height: 25),
                                  Text(
                                    'Base Stats',
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: theme.colorScheme.onSecondaryContainer,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          for (var stat in pokemon.stats)
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                              child: Text(
                                                stat.statName.name,
                                                style: theme.textTheme.bodyMedium!.copyWith(
                                                  color: theme.colorScheme.outline,
                                                  fontWeight: FontWeight.bold
                                                )
                                              ),
                                            )
                                        ]
                                      ),
                                      const SizedBox(width: 40),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            for (var stat in pokemon.stats)
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                                child: LabeledLinearProgressBar(value: stat.baseStat),
                                              )
                                          ]
                                        )
                                      )
                                    ]
                                  )
                                ]
                              )
                            )
                          )
                        )
                      ]
                    );
                  } else {
                    return const Center(child: Text('No data'));
                  }
                }
              }
            )
          ),
        )
      ),
    );
  }
}