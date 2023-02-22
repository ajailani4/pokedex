import 'package:pokedex/data/dto/name_dto.dart';
import 'package:pokedex/domain/model/name.dart';

class NameMapper {
  NameMapper._();

  static final instance = NameMapper._();

  Name mapToModel(NameDto nameDto) {
    return Name(name: nameDto.name[0].toUpperCase() + nameDto.name.substring(1).toLowerCase());
  }  
}