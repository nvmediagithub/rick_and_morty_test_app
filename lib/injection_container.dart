import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/features/characters/characters.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton<Dio>(() => Dio());
  // Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(dio: sl()),
  );
  // Repository (регистрируем через интерфейс, если потребуется)
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(remoteDataSource: sl(), database: sl()),
  );
  // Use case
  sl.registerLazySingleton<GetCharactersUseCase>(
    () => GetCharactersUseCase(repository: sl()),
  );
  // Cubit (каждый вызов создаёт новый экземпляр)
  sl.registerFactory<CharacterCubit>(
    () => CharacterCubit(getCharactersUseCase: sl()),
  );

  // Регистрация базы данных (если Drift используется)
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  // Регистрация репозитория избранного
  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(database: sl<AppDatabase>()),
  );
  // Регистрация use case‑ов для избранного
  sl.registerLazySingleton<GetFavoritesUseCase>(
    () => GetFavoritesUseCase(sl<FavoriteRepository>()),
  );
  sl.registerLazySingleton<AddFavoriteUseCase>(
    () => AddFavoriteUseCase(sl<FavoriteRepository>()),
  );
  sl.registerLazySingleton<RemoveFavoriteUseCase>(
    () => RemoveFavoriteUseCase(sl<FavoriteRepository>()),
  );
  // Регистрация FavoriteCubit
  sl.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(
      getFavoritesUseCase: sl<GetFavoritesUseCase>(),
      addFavoriteUseCase: sl<AddFavoriteUseCase>(),
      removeFavoriteUseCase: sl<RemoveFavoriteUseCase>(),
    ),
  );
}
