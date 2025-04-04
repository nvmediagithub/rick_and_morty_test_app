import '../entities/character_entity.dart';
import '../repositories/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository repository;

  GetCharactersUseCase({required this.repository});

  Future<List<CharacterEntity>> call() async {
    return await repository.getCharacters();
  }
}
