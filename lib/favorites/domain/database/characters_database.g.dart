// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_database.dart';

// ignore_for_file: type=lint
class $CharactersDatabaseTable extends CharactersDatabase
    with TableInfo<$CharactersDatabaseTable, CharactersDatabaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersDatabaseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, image, name, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters_database';
  @override
  VerificationContext validateIntegrity(
      Insertable<CharactersDatabaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CharactersDatabaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharactersDatabaseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $CharactersDatabaseTable createAlias(String alias) {
    return $CharactersDatabaseTable(attachedDatabase, alias);
  }
}

class CharactersDatabaseData extends DataClass
    implements Insertable<CharactersDatabaseData> {
  final int id;
  final String image;
  final String name;
  final String status;
  const CharactersDatabaseData(
      {required this.id,
      required this.image,
      required this.name,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['image'] = Variable<String>(image);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    return map;
  }

  CharactersDatabaseCompanion toCompanion(bool nullToAbsent) {
    return CharactersDatabaseCompanion(
      id: Value(id),
      image: Value(image),
      name: Value(name),
      status: Value(status),
    );
  }

  factory CharactersDatabaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharactersDatabaseData(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String>(json['image']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String>(image),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
    };
  }

  CharactersDatabaseData copyWith(
          {int? id, String? image, String? name, String? status}) =>
      CharactersDatabaseData(
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        status: status ?? this.status,
      );
  CharactersDatabaseData copyWithCompanion(CharactersDatabaseCompanion data) {
    return CharactersDatabaseData(
      id: data.id.present ? data.id.value : this.id,
      image: data.image.present ? data.image.value : this.image,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharactersDatabaseData(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, image, name, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharactersDatabaseData &&
          other.id == this.id &&
          other.image == this.image &&
          other.name == this.name &&
          other.status == this.status);
}

class CharactersDatabaseCompanion
    extends UpdateCompanion<CharactersDatabaseData> {
  final Value<int> id;
  final Value<String> image;
  final Value<String> name;
  final Value<String> status;
  final Value<int> rowid;
  const CharactersDatabaseCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharactersDatabaseCompanion.insert({
    required int id,
    required String image,
    required String name,
    required String status,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        image = Value(image),
        name = Value(name),
        status = Value(status);
  static Insertable<CharactersDatabaseData> custom({
    Expression<int>? id,
    Expression<String>? image,
    Expression<String>? name,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharactersDatabaseCompanion copyWith(
      {Value<int>? id,
      Value<String>? image,
      Value<String>? name,
      Value<String>? status,
      Value<int>? rowid}) {
    return CharactersDatabaseCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersDatabaseCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CharactersDatabaseTable charactersDatabase =
      $CharactersDatabaseTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [charactersDatabase];
}

typedef $$CharactersDatabaseTableCreateCompanionBuilder
    = CharactersDatabaseCompanion Function({
  required int id,
  required String image,
  required String name,
  required String status,
  Value<int> rowid,
});
typedef $$CharactersDatabaseTableUpdateCompanionBuilder
    = CharactersDatabaseCompanion Function({
  Value<int> id,
  Value<String> image,
  Value<String> name,
  Value<String> status,
  Value<int> rowid,
});

class $$CharactersDatabaseTableFilterComposer
    extends Composer<_$AppDatabase, $CharactersDatabaseTable> {
  $$CharactersDatabaseTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$CharactersDatabaseTableOrderingComposer
    extends Composer<_$AppDatabase, $CharactersDatabaseTable> {
  $$CharactersDatabaseTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$CharactersDatabaseTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharactersDatabaseTable> {
  $$CharactersDatabaseTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$CharactersDatabaseTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CharactersDatabaseTable,
    CharactersDatabaseData,
    $$CharactersDatabaseTableFilterComposer,
    $$CharactersDatabaseTableOrderingComposer,
    $$CharactersDatabaseTableAnnotationComposer,
    $$CharactersDatabaseTableCreateCompanionBuilder,
    $$CharactersDatabaseTableUpdateCompanionBuilder,
    (
      CharactersDatabaseData,
      BaseReferences<_$AppDatabase, $CharactersDatabaseTable,
          CharactersDatabaseData>
    ),
    CharactersDatabaseData,
    PrefetchHooks Function()> {
  $$CharactersDatabaseTableTableManager(
      _$AppDatabase db, $CharactersDatabaseTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharactersDatabaseTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharactersDatabaseTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharactersDatabaseTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CharactersDatabaseCompanion(
            id: id,
            image: image,
            name: name,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String image,
            required String name,
            required String status,
            Value<int> rowid = const Value.absent(),
          }) =>
              CharactersDatabaseCompanion.insert(
            id: id,
            image: image,
            name: name,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CharactersDatabaseTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CharactersDatabaseTable,
    CharactersDatabaseData,
    $$CharactersDatabaseTableFilterComposer,
    $$CharactersDatabaseTableOrderingComposer,
    $$CharactersDatabaseTableAnnotationComposer,
    $$CharactersDatabaseTableCreateCompanionBuilder,
    $$CharactersDatabaseTableUpdateCompanionBuilder,
    (
      CharactersDatabaseData,
      BaseReferences<_$AppDatabase, $CharactersDatabaseTable,
          CharactersDatabaseData>
    ),
    CharactersDatabaseData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CharactersDatabaseTableTableManager get charactersDatabase =>
      $$CharactersDatabaseTableTableManager(_db, _db.charactersDatabase);
}
