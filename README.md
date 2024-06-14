# Managing Large Data in Flutter with Infinite Scroll

In today's digital age, mobile applications are a critical component of business strategy. Users expect fast, responsive, and smooth experiences, regardless of the amount of data being handled. Studies show that 53% of mobile users will abandon a site or app that takes longer than 3 seconds to load . Furthermore, applications that offer seamless data loading can see up to a 20% increase in content consumption . Efficient data management is not just a technical concern but a business imperative.

Handling large data sets efficiently is crucial for maintaining user engagement and satisfaction. This is especially relevant for businesses that rely on real-time data, large inventories, or content-heavy platforms. For instance, e-commerce platforms, social media apps, and streaming services all benefit from optimized data handling to keep users engaged and prevent drop-offs.

[https://youtube.com/shorts/dqTBnu-JO9M](https://youtube.com/shorts/dqTBnu-JO9M)

## Why Infinite Scroll?

Infinite scroll is a design pattern that loads content continuously as the user scrolls down the page, eliminating the need for pagination controls. This provides a smoother user experience, especially when dealing with large data sets.

## Implementation Overview

We'll use the `tmdb_api` package to fetch movie data and `flutter_bloc` for state management.

First, you need to get an API key from [TMDB](https://www.themoviedb.org/). Follow the instructions on their website to obtain your key. 

Here's the implementation of the `MoviesBloc`:

```dart
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
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
      emit(
        state.copyWith(
          genres: genres,
          movies: moviesList.results,
          totalPages: moviesList.totalPages,
          page: moviesList.page,
        ),
      );
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
      emit(
        state.copyWith(
          movies: List.of(state.movies)..addAll(moviesList.results),
          totalPages: moviesList.totalPages,
          page: moviesList.page,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: const ErrorStatus('Something went wrong')));
    } finally {
      emit(state.copyWith(status: const StateStatus()));
    }
  }
}
```

In this code, we define a `MoviesBloc` that fetches movie data and handles loading more data when requested. 

### Using Bloc Transformers for Efficient Data Fetching

To efficiently manage API calls and ensure smooth scrolling, we employed a custom Bloc transformer. Transformers in Bloc help control the flow of events, allowing us to implement patterns like throttling and debouncing.

### Why Use Transformers?

When implementing infinite scroll, there's a risk of making too many API calls, especially if the user scrolls rapidly. This can lead to performance issues and hitting rate limits on the API. By using a transformer, we can control the frequency of these calls, ensuring our application remains responsive and within API limits.

### Throttling with `throttleDroppable`

In our `MoviesBloc`, we used a custom transformer called `throttleDroppable`. This transformer combines throttling with the droppable pattern. Throttling ensures that events are processed at most once in a specified duration, while the droppable pattern ensures that only the latest event is processed, dropping any intermediate events.

Here’s the implementation:

```dart
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}
```

### Infinite Scroll Widget

Next, let's create a widget to display the movie list and handle infinite scrolling:

```dart
class MoviesListWidget extends StatelessWidget {
  final List<Movie> list;
  final List<Genre> genres;
  final bool hasReachedMax;

  const MoviesListWidget({
    Key? key,
    required this.list,
    required this.genres,
    required this.hasReachedMax,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfiniteListPagination(
      onMaxScrollExtent: () {
        context.read<MoviesBloc>().add(_LoadMoreRequested());
      },
      builder: (context, scrollController) => ListView.separated(
        controller: scrollController,
        itemCount: hasReachedMax ? list.length : list.length + 1,
        itemBuilder: (context, index) => index >= list.length
            ? const Center(child: CircularProgressIndicator())
            : MovieItem(
                item: list[index],
                genres: genres.where((genre) => list[index].genreIds.contains(genre.id)).map((e) => e.name).toList(),
              ),
        separatorBuilder: (context, index) => const Divider(height: 24),
      ),
    );
  }

```

To display our movie list, we use the `ListView.separated` widget in Flutter. This widget is particularly beneficial for handling large data sets due to its efficient memory management. `ListView.separated` only keeps the widgets visible on the screen in memory, along with a few that are just outside the viewport. This significantly reduces the memory footprint compared to keeping all list items in memory. 

Items are built lazily, meaning that the widget only builds the items that are visible or near the visible area, which improves performance and responsiveness.

To handle infinite scrolling, we use a custom widget called `InfiniteListPagination`. This widget is responsible for detecting when the user has scrolled to the end of the list and then triggering a function to load more data.

The widget listens to the scroll events of the `ScrollController` and determines when the user has reached the maximum scroll extent. It uses a configurable threshold to determine when to start loading more data, providing flexibility in how early the loading starts.

```dart
class InfiniteListPagination extends StatefulWidget {
  final Function(BuildContext context, ScrollController scrollController) builder;
  final Function()? onMaxScrollExtent;
  final double maxScrollExtentThreshold;

  const InfiniteListPagination({
    Key? key,
    required this.builder,
    this.onMaxScrollExtent,
    this.maxScrollExtentThreshold = 0.9,
  }) : super(key: key);

  @override
  State<InfiniteListPagination> createState() => _InfiniteListPaginationState();
}

class _InfiniteListPaginationState extends State<InfiniteListPagination> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if ((scrollController.position.maxScrollExtent * widget.maxScrollExtentThreshold) <
          scrollController.position.pixels) {
        widget.onMaxScrollExtent?.call();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      scrollController,
    );
  }
}
```

## Conclusion

Handling large data sets efficiently in Flutter can significantly enhance the user experience. By implementing infinite scroll with `flutter_bloc` and a custom `InfiniteListPagination` widget, you can ensure smooth and responsive data loading. Leveraging transformers in Bloc for controlled event processing and using `ListView.separated` for efficient memory management further optimizes performance.

This approach can be adapted to various data sources and use cases, making it a valuable technique for any Flutter developer. By following these strategies, you can build applications that handle large amounts of data gracefully, providing a seamless and enjoyable experience for your users.