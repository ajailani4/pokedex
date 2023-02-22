import 'package:pokedex/domain/model/name.dart';
import 'package:pokedex/domain/model/stat.dart';
import 'package:pokedex/domain/model/type.dart';

import 'ability.dart';

class Pokemon {
  final int id;
  final String name;
  final String image;
  final List<Type> types;
  final Name species;
  final int height;
  final int weight;
  final List<Ability> abilities;
  final List<Stat> stats;

  const Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    required this.species,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats
  });
}