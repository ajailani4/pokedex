class NameDto {
  final String name;

  const NameDto({required this.name});

  factory NameDto.fromJson(Map<String, dynamic> json) {
    return NameDto(name: json['name']);
  }
}