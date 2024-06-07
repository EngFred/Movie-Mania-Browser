import 'package:my_movie_box/features/movie_details/data/models/movie_details_response.dart';
import 'package:my_movie_box/features/movie_details/domain/entities/movie_details.dart';

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
      voteAverage: movieDetailsDto.voteAverage);
}

Genre toGenre(GenreDto genreDto) {
  return Genre(id: genreDto.id, name: genreDto.name);
}

ProductionCompany toProductionCompany(
    ProductionCompanyDto productionCompanyDto) {
  return ProductionCompany(
      id: productionCompanyDto.id,
      logoPath: productionCompanyDto.logoPath,
      name: productionCompanyDto.name,
      originCountry: productionCompanyDto.originCountry);
}
