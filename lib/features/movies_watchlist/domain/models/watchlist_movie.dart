import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_movie.freezed.dart';
part 'watchlist_movie.g.dart'; // Generated file from json_serializable

@freezed
class WatchlistMovie with _$WatchlistMovie {
  factory WatchlistMovie(
      {required int id,
      String? title,
      String? posterPath,
      String? releaseDate,
      String? tagline}) = _WatchlistMovie;

  factory WatchlistMovie.fromJson(Map<String, dynamic> json) =>
      _$WatchlistMovieFromJson(json);
}
