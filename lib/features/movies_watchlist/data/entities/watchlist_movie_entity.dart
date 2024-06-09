import 'package:floor/floor.dart';

@Entity(tableName: "watchlist")
class WatchlistMovieEntity {
  @PrimaryKey(autoGenerate: false)
  final int id;
  final String? title;
  final String? posterPath;
  final String? releaseDate;
  final String? tagline;

  WatchlistMovieEntity(
      {required this.id,
      this.title,
      this.posterPath,
      this.releaseDate,
      this.tagline});
}
