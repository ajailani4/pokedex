import 'package:pokedex/domain/model/stat_name.dart';

class Stat {
  final int baseStat;
  final StatName statName;

  const Stat({
    required this.baseStat,
    required this.statName
  });
}