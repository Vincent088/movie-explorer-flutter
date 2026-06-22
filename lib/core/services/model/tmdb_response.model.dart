import '../../../features/movies/domain/model/movie.model.dart';

class TmdbResponse {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  TmdbResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TmdbResponse.fromJson(Map<String, dynamic> json) {
    return TmdbResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }
}
