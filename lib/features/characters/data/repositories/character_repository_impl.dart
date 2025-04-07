import 'package:drift/drift.dart';
import 'package:rick_and_morty_app/features/characters/data/datasources/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/local/drift_database.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  final AppDatabase database;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
    required this.database,
  });

  @override
  Future<List<CharacterEntity>> getCharacters({int page = 1}) async {
    if (page == 1) {
      final cached = await database.getAllCachedCharacters();
      if (cached.isNotEmpty) {
        return cached;
      }
    }

    // Подгружаем с API (теперь с учетом страницы)
    final remoteCharacters = await remoteDataSource.fetchCharacters(page: page);

    // Сохраняем в локальную БД только первую страницу
    if (page == 1) {
      final companions =
          remoteCharacters
              .map(
                (character) => CachedCharactersCompanion.insert(
                  id: Value(character.id),
                  name: character.name,
                  image: character.image,
                  status: character.status,
                  species: character.species,
                  location: character.location.name,
                ),
              )
              .toList();
      await database.insertCachedCharacters(companions);
    }

    return remoteCharacters.map((character) {
      return CharacterEntity(
        id: character.id,
        name: character.name,
        image: character.image,
        status: character.status,
        species: character.species,
        location: character.location.name,
        isFavorite: false,
      );
    }).toList();
  }
}
