// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $FavoriteCharactersTable extends FavoriteCharacters
    with TableInfo<$FavoriteCharactersTable, FavoriteCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    image,
    status,
    species,
    location,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteCharacter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteCharacter(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      image:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      species:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}species'],
          )!,
      location:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}location'],
          )!,
    );
  }

  @override
  $FavoriteCharactersTable createAlias(String alias) {
    return $FavoriteCharactersTable(attachedDatabase, alias);
  }
}

class FavoriteCharacter extends DataClass
    implements Insertable<FavoriteCharacter> {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;
  final String location;
  const FavoriteCharacter({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.location,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    map['status'] = Variable<String>(status);
    map['species'] = Variable<String>(species);
    map['location'] = Variable<String>(location);
    return map;
  }

  FavoriteCharactersCompanion toCompanion(bool nullToAbsent) {
    return FavoriteCharactersCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
      status: Value(status),
      species: Value(species),
      location: Value(location),
    );
  }

  factory FavoriteCharacter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteCharacter(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      status: serializer.fromJson<String>(json['status']),
      species: serializer.fromJson<String>(json['species']),
      location: serializer.fromJson<String>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'status': serializer.toJson<String>(status),
      'species': serializer.toJson<String>(species),
      'location': serializer.toJson<String>(location),
    };
  }

  FavoriteCharacter copyWith({
    int? id,
    String? name,
    String? image,
    String? status,
    String? species,
    String? location,
  }) => FavoriteCharacter(
    id: id ?? this.id,
    name: name ?? this.name,
    image: image ?? this.image,
    status: status ?? this.status,
    species: species ?? this.species,
    location: location ?? this.location,
  );
  FavoriteCharacter copyWithCompanion(FavoriteCharactersCompanion data) {
    return FavoriteCharacter(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
      status: data.status.present ? data.status.value : this.status,
      species: data.species.present ? data.species.value : this.species,
      location: data.location.present ? data.location.value : this.location,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteCharacter(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image, status, species, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteCharacter &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.status == this.status &&
          other.species == this.species &&
          other.location == this.location);
}

class FavoriteCharactersCompanion extends UpdateCompanion<FavoriteCharacter> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<String> status;
  final Value<String> species;
  final Value<String> location;
  const FavoriteCharactersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.status = const Value.absent(),
    this.species = const Value.absent(),
    this.location = const Value.absent(),
  });
  FavoriteCharactersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image,
    required String status,
    required String species,
    required String location,
  }) : name = Value(name),
       image = Value(image),
       status = Value(status),
       species = Value(species),
       location = Value(location);
  static Insertable<FavoriteCharacter> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<String>? status,
    Expression<String>? species,
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (status != null) 'status': status,
      if (species != null) 'species': species,
      if (location != null) 'location': location,
    });
  }

  FavoriteCharactersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? image,
    Value<String>? status,
    Value<String>? species,
    Value<String>? location,
  }) {
    return FavoriteCharactersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      status: status ?? this.status,
      species: species ?? this.species,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteCharactersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class $CachedCharactersTable extends CachedCharacters
    with TableInfo<$CachedCharactersTable, CachedCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    image,
    status,
    species,
    location,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedCharacter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedCharacter(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      image:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      species:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}species'],
          )!,
      location:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}location'],
          )!,
    );
  }

  @override
  $CachedCharactersTable createAlias(String alias) {
    return $CachedCharactersTable(attachedDatabase, alias);
  }
}

class CachedCharacter extends DataClass implements Insertable<CachedCharacter> {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;
  final String location;
  const CachedCharacter({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.location,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    map['status'] = Variable<String>(status);
    map['species'] = Variable<String>(species);
    map['location'] = Variable<String>(location);
    return map;
  }

  CachedCharactersCompanion toCompanion(bool nullToAbsent) {
    return CachedCharactersCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
      status: Value(status),
      species: Value(species),
      location: Value(location),
    );
  }

  factory CachedCharacter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedCharacter(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      status: serializer.fromJson<String>(json['status']),
      species: serializer.fromJson<String>(json['species']),
      location: serializer.fromJson<String>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'status': serializer.toJson<String>(status),
      'species': serializer.toJson<String>(species),
      'location': serializer.toJson<String>(location),
    };
  }

  CachedCharacter copyWith({
    int? id,
    String? name,
    String? image,
    String? status,
    String? species,
    String? location,
  }) => CachedCharacter(
    id: id ?? this.id,
    name: name ?? this.name,
    image: image ?? this.image,
    status: status ?? this.status,
    species: species ?? this.species,
    location: location ?? this.location,
  );
  CachedCharacter copyWithCompanion(CachedCharactersCompanion data) {
    return CachedCharacter(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
      status: data.status.present ? data.status.value : this.status,
      species: data.species.present ? data.species.value : this.species,
      location: data.location.present ? data.location.value : this.location,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedCharacter(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image, status, species, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedCharacter &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.status == this.status &&
          other.species == this.species &&
          other.location == this.location);
}

class CachedCharactersCompanion extends UpdateCompanion<CachedCharacter> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<String> status;
  final Value<String> species;
  final Value<String> location;
  const CachedCharactersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.status = const Value.absent(),
    this.species = const Value.absent(),
    this.location = const Value.absent(),
  });
  CachedCharactersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image,
    required String status,
    required String species,
    required String location,
  }) : name = Value(name),
       image = Value(image),
       status = Value(status),
       species = Value(species),
       location = Value(location);
  static Insertable<CachedCharacter> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<String>? status,
    Expression<String>? species,
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (status != null) 'status': status,
      if (species != null) 'species': species,
      if (location != null) 'location': location,
    });
  }

  CachedCharactersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? image,
    Value<String>? status,
    Value<String>? species,
    Value<String>? location,
  }) {
    return CachedCharactersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      status: status ?? this.status,
      species: species ?? this.species,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedCharactersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteCharactersTable favoriteCharacters =
      $FavoriteCharactersTable(this);
  late final $CachedCharactersTable cachedCharacters = $CachedCharactersTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    favoriteCharacters,
    cachedCharacters,
  ];
}

