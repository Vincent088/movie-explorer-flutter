import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/error_mapper.dart';
import '../../domain/model/movie.model.dart';
import '../../infrastructure/movies.repository.dart';

part 'movies.controller.g.dart';

class MoviesState {
  final List<Movie> movies;
  final bool loading;
  final String? error;
  final bool hasMore;
  final int page;

  const MoviesState({this.movies = const [], this.loading = false, this.error, this.hasMore = true, this.page = 1});

  MoviesState copyWith({List<Movie>? movies, bool? loading, String? error, bool clearError = false, bool? hasMore, int? page}) {
    return MoviesState(movies: movies ?? this.movies, loading: loading ?? this.loading, error: clearError ? null : (error ?? this.error), hasMore: hasMore ?? this.hasMore, page: page ?? this.page);
  }
}

@riverpod
class MoviesController extends _$MoviesController {
  @override
  MoviesState build() {
    Future.microtask(() => fetch(1, reset: true));
    return const MoviesState();
  }

  Future<void> fetch(int page, {bool reset = false}) async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      final repo = ref.read(moviesRepositoryProvider);
      final response = await repo.getPopularMovies(page: page);
      state = state.copyWith(movies: reset ? response.results : [...state.movies, ...response.results], loading: false, hasMore: page < response.totalPages, page: page);
    } catch (e) {
      state = state.copyWith(loading: false, error: mapErrorToMessage(e));
    }
  }

  void loadMore() {
    if (state.loading || !state.hasMore) return;
    fetch(state.page + 1);
  }

  void refresh() {
    fetch(1, reset: true);
  }
}
