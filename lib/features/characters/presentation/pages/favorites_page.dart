import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/characters.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_card.dart';

class FavoriteCharactersPage extends StatefulWidget {
  const FavoriteCharactersPage({super.key});

  @override
  State<FavoriteCharactersPage> createState() => _FavoriteCharactersPageState();
}

class _FavoriteCharactersPageState extends State<FavoriteCharactersPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<FavoriteCharacterEntity> _localFavorites = [];

  @override
  void initState() {
    super.initState();
    final cubit = context.read<FavoriteCubit>();
    cubit.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Избранные персонажи')),
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is FavoriteLoaded) {
            // если первый раз — заполняем локально
            if (_localFavorites.isEmpty && state.favorites.isNotEmpty) {
              _localFavorites = List.from(state.favorites);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                for (int i = 0; i < _localFavorites.length; i++) {
                  _listKey.currentState?.insertItem(i);
                }
              });
            }
          }
        },
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteLoaded) {
            if (_localFavorites.isEmpty) {
              return Center(
                child: Text(
                  'Нет избранных персонажей',
                  style: textTheme.titleMedium,
                ),
              );
            }

            return AnimatedList(
              key: _listKey,
              initialItemCount: _localFavorites.length,
              padding: const EdgeInsets.only(bottom: 16),
              itemBuilder: (context, index, animation) {
                final character = _localFavorites[index];
                return SizeTransition(
                  sizeFactor: animation,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CharacterCard(character: toCharacter(character)),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            _removeCharacter(character, index);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is FavoriteError) {
            return Center(
              child: Text(
                'Ошибка: ${state.message}',
                style: textTheme.bodyLarge,
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  void _removeCharacter(FavoriteCharacterEntity character, int index) {
    final removedItem = _localFavorites.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: CharacterCard(character: toCharacter(removedItem)),
      ),
      duration: const Duration(milliseconds: 300),
    );
    context.read<FavoriteCubit>().removeFavorite(character.id);
  }
}
