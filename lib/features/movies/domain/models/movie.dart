class Movie {
  final int id;
  final String? title;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;
  final String? originalLanguage;

  Movie(
      {required this.id,
      this.title,
      this.posterPath,
      this.releaseDate,
      this.voteAverage,
      this.originalLanguage});
}

class DomainMoviesResponse {
  final int page;
  final List<Movie> movies;
  final int? totalPages;
  final int? totalResults;

  DomainMoviesResponse(
      {required this.page,
      required this.movies,
      this.totalPages,
      this.totalResults});
}
