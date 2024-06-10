import 'package:logger/web.dart';
import 'package:my_movie_box/core/usecase/usecase.dart';
import 'package:my_movie_box/features/movie_trailer/domain/models/movie_trailer_response.dart';
import 'package:my_movie_box/features/movie_trailer/domain/repository/movie_trailer_repository.dart';

class GetMovieTrailerUsecase extends FutureBaseUsecase<Trailer?, int> {
  final MovieTrailerRepository _movieTrailerRepository;
  final Logger log = Logger();

  GetMovieTrailerUsecase(
      {required MovieTrailerRepository movieTrailerRepository})
      : _movieTrailerRepository = movieTrailerRepository;

  @override
  Future<Trailer?> call({int? params}) async {
    final trailers = await _movieTrailerRepository.getMovieTrailer(params!);
    if (trailers != null && trailers.isNotEmpty) {
      final filteredTrailers =
          trailers.where((trailer) => trailer.type == "Trailer").toList();
      if (filteredTrailers.isEmpty) {
        log.i(
            'The movie trailer  of type = "Trailer" wasn\'t found from the filtered list! ');
        return null;
      }
      final trailer = filteredTrailers[0];
      return trailer;
    } else {
      log.i('The remote trailers list is null or is empty');
      return null;
    }
  }
}
