// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MoviesApiService extends MoviesApiService {
  _$MoviesApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MoviesApiService;

  @override
  Future<RemoteMoviesResponse> getRemotePopularMovies(int page) async {
    final Uri $url =
        Uri.parse('movie/popular?api_key=5d1b1d3b9651a62438cbed62d058ce41');
    final Map<String, dynamic> $params = <String, dynamic>{'page': page};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    final Response $response =
        await client.send<RemoteMoviesResponse, RemoteMoviesResponse>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<RemoteMoviesResponse> searchMovie(
    String query,
    int page,
  ) async {
    final Uri $url =
        Uri.parse('search/movie?api_key=5d1b1d3b9651a62438cbed62d058ce41');
    final Map<String, dynamic> $params = <String, dynamic>{
      'query': query,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    final Response $response =
        await client.send<RemoteMoviesResponse, RemoteMoviesResponse>($request);
    return $response.bodyOrThrow;
  }
}
