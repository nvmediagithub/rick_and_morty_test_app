import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/character_entity.dart';
import '../../domain/entities/favorite_character_entity.dart';

part 'drift_database.g.dart';

class FavoriteCharacters extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get image => text()();
  TextColumn get status => text()();
  TextColumn get species => text()();
  TextColumn get location => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// Таблица для кэширования персонажей
class CachedCharacters extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get image => text()();
  TextColumn get status => text()();
  TextColumn get species => text()();
  TextColumn get location => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [FavoriteCharacters, CachedCharacters])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    // При первом создании базы данных создаются все таблицы
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    // При обновлении схемы
    onUpgrade: (Migrator m, int from, int to) async {
      // Если предыдущая версия меньше 2, то создаём новую таблицу CachedCharacters
      if (from < 2) {
        await m.createTable(cachedCharacters);
      }
      // Если в будущем появятся новые версии, можно добавлять дополнительные условия
    },
  );

  // Получение всех избранных персонажей с маппингом в Domain-сущность
  Future<List<FavoriteCharacterEntity>> getAllFavorites() async {
    final query = select(favoriteCharacters);
    final rows = await query.get();
    return rows
        .map(
          (row) => FavoriteCharacterEntity(
            id: row.id,
            name: row.name,
            image: row.image,
            status: row.status,
            species: row.species,
            location: row.location,
          ),
        )
        .toList();
  }

  // Вставка или обновление избранного персонажа
  Future<int> insertFavorite(FavoriteCharactersCompanion entry) =>
      into(favoriteCharacters).insert(entry, mode: InsertMode.insertOrReplace);

  // Удаление избранного персонажа по id
  Future<int> deleteFavorite(int id) {
    return (delete(favoriteCharacters)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Получение всех кэшированных персонажей с маппингом в Domain-сущность
  Future<List<CharacterEntity>> getAllCachedCharacters() async {
    final query = select(cachedCharacters);
    final rows = await query.get();
    return rows
        .map(
          (row) => CharacterEntity(
            id: row.id,
            name: row.name,
            image: row.image,
            status: row.status,
            species: row.species,
            location: row.location,
          ),
        )
        .toList();
  }

  // Пакетная вставка списка персонажей в таблицу (insertOrReplace)
  Future<void> insertCachedCharacters(
    List<CachedCharactersCompanion> characters,
  ) async {
    await batch((batch) {
      batch.insertAll(
        cachedCharacters,
        characters,
        mode: InsertMode.insertOrReplace,
      );
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbDir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbDir.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
