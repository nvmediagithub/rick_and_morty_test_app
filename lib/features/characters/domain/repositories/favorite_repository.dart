import '../entities/favorite_character_entity.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteCharacterEntity>> getFavorites();
  Future<void> addFavorite(FavoriteCharacterEntity character);
  Future<void> removeFavorite(int id);
}
