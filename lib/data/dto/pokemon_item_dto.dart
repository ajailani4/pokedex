class PokemonItemDto {
  final String url;
  final String name;
  final String image;

  const PokemonItemDto({
    required this.url,
    required this.name,
    required this.image
  });

  factory PokemonItemDto.fromJson(Map<String, dynamic> json) {
    return PokemonItemDto(
      url: json['url'],
      name: json['name'],
      image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['url'].split('/')[6]}.png'
    );
  }
}