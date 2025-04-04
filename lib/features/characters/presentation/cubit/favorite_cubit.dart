import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/favorite_character_entity.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/add_favorite_usecase.dart';
import '../../domain/usecases/remove_favorite_usecase.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteCharacterEntity> favorites;
  FavoriteLoaded(this.favorites);
}

class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}

class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  FavoriteCubit({
    required this.getFavoritesUseCase,
    required this.addFavoriteUseCase,
    required this.removeFavoriteUseCase,
  }) : super(FavoriteLoading());

  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    try {
      final favorites = await getFavoritesUseCase();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> addFavorite(FavoriteCharacterEntity character) async {
    try {
      await addFavoriteUseCase(character);
      await loadFavorites();
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> removeFavorite(int id) async {
    try {
      await removeFavoriteUseCase(id);
      await loadFavorites();
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
