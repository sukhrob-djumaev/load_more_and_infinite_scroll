import 'package:tmdb_api/tmdb_api.dart';

import '../models/genre.dart';
import '../models/movies_list.dart';

abstract interface class IMoviesRepository {
  Future<List<Genre>> fetchGenres();
  Future<MoviesList> fetchMovies([int? page]);
}

class MoviesRepository implements IMoviesRepository {
  final tmbd = TMDB(ApiKeys(const String.fromEnvironment('TMDB_API_KEY'), 'apiReadAccessTokenv4'));

  @override
  Future<List<Genre>> fetchGenres() async {
    return ((await tmbd.v3.genres.getMovieList())['genres'] as List).map((e) => Genre.fromJson(e)).toList();
  }

  @override
  Future<MoviesList> fetchMovies([int? page]) async {
    return MoviesList.fromJson(
        await tmbd.v3.trending.getTrending(page: page ?? 1, mediaType: MediaType.movie) as Map<String, dynamic>);
  }
}
