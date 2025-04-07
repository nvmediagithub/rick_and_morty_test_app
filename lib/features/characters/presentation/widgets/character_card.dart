import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/characters.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final statusColor =
        character.status.toLowerCase() == 'alive'
            ? Colors.green
            : character.status.toLowerCase() == 'dead'
            ? Colors.red
            : Colors.grey;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Аватар
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                character.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            // Информация
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Имя
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          character.name,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                  // Статус и вид
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${character.status} - ${character.species}',
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Локация
                  Text(
                    'Last known location:',
                    style: textTheme.bodySmall?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                  Text(
                    character.location,
                    style: textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Пример строки с сериалом — можно адаптировать под реальные поля
                  Text(
                    'First seen in:',
                    style: textTheme.bodySmall?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                  Text(
                    'Unknown episode', // TODO: заменить на actual data если появится
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            // Кнопка избранного
            IconButton(
              icon: Icon(
                character.isFavorite ? Icons.star : Icons.star_border,
                color: Colors.yellow[700],
              ),
              onPressed: () {
                final wasFavorite = character.isFavorite;
                context.read<CharacterCubit>().toggleFavorite(character);
                if (!wasFavorite) {
                  final favorite = toFavorite(character);
                  context.read<FavoriteCubit>().addFavorite(favorite);
                } else {
                  context.read<FavoriteCubit>().removeFavorite(character.id);
                }
              },
            ),
          ],
        ),
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

CharacterEntity toCharacter(FavoriteCharacterEntity character) {
  return CharacterEntity(
    id: character.id,
    name: character.name,
    image: character.image,
    status: character.status,
    species: character.species,
    location: character.location,
    isFavorite: true,
  );
}
