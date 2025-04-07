import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/favorite_repository.dart';
import 'package:rick_and_morty_app/features/characters/domain/usecases/get_characters_usecase.dart';

// Определяем состояния
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<CharacterEntity> characters;
  final bool hasMore;
  CharacterLoaded({required this.characters, required this.hasMore});
}

class CharacterError extends CharacterState {
  final String message;
  CharacterError({required this.message});
}

// Cubit для загрузки списка персонажей
class CharacterCubit extends Cubit<CharacterState> {
  final GetCharactersUseCase getCharactersUseCase;
  final FavoriteRepository favoriteRepository;

  CharacterCubit({
    required this.getCharactersUseCase,
    required this.favoriteRepository,
  }) : super(CharacterInitial());

  int _currentPage = 1;
  bool _isFetching = false;
  bool _hasMore = true;
  List<CharacterEntity> _characters = [];

  Future<void> fetchCharacters({bool isRefresh = false}) async {
    if (_isFetching || !_hasMore) return;
    _isFetching = true;

    if (isRefresh) {
      _currentPage = 1;
      _hasMore = true;
      _characters.clear();
    }

    if (state is! CharacterLoaded && !isRefresh) {
      emit(CharacterLoading());
    }

    try {
      final characters = await getCharactersUseCase(page: _currentPage);
      final favorites = await favoriteRepository.getFavorites();
      final favoriteIds = favorites.map((e) => e.id).toSet();

      final newCharacters =
          characters
              .map(
                (char) =>
                    char.copyWith(isFavorite: favoriteIds.contains(char.id)),
              )
              .where(
                (char) =>
                    !_characters.any((existing) => existing.id == char.id),
              ) // 🔥 удаляем дубликаты
              .toList();

      if (newCharacters.isNotEmpty) {
        _characters.addAll(newCharacters);
        _currentPage++;
      } else {
        _hasMore = false;
      }

      emit(
        CharacterLoaded(characters: List.from(_characters), hasMore: _hasMore),
      );
    } catch (e) {
      emit(CharacterError(message: e.toString()));
    } finally {
      _isFetching = false;
    }
  }

  // Метод для переключения избранного (пример)
  void toggleFavorite(CharacterEntity character) {
    if (state is CharacterLoaded) {
      final currentState = state as CharacterLoaded;
      final updatedCharacters =
          currentState.characters.map((c) {
            if (c.id == character.id) {
              return CharacterEntity(
                id: c.id,
                name: c.name,
                image: c.image,
                status: c.status,
                species: c.species,
                location: c.location,
                isFavorite: !c.isFavorite,
              );
            }
            return c;
          }).toList();
      emit(CharacterLoaded(characters: updatedCharacters, hasMore: false));
    }
  }
}
