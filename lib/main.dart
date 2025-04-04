import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/characters.dart';
import 'package:rick_and_morty_app/features/home/home.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); // Инициализация зависимостей через DI контейнер
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Предоставляем и CharacterCubit, и FavoriteCubit
        BlocProvider<CharacterCubit>(
          create: (context) => di.sl<CharacterCubit>(),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => di.sl<FavoriteCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Rick and Morty',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}
