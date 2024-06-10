import 'package:chopper/chopper.dart';
import 'package:my_movie_box/core/constants/constants.dart';
import 'package:my_movie_box/features/movie_trailer/data/modals/movie_trailer_dto.dart';
import 'package:my_movie_box/features/movie_trailer/data/source/movie_trailer_response_converter.dart';

part 'movie_trailer_api_service.chopper.dart';

@ChopperApi()
abstract class MovieTailerApiService extends ChopperService {
  @Get(path: "movie/{movie_id}/videos?api_key=$apiKey")
  Future<MovieTrailerResponseDto> getMovieTrailer(
      @Path('movie_id') int movieId);

  static MovieTailerApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse(baseUrl),
        interceptors: [HttpLoggingInterceptor()],
        services: [
          _$MovieTailerApiService(),
        ],
        converter: MovieTrailerResponseConverter(),
        errorConverter: const JsonConverter());
    return _$MovieTailerApiService(client);
  }
}
