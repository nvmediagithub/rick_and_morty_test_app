import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/characters.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Изображение персонажа
          Image.network(
            character.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Имя персонажа
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  // Дополнительные характеристики
                  Text('Статус: ${character.status}'),
                  Text('Вид: ${character.species}'),
                  Text('Локация: ${character.location}'),
                ],
              ),
            ),
          ),
          // Кнопка избранного
          IconButton(
            icon: Icon(
              character.isFavorite ? Icons.star : Icons.star_border,
              color: Colors.yellow,
            ),
            onPressed: () {
              // Сохраняем старое состояние, чтобы понять, что делать с базой данных
              final wasFavorite = character.isFavorite;
              // Обновляем состояние в CharacterCubit (например, переключаем визуальное отображение)
              context.read<CharacterCubit>().toggleFavorite(character);

              // Обновляем базу данных через FavoriteCubit:
              if (!wasFavorite) {
                // Если персонаж ранее не был избранным, добавляем его в базу
                final favorite = toFavorite(character);
                context.read<FavoriteCubit>().addFavorite(favorite);
              } else {
                // Если был избранным – удаляем из базы
                context.read<FavoriteCubit>().removeFavorite(character.id);
              }
            },
          ),
        ],
      ),
    );
  }
}

FavoriteCharacterEntity toFavorite(CharacterEntity character) {
  return FavoriteCharacterEntity(
    id: character.id,
    name: character.name,
    image: character.image,
    status: character.status,
    species: character.species,
    location: character.location,
  );
}
