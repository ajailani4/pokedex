import 'package:flutter/material.dart';

import '../../../../domain/model/pokemon_item.dart';

class PokemonItemCard extends StatelessWidget {
  const PokemonItemCard({
    super.key,
    required this.index,
    required this.pokemonList
  });

  final int index;
  final List<PokemonItem>? pokemonList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.network(
              pokemonList![index].image,
              width: double.infinity,
              height: 150.0
            ),
            const SizedBox(height: 15.0),
            Text(
              pokemonList![index].name,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold
              )
            )
          ]
        )
      )
    );
  }
}