// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'package:load_more_and_infinite_scroll/shared/services/connection_service.dart';

import '../../../shared/models/exceptions/no_internet_exceptions.dart';
import '../../../shared/utils/dio_connection_interceptor.dart';
import '../models/genre.dart';
import '../models/movies_list.dart';

abstract interface class IMoviesRepository {
  Future<List<Genre>?> fetchGenres();
  Future<MoviesList?> fetchMovies([int? page]);
}

class MoviesRepository implements IMoviesRepository {
  final IConnectionService _connectionService;
  MoviesRepository({
    required IConnectionService connectionService,
  }) : _connectionService = connectionService;

  late final tmbd = TMDB(
    ApiKeys(const String.fromEnvironment('TMDB_API_KEY'), 'apiReadAccessTokenv4'),
    interceptors: Interceptors()
      ..add(
        DioConnectionInterceptor(connectionService: _connectionService),
      ),
  );

  @override
  Future<List<Genre>?> fetchGenres() async {
    try {
      return ((await tmbd.v3.genres.getMovieList())['genres'] as List).map((e) => Genre.fromJson(e)).toList();
    } on NoInternetException {
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MoviesList?> fetchMovies([int? page]) async {
    try {
      return MoviesList.fromJson(
          await tmbd.v3.trending.getTrending(page: page ?? 1, mediaType: MediaType.movie) as Map<String, dynamic>);
    } on NoInternetException {
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
