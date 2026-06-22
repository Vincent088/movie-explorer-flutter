import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static String get baseUrl => dotenv.env['TMDB_BASE_URL']!;
  static String get apiKey => dotenv.env['TMDB_API_KEY']!;
  static String get imageUrl => dotenv.env['TMDB_IMAGE_URL']!;

  static const String popularMovies = '/movie/popular';
  static const String searchMovies = '/search/movie';
  static String movieDetail(int id) => '/movie/$id';
}
