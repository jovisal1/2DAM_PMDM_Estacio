import 'dart:convert';
import 'package:flutter_harry_potter_clean_architecture/data/models/character_model.dart';
import 'package:http/http.dart' as http;

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getAllCharacters();
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl(this.client);

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    final response = await client
        .get(Uri.parse('https://hp-api.onrender.com/api/characters'));

    if (response.statusCode == 200) {
      final List<dynamic> charactersJson = json.decode(response.body);
      return charactersJson
          .map((json) => CharacterModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error al cargar personajes');
    }
  }
}
