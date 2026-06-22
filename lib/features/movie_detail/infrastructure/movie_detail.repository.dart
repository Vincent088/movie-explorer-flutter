import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/api.constants.dart';
import '../../../core/services/remote.dart';
import '../domain/model/movie_detail.model.dart';

part 'movie_detail.repository.g.dart';

class MovieDetailRepository {
  final Dio _dio;

  MovieDetailRepository(this._dio);

  Future<MovieDetail> getMovieDetail(int id) async {
    final response = await _dio.get(Api.movieDetail(id));
    return MovieDetail.fromJson(response.data as Map<String, dynamic>);
  }
}

@riverpod
MovieDetailRepository movieDetailRepository(Ref ref) {
  return MovieDetailRepository(ref.watch(remoteProvider));
}
