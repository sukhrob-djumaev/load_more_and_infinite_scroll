// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MoviesTableTable extends MoviesTable
    with TableInfo<$MoviesTableTable, MoviesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
      'vote_average', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, posterPath, voteAverage];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movies_table';
  @override
  VerificationContext validateIntegrity(Insertable<MoviesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoviesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MoviesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      voteAverage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote_average'])!,
    );
  }

  @override
  $MoviesTableTable createAlias(String alias) {
    return $MoviesTableTable(attachedDatabase, alias);
  }
}

class MoviesTableData extends DataClass implements Insertable<MoviesTableData> {
  final int id;
  final String title;
  final String posterPath;
  final double voteAverage;
  const MoviesTableData(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.voteAverage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['poster_path'] = Variable<String>(posterPath);
    map['vote_average'] = Variable<double>(voteAverage);
    return map;
  }

  MoviesTableCompanion toCompanion(bool nullToAbsent) {
    return MoviesTableCompanion(
      id: Value(id),
      title: Value(title),
      posterPath: Value(posterPath),
      voteAverage: Value(voteAverage),
    );
  }

  factory MoviesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoviesTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'posterPath': serializer.toJson<String>(posterPath),
      'voteAverage': serializer.toJson<double>(voteAverage),
    };
  }

  MoviesTableData copyWith(
          {int? id, String? title, String? posterPath, double? voteAverage}) =>
      MoviesTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        posterPath: posterPath ?? this.posterPath,
        voteAverage: voteAverage ?? this.voteAverage,
      );
  @override
  String toString() {
    return (StringBuffer('MoviesTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('voteAverage: $voteAverage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, posterPath, voteAverage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoviesTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.posterPath == this.posterPath &&
          other.voteAverage == this.voteAverage);
}

class MoviesTableCompanion extends UpdateCompanion<MoviesTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> posterPath;
  final Value<double> voteAverage;
  const MoviesTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.voteAverage = const Value.absent(),
  });
  MoviesTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String posterPath,
    required double voteAverage,
  })  : title = Value(title),
        posterPath = Value(posterPath),
        voteAverage = Value(voteAverage);
  static Insertable<MoviesTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? posterPath,
    Expression<double>? voteAverage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (posterPath != null) 'poster_path': posterPath,
      if (voteAverage != null) 'vote_average': voteAverage,
    });
  }

  MoviesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? posterPath,
      Value<double>? voteAverage}) {
    return MoviesTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('voteAverage: $voteAverage')
          ..write(')'))
        .toString();
  }
}

class $GenresTableTable extends GenresTable
    with TableInfo<$GenresTableTable, GenresTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenresTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'genres_table';
  @override
  VerificationContext validateIntegrity(Insertable<GenresTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GenresTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GenresTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $GenresTableTable createAlias(String alias) {
    return $GenresTableTable(attachedDatabase, alias);
  }
}