typedef $$FavoriteCharactersTableCreateCompanionBuilder =
    FavoriteCharactersCompanion Function({
      Value<int> id,
      required String name,
      required String image,
      required String status,
      required String species,
      required String location,
    });
typedef $$FavoriteCharactersTableUpdateCompanionBuilder =
    FavoriteCharactersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> image,
      Value<String> status,
      Value<String> species,
      Value<String> location,
    });

class $$FavoriteCharactersTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteCharactersTable> {
  $$FavoriteCharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteCharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteCharactersTable> {
  $$FavoriteCharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteCharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteCharactersTable> {
  $$FavoriteCharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);
}

class $$FavoriteCharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteCharactersTable,
          FavoriteCharacter,
          $$FavoriteCharactersTableFilterComposer,
          $$FavoriteCharactersTableOrderingComposer,
          $$FavoriteCharactersTableAnnotationComposer,
          $$FavoriteCharactersTableCreateCompanionBuilder,
          $$FavoriteCharactersTableUpdateCompanionBuilder,
          (
            FavoriteCharacter,
            BaseReferences<
              _$AppDatabase,
              $FavoriteCharactersTable,
              FavoriteCharacter
            >,
          ),
          FavoriteCharacter,
          PrefetchHooks Function()
        > {
  $$FavoriteCharactersTableTableManager(
    _$AppDatabase db,
    $FavoriteCharactersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$FavoriteCharactersTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$FavoriteCharactersTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$FavoriteCharactersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<String> location = const Value.absent(),
              }) => FavoriteCharactersCompanion(
                id: id,
                name: name,
                image: image,
                status: status,
                species: species,
                location: location,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String image,
                required String status,
                required String species,
                required String location,
              }) => FavoriteCharactersCompanion.insert(
                id: id,
                name: name,
                image: image,
                status: status,
                species: species,
                location: location,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteCharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteCharactersTable,
      FavoriteCharacter,
      $$FavoriteCharactersTableFilterComposer,
      $$FavoriteCharactersTableOrderingComposer,
      $$FavoriteCharactersTableAnnotationComposer,
      $$FavoriteCharactersTableCreateCompanionBuilder,
      $$FavoriteCharactersTableUpdateCompanionBuilder,
      (
        FavoriteCharacter,
        BaseReferences<
          _$AppDatabase,
          $FavoriteCharactersTable,
          FavoriteCharacter
        >,
      ),
      FavoriteCharacter,
      PrefetchHooks Function()
    >;
typedef $$CachedCharactersTableCreateCompanionBuilder =
    CachedCharactersCompanion Function({
      Value<int> id,
      required String name,
      required String image,
      required String status,
      required String species,
      required String location,
    });
typedef $$CachedCharactersTableUpdateCompanionBuilder =
    CachedCharactersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> image,
      Value<String> status,
      Value<String> species,
      Value<String> location,
    });

class $$CachedCharactersTableFilterComposer
    extends Composer<_$AppDatabase, $CachedCharactersTable> {
  $$CachedCharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedCharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedCharactersTable> {
  $$CachedCharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedCharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedCharactersTable> {
  $$CachedCharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);
}

class $$CachedCharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedCharactersTable,
          CachedCharacter,
          $$CachedCharactersTableFilterComposer,
          $$CachedCharactersTableOrderingComposer,
          $$CachedCharactersTableAnnotationComposer,
          $$CachedCharactersTableCreateCompanionBuilder,
          $$CachedCharactersTableUpdateCompanionBuilder,
          (
            CachedCharacter,
            BaseReferences<
              _$AppDatabase,
              $CachedCharactersTable,
              CachedCharacter
            >,
          ),
          CachedCharacter,
          PrefetchHooks Function()
        > {
  $$CachedCharactersTableTableManager(
    _$AppDatabase db,
    $CachedCharactersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$CachedCharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CachedCharactersTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CachedCharactersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<String> location = const Value.absent(),
              }) => CachedCharactersCompanion(
                id: id,
                name: name,
                image: image,
                status: status,
                species: species,
                location: location,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String image,
                required String status,
                required String species,
                required String location,
              }) => CachedCharactersCompanion.insert(
                id: id,
                name: name,
                image: image,
                status: status,
                species: species,
                location: location,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedCharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedCharactersTable,
      CachedCharacter,
      $$CachedCharactersTableFilterComposer,
      $$CachedCharactersTableOrderingComposer,
      $$CachedCharactersTableAnnotationComposer,
      $$CachedCharactersTableCreateCompanionBuilder,
      $$CachedCharactersTableUpdateCompanionBuilder,
      (
        CachedCharacter,
        BaseReferences<_$AppDatabase, $CachedCharactersTable, CachedCharacter>,
      ),
      CachedCharacter,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteCharactersTableTableManager get favoriteCharacters =>
      $$FavoriteCharactersTableTableManager(_db, _db.favoriteCharacters);
  $$CachedCharactersTableTableManager get cachedCharacters =>
      $$CachedCharactersTableTableManager(_db, _db.cachedCharacters);
}
