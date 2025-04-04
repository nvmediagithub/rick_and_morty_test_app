// lib/features/characters/characters.dart

// Экспорт Domain слоя
export 'domain/entities/character_entity.dart';
export 'domain/usecases/get_characters_usecase.dart';
export 'domain/repositories/character_repository.dart';

export 'domain/entities/favorite_character_entity.dart';
export 'domain/usecases/get_favorites_usecase.dart';
export 'domain/usecases/add_favorite_usecase.dart';
export 'domain/usecases/remove_favorite_usecase.dart';
export 'domain/repositories/favorite_repository.dart';

// Экспорт Data слоя
export 'data/datasources/character_remote_data_source.dart';
export 'data/models/character_model.dart';
export 'data/repositories/character_repository_impl.dart';

export 'data/local/drift_database.dart' show AppDatabase;
export 'data/repositories/favorite_repository_impl.dart';

// Экспорт Presentation слоя
export 'presentation/cubit/character_cubit.dart';
export 'presentation/pages/characters_page.dart';

export 'presentation/pages/favorites_page.dart';
export 'presentation/cubit/favorite_cubit.dart';
