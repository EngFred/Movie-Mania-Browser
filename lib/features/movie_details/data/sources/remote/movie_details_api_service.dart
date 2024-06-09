import 'package:chopper/chopper.dart';
import 'package:my_movie_box/core/constants/constants.dart';
import 'package:my_movie_box/features/movie_details/data/models/movie_details_response.dart';
import 'package:my_movie_box/features/movie_details/data/sources/remote/movie_details_api_response_converter.dart';

part 'movie_details_api_service.chopper.dart';

@ChopperApi()
abstract class MovieDetailsApiService extends ChopperService {
  @Get(path: "movie/{movieId}?api_key=$apiKey&append_to_response=credits")
  Future<MovieDetailsResponse> getMovieDetails(@Path("movieId") int movieId);

  static MovieDetailsApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse(baseUrl),
        interceptors: [HttpLoggingInterceptor()],
        services: [
          _$MovieDetailsApiService(),
        ],
        converter: MovieDetailsApiResponseConverter(),
        errorConverter: const JsonConverter());
    return _$MovieDetailsApiService(client);
  }
}
