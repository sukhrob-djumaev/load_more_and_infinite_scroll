import 'package:load_more_and_infinite_scroll/features/movies/models/movies_list.dart';

import '../models/genre.dart';
import '../models/movie.dart';

abstract interface class IMoviesLocalDataSource {
  Future<List<Genre>?> getAllGenres();
  Future<MoviesList?> getAllMovies([int? page]);
  Future<void> deleteAllTables();
  Future<void> addGenres(List<Genre> genres);
  Future<void> addMovies(List<Movie> movies);
}

class MoviesLocalDataSource implements IMoviesLocalDataSource {
  @override
  Future<void> addGenres(List<Genre> genres) {
    // TODO: implement addGenres
    throw UnimplementedError();
  }

  @override
  Future<void> addMovies(List<Movie> movies) {
    // TODO: implement addMovies
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllTables() {
    // TODO: implement deleteAllTables
    throw UnimplementedError();
  }

  @override
  Future<List<Genre>?> getAllGenres() {
    // TODO: implement getAllGenres
    throw UnimplementedError();
  }

  @override
  Future<MoviesList?> getAllMovies([int? page]) {
    // TODO: implement getAllMovies
    throw UnimplementedError();
  }
}
