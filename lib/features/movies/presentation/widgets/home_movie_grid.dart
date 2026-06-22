import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/navigations/app_navigator.dart';
import '../../../../widgets/movie_grid.dart';
import '../controller/movies.controller.dart';
import '../controller/search.controller.dart';

class HomeMovieGrid extends ConsumerWidget {
  const HomeMovieGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesState = ref.watch(moviesControllerProvider);
    final searchState = ref.watch(searchControllerProvider);
    final isSearching = searchState.query.trim().isNotEmpty;

    final displayMovies = isSearching ? searchState.results : moviesState.movies;
    final displayLoading = isSearching ? searchState.loading : moviesState.loading;
    final displayHasMore = isSearching ? searchState.hasMore : moviesState.hasMore;
    final displayLoadMore = isSearching ? ref.read(searchControllerProvider.notifier).loadMore : ref.read(moviesControllerProvider.notifier).loadMore;

    return MovieGrid(
      movies: displayMovies,
      loading: displayLoading,
      hasMore: displayHasMore,
      onLoadMore: displayLoadMore,
      onMoviePress: (movie) => AppNavigator.pushMovieDetail(context, movie.id),
      error: isSearching ? searchState.error : null,
      onRetry: isSearching ? ref.read(searchControllerProvider.notifier).retry : null,
    );
  }
}
