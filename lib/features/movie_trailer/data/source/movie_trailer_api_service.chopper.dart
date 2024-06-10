// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_trailer_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MovieTailerApiService extends MovieTailerApiService {
  _$MovieTailerApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MovieTailerApiService;

  @override
  Future<MovieTrailerResponseDto> getMovieTrailer(int movieId) async {
    final Uri $url = Uri.parse(
        'movie/${movieId}/videos?api_key=5d1b1d3b9651a62438cbed62d058ce41');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    final Response $response = await client
        .send<MovieTrailerResponseDto, MovieTrailerResponseDto>($request);
    return $response.bodyOrThrow;
  }
}
