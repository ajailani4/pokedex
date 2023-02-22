import 'dart:convert';

import 'package:pokedex/data/dto/pokemon_dto.dart';
import 'package:pokedex/data/dto/response/base_response.dart';
import 'package:pokedex/data/mapper/pokemon_item_mapper.dart';
import 'package:pokedex/data/mapper/pokemon_mapper.dart';
import 'package:pokedex/domain/model/pokemon.dart';
import 'package:pokedex/domain/model/pokemon_item.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';
import 'package:pokedex/util/constants.dart';

import 'package:http/http.dart' as http;

import '../dto/pokemon_item_dto.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final baseUrl = Constants.instance.baseUrl;

  @override
  Future<List<PokemonItem>> getPokemonList() async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon?limit=50'));

    if (response.statusCode == 200) {
      final baseResponse = BaseResponse<List<PokemonItemDto>>.fromJson(
        jsonDecode(response.body),
        (json) => (json as List).map((e) => PokemonItemDto.fromJson(e)).toList()
      );

      return baseResponse.results.map((pokemonItemDto) => 
        PokemonItemMapper.instance.mapToModel(pokemonItemDto)
      ).toList();
    } else {
      throw Exception('Cannot retrieved pokemon list');
    }
  }

  @override
  Future<Pokemon> getPokemonDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$id'));

    if (response.statusCode == 200) {
      return PokemonMapper.instance.mapToModel(PokemonDto.fromJson(jsonDecode(response.body)));
    } else {
      throw Exception('Cannot retrieved pokemon detail');
    }
  }
}