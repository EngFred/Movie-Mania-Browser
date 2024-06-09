import 'package:my_movie_box/features/movie_details/data/models/movie_details_response.dart';
import 'package:my_movie_box/features/movie_details/domain/models/movie_details.dart';

MovieDetails toMovieDetails(MovieDetailsResponse movieDetailsDto) {
  return MovieDetails(
      backdropPath: movieDetailsDto.backdropPath,
      budget: movieDetailsDto.budget,
      genres:
          movieDetailsDto.genres?.map((genreDto) => toGenre(genreDto)).toList(),
      homepage: movieDetailsDto.homepage,
      id: movieDetailsDto.id,
      originCountry: movieDetailsDto.originCountry ?? <String>[],
      overview: movieDetailsDto.overview,
      posterPath: movieDetailsDto.posterPath,
      productionCompanies: movieDetailsDto.productionCompanies
          ?.map((productionCompanyDto) =>
              toProductionCompany(productionCompanyDto))
          .toList(),
      releaseDate: movieDetailsDto.releaseDate,
      revenue: movieDetailsDto.revenue,
      runtime: movieDetailsDto.runtime,
      tagline: movieDetailsDto.tagline,
      title: movieDetailsDto.title,
      voteAverage: movieDetailsDto.voteAverage,
      credits: toCredits(movieDetailsDto.credits));
}

Genre toGenre(GenreDto genreDto) {
  return Genre(id: genreDto.id, name: genreDto.name);
}

Cast toCast(CastDto castDto) {
  return Cast(
      id: castDto.id,
      name: castDto.name,
      profilePath: castDto.profilePath,
      character: castDto.character);
}

Crew toCrew(CrewDto crewDto) {
  return Crew(
      id: crewDto.id,
      name: crewDto.name,
      profilePath: crewDto.profilePath,
      job: crewDto.job);
}

Credits toCredits(CreditsDto? creditsDto) {
  return Credits(
      cast: toCastsList(creditsDto?.cast), crew: toCrewList(creditsDto?.crew));
}

List<Cast> toCastsList(List<CastDto>? castDto) {
  return castDto?.map((castDto) => toCast(castDto)).toList() ?? [];
}

List<Crew> toCrewList(List<CrewDto>? crewDto) {
  return crewDto?.map((crewDto) => toCrew(crewDto)).toList() ?? [];
}

ProductionCompany toProductionCompany(
    ProductionCompanyDto productionCompanyDto) {
  return ProductionCompany(
      id: productionCompanyDto.id,
      logoPath: productionCompanyDto.logoPath,
      name: productionCompanyDto.name,
      originCountry: productionCompanyDto.originCountry);
}
