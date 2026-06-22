import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/services/storage.dart';
import '../../movies/domain/model/movie.model.dart';

part 'favorites.repository.g.dart';

const _favoritesKey = 'favorites';

class FavoritesRepository {
  final SharedPreferences _prefs;

  FavoritesRepository(this._prefs);

  List<Movie> getFavorites() {
    final stored = _prefs.getString(_favoritesKey);
    if (stored == null) return [];
    final decoded = jsonDecode(stored) as List<dynamic>;
    return decoded.map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> saveFavorites(List<Movie> favorites) async {
    final encoded = jsonEncode(favorites.map((m) => m.toJson()).toList());
    await _prefs.setString(_favoritesKey, encoded);
  }
}

@riverpod
Future<FavoritesRepository> favoritesRepository(Ref ref) async {
  final prefs = await ref.watch(storageProvider.future);
  return FavoritesRepository(prefs);
}
