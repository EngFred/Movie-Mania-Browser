import 'package:my_movie_box/features/popular_movies/data/models/api_response.dart';
import 'package:my_movie_box/features/popular_movies/domain/entities/movie.dart';

class MovieMapper {
  static Movie toDomain(MovieDto movieDto) {
    return Movie(
      id: movieDto.id,
      title: movieDto.title,
      posterPath: movieDto.posterPath,
      releaseDate: movieDto.releaseDate,
      voteAverage: movieDto.voteAverage,
    );
  }

  static List<Movie> toMovieList(List<MovieDto> dtoList) {
    return dtoList.map((dto) => toDomain(dto)).toList();
  }
}
