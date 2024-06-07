import 'package:chopper/chopper.dart';
import 'package:my_movie_box/core/constants/constants.dart';
import 'package:my_movie_box/features/popular_movies/data/models/popular_movies_response.dart';
import 'package:my_movie_box/features/popular_movies/data/sources/remote/popular_movies_api_response_converter.dart';

part 'popular_movies_api_service.chopper.dart';

@ChopperApi()
abstract class PopularMoviesApiService extends ChopperService {
  @Get(path: "movie/popular?api_key=$apiKey")
  Future<PopularMoviesResponse> getPopularMovies(@Query('page') int page);

  static PopularMoviesApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse(baseUrl),
        interceptors: [HttpLoggingInterceptor()],
        services: [
          _$PopularMoviesApiService(),
        ],
        converter: PopularMoviesApiResponseConverter(),
        errorConverter: const JsonConverter());
    return _$PopularMoviesApiService(client);
  }
}
