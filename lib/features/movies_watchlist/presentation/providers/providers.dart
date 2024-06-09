import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/features/movies_watchlist/data/dao/watchlist_movie_dao.dart';
import 'package:my_movie_box/features/movies_watchlist/data/db/watchlist_movies_database.dart';
import 'package:my_movie_box/features/movies_watchlist/data/repository/watchlist_movies_repository_impl.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/models/watchlist_movie.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/repository/watchlist_movies_repository.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/usecases/add_movie_to_watchlist_usecase.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/usecases/delete_movie_from_watchlist_usecase.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/usecases/get_movies_watchlist_usecase.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/usecases/get_watchlist_movie_by_id_usecase.dart';

final databaseProvider = FutureProvider<AppDatabase>((ref) async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  return database;
});

final watchlistMovieDaoProvider =
    FutureProvider<WatchlistMovieDao>((ref) async {
  final database = await ref.read(databaseProvider.future);
  return database.watchlistMovieDao;
});

final watchlistMovieRepositoryProvider =
    FutureProvider<WatchlistMoviesRepository>((ref) async {
  final dbDao = await ref.watch(watchlistMovieDaoProvider.future);
  return WatchlistMoviesRepositoryImpl(dbDao: dbDao);
});

final addMovieToWatchlistUsecaseProvider =
    FutureProvider.family((ref, WatchlistMovie movie) async {
  try {
    final watchlistMoviesRepository =
        await ref.watch(watchlistMovieRepositoryProvider.future);
    return await AddMovieToWatchlistUsecase(
            watchlistMoviesRepository: watchlistMoviesRepository)
        .call(params: movie);
  } catch (e) {
    Logger().d("!!!!!!!!!!!!!!!issues in the provider. $e");
  }
});

final getMoviesWatchListProvider = StreamProvider((ref) {
  final watchlistMoviesRepository =
      ref.watch(watchlistMovieRepositoryProvider).value;
  if (watchlistMoviesRepository == null) {
    throw Exception("Repository not found");
  }
  return GetMoviesWatchlistUsecase(
          watchlistMoviesRepository: watchlistMoviesRepository)
      .call();
});

final getWatchlistMovieByIdUsecaseProvider =
    StreamProvider.family<WatchlistMovie?, int>((ref, movieId) async* {
  try {
    final watchlistMoviesRepository =
        await ref.watch(watchlistMovieRepositoryProvider.future);
    final movie = await GetWatchlistMovieByIdUsecase(
      watchlistMoviesRepository: watchlistMoviesRepository,
    ).call(params: movieId);

    yield* movie;
  } catch (e) {
    Logger().e("Something went wrong! $e");
    yield* Stream.error(Exception("Something went wrong! $e"));
  }
});

final deleteMovieFromWatchlistUsecaseProvider =
    FutureProvider.family((ref, int movie) async {
  try {
    final watchlistMoviesRepository =
        await ref.watch(watchlistMovieRepositoryProvider.future);
    return await DeleteMovieFromWatchlistUsecase(
            watchlistMoviesRepository: watchlistMoviesRepository)
        .call(params: movie);
  } catch (e) {
    Logger().e("Something went wrong! $e");
    throw Exception("Something went wrong! $e");
  }
});
