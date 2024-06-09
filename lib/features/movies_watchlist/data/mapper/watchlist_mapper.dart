import 'package:my_movie_box/features/movies_watchlist/domain/models/watchlist_movie.dart';
import 'package:my_movie_box/features/movies_watchlist/data/entities/watchlist_movie_entity.dart';

extension WatchlistMovieEntityMapper on WatchlistMovieEntity {
  WatchlistMovie toModel() {
    return WatchlistMovie(
        id: id,
        title: title,
        posterPath: posterPath,
        releaseDate: releaseDate,
        tagline: tagline);
  }
}

extension WatchlistMovieMapper on WatchlistMovie {
  WatchlistMovieEntity toEntity() {
    return WatchlistMovieEntity(
        id: id,
        title: title,
        posterPath: posterPath,
        releaseDate: releaseDate,
        tagline: tagline);
  }
}
