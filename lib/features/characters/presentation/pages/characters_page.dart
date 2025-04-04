import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/character_cubit.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_card.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Инициируем загрузку персонажей при построении страницы
    context.read<CharacterCubit>().fetchCharacters();

    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty Characters')),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoaded) {
            final characters = state.characters;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return CharacterCard(character: characters[index]);
              },
            );
          } else if (state is CharacterError) {
            return Center(child: Text('Ошибка: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
