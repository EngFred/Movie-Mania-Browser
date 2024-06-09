// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MovieDetailsApiService extends MovieDetailsApiService {
  _$MovieDetailsApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MovieDetailsApiService;

  @override
  Future<MovieDetailsResponse> getMovieDetails(int movieId) async {
    final Uri $url = Uri.parse(
        'movie/${movieId}?api_key=5d1b1d3b9651a62438cbed62d058ce41&append_to_response=credits');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    final Response $response =
        await client.send<MovieDetailsResponse, MovieDetailsResponse>($request);
    return $response.bodyOrThrow;
  }
}
