import 'package:drift/drift.dart';
import 'package:load_more_and_infinite_scroll/features/movies/models/movie.dart';
import 'package:load_more_and_infinite_scroll/features/movies/tables/genres_table.dart';
import 'package:load_more_and_infinite_scroll/features/movies/tables/movies_table.dart';
import 'package:load_more_and_infinite_scroll/features/movies/tables/movies_with_genres.dart';

import '../../../shared/services/database/database.dart';
import '../models/genre.dart';
import '../models/movies_list.dart';

part 'movies_dao.g.dart';

@DriftAccessor(tables: [MoviesTable, GenresTable, MoviesWithGenresTable])
class MoviesDao extends DatabaseAccessor<AppDatabase> with _$MoviesDaoMixin {
  MoviesDao(super.db);

  Future<List<Genre>> getAllGenres() async {
    return (await select(genresTable).get())
        .map(
          (e) => Genre(
            id: e.id,
            name: e.name,
          ),
        )
        .toList();
  }

  Future<MoviesList> getAllMovies([int? page]) async {
    final genresList = moviesWithGenresTable.genreId.groupConcat();
    final query = (select(moviesTable).join(
      [
        innerJoin(
          moviesWithGenresTable,
          moviesWithGenresTable.movieId.equalsExp(moviesTable.id),
        ),
      ],
    )
      ..addColumns([
        genresList,
      ])
      ..groupBy([
        moviesWithGenresTable.movieId,
      ]));
    final results = await query.map(
      (e) {
        return e.readTable(moviesTable).toModel(e.read(genresList));
      },
    ).get();

    return MoviesList(page: 1, results: results, totalPages: 2);
  }

  Future<void> addGenres(List<Genre> genres) async {
    await transaction(() async {
      await delete(genresTable).go();

      await batch(
        (batch) {
          batch.insertAll(
            genresTable,
            genres.map(
              (e) => e.toEntity(),
            ),
          );
        },
      );
    });
  }

  Future<void> addMovies(List<Movie> movies) async {
    await transaction(() async {
      await delete(moviesTable).go();

      await batch(
        (batch) {
          batch.insertAll(
            moviesTable,
            movies.map(
              (e) => e.toEntity(),
            ),
          );
        },
      );

      await batch(
        (batch) {
          batch.insertAll(
            moviesWithGenresTable,
            movies.expand(
              (element) {
                return element.genreIds.map(
                  (e) {
                    return (element.id, e);
                  },
                );
              },
            ).map(
              (e) => MoviesWithGenresTableCompanion.insert(
                movieId: e.$1,
                genreId: e.$2,
              ),
            ),
          );
        },
      );
    });
  }
}

extension MoviesTableDataX on MoviesTableData {
  Movie toModel(String? genreIds) {
    return Movie(
      id: id,
      title: title,
      posterPath: posterPath,
      voteAverage: voteAverage,
      genreIds: genreIds == null
          ? []
          : genreIds
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
  Insertable<GenresTableData> toEntity() {
    return GenresTableCompanion.insert(
      id: Value(id),
      name: name,
    );
  }
}

extension MovieX on Movie {
  Insertable<MoviesTableData> toEntity() {
    return MoviesTableCompanion.insert(
      id: Value(id),
      title: title,
      posterPath: posterPath,
      voteAverage: voteAverage,
    );
  }
}
