import 'package:pokedex/data/dto/stat_dto.dart';
import 'package:pokedex/data/mapper/name_mapper.dart';
import 'package:pokedex/domain/model/stat.dart';

class StatMapper {
  StatMapper._();

  static final instance = StatMapper._();

  Stat mapToModel(StatDto statDto) {
    return Stat(
      baseStat: statDto.baseStat,
      statName: NameMapper.instance.mapToModel(statDto.statNameDto)
    );
  }
}