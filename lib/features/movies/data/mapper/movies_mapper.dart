import 'package:my_movie_box/features/movies/data/models/remote_movies_response.dart';
import 'package:my_movie_box/features/movies/domain/models/movie.dart';

class MoviesMapper {
  static Movie toDomainMovie(MovieDto movieDto) {
    return Movie(
        id: movieDto.id,
        title: movieDto.title,
        posterPath: movieDto.posterPath,
        releaseDate: movieDto.releaseDate,
        voteAverage: movieDto.voteAverage,
        originalLanguage: movieDto.originalLanguage);
  }

  static DomainMoviesResponse toDomainMoviesResponse(
      RemoteMoviesResponse remotePopularMovies) {
    return DomainMoviesResponse(
        page: remotePopularMovies.page,
        movies: toDomainMoviesList(remotePopularMovies.movies),
        totalPages: remotePopularMovies.totalPages,
        totalResults: remotePopularMovies.totalResults);
  }

  static List<Movie> toDomainMoviesList(List<MovieDto> dtoList) {
    return dtoList.map((dto) => toDomainMovie(dto)).toList();
  }
}
