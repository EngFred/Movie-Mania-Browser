import 'package:my_movie_box/features/popular_movies/data/models/popular_movies_response.dart';
import 'package:my_movie_box/features/popular_movies/domain/entities/movie.dart';

class PopularMoviesMapper {
  static Movie toDomain(MovieDto movieDto) {
    return Movie(
      id: movieDto.id,
      title: movieDto.title,
      posterPath: movieDto.posterPath,
      releaseDate: movieDto.releaseDate,
      voteAverage: movieDto.voteAverage,
    );
  }

  static List<Movie> toPopularMoviesList(List<MovieDto> dtoList) {
    return dtoList.map((dto) => toDomain(dto)).toList();
  }
}
