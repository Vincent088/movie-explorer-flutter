import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:movie_explorer_flutter/features/favorites/presentation/controller/favorites.controller.dart';
import 'package:movie_explorer_flutter/features/movies/domain/model/movie.model.dart';

void main() {
  late ProviderContainer container;

  final mockMovie = Movie(
    id: 1,
    title: 'Inception',
    overview: 'A thief who steals corporate secrets.',
    posterPath: '/inception.jpg',
    backdropPath: '/backdrop.jpg',
    releaseDate: '2010-07-16',
    voteAverage: 8.8,
    genreIds: const [28, 878],
  );

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('starts with an empty favorites list', () {
    expect(container.read(favoritesControllerProvider), isEmpty);
  });

  test('adds a movie to favorites', () async {
    await container.read(favoritesControllerProvider.notifier).addFavorite(mockMovie);
    final favorites = container.read(favoritesControllerProvider);
    expect(favorites, hasLength(1));
    expect(favorites.first.id, 1);
  });

  test('removes a movie from favorites', () async {
    await container.read(favoritesControllerProvider.notifier).addFavorite(mockMovie);
    await container.read(favoritesControllerProvider.notifier).removeFavorite(1);
    expect(container.read(favoritesControllerProvider), isEmpty);
  });

  test('isFavorite returns true for a saved movie', () async {
    await container.read(favoritesControllerProvider.notifier).addFavorite(mockMovie);
    expect(container.read(favoritesControllerProvider.notifier).isFavorite(1), isTrue);
  });

  test('isFavorite returns false for a movie not in favorites', () {
    expect(container.read(favoritesControllerProvider.notifier).isFavorite(999), isFalse);
  });

  test('persists favorites to SharedPreferences on add', () async {
    await container.read(favoritesControllerProvider.notifier).addFavorite(mockMovie);
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString('favorites');
    expect(stored, isNotNull);
    expect(stored, contains('Inception'));
  });
}
