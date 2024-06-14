import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie.dart';

part 'movies_list.freezed.dart';
part 'movies_list.g.dart';

@freezed
class MoviesList with _$MoviesList {
  const factory MoviesList({
    required int page,
    required int totalPages,
    required List<Movie> results,
  }) = _MoviesList;

  factory MoviesList.fromJson(Map<String, dynamic> json) => _$MoviesListFromJson(json);
}
