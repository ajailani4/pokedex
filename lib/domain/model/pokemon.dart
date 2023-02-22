import 'package:pokedex/domain/model/stat.dart';
import 'package:pokedex/domain/model/type.dart';

import 'ability.dart';

class Pokemon {
  final int id;
  final String name;
  final List<Type> types;
  final String species;
  final int height;
  final int weight;
  final List<Ability> abilities;
  final List<Stat> stats;

  const Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.species,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats
  });
}