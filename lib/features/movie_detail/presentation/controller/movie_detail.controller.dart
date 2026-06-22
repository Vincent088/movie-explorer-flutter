import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/movie_detail.model.dart';
import '../../infrastructure/movie_detail.repository.dart';

part 'movie_detail.controller.g.dart';

@riverpod
Future<MovieDetail> movieDetailController(Ref ref, int movieId) async {
  final repo = ref.read(movieDetailRepositoryProvider);
  return repo.getMovieDetail(movieId);
}
