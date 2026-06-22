import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../movies/domain/model/movie.model.dart';
import '../../infrastructure/favorites.repository.dart';

part 'favorites.controller.g.dart';

@riverpod
class FavoritesController extends _$FavoritesController {
  @override
  List<Movie> build() {
    Future.microtask(_load);
    return [];
  }

  Future<void> _load() async {
    final repo = await ref.read(favoritesRepositoryProvider.future);
    if (!ref.mounted) return;
    state = repo.getFavorites();
  }

  Future<void> addFavorite(Movie movie) async {
    state = [...state, movie];
    final repo = await ref.read(favoritesRepositoryProvider.future);
    if (!ref.mounted) return;
    await repo.saveFavorites(state);
  }

  Future<void> removeFavorite(int movieId) async {
    state = state.where((m) => m.id != movieId).toList();
    final repo = await ref.read(favoritesRepositoryProvider.future);
    if (!ref.mounted) return;
    await repo.saveFavorites(state);
  }

  bool isFavorite(int movieId) => state.any((m) => m.id == movieId);
}
