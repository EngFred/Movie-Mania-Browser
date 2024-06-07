class Movie {
  final int id;
  final String? title;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;

  Movie({
    required this.id,
    this.title,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });
}
