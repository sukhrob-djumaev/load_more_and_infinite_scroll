import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:load_more_and_infinite_scroll/features/movies/repositories/movies_repository.dart';
import 'package:load_more_and_infinite_scroll/shared/models/state_status/state_status.dart';

import '../../../../shared/utils/bloc_transformers.dart';
import '../../models/genre.dart';
import '../../models/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';
part 'movies_bloc.freezed.dart';

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
