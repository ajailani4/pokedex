import 'package:pokedex/data/dto/type_dto.dart';
import 'package:pokedex/data/mapper/name_mapper.dart';

import 'package:pokedex/domain/model/type.dart';

class TypeMapper {
  TypeMapper._();

  static final instance = TypeMapper._();

  Type mapToModel(TypeDto typeDto) {
    return Type(
      typeName: NameMapper.instance.mapToModel(typeDto.typeNameDto)
    );
  }
}