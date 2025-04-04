import '../entities/favorite_character_entity.dart';
import '../repositories/favorite_repository.dart';

class GetFavoritesUseCase {
  final FavoriteRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<List<FavoriteCharacterEntity>> call() async {
    return await repository.getFavorites();
  }
}
