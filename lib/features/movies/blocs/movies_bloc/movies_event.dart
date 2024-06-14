part of 'movies_bloc.dart';

@freezed
class MoviesEvent with _$MoviesEvent {
  const factory MoviesEvent.started() = _Started;
  const factory MoviesEvent.loadMoreRequested() = _LoadMoreRequested;
}
