import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/favorite_cubit.dart';

class FavoriteCharactersPage extends StatefulWidget {
  const FavoriteCharactersPage({super.key});

  @override
  State<FavoriteCharactersPage> createState() => _FavoriteCharactersPageState();
}

class _FavoriteCharactersPageState extends State<FavoriteCharactersPage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    // FavoriteCubit должен быть доступен выше в дереве виджетов, например через MultiBlocProvider или отдельный BlocProvider.
    return Scaffold(
      appBar: AppBar(title: const Text('Избранные персонажи')),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteLoaded) {
            final favorites = state.favorites;
            if (favorites.isEmpty) {
              return const Center(child: Text('Нет избранных персонажей'));
            }
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final character = favorites[index];
                return ListTile(
                  leading: Image.network(
                    character.image,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(character.name),
                  subtitle: Text('${character.species} - ${character.status}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // При нажатии удаляем персонажа из избранного.
                      context.read<FavoriteCubit>().removeFavorite(
                        character.id,
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is FavoriteError) {
            return Center(child: Text('Ошибка: ${state.message}'));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
