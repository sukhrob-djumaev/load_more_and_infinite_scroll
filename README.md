# Caching with Hydrated Bloc in Flutter

In today's digital age, mobile applications are a critical component of business strategy. Users expect fast, responsive, and smooth experiences, regardless of the amount of data being handled. Studies show that 53% of mobile users will abandon a site or app that takes longer than 3 seconds to load . Furthermore, applications that offer seamless data loading can see up to a 20% increase in content consumption . Efficient data management is not just a technical concern but a business imperative.

Handling large data sets efficiently is crucial for maintaining user engagement and satisfaction. This is especially relevant for businesses that rely on real-time data, large inventories, or content-heavy platforms. For instance, e-commerce platforms, social media apps, and streaming services all benefit from optimized data handling to keep users engaged and prevent drop-offs.

[https://youtube.com/shorts/oJNcsHARnDU](https://youtube.com/shorts/oJNcsHARnDU)

For simple and quick implementation of caching, we use the hydrated_bloc package. This package extends the functionality of the Bloc library by adding automatic state persistence. By overriding the fromJson and toJson methods, we enable the Bloc to save and restore its state, providing a straightforward way to implement caching for small to medium-sized projects.

```dart
class MoviesBloc extends HydratedBloc<MoviesEvent, MoviesState> {
  final IMoviesRepository _repository;

  MoviesBloc({
    required IMoviesRepository repository,
  })  : _repository = repository,
        super(const MoviesState()) {
    on<_Started>(_onStarted);
    on<_LoadMoreRequested>(
      _onLoadMoreRequested,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  void _onStarted(_Started event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(status: const LoadingStatus()));
    try {
      final genres = await _repository.fetchGenres();
      final moviesList = await _repository.fetchMovies();
      if (genres != null && moviesList != null) {
        emit(
          state.copyWith(
            genres: genres,
            movies: moviesList.results,
            totalPages: moviesList.totalPages,
            page: moviesList.page,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: const ErrorStatus('Something went wrong')));
    } finally {
      emit(state.copyWith(status: const StateStatus()));
    }
  }

  void _onLoadMoreRequested(_LoadMoreRequested event, Emitter<MoviesState> emit) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(status: const LoadingStatus()));
    try {
      final moviesList = await _repository.fetchMovies(state.page + 1);
      if (moviesList != null) {
        emit(
          state.copyWith(
            movies: List.of(state.movies)..addAll(moviesList.results),
            totalPages: moviesList.totalPages,
            page: moviesList.page,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: const ErrorStatus('Something went wrong')));
    } finally {
      emit(state.copyWith(status: const StateStatus()));
    }
  }

  @override
  MoviesState? fromJson(Map<String, dynamic> json) => MoviesState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(MoviesState state) => state.toJson();
}
```
To support caching, we modify our repository to handle both online and offline data fetching. When the app is offline, the repository returns cached data instead of making network requests. This ensures that users can still access previously fetched data even without an internet connection.
```dart
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
```
A custom Dio interceptor is used to intercept network requests and check for internet connectivity. If no internet connection is detected, a custom NoInternetException is thrown. The repository catches this exception and returns cached data, ensuring the app continues to function smoothly without an internet connection.
```dart
class DioConnectionInterceptor extends Interceptor {
  final IConnectionService _connectionService;
  DioConnectionInterceptor({
    required IConnectionService connectionService,
  }) : _connectionService = connectionService;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final hasInternet = await _connectionService.hasInternet();
    if (!hasInternet) {
      throw NoInternetException();
    }
    super.onError(err, handler);
  }
}
```
```dart
class NoInternetException implements Exception {}
```

Implementing caching with hydrated_bloc in Flutter applications provides a straightforward approach to persisting and restoring Bloc state. By leveraging automatic state persistence, developers can enhance app performance and user experience by ensuring consistent state management across app sessions and device restarts. This approach not only simplifies caching implementation but also improves app reliability in handling both online and offline scenarios.
