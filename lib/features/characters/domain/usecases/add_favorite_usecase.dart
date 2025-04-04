import '../entities/favorite_character_entity.dart';
import '../repositories/favorite_repository.dart';

class AddFavoriteUseCase {
  final FavoriteRepository repository;

  AddFavoriteUseCase(this.repository);

  Future<void> call(FavoriteCharacterEntity character) async {
    await repository.addFavorite(character);
  }
}