class GenresTableData extends DataClass implements Insertable<GenresTableData> {
  final int id;
  final String name;
  const GenresTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GenresTableCompanion toCompanion(bool nullToAbsent) {
    return GenresTableCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory GenresTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GenresTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  GenresTableData copyWith({int? id, String? name}) => GenresTableData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('GenresTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenresTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class GenresTableCompanion extends UpdateCompanion<GenresTableData> {
  final Value<int> id;
  final Value<String> name;
  const GenresTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenresTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<GenresTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GenresTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return GenresTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MoviesWithGenresTableTable extends MoviesWithGenresTable
    with TableInfo<$MoviesWithGenresTableTable, MoviesWithGenresTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesWithGenresTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _movieIdMeta =
      const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int> movieId = GeneratedColumn<int>(
      'movie_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES movies_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _genreIdMeta =
      const VerificationMeta('genreId');
  @override
  late final GeneratedColumn<int> genreId = GeneratedColumn<int>(
      'genre_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES genres_table (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [movieId, genreId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movies_with_genres_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MoviesWithGenresTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('genre_id')) {
      context.handle(_genreIdMeta,
          genreId.isAcceptableOrUnknown(data['genre_id']!, _genreIdMeta));
    } else if (isInserting) {
      context.missing(_genreIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MoviesWithGenresTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MoviesWithGenresTableData(
      movieId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}movie_id'])!,
      genreId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}genre_id'])!,
    );
  }

  @override
  $MoviesWithGenresTableTable createAlias(String alias) {
    return $MoviesWithGenresTableTable(attachedDatabase, alias);
  }
}

class MoviesWithGenresTableData extends DataClass
    implements Insertable<MoviesWithGenresTableData> {
  final int movieId;
  final int genreId;
  const MoviesWithGenresTableData(
      {required this.movieId, required this.genreId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['movie_id'] = Variable<int>(movieId);
    map['genre_id'] = Variable<int>(genreId);
    return map;
  }

  MoviesWithGenresTableCompanion toCompanion(bool nullToAbsent) {
    return MoviesWithGenresTableCompanion(
      movieId: Value(movieId),
      genreId: Value(genreId),
    );
  }

  factory MoviesWithGenresTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoviesWithGenresTableData(
      movieId: serializer.fromJson<int>(json['movieId']),
      genreId: serializer.fromJson<int>(json['genreId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'movieId': serializer.toJson<int>(movieId),
      'genreId': serializer.toJson<int>(genreId),
    };
  }

  MoviesWithGenresTableData copyWith({int? movieId, int? genreId}) =>
      MoviesWithGenresTableData(
        movieId: movieId ?? this.movieId,
        genreId: genreId ?? this.genreId,
      );
  @override
  String toString() {
    return (StringBuffer('MoviesWithGenresTableData(')
          ..write('movieId: $movieId, ')
          ..write('genreId: $genreId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(movieId, genreId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoviesWithGenresTableData &&
          other.movieId == this.movieId &&
          other.genreId == this.genreId);
}

class MoviesWithGenresTableCompanion
    extends UpdateCompanion<MoviesWithGenresTableData> {
  final Value<int> movieId;
  final Value<int> genreId;
  final Value<int> rowid;
  const MoviesWithGenresTableCompanion({
    this.movieId = const Value.absent(),
    this.genreId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MoviesWithGenresTableCompanion.insert({
    required int movieId,
    required int genreId,
    this.rowid = const Value.absent(),
  })  : movieId = Value(movieId),
        genreId = Value(genreId);
  static Insertable<MoviesWithGenresTableData> custom({
    Expression<int>? movieId,
    Expression<int>? genreId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (movieId != null) 'movie_id': movieId,
      if (genreId != null) 'genre_id': genreId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MoviesWithGenresTableCompanion copyWith(
      {Value<int>? movieId, Value<int>? genreId, Value<int>? rowid}) {
    return MoviesWithGenresTableCompanion(
      movieId: movieId ?? this.movieId,
      genreId: genreId ?? this.genreId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (genreId.present) {
      map['genre_id'] = Variable<int>(genreId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesWithGenresTableCompanion(')
          ..write('movieId: $movieId, ')
          ..write('genreId: $genreId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $MoviesTableTable moviesTable = $MoviesTableTable(this);
  late final $GenresTableTable genresTable = $GenresTableTable(this);
  late final $MoviesWithGenresTableTable moviesWithGenresTable =
      $MoviesWithGenresTableTable(this);
  late final MoviesDao moviesDao = MoviesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [moviesTable, genresTable, moviesWithGenresTable];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('movies_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('movies_with_genres_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('genres_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('movies_with_genres_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$MoviesTableTableInsertCompanionBuilder = MoviesTableCompanion
    Function({
  Value<int> id,
  required String title,
  required String posterPath,
  required double voteAverage,
});
typedef $$MoviesTableTableUpdateCompanionBuilder = MoviesTableCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<String> posterPath,
  Value<double> voteAverage,
});

class $$MoviesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MoviesTableTable,
    MoviesTableData,
    $$MoviesTableTableFilterComposer,
    $$MoviesTableTableOrderingComposer,
    $$MoviesTableTableProcessedTableManager,
    $$MoviesTableTableInsertCompanionBuilder,
    $$MoviesTableTableUpdateCompanionBuilder> {
  $$MoviesTableTableTableManager(_$AppDatabase db, $MoviesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MoviesTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MoviesTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MoviesTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> posterPath = const Value.absent(),
            Value<double> voteAverage = const Value.absent(),
          }) =>
              MoviesTableCompanion(
            id: id,
            title: title,
            posterPath: posterPath,
            voteAverage: voteAverage,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String posterPath,
            required double voteAverage,
          }) =>
              MoviesTableCompanion.insert(
            id: id,
            title: title,
            posterPath: posterPath,
            voteAverage: voteAverage,
          ),
        ));
}

class $$MoviesTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $MoviesTableTable,
    MoviesTableData,
    $$MoviesTableTableFilterComposer,
    $$MoviesTableTableOrderingComposer,
    $$MoviesTableTableProcessedTableManager,
    $$MoviesTableTableInsertCompanionBuilder,
    $$MoviesTableTableUpdateCompanionBuilder> {
  $$MoviesTableTableProcessedTableManager(super.$state);
}

class $$MoviesTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MoviesTableTable> {
  $$MoviesTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get posterPath => $state.composableBuilder(
      column: $state.table.posterPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get voteAverage => $state.composableBuilder(
      column: $state.table.voteAverage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter moviesWithGenresTableRefs(
      ComposableFilter Function($$MoviesWithGenresTableTableFilterComposer f)
          f) {
    final $$MoviesWithGenresTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.moviesWithGenresTable,
            getReferencedColumn: (t) => t.movieId,
            builder: (joinBuilder, parentComposers) =>
                $$MoviesWithGenresTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.moviesWithGenresTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$MoviesTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MoviesTableTable> {
  $$MoviesTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get posterPath => $state.composableBuilder(
      column: $state.table.posterPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get voteAverage => $state.composableBuilder(
      column: $state.table.voteAverage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$GenresTableTableInsertCompanionBuilder = GenresTableCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$GenresTableTableUpdateCompanionBuilder = GenresTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

class $$GenresTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GenresTableTable,
    GenresTableData,
    $$GenresTableTableFilterComposer,
    $$GenresTableTableOrderingComposer,
    $$GenresTableTableProcessedTableManager,
    $$GenresTableTableInsertCompanionBuilder,
    $$GenresTableTableUpdateCompanionBuilder> {
  $$GenresTableTableTableManager(_$AppDatabase db, $GenresTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GenresTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GenresTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$GenresTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              GenresTableCompanion(
            id: id,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              GenresTableCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$GenresTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $GenresTableTable,
    GenresTableData,
    $$GenresTableTableFilterComposer,
    $$GenresTableTableOrderingComposer,
    $$GenresTableTableProcessedTableManager,
    $$GenresTableTableInsertCompanionBuilder,
    $$GenresTableTableUpdateCompanionBuilder> {
  $$GenresTableTableProcessedTableManager(super.$state);
}

class $$GenresTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $GenresTableTable> {
  $$GenresTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter moviesWithGenresTableRefs(
      ComposableFilter Function($$MoviesWithGenresTableTableFilterComposer f)
          f) {
    final $$MoviesWithGenresTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.moviesWithGenresTable,
            getReferencedColumn: (t) => t.genreId,
            builder: (joinBuilder, parentComposers) =>
                $$MoviesWithGenresTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.moviesWithGenresTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$GenresTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $GenresTableTable> {
  $$GenresTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MoviesWithGenresTableTableInsertCompanionBuilder
    = MoviesWithGenresTableCompanion Function({
  required int movieId,
  required int genreId,
  Value<int> rowid,
});
typedef $$MoviesWithGenresTableTableUpdateCompanionBuilder
    = MoviesWithGenresTableCompanion Function({
  Value<int> movieId,
  Value<int> genreId,
  Value<int> rowid,
});

class $$MoviesWithGenresTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MoviesWithGenresTableTable,
    MoviesWithGenresTableData,
    $$MoviesWithGenresTableTableFilterComposer,
    $$MoviesWithGenresTableTableOrderingComposer,
    $$MoviesWithGenresTableTableProcessedTableManager,
    $$MoviesWithGenresTableTableInsertCompanionBuilder,
    $$MoviesWithGenresTableTableUpdateCompanionBuilder> {
  $$MoviesWithGenresTableTableTableManager(
      _$AppDatabase db, $MoviesWithGenresTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$MoviesWithGenresTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$MoviesWithGenresTableTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MoviesWithGenresTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> movieId = const Value.absent(),
            Value<int> genreId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MoviesWithGenresTableCompanion(
            movieId: movieId,
            genreId: genreId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int movieId,
            required int genreId,
            Value<int> rowid = const Value.absent(),
          }) =>
              MoviesWithGenresTableCompanion.insert(
            movieId: movieId,
            genreId: genreId,
            rowid: rowid,
          ),
        ));
}

class $$MoviesWithGenresTableTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $MoviesWithGenresTableTable,
        MoviesWithGenresTableData,
        $$MoviesWithGenresTableTableFilterComposer,
        $$MoviesWithGenresTableTableOrderingComposer,
        $$MoviesWithGenresTableTableProcessedTableManager,
        $$MoviesWithGenresTableTableInsertCompanionBuilder,
        $$MoviesWithGenresTableTableUpdateCompanionBuilder> {
  $$MoviesWithGenresTableTableProcessedTableManager(super.$state);
}

class $$MoviesWithGenresTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MoviesWithGenresTableTable> {
  $$MoviesWithGenresTableTableFilterComposer(super.$state);
  $$MoviesTableTableFilterComposer get movieId {
    final $$MoviesTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.movieId,
        referencedTable: $state.db.moviesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MoviesTableTableFilterComposer(ComposerState($state.db,
                $state.db.moviesTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$GenresTableTableFilterComposer get genreId {
    final $$GenresTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genreId,
        referencedTable: $state.db.genresTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$GenresTableTableFilterComposer(ComposerState($state.db,
                $state.db.genresTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$MoviesWithGenresTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MoviesWithGenresTableTable> {
  $$MoviesWithGenresTableTableOrderingComposer(super.$state);
  $$MoviesTableTableOrderingComposer get movieId {
    final $$MoviesTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.movieId,
        referencedTable: $state.db.moviesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MoviesTableTableOrderingComposer(ComposerState($state.db,
                $state.db.moviesTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$GenresTableTableOrderingComposer get genreId {
    final $$GenresTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genreId,
        referencedTable: $state.db.genresTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$GenresTableTableOrderingComposer(ComposerState($state.db,
                $state.db.genresTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$MoviesTableTableTableManager get moviesTable =>
      $$MoviesTableTableTableManager(_db, _db.moviesTable);
  $$GenresTableTableTableManager get genresTable =>
      $$GenresTableTableTableManager(_db, _db.genresTable);
  $$MoviesWithGenresTableTableTableManager get moviesWithGenresTable =>
      $$MoviesWithGenresTableTableTableManager(_db, _db.moviesWithGenresTable);
}
