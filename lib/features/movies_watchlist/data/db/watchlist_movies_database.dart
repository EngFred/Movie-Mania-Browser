import 'package:floor/floor.dart';
import 'package:my_movie_box/features/movies_watchlist/data/dao/watchlist_movie_dao.dart';
import 'package:my_movie_box/features/movies_watchlist/data/entities/watchlist_movie_entity.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'watchlist_movies_database.g.dart';

@Database(version: 1, entities: [WatchlistMovieEntity])
abstract class AppDatabase extends FloorDatabase {
  WatchlistMovieDao get watchlistMovieDao;
}
