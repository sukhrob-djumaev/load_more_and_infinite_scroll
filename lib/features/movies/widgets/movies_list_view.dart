import 'package:flutter/material.dart';

import '../../../shared/widgets/infinite_list_pagination.dart';
import '../models/genre.dart';
import '../models/movie.dart';
import 'movie_item.dart';

class MoviesListView extends StatelessWidget {
  final List<Movie> list;
  final List<Genre> genres;
  final bool hasReachedMax;
  final VoidCallback onMaxScrollExtent;
  const MoviesListView({
    super.key,
    required this.list,
    required this.hasReachedMax,
    required this.genres,
    required this.onMaxScrollExtent,
  });

  @override
  Widget build(BuildContext context) {
    return InfiniteListPagination(
      onMaxScrollExtent: onMaxScrollExtent,
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
}
