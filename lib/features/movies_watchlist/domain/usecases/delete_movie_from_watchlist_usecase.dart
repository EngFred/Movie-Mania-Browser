import 'package:logger/web.dart';
import 'package:my_movie_box/core/usecase/usecase.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/repository/watchlist_movies_repository.dart';

class DeleteMovieFromWatchlistUsecase extends FutureBaseUsecase<void, int> {
  final WatchlistMoviesRepository watchlistMoviesRepository;

  DeleteMovieFromWatchlistUsecase({required this.watchlistMoviesRepository});

  @override
  Future<void> call({int? params}) async {
    try {
      return await watchlistMoviesRepository.deleteWatchlistMovie(params!);
    } catch (e) {
      Logger().d("Error in usecase $e");
    }
  }
}
