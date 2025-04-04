import 'package:drift/drift.dart';
import '../../domain/entities/favorite_character_entity.dart';
import '../../domain/repositories/favorite_repository.dart';
import '../local/drift_database.dart' as drift;

class FavoriteRepositoryImpl implements FavoriteRepository {
  final drift.AppDatabase database;

  FavoriteRepositoryImpl({required this.database});

  @override
  Future<List<FavoriteCharacterEntity>> getFavorites() async {
    final dbFavorites = await database.getAllFavorites();
    return dbFavorites
        .map(
          (dbFav) => FavoriteCharacterEntity(
            id: dbFav.id,
            name: dbFav.name,
            image: dbFav.image,
            status: dbFav.status,
            species: dbFav.species,
            location: dbFav.location,
          ),
        )
        .toList();
  }

  @override
  Future<void> addFavorite(FavoriteCharacterEntity character) async {
    final companion = drift.FavoriteCharactersCompanion.insert(
      id: Value(character.id),
      name: character.name,
      image: character.image,
      status: character.status,
      species: character.species,
      location: character.location,
    );
    await database.insertFavorite(companion);
  }

  @override
  Future<void> removeFavorite(int id) async {
    await database.deleteFavorite(id);
  }
}
