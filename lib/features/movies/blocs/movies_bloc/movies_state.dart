part of 'movies_bloc.dart';

@freezed
class MoviesState with _$MoviesState {
  const MoviesState._();
  const factory MoviesState({
    @Default(StateStatus()) StateStatus status,
    @Default([]) List<Movie> movies,
    @Default([]) List<Genre> genres,
    @Default(1) int page,
    @Default(2) int totalPages,
  }) = _MoviesState;

  bool get hasReachedMax => page >= totalPages;

  factory MoviesState.fromJson(Map<String, dynamic> json) => _$MoviesStateFromJson(json);
}
