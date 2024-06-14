import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie item;
  final List<String> genres;
  const MovieItem({
    super.key,
    required this.item,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            width: 80,
            height: 120,
            fit: BoxFit.cover,
            imageUrl: const String.fromEnvironment('MOVIE_POSTER_URL_PREFIX') + item.posterPath,
          ),
        ),
        const SizedBox(
          width: 26,
        ),
        Expanded(
          child: SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  genres.reduce((value, element) => '$value / $element'),
                  maxLines: 1,
                  style: const TextStyle(color: Color(0xFFFD577B)),
                ),
                const Spacer(),
                Row(
                  children: [
                    Assets.images.vector.star.svg(),
                    const SizedBox(width: 4),
                    Text(
                      item.voteAverage.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
