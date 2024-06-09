class MovieDetails {
  final String? backdropPath;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int id;
  final List<String>? originCountry;
  final String? overview;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String? tagline;
  final String? title;
  final double? voteAverage;
  final Credits? credits;

  MovieDetails(
      {this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      required this.id,
      this.originCountry,
      this.overview,
      this.posterPath,
      this.productionCompanies,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.tagline,
      this.title,
      this.voteAverage,
      this.credits});
}

class Genre {
  final int id;
  final String? name;

  Genre({
    required this.id,
    this.name,
  });
}

class ProductionCompany {
  final int id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompany({
    required this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });
}

class Credits {
  final List<Cast>? cast;
  final List<Crew>? crew;

  Credits({
    this.cast,
    this.crew,
  });
}

class Crew {
  final int id;
  final String? name;
  final String? profilePath;
  final String? job;

  Crew({required this.id, this.name, this.profilePath, this.job});
}

class Cast {
  final int id;
  final String? name;
  final String? profilePath;
  final String? character;

  Cast({required this.id, this.name, this.profilePath, this.character});
}
