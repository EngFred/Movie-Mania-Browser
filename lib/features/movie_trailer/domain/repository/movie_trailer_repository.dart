import 'package:my_movie_box/features/movie_trailer/domain/models/movie_trailer_response.dart';

abstract class MovieTrailerRepository {
  Future<List<Trailer>?> getMovieTrailer(int movieId);
}
