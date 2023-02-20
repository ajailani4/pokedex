import 'dart:convert';

import 'package:pokedex/data/dto/base_response.dart';
import 'package:pokedex/domain/model/pokemon_item.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';
import 'package:pokedex/util/constants.dart';

import 'package:http/http.dart' as http;

class PokemonRepositoryImpl implements PokemonRepository {
  final baseUrl = Constants.instance.baseUrl;

  @override
  Future<List<PokemonItem>> getPokemonList() async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon'));

    if (response.statusCode == 200) {
      final baseResponse = BaseResponse<PokemonItem>.fromJson(jsonDecode(response.body));
      return baseResponse.results;
    } else {
      throw Exception('Cannot retrieved pokemon list');
    }
  }
}