import 'package:flutter/material.dart';

import '../../features/movie_detail/presentation/movie_detail.screen.dart';

class AppNavigator {
  static void pushMovieDetail(BuildContext context, int movieId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => MovieDetailScreen(movieId: movieId)));
  }
}
