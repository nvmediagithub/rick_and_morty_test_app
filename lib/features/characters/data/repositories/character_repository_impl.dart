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
  Future<List<CharacterEntity>> getCharacters() async {
    // Попытка загрузить данные из локального кэша
    final cached = await database.getAllCachedCharacters();
    if (cached.isNotEmpty) {
      return cached;
    } else {
      // Если кэш пуст, получаем данные с сервера
      final remoteCharacters = await remoteDataSource.fetchCharacters();
      // Преобразуем полученные данные в companion для Drift
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
      // Сохраняем в локальную базу
      await database.insertCachedCharacters(companions);
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
}
