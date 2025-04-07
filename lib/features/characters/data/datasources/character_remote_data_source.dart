import 'package:dio/dio.dart';
import '../models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> fetchCharacters({int page = 1});
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final Dio dio;

  CharacterRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CharacterModel>> fetchCharacters({int page = 1}) async {
    final response = await dio.get(
      'https://rickandmortyapi.com/api/character?page=$page',
    );
    if (response.statusCode == 200) {
      final data = response.data;
      final results = data['results'] as List;
      return results.map((json) => CharacterModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
