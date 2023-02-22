import 'package:flutter/material.dart';

import 'component/labeled_linear_progress_bar.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bulbasaur',
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Chip(
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    label: Text(
                      'Grass',
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onSecondaryContainer
                      )
                    )
                  )
                ]
              ),
              const SizedBox(height: 15.0),
              Center(
                child: Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                  width: 230.0,
                  height: 230.0,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onSecondaryContainer
                          ),
                        ),
                        const SizedBox(height: 10.0),
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
                                const SizedBox(height: 10.0),
                                Text(
                                  'Height',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.outline,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Weight',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.outline,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Abilities',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.outline,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ]
                            ),
                            const SizedBox(width: 40.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Species',
                                  style: theme.textTheme.bodyMedium
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Height',
                                  style: theme.textTheme.bodyMedium
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Weight',
                                  style: theme.textTheme.bodyMedium!
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Abilities',
                                  style: theme.textTheme.bodyMedium
                                )
                              ]
                            )
                          ]
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          'Base Stats',
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onSecondaryContainer
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'HP',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.outline,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Attack',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.outline,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Defense',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.outline,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Sp. Atk',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.outline,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Sp. Def',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.outline,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Speed',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.outline,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ]
                            ),
                            const SizedBox(width: 40.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabeledLinearProgressBar(value: 50),
                                  const SizedBox(height: 10.0),
                                  LabeledLinearProgressBar(value: 50),
                                  const SizedBox(height: 10.0),
                                  LabeledLinearProgressBar(value: 50),
                                  const SizedBox(height: 10.0),
                                  LabeledLinearProgressBar(value: 50),
                                  const SizedBox(height: 10.0),
                                  LabeledLinearProgressBar(value: 50),
                                  const SizedBox(height: 10.0),
                                  LabeledLinearProgressBar(value: 50)
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
          )
        ),
      )
    );
  }
}