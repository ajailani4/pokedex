import 'name_dto.dart';

class TypeDto {
  final NameDto typeNameDto;

  const TypeDto({required this.typeNameDto});

  factory TypeDto.fromJson(Map<String, dynamic> json) {
    return TypeDto(typeNameDto: NameDto.fromJson(json['type']));
  }
}