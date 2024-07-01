import 'package:drift/drift.dart';
import 'package:load_more_and_infinite_scroll/features/movies/tables/genres_table.dart';
import 'package:load_more_and_infinite_scroll/features/movies/tables/movies_table.dart';

class MoviesWithGenresTable extends Table {
  IntColumn get movieId => integer().references(MoviesTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get genreId => integer().references(GenresTable, #id, onDelete: KeyAction.cascade)();
}
