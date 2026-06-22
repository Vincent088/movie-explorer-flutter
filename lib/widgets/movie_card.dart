import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/constants/api.constants.dart';
import '../features/movies/domain/model/movie.model.dart';
import '../core/configs/app_theme.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onPress;

  const MovieCard({super.key, required this.movie, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterPath != null ? '${Api.imageUrl}${movie.posterPath}' : null;
    final year = movie.releaseDate.isNotEmpty ? movie.releaseDate.substring(0, 4) : '';

    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: posterUrl != null
                      ? CachedNetworkImage(
                          imageUrl: posterUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          fadeInDuration: const Duration(milliseconds: 200),
                          errorWidget: (context, url, error) => Container(color: context.surfaceAlt),
                        )
                      : Container(color: context.surfaceAlt),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  color: Colors.black.withValues(alpha: 0.78),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600, height: 1.3),
                      ),
                      if (year.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(year, style: const TextStyle(color: Color(0xFFAAAAAA), fontSize: 10)),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(color: getRatingColor(movie.voteAverage), borderRadius: BorderRadius.circular(6)),
                child: Text(
                  '★ ${movie.voteAverage.toStringAsFixed(1)}',
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
