import '../repositories/favorite_repository.dart';

class RemoveFavoriteUseCase {
  final FavoriteRepository repository;

  RemoveFavoriteUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.removeFavorite(id);
  }
}
