import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/api.constants.dart';
import '../../../core/services/model/tmdb_response.model.dart';
import '../../../core/services/remote.dart';

part 'movies.repository.g.dart';

class MoviesRepository {
  final Dio _dio;

  MoviesRepository(this._dio);

  Future<TmdbResponse> getPopularMovies({int page = 1}) async {
    final response = await _dio.get(Api.popularMovies, queryParameters: {'page': page});
    return TmdbResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<TmdbResponse> searchMovies(String query, {int page = 1}) async {
    final response = await _dio.get(Api.searchMovies, queryParameters: {'query': query, 'page': page});
    return TmdbResponse.fromJson(response.data as Map<String, dynamic>);
  }
}

@riverpod
MoviesRepository moviesRepository(Ref ref) {
  return MoviesRepository(ref.watch(remoteProvider));
}
