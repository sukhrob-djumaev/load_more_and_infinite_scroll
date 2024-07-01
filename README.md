# Advanced Caching with Drift in Flutter

In larger Flutter projects, managing sophisticated caching mechanisms becomes crucial for optimizing performance and user experience. The drift package, built on SQLite, offers powerful database features that enable developers to implement comprehensive caching strategies effectively. By integrating Drift, developers can seamlessly manage complex caching requirements, handle database migrations, and ensure data consistency across app sessions.

[https://www.youtube.com/shorts/Fzfi21YJLj8](https://www.youtube.com/shorts/Fzfi21YJLj8)

```dart
class MoviesRepository implements IMoviesRepository {
  final IConnectionService _connectionService;
  final MoviesDao _moviesDao;
  MoviesRepository({
    required IConnectionService connectionService,
    required MoviesDao moviesDao,
  })  : _connectionService = connectionService,
        _moviesDao = moviesDao;

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
      final remoteGenres = ((await tmbd.v3.genres.getMovieList())['genres'] as List)
          .map(
            (e) => Genre.fromJson(e),
          )
          .toList();
      _moviesDao.addGenres(remoteGenres);
      return remoteGenres;
    } on DioException catch (e) {
      if (e.error is NoInternetException) {
        final localGenres = await _moviesDao.getAllGenres();

        return localGenres;
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MoviesList> fetchMovies(int page) async {
    try {
      final remoteMoviesList = MoviesList.fromJson(
          await tmbd.v3.trending.getTrending(page: page, mediaType: MediaType.movie) as Map<String, dynamic>);

      _moviesDao.addMovies(
        remoteMoviesList.results,
        page,
      );
      return remoteMoviesList;
    } on DioException catch (e) {
      if (e.error is NoInternetException) {
        final localMovies = await _moviesDao.getAllMovies(page);

        return localMovies;
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
```
When integrating Drift, we move the caching responsibility to the repository. The repository saves successful responses to the local database and retrieves cached data when the app is offline. This approach centralizes data management and ensures that the app's data layer handles both network and local data seamlessly.

The database configuration involves defining tables and data access objects (DAOs). Drift generates the necessary functionality, simplifying database interactions. The repository uses DAOs to save and retrieve data, ensuring that all data operations are encapsulated within the repository.

```dart
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
```

```dart
class GenresTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
```

```dart
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
```

All required functionality to store and retrieve cached data is organized in `MoviesDao`. Since the API's method of ordering movies is unknown, an extra field for position is included to maintain the order. Additionally, pagination functionality is implemented to align with the API's pagination.


Integrating Drift in Flutter applications empowers developers to implement advanced caching strategies efficiently. By leveraging SQLite and Drift's capabilities, developers can manage complex data caching requirements, ensure offline availability, and maintain data integrity across app sessions. This approach not only optimizes performance but also enhances the overall user experience by seamlessly handling network and local data interactions.
