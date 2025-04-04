import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/features/characters/domain/usecases/get_characters_usecase.dart';

// Определяем состояния
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<CharacterEntity> characters;
  CharacterLoaded({required this.characters});
}

class CharacterError extends CharacterState {
  final String message;
  CharacterError({required this.message});
}

// Cubit для загрузки списка персонажей
class CharacterCubit extends Cubit<CharacterState> {
  final GetCharactersUseCase getCharactersUseCase;

  CharacterCubit({required this.getCharactersUseCase})
    : super(CharacterInitial());

  void fetchCharacters() async {
    emit(CharacterLoading());
    try {
      final characters = await getCharactersUseCase();
      emit(CharacterLoaded(characters: characters));
    } catch (e) {
      emit(CharacterError(message: e.toString()));
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
      emit(CharacterLoaded(characters: updatedCharacters));
    }
  }
}
