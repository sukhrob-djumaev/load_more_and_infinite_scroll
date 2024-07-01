import 'package:drift/drift.dart';

class MoviesTable extends Table {
  IntColumn get id => integer()();

  TextColumn get title => text()();

  TextColumn get posterPath => text()();

  RealColumn get voteAverage => real()();

  TextColumn get genreIds => text()();

  IntColumn get position => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
