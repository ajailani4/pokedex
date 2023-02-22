import 'package:flutter/material.dart';

import '../../../../domain/model/pokemon_item.dart';

class PokemonItemCard extends StatelessWidget {
  const PokemonItemCard({
    super.key,
    required this.pokemonItem,
    required this.onClick
  });

  final PokemonItem pokemonItem;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.network(
                pokemonItem.image,
                width: double.infinity,
                height: 150.0
              ),
              const SizedBox(height: 15.0),
              Text(
                pokemonItem.name,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold
                )
              )
            ]
          )
        )
      )
    );
  }
}