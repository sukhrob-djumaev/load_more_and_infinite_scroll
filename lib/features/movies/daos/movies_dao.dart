import 'package:drift/drift.dart';
import 'package:collection/collection.dart';
import 'package:load_more_and_infinite_scroll/features/movies/models/movie.dart';
import 'package:load_more_and_infinite_scroll/features/movies/tables/genres_table.dart';
import 'package:load_more_and_infinite_scroll/features/movies/tables/movies_table.dart';

import '../../../shared/services/database/database.dart';
import '../models/genre.dart';
import '../models/movies_list.dart';

part 'movies_dao.g.dart';

@DriftAccessor(tables: [MoviesTable, GenresTable])
class MoviesDao extends DatabaseAccessor<AppDatabase> with _$MoviesDaoMixin {
  MoviesDao(super.db);

  Future<List<Genre>> getAllGenres() async {
    return (await select(genresTable).get())
        .map(
          (e) => e.toModel(),
        )
        .toList();
  }

  Future<MoviesList> getAllMovies([int? page]) async {
    final offset = page != null && page > 1 ? 20 * page - 20 : null;
    final totalElementsLength = (await select(moviesTable).get()).length;
    if (totalElementsLength <= 0) {
      return const MoviesList(page: 1, results: [], totalPages: 1);
    }
    final totalPages = (totalElementsLength / 20).ceil();
    final results = (await (select(moviesTable)
              ..orderBy([(t) => OrderingTerm(expression: t.position)])
              ..limit(20, offset: offset))
            .get())
        .map(
          (e) => e.toModel(),
        )
        .toList();

    return MoviesList(page: page ?? 1, results: results, totalPages: totalPages);
  }

  Future<void> addGenres(List<Genre> genres) async {
    await transaction(() async {
      await delete(genresTable).go();

      await batch(
        (batch) {
          batch.insertAll(
            genresTable,
            genres.map((e) => e.toDBData()),
          );
        },
      );
    });
  }

  Future<void> addMovies(List<Movie> movies, int page) async {
    await transaction(() async {
      if (page == 1) {
        await delete(moviesTable).go();
      }

      await batch(
        (batch) {
          batch.insertAll(
            moviesTable,
            movies.mapIndexed((i, e) => e.toDBData(int.parse('$page$i'))),
          );
        },
      );
    });
  }
}

extension GenresTableDataX on GenresTableData {
  Genre toModel() {
    return Genre(
      id: id,
      name: name,
    );
  }
}

extension MoviesTableDataX on MoviesTableData {
  Movie toModel() {
    return Movie(
      id: id,
      title: title,
      posterPath: posterPath,
      voteAverage: voteAverage,
      genreIds: genreIds
          .split(',')
          .map(
            (e) => int.tryParse(e),
          )
          .nonNulls
          .toList(),
    );
  }
}

extension GenreX on Genre {
  Insertable<GenresTableData> toDBData() {
    return GenresTableCompanion.insert(
      id: Value(id),
      name: name,
    );
  }
}

extension MovieX on Movie {
  Insertable<MoviesTableData> toDBData(int position) {
    return MoviesTableCompanion.insert(
      id: Value(id),
      title: title,
      posterPath: posterPath,
      voteAverage: voteAverage,
      position: position,
      genreIds: genreIds.fold(
        '',
        (previousValue, element) => '$previousValue,$element',
      ),
    );
  }
}
