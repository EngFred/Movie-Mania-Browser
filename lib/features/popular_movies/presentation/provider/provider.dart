import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movie_box/features/popular_movies/data/repository/popular_movies_repository_impl.dart';
import 'package:my_movie_box/features/popular_movies/data/sources/remote/popular_movies_api_service.dart';
import 'package:my_movie_box/features/popular_movies/domain/usescases/get_popular_movies_usecase.dart';

final popularMoviesApiServiceProvider = Provider((ref) {
  return PopularMoviesApiService.create();
});

final popularMovieRepositoryProvider = Provider((ref) {
  final popularMoviesApiService = ref.watch(popularMoviesApiServiceProvider);
  return PopularMoviesRepositoryImpl(moviesApiService: popularMoviesApiService);
});

final getPopularMoviesProvider = FutureProvider.family((ref, int page) {
  final popularMoviesRepository = ref.watch(popularMovieRepositoryProvider);
  return GetPopularMoviesUsecase(moviesRepository: popularMoviesRepository)
      .call(params: page);
});
