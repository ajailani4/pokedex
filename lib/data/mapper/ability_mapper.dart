import 'package:pokedex/data/dto/ability_dto.dart';
import 'package:pokedex/data/mapper/name_mapper.dart';
import 'package:pokedex/domain/model/ability.dart';

class AbilityMapper {
  AbilityMapper._();

  static final instance = AbilityMapper._();

  Ability mapToModel(AbilityDto abilityDto) {
    return Ability(
      abilityName: NameMapper.instance.mapToModel(abilityDto.abilityNameDto)
    );
  }
}