import 'package:json_annotation/json_annotation.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "belongs_to_collection")
  final BelongsToCollectionDto? belongsToCollection;
  final int? budget;
  final List<GenreDto>? genres;
  final String? homepage;
  final int id;
  @JsonKey(name: "imdb_id")
  final String? imdbId;
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "production_companies")
  final List<ProductionCompanyDto>? productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountryDto>? productionCountries;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguageDto>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;
  final CreditsDto? credits;

  MovieDetailsResponse(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      required this.id,
      this.imdbId,
      this.originCountry,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.credits});

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}

@JsonSerializable()
class BelongsToCollectionDto {
  final int id;
  final String? name;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;

  BelongsToCollectionDto({
    required this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollectionDto.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BelongsToCollectionDtoToJson(this);
}

@JsonSerializable()
class GenreDto {
  final int id;
  final String? name;

  GenreDto({
    required this.id,
    this.name,
  });

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      _$GenreDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GenreDtoToJson(this);
}

@JsonSerializable()
class ProductionCompanyDto {
  final int id;
  @JsonKey(name: "logo_path")
  final String? logoPath;
  final String? name;
  @JsonKey(name: "origin_country")
  final String? originCountry;

  ProductionCompanyDto({
    required this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompanyDto.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyDtoToJson(this);
}

@JsonSerializable()
class ProductionCountryDto {
  @JsonKey(name: "iso_3166_1")
  final String? iso31661;
  final String? name;

  ProductionCountryDto({
    this.iso31661,
    this.name,
  });

  factory ProductionCountryDto.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryDtoToJson(this);
}

@JsonSerializable()
class SpokenLanguageDto {
  @JsonKey(name: "english_name")
  final String? englishName;
  @JsonKey(name: "iso_639_1")
  final String? iso6391;
  final String? name;

  SpokenLanguageDto({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguageDto.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguageDtoToJson(this);
}

@JsonSerializable()
class CreditsDto {
  final List<CastDto>? cast;
  final List<CrewDto>? crew;

  CreditsDto({
    this.cast,
    this.crew,
  });

  factory CreditsDto.fromJson(Map<String, dynamic> json) =>
      _$CreditsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreditsDtoToJson(this);
}

@JsonSerializable()
class CrewDto {
  final bool? adult;
  final int? gender;
  final int id;
  @JsonKey(name: "known_for_department")
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  final double? popularity;
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @JsonKey(name: "credit_id")
  final String? creditId;
  final String? department;
  final String? job;

  CrewDto(
      {this.adult,
      this.gender,
      required this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});

  factory CrewDto.fromJson(Map<String, dynamic> json) =>
      _$CrewDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CrewDtoToJson(this);
}

@JsonSerializable()
class CastDto {
  final bool? adult;
  final int? gender;
  final int id;
  @JsonKey(name: "known_for_department")
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  final double? popularity;
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @JsonKey(name: "cast_id")
  final int? castId;
  final String? character;
  @JsonKey(name: "credit_id")
  final String? creditId;
  final int? order;

  CastDto(
      {this.adult,
      this.gender,
      required this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order});

  factory CastDto.fromJson(Map<String, dynamic> json) =>
      _$CastDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CastDtoToJson(this);
}
