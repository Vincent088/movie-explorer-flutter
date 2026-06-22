import '../../../movies/domain/model/movie.model.dart';
import 'genre.model.dart';

class MovieDetail extends Movie {
  final List<Genre> genres;
  final int runtime;

  MovieDetail({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.genreIds,
    required this.genres,
    required this.runtime,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      releaseDate: json['release_date'] as String? ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      genreIds: const [],
      genres: (json['genres'] as List<dynamic>?)?.map((e) => Genre.fromJson(e as Map<String, dynamic>)).toList() ?? [],
      runtime: json['runtime'] as int? ?? 0,
    );
  }
}
