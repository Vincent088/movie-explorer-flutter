import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/error_mapper.dart';
import '../../domain/model/movie.model.dart';
import '../../infrastructure/movies.repository.dart';

part 'search.controller.g.dart';

class SearchState {
  final String query;
  final List<Movie> results;
  final bool loading;
  final String? error;
  final bool hasMore;
  final int page;

  const SearchState({this.query = '', this.results = const [], this.loading = false, this.error, this.hasMore = false, this.page = 1});

  SearchState copyWith({String? query, List<Movie>? results, bool? loading, String? error, bool clearError = false, bool? hasMore, int? page}) {
    return SearchState(
      query: query ?? this.query,
      results: results ?? this.results,
      loading: loading ?? this.loading,
      error: clearError ? null : (error ?? this.error),
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
    );
  }
}

@riverpod
class SearchController extends _$SearchController {
  Timer? _debounce;

  @override
  SearchState build() {
    ref.onDispose(() => _debounce?.cancel());
    return const SearchState();
  }

  void setQuery(String query) {
    state = state.copyWith(query: query);
    _debounce?.cancel();

    if (query.trim().isEmpty) {
      state = state.copyWith(results: [], page: 1, hasMore: false, loading: false, clearError: true);
      return;
    }

    state = state.copyWith(loading: true);
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _fetch(query, 1, reset: true);
    });
  }

  Future<void> _fetch(String query, int page, {bool reset = false}) async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      final repo = ref.read(moviesRepositoryProvider);
      final response = await repo.searchMovies(query, page: page);
      state = state.copyWith(results: reset ? response.results : [...state.results, ...response.results], loading: false, hasMore: page < response.totalPages, page: page);
    } catch (e) {
      state = state.copyWith(loading: false, error: mapErrorToMessage(e));
    }
  }

  void loadMore() {
    if (state.loading || !state.hasMore || state.query.trim().isEmpty) return;
    _fetch(state.query, state.page + 1);
  }

  void retry() {
    if (state.query.trim().isNotEmpty) {
      _fetch(state.query, 1, reset: true);
    }
  }
}
