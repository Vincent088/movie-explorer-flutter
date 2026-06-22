import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/strings.constants.dart';
import '../../../widgets/error_message.dart';
import '../../../widgets/loading_indicator.dart';
import 'controller/movie_detail.controller.dart';
import 'widgets/detail_back_button.dart';
import 'widgets/genre_chips.dart';
import 'widgets/movie_backdrop.dart';
import 'widgets/movie_meta_row.dart';
import 'widgets/movie_overview_section.dart';
import 'widgets/movie_title_header.dart';

class MovieDetailScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(movieDetailControllerProvider(movieId));

    return Scaffold(
      body: detailAsync.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorMessage(message: Strings.common.genericError, onRetry: () => ref.invalidate(movieDetailControllerProvider(movieId))),
        data: (movie) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieBackdrop(backdropPath: movie.backdropPath),
                    SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MovieTitleHeader(movie: movie),
                            const SizedBox(height: 4),
                            MovieMetaRow(voteAverage: movie.voteAverage, releaseDate: movie.releaseDate, runtime: movie.runtime),
                            GenreChips(genres: movie.genres),
                            const SizedBox(height: 12),
                            MovieOverviewSection(overview: movie.overview),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const DetailBackButton(),
            ],
          );
        },
      ),
    );
  }
}
